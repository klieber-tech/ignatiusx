<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <!-- Template to split text into words -->
    <xsl:template name="split-words">
        <xsl:param name="text"/>
        <xsl:if test="string-length($text) > 0">
            <xsl:variable name="word" select="substring-before(concat($text, ' '), ' ')"/>
            <xsl:element name="word">
                <xsl:value-of select="$word"/>
            </xsl:element>
            <xsl:call-template name="split-words">
                <xsl:with-param name="text" select="substring-after($text, ' ')"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Tag Cloud</title>
            </head>
            <body>
                <h1>Tag Cloud</h1>
                <div class="tag-cloud">
                    <!-- Loop through each Ideanotes -->
                    <xsl:for-each select="//Ideanotes">
                        <xsl:call-template name="split-words">
                            <xsl:with-param name="text" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
