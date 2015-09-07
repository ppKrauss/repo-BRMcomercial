<?xml version="1.0" encoding="UTF-8"?>
<!--  -->
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
			<link rel="stylesheet" type="text/css" href="css/main_paged.css"/>
		</head>
	<body>
	<p>PAGINA REMOVIDA AUTOMATICAMENTE PELO 
		<pre>
prince lixo.htm
pdf2ps lixo.pdf lixo_big.ps
ps2pdf lixo_big.ps lixo_peq.pdf
pdftk lixo_peq.pdf cat 2-end output new.pdf
mv new.pdf lixo_peq.pdf
		</pre>
	</p>
	<p style="page-break-after: always"></p> 

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
        <!--
			<div class="contrib-group">...nada...</div>
			<div class="aff-group">...nada..</div>
			<div class="corresp-group">..nada...</div>
		-->
		<p class="abstract"><img src="{$url}/{IMAGEM}" width="320"/></p><!-- php urlencode -->
	</div>
</xsl:template>


</xsl:stylesheet>
