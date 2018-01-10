<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
			</head>
			<body>

			<h1>Prévisualisation du formulaire :</h1>
			<form>
				<xsl:for-each select="/.">
					<xsl:for-each select="descendant::*">
						<xsl:if test="name(.) = 'boutonGroupe'">
							<xsl:value-of select="label"></xsl:value-of>&#160;&#160;
							<xsl:for-each select="descendant::*">
								<xsl:if test="name(.) = 'checkBox'">
									<input type="checkbox" name="." value="."></input>
									<xsl:value-of select="."/>&#160;
								</xsl:if>
								<xsl:if test="name(.) = 'boutonRadio'">
									<input type="radio" name="." value="."></input>
									<xsl:value-of select="."/>&#160;
								</xsl:if>
							</xsl:for-each>
							<br />
						</xsl:if>
						<xsl:if test="name(.) = 'liste'">
							<xsl:value-of select="label"></xsl:value-of>&#160;&#160;
							<xsl:for-each select="descendant::*">
								<xsl:if test="name(.) != 'label'">
									<xsl:value-of select="."/>&#160;
								</xsl:if>
							</xsl:for-each>
							<br />
						</xsl:if>
						<xsl:if test="name(.) = 'composant'">

							<xsl:value-of select="label"></xsl:value-of>&#160;&#160;
							<xsl:for-each select="descendant::*">
								<xsl:if test="name(.) != 'label'">
									<xsl:value-of select="."/>&#160;
								</xsl:if>
							</xsl:for-each>
							<br />
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
				</form>
				<!-- <h3>Boutons Groupe :</h3>
				<xsl:apply-templates select="formulaire/boutonGroupe" />
				<h3>Liste :</h3>
				<xsl:apply-templates select="formulaire/liste" />
				<h3>Composants :</h3>
				<xsl:apply-templates select="formulaire/composant" /> -->

			</body>
		</html>
	</xsl:template>



</xsl:stylesheet>