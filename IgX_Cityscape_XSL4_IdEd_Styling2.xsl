<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/Cityscape">
        <html>
            <head>
                <title>Ideas By Edifice</title>
                <style>
                    body {
                    font-family: 'Arial', sans-serif;
                    background-color: #f4f4f4;
                    color: #333;
                    margin: 0;
                    padding: 0;
                    }
                    .container {
                    max-width: 800px;
                    margin: 50px auto;
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    }
                    h2 {
                    color: #2C3E50;
                    border-bottom: 2px solid #3498DB;
                    padding-bottom: 10px;
                    margin-bottom: 20px;
                    }
                    ul {
                    list-style-type: none;
                    padding-left: 0;
                    }
                    li {
                    padding: 10px 0;
                    border-top: 1px solid #eaeaea;
                    }
                    li:first-child {
                    border-top: none;
                    }
                    .header-image {
                    width: 100%;
                    height: 50px;
                    background-image: url('https://luc2023fall.s3.us-east-2.amazonaws.com/ignatiusx/grid-black-pattern-yellow-glow.jpg'); 
                    background-repeat: no-repeat;
                    background-size: cover; 
                    background-position: center; 
                    }
                </style>
            </head>
            <body>
                <div class="header-image"></div>
                <div class="container">
                    <xsl:apply-templates select="Edifice"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="Edifice">
        <h2>
            <xsl:value-of select="@id"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="Title"/>
        </h2>
        <ul>
            <xsl:apply-templates select="Building_Block/Idea"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="Idea">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>
