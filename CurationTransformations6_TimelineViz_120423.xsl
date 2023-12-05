<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ideas Timeline</title>
                <!-- Add CSS here or link to an external stylesheet -->
            </head>
            <body>
                <h1>Ideas Timeline</h1>
                <div class="timeline">
                    <xsl:for-each select="//Idea">
                        <xsl:sort select="TimestampCreated" data-type="text" order="ascending"/>
                        <div class="timeline-item">
                            <div class="timeline-time">
                                <xsl:value-of select="TimestampCreated"/>
                            </div>
                            <div class="timeline-content">
                                <h2><xsl:value-of select="Keycat"/></h2>
                                <p><xsl:value-of select="Ideanotes"/></p>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
