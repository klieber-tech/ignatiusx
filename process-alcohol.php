<?php
// Enable error reporting for debugging
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect and sanitize input data
    $alcoholType = htmlspecialchars($_POST['alcohol']);

    // Specify the path to the XML file
    $xmlFilePath = 'SuperCocktailsxa_111823.xml';

    // Check if the XML file exists and is writable
    if (file_exists($xmlFilePath) && is_writable($xmlFilePath)) {
        // Load the XML file
        $xml = simplexml_load_file($xmlFilePath);
        if ($xml === false) {
            echo "Failed to open XML file for reading.";
            exit;
        }

        // Add a new cocktail entry
        $cocktail = $xml->addChild('cocktail');
        $cocktail->addChild('alcohol', $alcoholType);

        // Save the updated XML back to the file
        if ($xml->asXML($xmlFilePath) === false) {
            echo "Failed to write to XML file.";
        } else {
            // Redirect back to the form after adding the entry
            header('Location: AdvancedCocktails2xa_111823.html');
            exit;
        }
    } else {
        if (!file_exists($xmlFilePath)) {
            echo "Error: XML file does not exist.";
        } else {
            echo "Error: XML file is not writable.";
        }
    }
} else {
    // Message to show when accessing the file directly
    echo "Please submit the form.";
}
?>
