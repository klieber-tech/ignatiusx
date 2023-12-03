<?php
if (isset($_GET['ideaId'])) {
    $ideaId = $_GET['ideaId'];
    $filePath = 'IgX_IdeaBoxDB.xml';
    $xml = simplexml_load_file($filePath);
    
    foreach ($xml->Ideaboxes->Ideabox->Ideas->Idea as $idea) {
        if ((string)$idea['id'] === $ideaId) {
            // Extract the necessary details
            $ideaDetails = [
                'id' => (string)$idea['id'],
                'text' => (string)$idea,
                'keycat' => (string)$idea->Keycat,
                'timestamp' => (string)$idea->TimestampCreated
            ];
            echo json_encode($ideaDetails);
            exit;
        }
    }
}
echo json_encode(["error" => "Idea not found"]);
?>
