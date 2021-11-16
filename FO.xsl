<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:form="urn:x-kosek:schemas:pokus" exclude-result-prefixes="xs" version="2.0">
    <xsl:attribute-set name="myBorder">
        <xsl:attribute name="border">solid 0.5mm black</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="myHeader">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">115%</xsl:attribute>
    </xsl:attribute-set>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master margin-bottom="0.5cm" margin-left="0.5cm"
                    margin-right="0.5cm" margin-top="0.5cm" page-width="11cm" page-height="16cm"
                    master-name="my-master">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="my-master">
                <fo:flow flow-name="xsl-region-body" font-family="Times New Roman" font-size="8pt">
                    <fo:table xsl:use-attribute-sets="myBorder">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell xsl:use-attribute-sets="myBorder">
                                    <fo:block font-size="125%" font-weight="bold">Přihláška k
                                        dobrovolné účasti na nemocenském pojištění OSVČ</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <xsl:apply-templates/>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="form:hlavicka">
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block>Místně příslušná OSSZ/PSSZ/MSSZ Brno: <xsl:value-of select="form:sprava"
                    /></fo:block>
                <fo:block>Variabilní symbol nemocenského pojištění: <xsl:value-of
                        select="form:variabilniSymbol"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    <xsl:template match="form:telo/form:zakladniIdentifikace">
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block xsl:use-attribute-sets="myHeader">A. Základní identifikace</fo:block>
            </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block>Příjmení: <xsl:value-of select="form:prijmeni"/></fo:block>
                <fo:block>Jméno: <xsl:value-of select="form:jmeno"/></fo:block>
                <fo:block>Rodné příjmení: <xsl:value-of select="form:rodnePrijmeni"/></fo:block>
                <fo:block>Rodné číslo: <xsl:value-of select="form:rodneCislo"/></fo:block>
                <fo:block>Titul: <xsl:value-of select="form:titul"/></fo:block>
                <fo:block>Datum narození: <xsl:value-of select="form:datumNarozeni"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    <xsl:template match="form:telo/form:prihlaskaKUcasti">
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block xsl:use-attribute-sets="myHeader">B. Přihláška k účasti</fo:block>
            </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block>Přihlášení od: <xsl:value-of select="form:prihlaseniOd"/></fo:block>
                <fo:block>Název pojišťovny: <xsl:value-of select="form:nazevPojistovny"/></fo:block>
                <fo:block>Datum zahájení: <xsl:value-of select="form:datumZahajeni"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    <xsl:template match="form:telo/form:uhrada">
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block xsl:use-attribute-sets="myHeader">C. Úhrada pojistného</fo:block>
            </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block>Požaduji zaslání poštovních poukázek pro placení pojistného: <xsl:value-of
                        select="form:zasilani"/></fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    <xsl:template match="form:telo/form:udajeOPojisteni">
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block xsl:use-attribute-sets="myHeader">D. Údaje o nemocenském
                    pojištění</fo:block>
            </fo:table-cell>
        </fo:table-row>
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="myBorder">
                <fo:block>Předchozí orgán: <xsl:value-of select="form:organ/form:predchozi"/> &#160;
                    Současný orgán: <xsl:value-of select="form:organ/form:soucasny"/></fo:block>
                <fo:block>Předchozí doba od: <xsl:value-of select="form:predchoziDoba/form:od"/>
                    &#160; do: <xsl:value-of select="form:predchoziDoba/form:do"/></fo:block>
                <fo:block>Cizozemský nositel nemocenského pojištění</fo:block>
                <fo:block>Název: <xsl:value-of select="form:cizozemskyNositel/form:nazev"
                    /></fo:block>
                <fo:block>Číslo pojištění: <xsl:value-of
                        select="form:cizozemskyNositel/form:cisloPojisteni"/></fo:block>
                <xsl:apply-templates select="form:cizozemskyNositel/form:adresa"/>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
    <xsl:template match="form:telo/form:udajeOPojisteni/form:cizozemskyNositel/form:adresa">
        <fo:block>&#x00A0;</fo:block>
        <fo:block>Ulice: <xsl:value-of select="form:ulice"/></fo:block>
        <fo:block>Číslo domu: <xsl:value-of select="form:cisloDomu"/></fo:block>
        <fo:block>Obec: <xsl:value-of select="form:obec"/></fo:block>
        <fo:block>PSČ: <xsl:value-of select="form:PSC"/></fo:block>
        <fo:block>Stát: <xsl:value-of select="form:stat"/></fo:block>
    </xsl:template>
</xsl:stylesheet>
