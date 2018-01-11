<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<link href="base.css" rel="stylesheet"/>
				<script src="jquery-3.1.1.min.js"></script>
				<script type="text/javascript" src="touches.js"></script>
			</head>
			<body>

			<h1>Prévisualisation du formulaire :</h1>
			<form action="https://www.w3schools.com/action_page.php">
				<table>
					<xsl:for-each select="/.">
						<xsl:for-each select="descendant::*">
							<xsl:if test="name(.) = 'boutonGroupe'">
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<xsl:for-each select="descendant::*">
									<xsl:if test="name(.) = 'checkBox'">
										<xsl:element name="input">
											<xsl:attribute name="class">inputForm</xsl:attribute>
											<xsl:attribute name="type">checkbox</xsl:attribute>
											<xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute>
											<p class="textInput">	<xsl:value-of select="."/></p>
										</xsl:element>
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
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<xsl:if test="@compo != 'label'">
									<xsl:element name="input">
										<xsl:attribute name="class">inputForm</xsl:attribute>
										<xsl:attribute name="type">text</xsl:attribute>
										<xsl:attribute name="value"><xsl:value-of select="."/></xsl:attribute>
									</xsl:element>
								</xsl:if></td></tr>
							</xsl:if>

							<xsl:if test="name(.) = 'liste'">
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
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
			</body>
		</html>
	</xsl:template>



</xsl:stylesheet>