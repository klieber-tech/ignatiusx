<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!-- Identity transform: copy all elements and attributes as-is -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Customize the output for <Idea> elements -->
    <xsl:template match="Idea">
        <xsl:text>&#10;</xsl:text>
        <!-- Idea ID in bold -->
        <strong><xsl:value-of select="@id"/></strong>: 
        <!-- Idea text -->
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
 
</xsl:stylesheet>
