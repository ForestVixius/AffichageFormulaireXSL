<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>

			<h1>Prévisualisation du formulaire :</h1>
				<xsl:for-each select="./*">
					<xsl:if test="name(.) = 'boutonGroupe'">
						
					</xsl:if>
				</xsl:for-each>
				<br />
				<!-- <h3>Boutons Groupe :</h3>
				<xsl:apply-templates select="formulaire/boutonGroupe" />
				<h3>Liste :</h3>
				<xsl:apply-templates select="formulaire/liste" />
				<h3>Composants :</h3>
				<xsl:apply-templates select="formulaire/composant" /> -->

			</body>
		</html>
	</xsl:template>

	<xsl:template match="boutonGroupe">
		<xsl:for-each select="./*">
			<xsl:value-of select="."></xsl:value-of>&#160;
		</xsl:for-each>
		<br />
	</xsl:template>

	<xsl:template match="liste">
		<xsl:for-each select="./*">
			<xsl:value-of select="."></xsl:value-of>&#160;
		</xsl:for-each>
		<br />
	</xsl:template>

	<xsl:template match="composant">
		<xsl:for-each select="./*">
			<xsl:value-of select="."></xsl:value-of>&#160;
		</xsl:for-each>
		<br />
	</xsl:template>

</xsl:stylesheet>