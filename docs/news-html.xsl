<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

  <!-- This XSLT stylesheet can be applied to the XML version of the release
       notes to produce an HTML document suitable for further processing.
       In particular, the final output will end up on the libvirt website -->

  <!-- Document -->
  <xsl:template match="/libvirt">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;
</xsl:text>
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      </head>
      <body>
        <xsl:text disable-output-escaping="yes">

        &lt;!-- DO NOT EDIT THIS FILE! It was generated automatically.
             Edit the source file (news.xml) instead --&gt;

        </xsl:text>
        <h1>Releases</h1>
        <p>This is the list of official releases for libvirt, along with an
        overview of the changes introduced by each of them.</p>
        <p>For a more fine-grained view, use the
        <a href="http://libvirt.org/git/?p=libvirt.git;a=log">git log</a>.
        </p>
        <xsl:apply-templates select="release"/>
        <p>Older libvirt releases didn't have proper release notes,
        and as such are not included in this page: if you're looking
        for information about them, start from those made in
        <a href="news-2016.html">2016</a> and work your way back.</p>
      </body>
    </html>
  </xsl:template>

  <!-- Release -->
  <xsl:template match="release">
    <h3>
      <strong>
        <xsl:value-of select="@version"/>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@date"/>
        <xsl:text>)</xsl:text>
      </strong>
    </h3>
    <ul>
      <xsl:apply-templates select="section"/>
    </ul>
  </xsl:template>

  <!-- Section -->
  <xsl:template match="section">
    <li>
      <strong>
        <xsl:value-of select="@title"/>
      </strong>
      <ul>
        <xsl:apply-templates select="change"/>
      </ul>
    </li>
  </xsl:template>

  <!-- Change -->
  <xsl:template match="change">
    <li>
      <xsl:apply-templates select="summary"/>
      <xsl:apply-templates select="description"/>
    </li>
  </xsl:template>

  <!-- Change summary -->
  <xsl:template match="summary">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Change description -->
  <xsl:template match="description">
    <br/>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Misc HTML tags, add more as they are needed -->
  <xsl:template match="code|i|tt">
    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
    <xsl:value-of select="name()"/>
    <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
  </xsl:template>

</xsl:stylesheet>