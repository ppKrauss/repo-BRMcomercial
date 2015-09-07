<?xml version="1.0" encoding="UTF-8"?>
<!-- 
PENDENCIAS
1) puxar legendas do DOC da AAPCI
2) reduzir fotos por X e fazer o XSLT ou o PHP detectar 
3) git (PDF) e FTP para ter tudo online!
4) despachar hoje pra BRM pedindo por mais legendas amanha, e mostrando o conceito.
...
5) fazer formulário online com o MongDB! (demanda hosting)
 -->
<!-- CONVERTE  -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:mml="http://www.w3.org/1998/Math/MathML"
	xmlns:fn="http://php.net/xsl"
	exclude-result-prefixes="xlink mml fn"  
>

<xsl:template match="GALLERY[@version=1]">
	<html>
		<head>
			<title>GALLERY</title>
			<link rel="stylesheet" type="text/css" href="css/main.css"/>
		</head>
	<body>
	<xsl:apply-templates/>
	</body>
	</html>
</xsl:template>


<xsl:template match="PASTA">
	<xsl:if test=".//TR">
		<div class="sec">
			<p class="secTitle"><xsl:value-of select="@name"/></p>
			<xsl:if test="LEGENDA">
				<p class="secCenter"><xsl:value-of select="LEGENDA"/></p>
				<p>&#160;</p>

			</xsl:if>
			<xsl:apply-templates select="TR">
				<xsl:with-param name="url"><xsl:value-of select="@url"/></xsl:with-param> 
			</xsl:apply-templates>
		</div>
	</xsl:if>
</xsl:template>

<xsl:template match="TR">
	<xsl:param name="url" />	
	<xsl:variable name="id" select="position()"/>

	<div class="article" id="{$id}">
		<hr/>
		<span class="pubid"><xsl:value-of select="$id"/></span>
        <div class="title">
			<xsl:value-of select="IMAGEM"/>
        </div>
		<div class="contrib-group"><xsl:value-of select="LEGENDA"/></div>
		<p class="abstract"><a href="{$url}/{IMAGEM}"><img src="{$url}/{IMAGEM}" width="320"/></a></p><!-- php urlencode -->
	</div>
</xsl:template>


</xsl:stylesheet>
