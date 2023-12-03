<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $ideaId = $data->id;
    $boxLabelValue = $data->boxlabel;

    $filePath = 'IgX_IdeaBoxDB.xml';
    $xml = simplexml_load_file($filePath);

    foreach ($xml->Ideaboxes->Ideabox->Ideas->Idea as $idea) {
		// echo "Checking idea with ID: " . (string)$idea['id'] . "\n"; // Debugging line
        if ((string)$idea['id'] === $ideaId) {
            // Check if the boxlabel element exists
            if (isset($idea->boxlabel)) {
                // If it exists, update its value
                $idea->boxlabel = $boxLabelValue;
            } else {
                // If it doesn't exist, create it
                $idea->addChild('boxlabel', $boxLabelValue);
            }
            // Save the updated XML
            $xml->asXML($filePath);
            echo "BoxLabel updated successfully";
            exit;
        }
    }
    echo "Idea not found";
} else {
    echo "Invalid request method";
}
?>
