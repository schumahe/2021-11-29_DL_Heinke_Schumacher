

#1# IMPORTANT + TABS filtern
sed "s/^IMPORTANT!//g" 2021-11-29-Article_list_dirty.tsv > temp1.tsv
sed "s/^IMPORTANT//g" temp1.tsv > temp2.tsv
sed "s/^		//g" temp2.tsv > temp3.tsv


#2# MAYBE + # filtern
grep -v "^MAYBE" temp3.tsv > temp4.tsv && sed "/^#/d" temp4.tsv > temp5.tsv


#3# issn+date-spalten isoliert
cut -f 5,12 temp5.tsv > temp6.tsv


#4# kopfzeile löschen
tail -120 temp6.tsv > temp7.tsv


#5# issn-text filtern
tr -d "[iIsSnN]:" < temp7.tsv > temp8.tsv
tr -d "^ " < temp8.tsv > temp9.tsv


#6# numerisch sortieren + doppelzeilen nicht anzeigen
sort temp9.tsv > temp10.tsv
uniq -c temp10.tsv > temp11.tsv


#7# Nichtanzeige zweier letzter Doppelzeilen: ich konnte nicht nachvollziehen, warum diese beiden doppelten Zeilen weiterhin angezeigt werden. Alle zahlreichen Versuche, dies mit anderen Befehskombinationen von sort und uniq zu lösen und das Herausschneiden mittels sed zu vermeiden, waren leider erfolglos. Die beiden Doppelpositionen scheinen jeweils als eigene Positionen definiert und nicht als Doppelzeilen. Das legt die Anzeige mit uniq -c nahe. Möglicherweise sind die betroffenen Zellen der Ausgangsdatei anders definiert? Falls jemand hier hinein schaut und eine Idee zu dem Problem hat, wäre ich über einen Hinweis zur Lösung des Problems sehr dankbar.
sed -e "14d" -e "29d" temp11.tsv > 2021-12-14-Dates_and_ISSNs_heinke3.tsv






