<?php
ini_set('display_errors', 1);
ini_set('log_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Receive JSON POST data
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    $ideaText = $data->idea;
    $keycatText = $data->keycat;

    // Correct the path to your XML file
    $filePath = 'IgX_IdeaBoxDB.xml';
    $xml = simplexml_load_file($filePath);

    // Check if the XML file is loaded correctly
    if ($xml === false) {
        echo "Failed to load XML file";
        exit;
    }

    // Create a unique ID
    $id = round(microtime(true) * 1000);

    // Convert the XML object to a string and add the new elements
    $xmlString = $xml->asXML();

    // New idea and keycat formatted with indentation and line breaks
    $newIdeaFormatted = "\n\t\t\t<Idea id=\"" . $id . "\">" . htmlspecialchars($ideaText) .
                        "\n\t\t\t\t<Keycat>" . htmlspecialchars($keycatText) . "</Keycat>" .
                        "\n\t\t\t</Idea>";

    // Replace the last closing tag with new idea + closing tag
    $xmlString = str_replace("</Ideas>", $newIdeaFormatted . "</Ideas>", $xmlString);

    // Save the formatted string back to the file
    if (file_put_contents($filePath, $xmlString)) {
        echo "Idea and Key Category added successfully";
    } else {
        echo "Error saving the idea";
    }
} else {
    echo "Invalid request method";
}
?>
