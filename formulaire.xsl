<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link href="base.css" rel="stylesheet"/>
			</head>
			<body>

			<h1>Prévisualisation du formulaire :</h1>
			<form action="https://www.w3schools.com/action_page.php">
				<table>
					<xsl:for-each select="/.">
						<xsl:for-each select="descendant::*">
							<xsl:if test="name(.) = 'boutonGroupe'">
								<tr><td><xsl:value-of select="label"></xsl:value-of></td><td>
								<xsl:for-each select="descendant::*">
									<xsl:if test="name(.) = 'checkBox'">
										<td><xsl:element name="input">
											<xsl:attribute name="class">inputForm</xsl:attribute>
											<xsl:attribute name="type">checkbox</xsl:attribute>
											<xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute>
											<p class="textInput">	<xsl:value-of select="."/></p>
										</xsl:element></td>
									</xsl:if>
									<xsl:if test="name(.) = 'boutonRadio'">
										<xsl:element name="input">
											<xsl:attribute name="class">inputForm</xsl:attribute>
											<xsl:attribute name="name"><xsl:value-of select="../@id"/></xsl:attribute>
											<xsl:attribute name="type">radio</xsl:attribute>
											<xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute>
											<p class="textInput">	<xsl:value-of select="."/></p>
										</xsl:element>
									</xsl:if>
								</xsl:for-each>
								</td></tr>
							</xsl:if>
							
							<xsl:if test="name(.) = 'composant'">
								<tr><td><xsl:value-of select="label"></xsl:value-of></td><td>
								<xsl:if test="@compo != 'label'">
									<xsl:element name="input">
										<xsl:attribute name="class">inputForm</xsl:attribute>
										<xsl:attribute name="type">text</xsl:attribute>
										<xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute>
									</xsl:element>
								</xsl:if></td></tr>
							</xsl:if>
							<xsl:if test="name(.) = 'liste'">
								<tr>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<select>
									<xsl:for-each select="descendant::*">
										<xsl:if test="name(.) != 'label'">
											<option><xsl:value-of select="."/></option>
										</xsl:if>
									</xsl:for-each>
								</select>
								</td></tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</table>
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