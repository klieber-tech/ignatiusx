<?php
ini_set('display_errors', 1);
ini_set('log_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Receive JSON POST data
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $ideaText = $data->idea;

    // Correct the path to your XML file
    $filePath = 'IgX_IdeaBoxDB.xml';
    $xml = simplexml_load_file($filePath);

    // Check if the XML file is loaded correctly
    if ($xml === false) {
        echo "Failed to load XML file";
        exit; // Exit if file not loaded
    }

    // Create a unique ID
    $id = round(microtime(true) * 1000);

    // New idea formatted with indentation and line breaks
    $newIdeaFormatted = "\n\t\t\t<Idea id=\"" . $id . "\">" . htmlspecialchars($ideaText) . "</Idea>";

    // Convert the XML object to a string
    $xmlString = $xml->asXML();

    // Replace the last closing tag with new idea + closing tag
    $xmlString = str_replace("</Ideas>", $newIdeaFormatted . "</Ideas>", $xmlString);

    // Save the formatted string back to the file
    file_put_contents($filePath, $xmlString);

    echo "Idea added successfully";
} else {
    echo "Invalid request method";
}
?>
