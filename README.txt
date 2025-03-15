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
1. Install XAMPP
   Download and install from https://www.apachefriends.org/

2. Clone Repository
   Copy files to xampp/htdocs/EventTracker/

3. Database Setup
   - Open phpMyAdmin (http://localhost/phpmyadmin)
   - Create database 'event_tracker'
   - Import SQL file from /database/event_tracker.sql

4. Run Application
   - Start XAMPP (Apache & MySQL)
   - Visit http://localhost/EventTracker
   - Visit http://localhost/phpmyadmin

## Features
- Event Management (Create, Read, Update, Delete)
- Organizer Assignment
- Active/Inactive Organizer Filtering
- Responsive Design

## Project Structure
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
├── calendar.html          # calendar page
└── event-details.js       # JavaScript for event-details.html

## File Descriptions
### Frontend Files
- index.html: Main entry page with form to create new events and assign organizers
- event-details.html: Management interface for viewing and editing events
- styles.css: Contains all styling for both pages, including responsive design
- scripts.js: Handles event creation and organizer loading for main page
- event-details.js: Manages event editing, deletion, and updates

### Backend Files
- api/events.php: Handles CRUD operations for events and organizer data
- api/event-details.php: Processes detailed event operations and updates
- config.php: Contains database configuration settings

### Database
- database/event_tracker.sql: Complete database structure including:
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



###Additions made to version 2.0
1. Status Change
-Status can now be changed in Event Management, will be tracked in database

2. Color Coded Event Status
-Status will be Green for upcoming and Orange for planning

3. Search Function
-You can now search for specific events on the main page

4. Calendar Page
-New page that displays a calendar showing all events. Color coded as well for upcoming/planning
-Multiple calendar views
-Features a "today" button that highlights the current date.
-Planner functionality: click to add text on "week", or "day" view.
Notes added in the calendar in the "week" or "day" tab will only be displayed in the
calendar, not the home page.
-Persistent storage for calendar notes
-Click to delete notes made on the "week" or "day" view









