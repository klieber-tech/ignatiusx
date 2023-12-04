<?php
$xml = simplexml_load_file('IgX_IdeaBoxDB.xml');
header("Content-type: text/xml");
echo $xml->asXML();
?>
