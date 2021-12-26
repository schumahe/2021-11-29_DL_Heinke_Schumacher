
#1# spalten ausschneiden
cut -f 5,12 2021-11-29-Article_list_dirty.tsv > temp1.tsv


#2# buchstabenstrings herausfiltern
tr -d "[iIsSnN]:" < temp1.tsv > temp2.tsv && tr -d "^ " < temp2.tsv > temp3.tsv


#3# sortieren
sort temp3.tsv > temp4.tsv


#4# überflüssige zeilen herausschneiden
sed "124,132d" temp4.tsv > temp5.tsv ; sed "1,11d" temp5.tsv > temp6.tsv


#5# doppelzeilen herausfiltern
uniq temp6.tsv > 2021-12-14-Dates_and_ISSNs_heinke2.tsv

