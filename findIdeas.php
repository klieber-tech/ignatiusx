<?php
if (isset($_GET['keyword'])) {
    $keyword = $_GET['keyword'];
    $filePath = 'IgX_IdeaBoxDB.xml';
    $xml = simplexml_load_file($filePath);
    $filteredIdeas = [];

    foreach ($xml->Ideaboxes->Ideabox->Ideas->Idea as $idea) {
        // Check if the idea text contains the keyword
        if (strpos(strtolower($idea), strtolower($keyword)) !== false) {
            $filteredIdeas[] = [
                'id' => (string)$idea['id'],
                'text' => (string)$idea,
                'keycat' => isset($idea->Keycat) ? (string)$idea->Keycat : '',
                'timestamp' => isset($idea->TimestampCreated) ? (string)$idea->TimestampCreated : '',
                'boxlabel' => isset($idea->boxlabel) ? (string)$idea->boxlabel : '',
                'ideanotes' => isset($idea->Ideanotes) ? (string)$idea->Ideanotes : ''
            ];
        }
    }

    echo json_encode($filteredIdeas);
} else {
    echo json_encode(["error" => "No keyword provided"]);
}
?>
