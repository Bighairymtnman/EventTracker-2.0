# EventTracker Application 2.0

A web application for managing events and organizers.

## Technologies Used

### Frontend
- HTML
- CSS
- JavaScript

### Backend
- PHP
- MySQL

### Development Environment
- XAMPP v3.3.0
- Apache 2.4.54
- MySQL 8.0.30
- PHP 8.1.12
- phpMyAdmin 5.2.0

## Setup Instructions

### 1. Install XAMPP
Download and install from https://www.apachefriends.org/

### 2. Clone Repository
Copy files to `xampp/htdocs/EventTracker/`

### 3. Database Setup
- Open phpMyAdmin (http://localhost/phpmyadmin)
- Create database 'event_tracker'
- Import SQL file from `/database/event_tracker.sql`

### 4. Run Application
- Start XAMPP (Apache & MySQL)
- Visit http://localhost/EventTracker
- Visit http://localhost/phpmyadmin

## Features

- Event Management (Create, Read, Update, Delete)
- Organizer Assignment
- Active/Inactive Organizer Filtering
- Responsive Design
- Status Change Tracking
- Color-Coded Event Status
- Search Function
- Calendar View with Multiple Display Options
- Planner Functionality with Persistent Notes

## Project Structure

```
EventTracker/
├── api/
│   ├── events.php            # Main API handler for event operations
│   └── event-details.php     # API handler for detailed event operations
├── database/
│   └── event_tracker.sql     # Database schema and initial data
├── config.php               # Database configuration
├── index.html               # Main page with event creation form
├── event-details.html       # Event management page
├── styles.css              # Shared styles for both pages
├── scripts.js             # JavaScript for index.html
├── calendar.js            # JavaScript for calendar.html
├── calendar.html          # Calendar page
└── event-details.js       # JavaScript for event-details.html
```

## File Descriptions

### Frontend Files
- **index.html**: Main entry page with form to create new events and assign organizers
- **event-details.html**: Management interface for viewing and editing events
- **calendar.html**: Calendar page with multiple view options and planner functionality
- **styles.css**: Contains all styling for all pages, including responsive design
- **scripts.js**: Handles event creation and organizer loading for main page
- **event-details.js**: Manages event editing, deletion, and updates
- **calendar.js**: Handles calendar functionality, view switching, and note management

### Backend Files
- **api/events.php**: Handles CRUD operations for events and organizer data
- **api/event-details.php**: Processes detailed event operations and updates
- **config.php**: Contains database configuration settings

### Database
- **database/event_tracker.sql**: Complete database structure including:
  - Event table
  - Organizer table
  - Initial data setup

## Viewing Changes in phpMyAdmin

### 1. Event Creation
- When a new event is added through the form, refresh phpMyAdmin
- Navigate to event_tracker > Event table
- New event appears with assigned org_id and details

### 2. Organizer Updates
- After changing an event's organizer and saving
- Check Event table in phpMyAdmin
- The org_id column will reflect the new organizer assignment
- Cross-reference org_id with Organizer table to see organizer details

### 3. Database Relationships
- Events are linked to Organizers through org_id
- Each event record shows:
  - event_num (unique identifier)
  - org_id (connects to Organizer table)
  - event details (location, dates, status)

## What's New in Version 2.0

### 1. Status Change
- Status can now be changed in Event Management
- Changes are tracked in the database

### 2. Color Coded Event Status
- **Green**: Upcoming events
- **Orange**: Planning events

### 3. Search Function
- Search for specific events on the main page

### 4. Calendar Page
- New page displaying a calendar with all events
- Color-coded events (upcoming/planning)
- Multiple calendar views (month, week, day)
- "Today" button that highlights the current date
- **Planner functionality**: Click to add text notes in "week" or "day" view
- Notes added in calendar are displayed only in calendar view, not on home page
- Persistent storage for calendar notes
- Click to delete notes in "week" or "day" view

## Usage

1. **Creating Events**: Use the main page form to create new events and assign organizers
2. **Managing Events**: Navigate to the event details page to edit, update, or delete events
3. **Calendar View**: Use the calendar page to view events in a calendar format and add planning notes
4. **Search**: Use the search function on the main page to find specific events
5. **Status Tracking**: Update event status and see color-coded visual indicators
