## Vergleich SOLR-Core-Indexierung techproducts - eigene Indexierung json/xml-Daten

#####1. films.json & films.xml

- Ausgangspunkt: int AND txt-Suche: "crime 2003"
- sort: score asc = ++
- sort "initial_release_date asc" = ++
- sort "directed_by": "can not sort on multivalued field: directed_by of type: text_general"
- sort "id asc": sortiert nach erster Zahl, die im Feld gefunden wird
- Phrase ohne "" Quién es el señor López = Filmtitel: findet den relevanten Eintrag, aber auch noch 4 andere Titel, die damit nichts zu tun haben, es liegt wahrscheinlich an der spanischen Textauswertung, alle Filme mit dem Artikel "el" wurden ausgeworfen
- Phrase mit "" "Quién es el señor López": korrekt
- df-Suche ok
- fl = returns only the listed fields
- Facetten-Funktionalität(?)
- * = fl(?)
- wie funktioneren filter queries(?)


#####2. techproducts

- inStock-Suche funktioniert nicht. Doch! Was war falsch?
- Anzeige Suchergebnisse: zwischendurch items als String angezeigt statt in Zeilen
- sort "price_c asc"
- sort "id asc", total uneinheitlich, weil uneinheitliche ids: Sortierung in Blöcken jeweils asc: 1. Strings, 2. Intergers, 3. alphabetical upper character, 4. alphabetical lower character
- df-Suche "cat", StiWo "electronics" ok
- Suche nach StiWo "apple" liefert nur 1 Treffer result, obwohl 2 vorh. sind, der andere nicht gefundene hat StiWo in Field "compName_s" (als str indexiert). Eine Suche auf das Feld compName_s beschränkt, liefert 0 Treffer. Warum?


#####4. bibsonomy_to_solr.json:

- StiWo: music* 2008
- df-Suche ok
- wann wird year_s angewählt, wann date: music* 2006 = year_s, alles andere = date
- sort score asc = ++
- 

####5. Schaer: bibsonomy-covid-solr.json:

- StiWo "long": Ranking = 1. am meisten treffer im item, 2. Auftreten in author or title-Feld
- sort score desc = ++
- sort id asc = ++
- fl-Ansicht  ok
- StiWo "article 24": 2 reguläre Treffer in Feld "pubtype" und "volume_s", der Rest nur mit ZAhl irgendwo im Nirvana


####6. Wünsche:

- Dynamic fields Einfluss auf Ranking?
- hl, facet, spatial, spellcheck
- Menüpunkt "Documents"
















