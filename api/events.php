<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT");
header("Access-Control-Allow-Headers: Content-Type");

include_once '../config.php';

$method = $_SERVER['REQUEST_METHOD'];

switch($method) {
    case 'GET':
        if (isset($_GET['action']) && $_GET['action'] === 'organizers') {
            try {
                $stmt = $pdo->query("SELECT org_id, orgname FROM Organizer WHERE event_status = 'active'");
                $organizers = $stmt->fetchAll(PDO::FETCH_ASSOC);
                error_log('Organizers found: ' . count($organizers));
                echo json_encode($organizers);
            } catch (PDOException $e) {
                error_log('Error fetching organizers: ' . $e->getMessage());
                echo json_encode(['error' => 'Failed to fetch organizers']);
            }
            break;
        }
        
 // Replace the existing SELECT query in GET case
$stmt = $pdo->query("
SELECT e.event_num, e.event_start_date, e.event_end_date, 
       e.event_location, e.event_status, e.org_id
FROM Event e
ORDER BY e.event_start_date
");

        $events = $stmt->fetchAll();
        echo json_encode($events);
        break;
        
    case 'POST':
        $data = json_decode(file_get_contents("php://input"));
        $stmt = $pdo->prepare("
            INSERT INTO Event (event_num, event_start_date, event_end_date, 
                             event_status, event_location, org_id) 
            VALUES (?, ?, ?, ?, ?, ?)
        ");
        $stmt->execute([
            $data->event_num,
            $data->start_date,
            $data->end_date,
            $data->status,
            $data->location,
            $data->org_id
        ]);
        echo json_encode(["message" => "Event created successfully"]);
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));
        $stmt = $pdo->prepare("
            UPDATE Event 
            SET event_location = ?, 
                event_start_date = ?,
                event_end_date = ?,
                org_id = ?
            WHERE event_num = ?
        ");
        $stmt->execute([
            $data->location,
            $data->start_date,
            $data->end_date,
            $data->org_id,
            $data->event_num
        ]);
        echo json_encode(["message" => "Event updated successfully"]);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));
        $stmt = $pdo->prepare("DELETE FROM Event WHERE event_num = ?");
        $stmt->execute([$data->event_num]);
        echo json_encode(["message" => "Event deleted successfully"]);
        break;
}
?>

