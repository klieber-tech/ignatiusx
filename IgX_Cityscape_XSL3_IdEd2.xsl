<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
        
        <xsl:template match="/">
            <html>
                <head><title>Analytics Ideas for College Admissions</title></head>
                <body>
                    <h1>Ideas by Edifice:</h1>
                    <xsl:apply-templates select="//Edifice" />
                </body>
            </html>
        </xsl:template>
        
        <xsl:template match="Edifice">
            <h2>
                <xsl:value-of select="@id"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="Title"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="Output"/>
                
            </h2>
            <ul>
                <xsl:apply-templates select="Building_Block/Idea" />
            </ul>
        </xsl:template>
        
        <xsl:template match="Idea">
            <li><xsl:value-of select="."/></li>
        </xsl:template>
    </xsl:stylesheet>