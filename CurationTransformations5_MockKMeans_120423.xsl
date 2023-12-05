<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:key name="ideas-by-keycat" match="Idea" use="Keycat"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Keycat Summary - Faux K-Means</title>
            </head>
            <body>
                <h1>Keycat Summary - Faux K-Means</h1>
                <xsl:for-each select="//Idea[count(. | key('ideas-by-keycat', Keycat)[1]) = 1]">
                    <xsl:sort select="count(key('ideas-by-keycat', Keycat))" data-type="number" order="descending"/>
                    <xsl:variable name="currentKeycat" select="Keycat"/>
                    <xsl:variable name="ideaCount" select="count(key('ideas-by-keycat', Keycat))"/>
                    <h2>
                        <xsl:value-of select="$currentKeycat"/>
                        <span> (Ideas: <xsl:value-of select="$ideaCount"/>)</span>
                    </h2>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
