<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="IgX_IdeaBox_allTransformations.xsl"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Define a key to group ideas by Keycat -->
    <xsl:key name="ideas-by-keycat" match="Idea" use="Keycat"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ideas Clustered by Keycat</title>
            </head>
            <body>
                <h1>Ideas Clustered by Keycat</h1>
                
                <!-- Loop through distinct Keycat values -->
                <xsl:for-each select="//Idea[generate-id() = generate-id(key('ideas-by-keycat', Keycat)[1])]">
                    <h2><xsl:value-of select="Keycat"/></h2>
                    <ul>
                        <!-- Select ideas with the current Keycat value -->
                        <xsl:for-each select="key('ideas-by-keycat', Keycat)">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
