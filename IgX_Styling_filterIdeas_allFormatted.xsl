<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Template for matching Idea elements -->
    <xsl:template match="Idea">
        <!-- Field Name in Bold -->
        <strong>ID:</strong> <xsl:value-of select="@id"/><br/>
        <strong>Text:</strong> <xsl:value-of select="."/><br/>
        
        <!-- Check if Keycat exists -->
        <strong>Key Category:</strong>
        <xsl:choose>
            <xsl:when test="Keycat != ''">
                <xsl:value-of select="Keycat"/>
            </xsl:when>
            <xsl:otherwise>Not Specified</xsl:otherwise>
        </xsl:choose>
        <br/>
        
        <!-- Other fields similarly... -->
        
        <!-- Blank line after each idea -->
        <br/><br/>
    </xsl:template>
    
    <!-- Additional templates and formatting as needed -->
</xsl:stylesheet>
