<?php
ini_set('display_errors', 1);
ini_set('log_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Receive JSON POST data
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $ideaText = $data->idea;

    // Load your XML file
    $xml = simplexml_load_file('IgX_IdeaBoxDB.xml');

    // Create a unique ID
    $id = round(microtime(true) * 1000);

    // Add the idea to the XML
    $newIdea = $xml->Ideaboxes->Ideabox->Ideas->addChild('Idea', $ideaText);
    $newIdea->addAttribute('id', $id);

    // Save the XML file
    $xml->asXML('IgX_IdeaBoxDB.xml');
    
    echo "Idea added successfully";
} else {
    echo "Invalid request method";
}
?>
