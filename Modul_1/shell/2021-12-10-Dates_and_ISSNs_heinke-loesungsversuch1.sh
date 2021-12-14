

#1#IMPORTANT + TABS filtern
sed  "s/^IMPORTANT!//g" 2021-11-29-Article_list_dirty.tsv > temp1.tsv
sed "s/^IMPORTANT//g" temp1.tsv > temp2.tsv
sed "s/^		//g" temp2.tsv > temp3.tsv


#2#MAYBE + # filtern
grep -v "^MAYBE" temp3.tsv > temp4.tsv && sed "/^#/d" temp4.tsv > temp5.tsv


#3#issn+date-spalten isoliert
cut -f 5,12 temp5.tsv > temp6.tsv


#4#kopfzeile löschen
tail -120 temp6.tsv > temp7.tsv


#5#issn-text filtern
tr -d "[iIsSnN]:" < temp7.tsv > temp8.tsv
tr -d "^ " < temp8.tsv > temp9.tsv


#6#numerisch sortieren + doppelzeilen löschen
sort -t $'\t' temp9.tsv | sort -n temp9.tsv | uniq temp10.tsv > 2021-12-10-Dates_and_ISSNs_heinke1.tsv




##------------Bemerkung--------------##
#Die Schritte 1-5 haben keine Tabellenzeilen verloren. Das hat jeweils ein Tabellenvergleich der entstandenen temp-Dateien ergeben. Der letzte Sortierungs- und Bereinigungsschritt liefert jedoch nicht die gewünschte Anzahl der Titelzeilen. Dazu wurden meherere, wenn nicht unzählige Kombinationen ausprobiert, jedoch vergeblich... Auch verschiedee Ansätze, die Ursprungstabelle zu bereinigen, brachten keinen Erfolg.

