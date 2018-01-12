<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	

	<xsl:template match="/">
		<html>
			<head>
				<link href="base.css" rel="stylesheet"/>
				<script src="jquery-3.1.1.min.js"/>
				
			</head>
			<body>

			<h1 class="titre">Prévisualisation du formulaire :</h1>
			<p class="instructions">ALT + I pour afficher les IDs</p>
			<p class="instructions">ALT + T pour afficher les types de retour</p>
			<form action="https://www.w3schools.com/action_page.php">
				<table class="formulaire">
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
							<xsl:if test="name(.) = 'tableau'">
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<div style="width:170px; height:250px; overflow:auto;">
								<table class="tableau">

									<xsl:call-template name="lignes">
										<xsl:with-param name="i" select="0"/>
										<xsl:with-param name="lig" select="nbLignes" /> 
										<xsl:with-param name="col" select="nbColonnes" /> 
									</xsl:call-template>
								</table></div></td><td>
									<p>Valeur :</p>
									<input type="text" class="entreeTab"></input>
								</td></tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</form>
			<script type="text/javascript" src="touches.js"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="lignes">
		<xsl:param name="i"/>
		<xsl:param name="lig"/>
		<xsl:param name="col"/>
		<xsl:if test="$i &lt; $lig+1">
			<tr>
			<xsl:call-template name="colonnes">
				<xsl:with-param name="cpt" select="0"/>
				<xsl:with-param name="col" select="$col" />
				<xsl:with-param name="i" select="$i" /> 
			</xsl:call-template>
			<xsl:call-template name="lignes">
				<xsl:with-param name="i" select="number($i)+1"/>
				<xsl:with-param name="col" select="$col" /> 
				<xsl:with-param name="lig" select="$lig" /> 
			</xsl:call-template>
			
			</tr>
		</xsl:if>
	</xsl:template>

	<xsl:template name="colonnes">
		<xsl:param name="cpt"/>
		<xsl:param name="i"/>
		<xsl:param name="col"/>
		<xsl:if test="$cpt &lt; $col+1">
			<xsl:choose>
				<xsl:when test="$i=0 and $cpt = 0 ">
					<td class="numTableau"></td>
				</xsl:when>
				<xsl:when test="$cpt = 0 ">
					<td class="cellule numTableau"><xsl:value-of select="$i"/></td>
				</xsl:when>
				<xsl:when test="$i=0 and $cpt != 0 ">
					<td class="cellul numTableau"><xsl:value-of select="$cpt"/></td>
				</xsl:when>
				<xsl:otherwise>
					<td class="cellule"></td>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="colonnes">
				<xsl:with-param name="cpt" select="number($cpt)+1"/>
				<xsl:with-param name="col" select="$col"/>
				<xsl:with-param name="i" select="$i" /> 
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>