<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="IgX_IdeaBox_allTransformations.xsl"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Define a key to group ideas by boxlabel -->
    <xsl:key name="ideas-by-boxlabel" match="Idea" use="boxlabel"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ideas Clustered by Boxlabel</title>
            </head>
            <body>
                <h1>Ideas Clustered by Boxlabel</h1>
                
                <!-- Loop through distinct boxlabel values -->
                <xsl:for-each select="//Idea[generate-id() = generate-id(key('ideas-by-boxlabel', boxlabel)[1])]">
                    <h2><xsl:value-of select="boxlabel"/></h2>
                    <ul>
                        <!-- Select ideas with the current boxlabel value -->
                        <xsl:for-each select="key('ideas-by-boxlabel', boxlabel)">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
