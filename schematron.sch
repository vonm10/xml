<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns prefix="form" uri="urn:x-kosek:schemas:pokus"/>
    <pattern>
        <title>Posloupnost datumu predchozi doby pojisteni</title>
        <rule context="/form:prihlaska/form:telo/form:udajeOPojisteni/form:predchoziDoba">
            <report test="number(translate(form:od, '-', '')) > number(translate(form:do, '-', ''))"
                >Datum začátku předchozí doby pojištění nesmí být později než jeho konec.</report>
        </rule>
    </pattern>
    <pattern>
        <title>Posloupnost datumu prihlasky k ucasti</title>
        <rule context="/form:prihlaska/form:telo/form:prihlaskaKUcasti">
            <report test="number(translate(form:prihlaseniOd, '-', '')) > number(translate(form:datumZahajeni, '-', ''))"
                >Datum začátku přihlášení nesmí být později než zahájení.</report>
        </rule>
    </pattern>
</schema>
