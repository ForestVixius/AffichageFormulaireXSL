<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	

	<xsl:template match="/">
		<html>
			<head>
				<!-- balise head avec le css, le javascript, etc -->
				<link href="base.css" rel="stylesheet"/>
				<script src="jquery-3.1.1.min.js"/>
				<title>Formulaire</title>
			</head>
			<body>
			<!-- Header de la page, avec le titre et les instructions -->
			<h1 class="titre">Prévisualisation du formulaire :</h1>
			<p class="instructions">ALT + I pour afficher les IDs</p>
			<p class="instructions">ALT + T pour afficher les types de retour</p>
			<form action="">
				<table class="formulaire"> <!-- On ouvre le formulaire et un tableau afin d'y placer les éléments -->
					<xsl:for-each select="/."> <!-- On parcours tout les éléments formulaire du XML -->
						<xsl:for-each select="descendant::*">
							<!-- On vérifie ensuite le nom de l'élément actif (bouton, composant, etc) -->
							<xsl:if test="name(.) = 'boutonGroupe'">
								<!-- On créer la ligne et on y mets l'id, le type de retour, son label, les deux premiers 
								étant caché par défaut, une combinaison étant nécessaire -->
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<!-- On parcours les enfants de l'élément actif -->
								<xsl:for-each select="descendant::*">
									<xsl:if test="name(.) = 'checkBox'">
										<!-- On créer un input checkbox et on lui accole sa valeur -->
										<xsl:element name="input">
											<xsl:attribute name="class">inputForm</xsl:attribute>
											<xsl:attribute name="type">checkbox</xsl:attribute>
											<xsl:attribute name="style"></xsl:attribute>
										</xsl:element>
										<p class="textInput">	<xsl:value-of select="."/></p>
									</xsl:if>
									<!-- On parcours les enfants de l'élément actif -->
									<xsl:if test="name(.) = 'boutonRadio'">
										<!-- On créer un input radiobutton et on lui accole sa valeur -->
										<xsl:element name="input">
											<xsl:attribute name="class">inputForm</xsl:attribute>
											<xsl:attribute name="name"><xsl:value-of select="../@id"/></xsl:attribute>
											<xsl:attribute name="type">radio</xsl:attribute>
										</xsl:element>
										<p class="textInput"><xsl:value-of select="."/></p>
									</xsl:if>
								</xsl:for-each>
								</td></tr>
							</xsl:if>
							
							<xsl:if test="name(.) = 'composant'">
								<!-- On créer la ligne et on y mets l'id, le type de retour, son label, les deux premiers 
								étant caché par défaut, une combinaison étant nécessaire -->
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td>
								<!-- On vérifie que le type de l'élément actif est bien un champ de texte -->
								<xsl:if test="@compo = 'champDeTexte'"><td>
									<!-- On créer un input text, pour une saisie -->
									<xsl:element name="input">
										<xsl:attribute name="class">inputForm</xsl:attribute>
										<xsl:attribute name="type">text</xsl:attribute>
									</xsl:element></td>
								</xsl:if>
								<!-- On vérifie que le type de l'élément actif est bien une case a cocher -->
								<xsl:if test="@compo = 'caseACocher'">
									<!-- On créer un input checkbox, qui retourne un booléen -->
									<td><xsl:element name="input">
										<xsl:attribute name="class">inputForm</xsl:attribute>
										<xsl:attribute name="type">checkbox</xsl:attribute>
									</xsl:element></td>
								</xsl:if></tr>
							</xsl:if>
							<xsl:if test="name(.) = 'liste'">
								<!-- On créer la ligne et on y mets l'id, le type de retour, son label, les deux premiers 
								étant caché par défaut, une combinaison étant nécessaire -->
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<select> <!-- On créer un select, qui est une liste déroulante -->
									<xsl:for-each select="descendant::*">
										<!-- On parcourt tous les éléments enfants qui ne sont pas des label et on les ajoute à la liste -->
										<xsl:if test="name(.) != 'label'">
											<option><xsl:value-of select="."/></option>
										</xsl:if>
									</xsl:for-each>
								</select>
								</td></tr>
							</xsl:if>
							<xsl:if test="name(.) = 'tableau'">
								<!-- On créer la ligne et on y mets l'id, le type de retour, son label, les deux premiers 
								étant caché par défaut, une combinaison étant nécessaire -->
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour"><xsl:value-of select="@type"></xsl:value-of></span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<!-- On créer une div de taille fixe, qui aura des scroll bar si le tableau fait plus de 
								5 colonnes et/ou plus de 5 lignes -->
								<div style="width:265px; height:251px; overflow:auto;">
								<table class="tableau">
									<!-- Il n'y a pas de boucle for "normale" en XSLT, donc pas moyen de d'incrémenter simplement
									Il faut donc utiliser la récursivité avec les templates
									On commence donc par appeler le template de lignes avec un compteur et les lignes/colonnes -->
									<xsl:call-template name="lignes">
										<xsl:with-param name="i" select="0"/>
										<xsl:with-param name="lig" select="nbLignes" /> 
										<xsl:with-param name="col" select="nbColonnes" /> 
									</xsl:call-template>
								</table></div></td><td>
									<!-- On ajoute l'input pour la valeur de la case du tableau -->
									<p>Valeur :</p>
									<form><input type="text" class="entreeTab"></input></form>
								</td></tr>
							</xsl:if>
							<xsl:if test="name(.) = 'calendrier'">
								<!-- On créer la ligne et on y mets l'id, le type de retour, son label, les deux premiers 
								étant caché par défaut, une combinaison étant nécessaire -->
								<tr><td class="colID"><span class="id"><xsl:value-of select="@id"></xsl:value-of></span></td>
								<td class="colRetour"><span class="retour">String</span></td>
								<td><xsl:value-of select="label"></xsl:value-of></td><td>
								<!-- On créer un input date, qui permet de sélectionner la date -->
								<input id="date" type="date"></input>
								</td></tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</table>
				<!-- Enfin on ajoute les boutons Annuler pour nettoyer le formulaire
				et le Valider pour envoyer le formulaire -->
				<input type="reset" value="Annuler"></input>
				<input type="submit" value="Valider"></input>
			</form>
			<p class="instructions centre">(Page à but purement de prévisualisation, le formulaire ne retourne pas de valeur utilisable)</p>
			<script type="text/javascript" src="touches.js"/>
			</body>
		</html>
	</xsl:template>


	<!-- On entre dans le template ligne qui va appeler le template colonne, une fois que toute les colonnes ont été
	ajoutées, il s'appelle lui même en incrémentant le compteur i. -->
	<xsl:template name="lignes">
		<!-- Saisie des paramètres -->
		<xsl:param name="i"/>
		<xsl:param name="lig"/>
		<xsl:param name="col"/>
		<!-- On vérifie que le compteur n'ait pas ateint sa valeur max, on ajoute 1 pour la ligne de numérotation-->
		<xsl:if test="$i &lt; $lig+1">
			<tr>
			<!-- On appelle colonne qui va créer toutes les colonnes de la ligne -->
			<xsl:call-template name="colonnes">
				<xsl:with-param name="cpt" select="0"/>
				<xsl:with-param name="col" select="$col" />
				<xsl:with-param name="i" select="$i" /> 
			</xsl:call-template>
			<!-- Ensuite le template s'appelle lui même en incrémentant -->
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
		<!-- On vérifie que le compteur n'ait pas ateint sa valeur max, on ajoute 1 pour la colonne de numérotation-->
		<xsl:if test="$cpt &lt; $col+1">
			<!-- On ouvre un choose afin de faire les vérifications nécessaire pour les cellules de numérotation -->
			<xsl:choose>
				<!-- Sur la premier case du tableau on ne mets rien -->
				<xsl:when test="$i=0 and $cpt = 0 ">
					<td class="numTableau"></td>
				</xsl:when>
				<!-- Si on est sur la premiere colonne on entre le numéro de ligne -->
				<xsl:when test="$cpt = 0 ">
					<td class="numTableau"><xsl:value-of select="number($i)-1"/></td>
				</xsl:when>
				<!-- Si on est sur la premiere ligne on entre le numéro de colonne -->
				<xsl:when test="$i=0 and $cpt != 0 ">
					<td class="numTableau"><xsl:value-of select="number($cpt)-1"/></td>
				</xsl:when>
				<!-- Si aucune des conditions n'est rencontrée, cela veut dire qu'on est dans le tableau
				on crée donc une cellule vide -->
				<xsl:otherwise>
					<td class="cellule"></td>
				</xsl:otherwise>
			</xsl:choose>
			<!-- Ensuite le template s'appelle lui même en incrémentant comme pour les lignes -->
			<xsl:call-template name="colonnes">
				<xsl:with-param name="cpt" select="number($cpt)+1"/>
				<xsl:with-param name="col" select="$col"/>
				<xsl:with-param name="i" select="$i" /> 
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>