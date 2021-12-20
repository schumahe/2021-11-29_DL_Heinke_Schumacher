

#1# leerzeilen mit "MAYBE + #" filtern
grep -v "^MAYBE" 2021-11-29-Article_list_dirty.tsv > temp1.tsv && sed "/^#/d" temp1.tsv > temp2.tsv


#2# issn+date-spalten isolieren
cut -f 5,12 temp2.tsv > temp3.tsv


#3# issn-text filtern
tr -d "[iIsSnN]:" < temp3.tsv > temp4.tsv
tr -d "^ " < temp4.tsv > temp5.tsv


#4# restzeilen ohne issn wegfiltern
grep -Pv "eg" temp5.tsv > temp6.tsv


#5# kopfzeile löschen
sed "1d" temp6.tsv > temp7.tsv


#6# sortieren und doppelzeilen filtern
sort temp7.tsv > temp8.tsv
uniq temp8.tsv > 2021-12-14-Dates_and_ISSNs_heinke1.tsv



