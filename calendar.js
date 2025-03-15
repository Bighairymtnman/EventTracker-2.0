document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar');
    
    // Store calendar notes in localStorage
    let calendarNotes = JSON.parse(localStorage.getItem('calendarNotes')) || [];
    
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        editable: true,
        selectable: true,
        select: function(info) {
            // Only allow adding notes in week or day view
            if (calendar.view.type === 'timeGridWeek' || calendar.view.type === 'timeGridDay') {
                const noteText = prompt('Add note:');
                if (noteText) {
                    const note = {
                        id: Date.now().toString(),
                        title: noteText,
                        start: info.startStr,
                        end: info.endStr,
                        backgroundColor: '#6c757d',
                        extendedProps: {
                            isNote: true
                        }
                    };
                    
                    // Add to local storage
                    calendarNotes.push(note);
                    localStorage.setItem('calendarNotes', JSON.stringify(calendarNotes));
                    
                    // Add to calendar
                    calendar.addEvent(note);
                }
            }
            calendar.unselect();
        },
        eventClick: function(info) {
            if (info.event.extendedProps.isNote) {
                if (confirm('Delete this note?')) {
                    // Remove from local storage
                    calendarNotes = calendarNotes.filter(note => note.id !== info.event.id);
                    localStorage.setItem('calendarNotes', JSON.stringify(calendarNotes));
                    
                    // Remove from calendar
                    info.event.remove();
                }
            }
        },
        events: function(fetchInfo, successCallback, failureCallback) {
            // Fetch regular events
            fetch('api/events.php')
                .then(response => response.json())
                .then(events => {
                    const calendarEvents = events.map(event => ({
                        title: event.event_location,
                        start: event.event_start_date,
                        end: event.event_end_date,
                        backgroundColor: event.event_status === 'upcoming' ? '#28a745' : '#ffa500',
                        extendedProps: {
                            isNote: false
                        }
                    }));
                    
                    // Add stored notes with preserved properties
                    const storedNotes = calendarNotes.map(note => ({
                        ...note,
                        backgroundColor: '#6c757d',
                        extendedProps: {
                            isNote: true
                        }
                    }));
                    
                    // Combine regular events with calendar notes
                    const allEvents = [...calendarEvents, ...storedNotes];
                    successCallback(allEvents);
                })
                .catch(error => {
                    console.error('Error:', error);
                    failureCallback(error);
                });
        }
    });
    calendar.render();
});
