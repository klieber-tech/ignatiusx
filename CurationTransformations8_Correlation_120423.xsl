<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Define the key for grouping ideas by Keycat -->
    <xsl:key name="ideas-by-keycat" match="Idea" use="Keycat"/>
    
    <!-- Template to split text into words -->
    <xsl:template name="split-words">
        <xsl:param name="text"/>
        <xsl:if test="string-length($text) > 0">
            <xsl:variable name="word" select="normalize-space(substring-before(concat($text, ' '), ' '))"/>
            <xsl:if test="$word != ''">
                <xsl:element name="word">
                    <xsl:value-of select="$word"/>
                </xsl:element>
            </xsl:if>
            <xsl:call-template name="split-words">
                <xsl:with-param name="text" select="substring-after($text, ' ')"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Keycat Correlation Map</title>
            </head>
            <body>
                <h1>Keycat Correlation Map</h1>
                <div class="correlation-map">
                    <!-- Iterate over each Keycat -->
                    <xsl:for-each select="//Idea[count(. | key('ideas-by-keycat', Keycat)[1]) = 1]">
                        <xsl:variable name="currentKeycat" select="Keycat"/>
                        <xsl:variable name="currentIdeanotes" select="key('ideas-by-keycat', Keycat)/Ideanotes"/>
                        <!-- Display current Keycat -->
                        <div class="keycat">
                            <h2><xsl:value-of select="$currentKeycat"/></h2>
                            <!-- Compare with other Keycats -->
                            <xsl:for-each select="//Idea[Keycat != $currentKeycat]">
                                <xsl:variable name="otherKeycat" select="Keycat"/>
                                <!-- Check for shared keywords -->
                                <!-- This part is oversimplified and needs a more sophisticated method -->
                                <xsl:if test="contains($currentIdeanotes, Ideanotes)">
                                    <div class="correlation">
                                        <p>Shares keywords with <xsl:value-of select="$otherKeycat"/></p>
                                    </div>
                                </xsl:if>
                            </xsl:for-each>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
