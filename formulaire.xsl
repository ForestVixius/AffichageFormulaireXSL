<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>
			<h1>Prévisualisation du formulaire :</h1>
				<h3>Boutons Groupe :</h3>
				<xsl:apply-templates select="formulaire/boutonGroupe" />
				<h3>Liste :</h3>
				<xsl:apply-templates select="formulaire/liste" />
				<h3>Composants :</h3>
				<xsl:apply-templates select="formulaire/composant" />

			</body>
		</html>
	</xsl:template>

	<xsl:template match="boutonGroupe">
			<xsl:value-of select="@id"/>
			<br />
	</xsl:template>

	<xsl:template match="liste">
		<xsl:value-of select="@id"/>
		<br />
	</xsl:template>

	<xsl:template match="composant">
		<xsl:value-of select="@id"/>
		<br />
	</xsl:template>

</xsl:stylesheet>