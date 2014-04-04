<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:output encoding="ISO-8859-1" indent="yes"/>
  <xsl:template match="listado">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master margin-right="1cm" margin-left="1cm" margin-bottom="1cm" margin-top="1cm" page-width="210mm" page-height="297mm" master-name="first">
          
          <fo:region-body margin-top="1cm" margin-bottom="1cm"/>
          <fo:region-before extent="1cm"/>
          <fo:region-after extent="1cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="first">
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:value-of select="cabecera"/>
          </fo:block>
          <fo:list-block space-before="0.5cm" space-after="0.5cm" font-size="12pt">
            <xsl:apply-templates select="articulos/articulo"/>
          </fo:list-block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="articulo">
    <fo:list-item>
      <fo:list-item-label end-indent="label-end()">
        <fo:block text-align="start">
          <xsl:text>&#8226;</xsl:text>
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <fo:block>
          <xsl:value-of select="text()"/>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
</xsl:stylesheet>
