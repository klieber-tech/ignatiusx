<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="IgX_IdeaBox_allTransformations.xsl"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Define keys for sorting -->
    <xsl:key name="ideas-by-boxlabel" match="Idea" use="boxlabel"/>
    <xsl:key name="ideas-by-boxlabel-keycat" match="Idea" use="concat(boxlabel, '|', Keycat)"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ideas Clustered by Boxlabel and Subsorted by Keycat</title>
            </head>
            <body>
                <h1>Ideas Clustered by Boxlabel and Subsorted by Keycat</h1>
                
                <!-- Loop through distinct boxlabel values -->
                <xsl:for-each select="//Idea[generate-id() = generate-id(key('ideas-by-boxlabel', boxlabel)[1])]">
                    <h2><xsl:value-of select="boxlabel"/></h2>
                    
                    <!-- Loop through distinct Keycat values within each boxlabel -->
                    <xsl:for-each select="key('ideas-by-boxlabel', boxlabel)[generate-id() = generate-id(key('ideas-by-boxlabel-keycat', concat(boxlabel, '|', Keycat))[1])]">
                        <h3><xsl:value-of select="Keycat"/></h3>
                        <ul>
                            <!-- List ideas under this Keycat -->
                            <xsl:for-each select="key('ideas-by-boxlabel-keycat', concat(boxlabel, '|', Keycat))">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
