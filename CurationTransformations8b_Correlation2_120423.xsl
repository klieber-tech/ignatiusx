<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Define the key for grouping ideas by Keycat -->
    <xsl:key name="ideas-by-keycat" match="Idea" use="Keycat"/>
    
    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Keycat Correlation Map 2</title>
            </head>
            <body>
                <h1>Keycat Correlation Map 2</h1>
                <div class="correlation-map">
                    <!-- Iterate over each Keycat -->
                    <xsl:for-each select="//Idea[count(. | key('ideas-by-keycat', Keycat)[1]) = 1]">
                        <xsl:variable name="currentKeycat" select="Keycat"/>
                        <!-- Display current Keycat -->
                        <div class="keycat">
                            <h2><xsl:value-of select="$currentKeycat"/></h2>
                            <ul>
                                <!-- List all ideas in this Keycat -->
                                <xsl:for-each select="key('ideas-by-keycat', $currentKeycat)">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>
                            <!-- Compare with other Keycats -->
                            <xsl:for-each select="//Idea[Keycat != $currentKeycat]">
                                <xsl:variable name="otherKeycat" select="Keycat"/>
                                <!-- Simple keyword extraction -->
                                <xsl:variable name="sharedWords" select="."/>
                                <!-- Check for shared keywords (simplified) -->
                                <xsl:if test="contains(Ideanotes, $currentKeycat)">
                                    <div class="correlation">
                                        <p>Shares keywords with <xsl:value-of select="$otherKeycat"/>: <xsl:value-of select="$sharedWords"/></p>
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
