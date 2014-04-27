# Hausaufgabe 03
# Achim Hötzel
# 2014-04-27
# Dieses Werk ist lizenziert unter einer CC-BY-NC-XY Lizenz.

# Sie sollten die Datei auch in Ihren Ordner kopieren und einen Commit machen, 
# bevor Sie die Kopie weiter anpassen! Vergessen Sie dabei nicht, Namen, Datum
# und ggf. Lizenz zu ändern. Bei R-Code-Dateien wird der Text als R-Code
# verstanden, weshalb man Fließtext auskommentieren (mit #-Präfix inaktiv 
# stellen) muss. Das ist zwar Umständlicher für Beschreibungstext, aber schöner 
# für den Umgang mit viel Code.

# In R können wir sehr den arithmetischen Mittelwert sehr leicht mit mean()
# berechnen.

my.data <- c(1,9,7,3)
print(mean(my.data))

# Führen Sie das Skript mit dem "Source"-Knopf aus. Bemerken Sie dabei, dass wir
# hier print() nutzen müssen, damit das Ergebnis gedruck wird. Das ist anders als 
# beim interaktiven Fenster!

# Der Output in der R-Konsole sieht nicht besonders schön aus, v.a. im Vergleich
# zu RMarkdown-Output. Das ist die Ur-Form von R. RStudio bietet auch die 
# Möglichkeit an, den Output automatisch einigermaßen schöner darzustellen. Es 
# gibt in der Leiste mit "Source" auch einen kleinen Knopf, der so aussieht wie 
# einen kleinen Notizblock (Notebook) aus. Ein weiteres Fenster öffnet sich mit 
# schön formatiertem Output. Das ist schön, aber trotzdem sollten Sie wissen,
# wie R-Output in seiner Bassiform aussieht UND wie man wirklich schönen Output
# mit Fließtext durch RMarkdown macht.

# In R sind fast alle Daten Vektoren, sogar Einzelzahlen -- Einzelelemente sind
# einfach Vektoren mit Länge 1. Wir können das daran betrachten, dass die
# üblichen Vektoroperationen auch bei "normalen" Einzelzahlen funktionieren. Zum
# Beispiel ist es möglich das Element an Position n mit [n] abzurufen:

# (Im folgenden müssen Sie die Code-Zeilen wieder aktiv setzen -- ich habe sie
# vorläufig auskommentiert, damit der Output beim ersten Beispiel sehr
# überschaubar war.)

 print(my.data[3])

# Wenn wir eine Variable mit einer Zahl haben,
 zahl <- 42
 print(zahl)

# können wir auch sie indizieren (zwar nur mit [1]), weil es nur ein Element gibt
 print(zahl[1])

# Diese starke Orientierung an Daten statt an Datenpunkte ist eine große Stärke
# von R, die R von vielen anderen Programmiersprachen unterscheidet.
# Ganz viele praktische Funktionen sind in R eingebaut und sie funktionieren alle
# mit Vektoren:

# Quadratwurzel
print(sqrt(my.data))

# Exponenten mit **
print(my.data**3)

# Logarithmen
 print(log(my.data))

# Summe aller Elemente in einem Vektor
 print(sum(my.data))

# Sortieren
 print(sort(my.data))

# und vieles Mehr! 

# Es gibt eine eingebaute Funktion für das Median:
 print(median(my.data))

# aber nicht für den Modalwert!
# Es gibt aber andere Funktionen, die uns da helfen.
 more.data <- c("m","m","w","w","m","w","w","w","w","w","w","m","m","m","w","w","w")

 #with table()
 print(table(more.data))

# with xtabs()
# die komische Syntax mit Tilde wird später deutlicher ....
 print(xtabs(~more.data))

# auch die Ergebnisse solcher Funktionen können wir einer Variabel zuweisen:
 tabelle <- xtabs(~more.data)
 print(tabelle)

# Wir können die Werte auch aus dieser Tabelle bearbeiten
 total <- sum(tabelle)
 print(total)

# und damit relative Häufigkeiten ausdrucken:
 tabelle.rel <- tabelle / total
 print(tabelle.rel)

# Vervollständigen Sie folgende Zeile, sodass Prozentwerte aus den relativen
# Häufigkeiten entst ehen:
  tabelle.prozent <- tabelle.rel*100 
  print(tabelle.prozent)

# Aber die Frage bleibt, wie berechnen wir den Modus? Durch sortieren!
  tabelle.sorted <- sort(tabelle,decreasing=TRUE)
  print(tabelle.sorted)

# Sie sehen hier, dass manche Funktionen weitere Optionen haben, die wir
# bestimmen können. Hier wollten wir, dass die Liste mit dem größten Wert
# anfängt, daher setzen wir decreasing=TRUE

# Nehmen Sie das erste Element aus dem obigen Ergebnis, um den Modalwert zu
# bekommen:
  print(tabelle.sorted[1])

# Verständisfrage: gibt es immer nur *einen* Modalwert? 
# Wenn nicht, ist der Code oben korrekt? Warum?
# Schreiben Sie Ihre Antwort als Comment hier.

# Nein, eine Variable muss nicht immer nur einen Modus enthalten. Die Häufigkeitsverteilung
# einer Variable kann auch mehrere Modi besitzen. Die Anzahl der Ausprägungen unserer Variable 
# "Geschlecht" sähen in diesem Fall folgendermaßen aus: m= 11 w=11.
# Der oben angewandte R-Code wäre in diesem Beispiel dennoch richtig, denn egal wieviele Modi eine 
# Variable besitzt, sie entspechen immer dem höchsten Zahlenwert der Häufigkeitsverteilung einer 
# Variable. Aus diesem Grund entspricht in einer abfallenden sortierten Liste der erste Wert immer 
# dem Modus der Häufigkeitsverteilung. So wäre in unserem Beispiel der Variable "Geschlecht" der Modus 
# der Ausprägungen m=11 und w=11 immer noch 11.
#
# Allerdings ist bei diesem R-Code, mit welchem der Modus berechnet werden soll, eine Einschränkung zu 
# machen. Er erlaubt nicht die Entscheidung zu treffen, ob die Häufigkeitsverteilung der Variable nur 
# einen Modus besitzt oder mehrere. Dies liegt daran, dass nur die höchste Zahl ausgegeben wird, aber 
# keine Information darüber geliefert wird, wie häufig diese vorkommt.
# In unserm Beispiel der Variable "Geschlecht" erhalten wird dabei keine Auskunft darüber, dass der Modus
# 11 mehrfach enthalten ist. Aus unserer Modusbestimmung lässt sich also keine Entscheidung darüber treffen,
# ob es sich um eine unimodale oder um eine bimodale Verteilung handelt.  



# Als Abscheid ein Beispiel mit der Darstellung Frequenzdaten mit Säulendiagramm
# bzw. Histogramm

 library(ggplot2)
 my.histogram <- qplot(more.data,geom="histogram")
 print(my.histogram)

# Sie sind jetzt fertig -- das waren ganz viele Kleinigkeiten, aber
# Kleinigkeiten, die wir immer wieder nutzen werden. Machen Sie einen Commit und
# einen Push!

