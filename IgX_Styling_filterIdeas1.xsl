<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    
    <!-- Template for matching Idea elements -->
    <xsl:template match="Idea">
        <!-- Check if Keycat equals 'Admissions Analytics' -->
        <xsl:if test="Keycat = 'Admissions Analytics'">
            <!-- Formatting for each field -->
            <strong>ID:</strong> <xsl:value-of select="@id"/><br/>
            <strong>Text:</strong> <xsl:value-of select="."/><br/>
            <strong>Key Category:</strong> <xsl:value-of select="Keycat"/><br/>
            
            <!-- Other fields... -->
            
            <!-- Blank line after each idea -->
            <br/><br/>
        </xsl:if>
    </xsl:template>
    
    <!-- Additional templates and formatting as needed -->
</xsl:stylesheet>
