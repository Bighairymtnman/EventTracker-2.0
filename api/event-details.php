<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET, PUT");
header("Access-Control-Allow-Headers: Content-Type");

include_once '../config.php';

// Add error logging
error_log("Request received: " . $_SERVER['REQUEST_METHOD']);
error_log("GET params: " . print_r($_GET, true));

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    try {
        if (isset($_GET['action']) && $_GET['action'] === 'list') {
            // Get all events
            $stmt = $pdo->query("SELECT * FROM Event ORDER BY event_start_date");
            $events = $stmt->fetchAll();
            error_log("Events found: " . count($events));
            echo json_encode($events);
        }
        elseif (isset($_GET['action']) && $_GET['action'] === 'details' && isset($_GET['event_num'])) {
            $event_num = $_GET['event_num'];
            
            // Get event details
            $eventStmt = $pdo->prepare("SELECT * FROM Event WHERE event_num = ?");
            $eventStmt->execute([$event_num]);
            $event = $eventStmt->fetch();
            
            // Get organizers
            $organizerStmt = $pdo->query("SELECT org_id, orgname FROM Organizer WHERE event_status = 'active'");
            $organizers = $organizerStmt->fetchAll();
            
            echo json_encode([
                'event' => $event,
                'organizers' => $organizers
            ]);
        }
    } catch (Exception $e) {
        error_log("Error: " . $e->getMessage());
        echo json_encode(['error' => $e->getMessage()]);
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    $data = json_decode(file_get_contents("php://input"));
    
    $stmt = $pdo->prepare("
        UPDATE Event
        SET event_location = ?, 
            event_start_date = ?,
            event_end_date = ?,
            org_id = ?,
            event_status = ?
        WHERE event_num = ?
    ");
    
    $stmt->execute([
        $data->location,
        $data->start_date,
        $data->end_date,
        $data->org_id,
        $data->event_status,
        $data->event_num
    ]);
    
    echo json_encode(["message" => "Event updated successfully"]);
}
?>
