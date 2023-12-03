<?php
if (isset($_GET['keyword'])) {
    $keyword = $_GET['keyword'];
    $filePath = 'IgX_IdeaBoxDB.xml';
    $xml = simplexml_load_file($filePath);
    $filteredIdeas = [];

foreach ($xml->Ideaboxes->Ideabox->Ideas->Idea as $idea) {
    if (strpos(strtolower($idea), strtolower($keyword)) !== false) {
        $filteredIdeas[] = [
            'text' => (string)$idea,
            'keycat' => (string)$idea->Keycat,
            'timestamp' => (string)$idea->TimestampCreated,
            'boxlabel' => isset($idea->boxlabel) ? (string)$idea->boxlabel : '' // Ensure boxlabel is set
			'ideanotes' => isset($idea->Ideanotes) ? (string)$idea->Ideanotes : ''
 
        ];
    }
}
    echo json_encode($filteredIdeas);
} else {
    echo json_encode(["error" => "No keyword provided"]);
}
?>


