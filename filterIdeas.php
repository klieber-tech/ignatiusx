<?php
$xml = new DOMDocument;
$xml->load('IgX_IdeaBoxDB.xml');

$xsl = new DOMDocument;
$xsl->load('IgX_IdeaBox_allTransformations.xsl');

$processor = new XSLTProcessor;
$processor->importStylesheet($xsl);

echo $processor->transformToXML($xml);
?>
