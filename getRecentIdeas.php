<?php
$filePath = 'IgX_IdeaBoxDB.xml';
$xml = simplexml_load_file($filePath);

if ($xml === false) {
    echo json_encode(["error" => "Failed to load XML file"]);
    exit;
}

// Extract ideas and reverse to get the most recent first
$ideasArray = [];
foreach ($xml->Ideaboxes->Ideabox->Ideas->Idea as $idea) {
    $ideasArray[] = [
        'id' => (string)$idea['id'],
        'text' => (string)$idea,
        'keycat' => (string)$idea->Keycat
    ];
}

// Return only the most recent ideas, e.g., the last 5 entries
$recentIdeas = array_slice(array_reverse($ideasArray), 0, 21);

echo json_encode($recentIdeas);
?>
