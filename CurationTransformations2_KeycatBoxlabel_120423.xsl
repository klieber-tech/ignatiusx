<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="IgX_IdeaBox_allTransformations.xsl"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Define a key to group ideas by Keycat -->
    <xsl:key name="ideas-by-keycat" match="Idea" use="Keycat"/>
    <!-- Define a key to group ideas by Keycat and boxlabel -->
    <xsl:key name="ideas-by-keycat-boxlabel" match="Idea" use="concat(Keycat, '|', boxlabel)"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ideas Organized by Keycat and Boxlabel</title>
                <style>
                    /* Define CSS style for Keycat header */
                    .keycat-header {
                    font-weight: bold;
                    color: purple;
                    }
                </style>
            </head>
            <body>
                <h1>Ideas Organized by Keycat and Boxlabel</h1>
                
                <!-- Loop through distinct Keycat values -->
                <xsl:for-each select="//Idea[generate-id() = generate-id(key('ideas-by-keycat', Keycat)[1])]">
                    <!-- Apply CSS style to Keycat header -->
                    <h2 class="keycat-header"><xsl:value-of select="Keycat"/></h2>
                    <!-- Loop through distinct boxlabel values within the current Keycat -->
                    <xsl:for-each select="key('ideas-by-keycat', Keycat)[generate-id() = generate-id(key('ideas-by-keycat-boxlabel', concat(Keycat, '|', boxlabel))[1])]">
                        <h3><xsl:value-of select="boxlabel"/></h3>
                        <ul>
                            <!-- Select ideas with the current Keycat and boxlabel values -->
                            <xsl:for-each select="key('ideas-by-keycat-boxlabel', concat(Keycat, '|', boxlabel))">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </xsl:for-each>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
