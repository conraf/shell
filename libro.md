# 📖 LIBRO — Come funziona?

## APERTURA

Avete mai scansionato un libro pagina per pagina e ritrovato alla fine un caos di file senza capo né coda?

Sì. Anche io.

Oggi vi mostro uno script bash che ho chiamato semplicemente **"libro"** e che risolve in modo elegante uno dei problemi più fastidiosi di chi digitalizza testi: rimettere nell'ordine giusto le pagine di un libro scansionate in due passate separate.

## IL PROBLEMA

Quando scansionate un libro (anche con il telefono) una tecnica è questa: prima scansionate tutte le pagine **dispari** in una passata, poi girate il libro e scansionate tutte le pagine **pari** nell'altra.

Risultato: due file PDF separati. Uno con le pagine 1, 3, 5, 7… e uno con le pagine 2, 4, 6, 8…

Il problema è ricombinarli nell'ordine corretto: 1, 2, 3, 4, 5, 6… cioè fare quello che in gergo tecnico si chiama **interleaving**, ovvero interlacciare due sequenze alternate.

E il problema si complica ulteriormente quando, come capita quasi sempre, alcune pagine bianche vengono saltate durante la scansione. Magari la pagina 24 era completamente bianca e non l'avete acquisita. A quel punto i due PDF hanno un numero di pagine diverso e semplicemente unirli in sequenza produce un libro sfasato, con le pagine nell'ordine sbagliato.

Questo script risolve entrambi i problemi.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in bash e usa strumenti disponibili su macOS. Con qualche piccola modifica funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**Poppler** — una libreria open source per la gestione dei PDF. Si installa con un solo comando:

```
brew install poppler
```

Questo vi darà due strumenti fondamentali: `pdfseparate`, che spacca un PDF nelle singole pagine, e `pdfunite`, che le riunisce. Nient'altro. Nessuna dipendenza esotica.

## COME SI USA

Mettete i vostri due file nella stessa cartella e chiamateli esattamente `Pari.pdf` e `Dispari.pdf`. Poi lanciate lo script da quella cartella.

```
./libro
```

A questo punto lo script vi fa tre domande.

**Prima:** qual è il numero della prima pagina che avete scansionato in Dispari.pdf? Di solito è 1, ma se il libro comincia diversamente potete dirlo qui.

**Seconda:** stessa domanda per Pari.pdf. Di solito è 2 ma ci siamo capiti.

**Terza, la più interessante:** avete saltato delle pagine durante la scansione? Se sì, inseritele una per volta. Lo script le accetta tutte insieme, pari e dispari mescolate, e le separa da solo, perché ovviamente i numeri pari vanno in un gruppo e i dispari nell'altro. Inserite un numero, premete Invio, inserite il prossimo, premete Invio.  
Puoi inserire un numero per volta oppure incollarli tutti insieme. Separatori accettati: spazio, virgola, punto, trattino, barra, più. Invio vuoto per terminare.

Tutte queste varianti funzionano allo stesso modo: `8,24,56` / `8 24 56` / `8.24.56` / `8/24/56` / `8-24-56` / `8+24+56` — o anche combinazioni miste come `8, 24. 56`.

Dopodichè lo script mostra un riepilogo: prima pagina di ciascun file, pagine saltate, e chiede conferma. Basta premere Invio per procedere.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Crea tre cartelle:** `Pari/`, `Dispari/` e `LIBRO/`.

**Estrae le singole pagine** da ciascun PDF usando `pdfseparate` (ogni pagina diventa un file PDF separato).

**Rinomina ogni file con il numero fisico del libro** cioè il numero reale della pagina come stampato sul libro, non il numero d'ordine nella scansione. Questo è il passaggio chiave: la prima pagina di Dispari.pdf diventa `0001.pdf`, la seconda `0003.pdf`, la terza `0005.pdf`… saltando i numeri che avete dichiarato come mancanti. Stesso meccanismo per Pari.pdf: `0002.pdf`, `0004.pdf`, `0006.pdf`…

**Copia tutto in `LIBRO/`** — così nella cartella trovate tutti i file con la numerazione corretta e i buchi dove ci sono le pagine saltate.

**Unisce tutto** con `pdfunite` in ordine alfabetico crescente — che corrisponde esattamente all'ordine numerico del libro — e produce il file finale `LIBRO\\\_UNITO.pdf`.

## IL FILE SALTI.TXT

C'è un dettaglio che vale la pena menzionare: lo script salva automaticamente i dati che avete inserito in un file chiamato `salti.txt`. Questo file ha un doppio scopo.

Il primo è pratico: se per qualche motivo dovete rilanciare lo script (magari avete sbagliato qualcosa) non dovete reinserire tutto da capo. Lo script trova il file, mostra i dati salvati e chiede semplicemente se usarli o reinserirli.

Il secondo è documentativo: tenete il file finché non avete controllato che il PDF finale sia corretto. Poi potete eliminarlo insieme alle sottocartelle (che, attenzione, lo script lascia lì intenzionalmente, così potete verificare ogni singola pagina estratta prima di buttare via tutto).

## IL RISULTATO

Alla fine nella cartella di lavoro trovate:

- I due PDF originali, intatti

- Le cartelle `Pari/` e `Dispari/` con le pagine estratte e rinominate

- La cartella `LIBRO/` con tutte le pagine nell'ordine corretto

- Il file `salti.txt` con il log della sessione

- E soprattutto: **`LIBRO\\\_UNITO.pdf`** il vostro libro digitale, con le pagine nell'ordine giusto

Non ci sono pagine bianche inserite artificialmente, non ci sono ridondanze. Solo le pagine reali, nell'ordine reale del libro fisico.

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se scansionate libri, per uso personale, per archivi, per la didattica, per preservare testi rari, può farvi risparmiare ore di lavoro manuale.

Lo script è liberamente modificabile: se avete esigenze diverse (nomi di file diversi, un numero di cifre maggiore, un formato di output alternativo) il codice è leggibile e commentato, e potete adattarlo senza difficoltà.

Alla prossima. 📖

