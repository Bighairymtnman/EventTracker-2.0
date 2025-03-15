// Function to generate a unique event number
function generateEventNum() {
    return Math.floor(Math.random() * 1000000);
}

// Function to load organizers
async function loadOrganizers() {
    try {
        console.log('Fetching organizers...');
        const response = await fetch('api/events.php?action=organizers');
        const organizers = await response.json();
        console.log('Organizers received:', organizers);
        const select = document.getElementById('eventOrganizer');
        console.log('Select element:', select);
        if (!select) {
            console.error('Select element not found!');
            return;
        }
        select.innerHTML = '<option value="">Select an organizer</option>';
        organizers.forEach(org => {
            select.innerHTML += `<option value="${org.org_id}">${org.orgname}</option>`;
        });
        console.log('Dropdown populated with', organizers.length, 'organizers');
    } catch (error) {
        console.error('Error loading organizers:', error);
    }
}

// Function to filter events
function filterEvents() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const eventItems = document.querySelectorAll('li');
    
    eventItems.forEach(item => {
        const location = item.querySelector('strong').textContent.toLowerCase();
        item.style.display = location.includes(searchTerm) ? '' : 'none';
    });
}

// Function to load events from the database
async function loadEvents() {
    try {
        console.log('Loading events...');
        const response = await fetch('api/events.php');
        const events = await response.json();
        const eventList = document.getElementById('eventList');
        eventList.innerHTML = '';
        
        events.forEach(event => {
            const li = document.createElement('li');
            li.dataset.id = event.event_num;
            li.classList.add('event-item');
            li.classList.add(`status-${event.event_status.toLowerCase()}`);
            li.innerHTML = `
                <strong>${event.event_location}</strong><br>
                <span>Start: ${event.event_start_date}</span><br>
                <span>End: ${event.event_end_date}</span><br>
                <span>Status: ${event.event_status}</span><br>
            `;
            
            const removeBtn = document.createElement('button');
            removeBtn.textContent = "Remove";
            removeBtn.classList.add('remove-btn');
            
            removeBtn.addEventListener('click', async function() {
                try {
                    const response = await fetch('api/events.php', {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ event_num: event.event_num })
                    });
                    
                    if (response.ok) {
                        eventList.removeChild(li);
                    }
                } catch (error) {
                    console.error('Error:', error);
                }
            });
            
            li.appendChild(removeBtn);
            eventList.appendChild(li);
        });
    } catch (error) {
        console.error('Error loading events:', error);
    }
}

// Add event listeners
document.getElementById('eventForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    console.log('Form submitted');

    const title = document.getElementById('eventTitle').value;
    const date = document.getElementById('eventDate').value;
    const description = document.getElementById('eventDescription').value;
    const orgId = document.getElementById('eventOrganizer').value;

    console.log('Form values:', { title, date, description, orgId });

    const eventData = {
        event_num: generateEventNum(),
        start_date: date,
        end_date: date,
        location: title,
        status: 'upcoming',
        org_id: orgId
    };

    try {
        const response = await fetch('api/events.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(eventData)
        });

        if (response.ok) {
            await loadEvents();
            document.getElementById('eventForm').reset();
        }
    } catch (error) {
        console.error('Error adding event:', error);
    }
});

// Add search input event listener
document.getElementById('searchInput').addEventListener('input', filterEvents);

// Load events and organizers when page loads
document.addEventListener('DOMContentLoaded', () => {
    console.log('Page loaded - DOMContentLoaded fired');
    loadEvents();
    loadOrganizers();
});
