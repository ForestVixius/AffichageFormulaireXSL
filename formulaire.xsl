<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>
			<h1>Les différents type de navire</h1>
				<xsl:apply-templates select="port" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="port">
		<xsl:for-each select="typeNav">
			<xsl:value-of select="@idType"/>
			&#160;&#160;
			<xsl:value-of select="designation"/>
			<br />
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>