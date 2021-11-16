<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:form="urn:x-kosek:schemas:pokus"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Formular</title>
                <style>
                    table,
                    th,
                    td {
                        border: 1px solid black;
                    }
                    th {
                        font-size: 125%
                    }
                    .category {
                        font-size: 115%;
                        font-weight: bold;
                    }
                    pre {
                        font-family: serif;
                        font-size: 100%
                    }</style>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Přihláška k dobrovolné účasti na nemocenském pojištění OSVČ</th>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="form:hlavicka">
        <tr>
            <td>
                <div>Místně příslušná OSSZ/PSSZ/MSSZ Brno: <xsl:value-of select="form:sprava"
                    /></div>
                <div>Variabilní symbol nemocenského pojištění: <xsl:value-of
                        select="form:variabilniSymbol"/></div>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="form:telo/form:zakladniIdentifikace">
        <tr>
            <td>
                <div class="category">A. Základní identifikace</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>Příjmení: <xsl:value-of select="form:prijmeni"/></div>
                <div>Jméno: <xsl:value-of select="form:jmeno"/></div>
                <div>Rodné příjmení: <xsl:value-of select="form:rodnePrijmeni"/></div>
                <div>Rodné číslo: <xsl:value-of select="form:rodneCislo"/></div>
                <div>Titul: <xsl:value-of select="form:titul"/></div>
                <div>Datum narození: <xsl:value-of select="form:datumNarozeni"/></div>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="form:telo/form:prihlaskaKUcasti">
        <tr>
            <td>
                <div class="category">B. Přihláška k účasti</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>Přihlášení od: <xsl:value-of select="form:prihlaseniOd"/></div>
                <div>Název pojišťovny: <xsl:value-of select="form:nazevPojistovny"/></div>
                <div>Datum zahájení: <xsl:value-of select="form:datumZahajeni"/></div>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="form:telo/form:uhrada">
        <tr>
            <td>
                <div class="category">C. Úhrada pojistného</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>Požaduji zaslání poštovních poukázek pro placení pojistného: <xsl:value-of
                        select="form:zasilani"/></div>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="form:telo/form:udajeOPojisteni">
        <tr>
            <td>
                <div class="category">D. Údaje o nemocenském pojištění</div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <pre>Předchozí orgán: <xsl:value-of select="form:organ/form:predchozi"/>     Současný orgán: <xsl:value-of select="form:organ/form:soucasny"/></pre>
                </div>
                <div>
                    <pre>Předchozí doba od: <xsl:value-of select="form:predchoziDoba/form:od"/>     do: <xsl:value-of select="form:predchoziDoba/form:do"/></pre>
                </div>
                <div>Cizozemský nositel nemocenského pojištění</div>
                <div>Název: <xsl:value-of select="form:cizozemskyNositel/form:nazev"/></div>
                <div>Číslo pojištění: <xsl:value-of
                        select="form:cizozemskyNositel/form:cisloPojisteni"/></div>
                <xsl:apply-templates select="form:cizozemskyNositel/form:adresa"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="form:telo/form:udajeOPojisteni/form:cizozemskyNositel/form:adresa">
        <div>Ulice: <xsl:value-of select="form:ulice"/></div>
        <div>Číslo domu: <xsl:value-of select="form:cisloDomu"/></div>
        <div>Obec: <xsl:value-of select="form:obec"/></div>
        <div>PSČ: <xsl:value-of select="form:PSC"/></div>
        <div>Stát: <xsl:value-of select="form:stat"/></div>
    </xsl:template>
</xsl:stylesheet>
