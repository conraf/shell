# 📂 NO-NFO — Come funziona?

## IL PROBLEMA

Trovare a mano le cartelle senza .nfo in una struttura con centinaia di sottocartelle è impossibile. dovete aprire ogni cartella, cercare il file, passare alla successiva.

Questo script risolve il problema in una riga. Trova tutte le cartelle senza file .nfo.

## GLI INGREDIENTI

Per usarlo vi serve solo una cosa:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche piccola modifica funziona anche su Linux.

Non serve Homebrew, non serve FFmpeg. Lo script usa solo comandi integrati nella shell.

## COME SI USA

Lanci lo script passando la cartella da cercare:

```
./no-nfo /percorso/alla/tua/collection
```

Lo script analizza tutte le sottocartelle (a qualsiasi profondità) e mostra solo quelle che non contengono alcun file .nfo.

Esempio di output:

```
/Users/franco/Film/Azione/  
/Users/franco/Film/Commedia/  
/Users/franco/Serie/2024/
```

Ogni riga è una cartella che non ha ancora un file .nfo, quindi potenzialmente non ancora elaborata.

## COSA SUCCEDE DIETRO LE QUINTE

Lo script è elegantemente semplice. Ecco cosa fa:

**Valida l'argomento** — richiede una cartella come argomento e verifica che esista.

**Cicla su tutte le sottocartelle** — `\*\*/\*(/:)` in zsh significa "tutte le sottocartelle a qualsiasi profondità". Il glob è ricorsivo.

**Controlla se c'è un .nfo** — `$dir/\*.nfo(N)` elenca i file .nfo nella cartella. Il qualifier `(N)` significa "null glob", cioè se non trova nulla restituisce una lista vuota, non un errore.

**Stampa il risultato** — se la lista è vuota, la cartella non ha file .nfo e viene stampata.

## IL RISULTATO

Prima (centinaia di cartelle miste):

```
📂 Film/  
├── 📂 Avengers/  
│   └── movie.nfo  ← elaborato  
├── 📂 Iron/  
│   └── movie.nfo  ← elaborato  
└── 📂 Batman/     ← NON elaborato!  
  
📂 Serie/  
├── 📂 Grey's Anatomy/  
│   └── tvshow.nfo  ← elaborato  
└── 📂 Ted Lasso/    ← NON elaborato!
```

Dopo (solo le cartelle senza .nfo):

```
/Users/franco/Film/Batman/  
/Users/franco/Serie/Ted Lasso/
```

## NOTE

Lo script cerca file con estensione `.nfo` minuscolo. Se i vostri file sono `.NFO` maiuscoli, lo script non li trova. Potete modificare lo script facilmente se necessario.

Lo script elenca solo le cartelle, non i file. Se volete cercare anche file specifici, lo script è facilmente adattabile.

La ricerca è ricorsiva: analizza tutte le sottocartelle a qualsiasi profondità. Se avete una struttura molto grande, può richiedere qualche secondo.

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se collezionate film, serie TV, musica, può farvi risparmiare ore di lavoro noioso.

Lo script è liberamente modificabile: se avete esigenze diverse (cercare altri file, limitare la profondità, filtrare per nome) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 📂

