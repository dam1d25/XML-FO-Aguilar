<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
   <xsl:output method="xml"/>
   <!-- Raíz del documento - genera el marcado del formato global -->
   <xsl:template match="/">
      <fo:root>
         <fo:layout-master-set>
            <fo:simple-page-master master-name="my-page" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="1cm" margin-left="2cm" margin-right="2cm">
               <fo:region-body margin="1cm"/>
               <fo:region-after extent="0.75cm"/>
            </fo:simple-page-master>
         </fo:layout-master-set>

         <fo:page-sequence master-reference="my-page">
            <fo:static-content flow-name="xsl-region-after">
               <fo:block font-size="0.8em" font-family="sans-serif" text-align="center" padding-top="3pt">
                  <xsl:text>Page </xsl:text>
                  <fo:page-number format="1"/>
               </fo:block>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body">
               <xsl:apply-templates/>
            </fo:flow>
         </fo:page-sequence>
      </fo:root>
   </xsl:template>

   <!-- Elemento raíz -->
   <xsl:template match="documento">
      <xsl:apply-templates/>
   </xsl:template>

   <!-- Sección o subsección -->
   <xsl:template match="seccion">
      <fo:block>
         <xsl:apply-templates/>
      </fo:block>
   </xsl:template>

   <!-- Título del documento -->
   <xsl:template match="documento/titulo">
      <fo:block font-size="1.5em" color="red" text-align="center" padding="1em">
          <xsl:value-of select="."/>
      </fo:block>
   </xsl:template>

   <!-- Título de sección o subsección -->
   <xsl:template match="titulo">
      <fo:block font-size="1.2em" color="blue" space-before="1em">
         <xsl:number level="multiple" count="seccion" format="1.1. "/>
         <xsl:value-of select="."/>
      </fo:block>
   </xsl:template>

   <!-- Párrafo -->
   <xsl:template match="parrafo">
      <fo:block text-indent="2em" text-align="justify">
         <xsl:value-of select="."/>
      </fo:block>
   </xsl:template>

   <!-- Figura -->
   <xsl:template match="figura">
      <fo:block text-align="center" keep-together.within-page="always">
         <fo:external-graphic src="url('{@uri}')" content-width="50%"/>
         <fo:block font-style="italic" text-align="center" space-after="0.5em">
            <xsl:value-of select="."/>
         </fo:block>
      </fo:block>
   </xsl:template>

</xsl:stylesheet>
