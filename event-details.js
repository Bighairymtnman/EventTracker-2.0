// Function to load organizers
async function loadOrganizers() {
    try {
        console.log('Loading organizers...');
        const response = await fetch('api/events.php?action=organizers');
        const organizers = await response.json();
        console.log('Organizers received:', organizers);
        const select = document.getElementById('editOrganizer');
        select.innerHTML = '<option value="">Select an organizer</option>';
        organizers.forEach(org => {
            select.innerHTML += `<option value="${org.org_id}">${org.orgname}</option>`;
        });
    } catch (error) {
        console.error('Error loading organizers:', error);
    }
}

// Function to load events
async function loadEvents() {
    try {
        const response = await fetch('api/event-details.php?action=list');
        const events = await response.json();
        const eventList = document.getElementById('eventList');
        eventList.innerHTML = '';
        
        events.forEach(event => {
            const li = document.createElement('li');
            li.textContent = event.event_location;
            li.addEventListener('click', () => showEventDetails(event));
            eventList.appendChild(li);
        });
    } catch (error) {
        console.error('Error:', error);
    }
}

// Function to show event details
function showEventDetails(event) {
    console.log("Event data received:", event);
    const detailsDiv = document.getElementById('eventDetails');
    detailsDiv.innerHTML = `
        <h3>Edit Event</h3>
        <form id="editForm">
            <input type="hidden" id="editEventNum" value="${event.event_num}">
            <div class="form-group">
                <label>Location:</label>
                <input type="text" id="editLocation" value="${event.event_location}" required>
            </div>
            <div class="form-group">
                <label>Start Date:</label>
                <input type="date" id="editStartDate" value="${event.event_start_date}" required>
            </div>
            <div class="form-group">
                <label>End Date:</label>
                <input type="date" id="editEndDate" value="${event.event_end_date}" required>
            </div>
            <div class="form-group">
                <label>Organizer:</label>
                <select id="editOrganizer" required></select>
            </div>
            <div class="form-group">
                <label>Status:</label>
                <select id="editStatus" required>
                    <option value="upcoming">Upcoming</option>
                    <option value="planning">Planning</option>
                </select>
            </div>
            <button type="submit">Save Changes</button>
        </form>
    `;

    // Set the status value
    const statusSelect = document.getElementById('editStatus');
    statusSelect.value = event.event_status;

    loadOrganizers().then(() => {
        const organizerSelect = document.getElementById('editOrganizer');
        if (organizerSelect) {
            organizerSelect.value = event.org_id;
        }
    });

    document.getElementById('editForm').addEventListener('submit', handleEditSubmit);
}




// Function to handle form submission
async function handleEditSubmit(e) {
    e.preventDefault();
    console.log('Form submitted');
    
    const eventData = {
        event_num: document.getElementById('editEventNum').value,
        location: document.getElementById('editLocation').value,
        start_date: document.getElementById('editStartDate').value,
        end_date: document.getElementById('editEndDate').value,
        org_id: document.getElementById('editOrganizer').value,
        event_status: document.getElementById('editStatus').value  // Changed from 'status' to 'event_status'
    };
    
    console.log('Sending update with data:', eventData);

    try {
        const response = await fetch('api/event-details.php', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(eventData)
        });

        if (response.ok) {
            console.log('Update successful');
            await loadEvents();
        } else {
            console.error('Update failed:', await response.text());
        }
    } catch (error) {
        console.error('Error updating event:', error);
    }
}


// Load events when page loads
document.addEventListener('DOMContentLoaded', () => {
    console.log('Page loaded');
    loadEvents();
});
