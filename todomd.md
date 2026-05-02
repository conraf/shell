# 📄 TODOMD — Come funziona?


## APERTURA

Avete mai ricevuto un PDF scansionato, un DOCX pieno di tabelle, una presentazione PowerPoint — e pensato: "vorrei solo avere il testo, in un formato pulito, che posso aprire con qualsiasi editor"?

Oggi vi mostro **todomd** — uno script zsh di poche righe che trasforma praticamente qualsiasi documento in Markdown. Pulito, leggibile, portatile.


## IL PROBLEMA

Il Markdown è diventato negli ultimi anni il formato di riferimento per chiunque lavori con il testo in modo serio: sviluppatori, scrittori, ricercatori, insegnanti. È leggibile da qualsiasi editor, si converte in HTML, PDF, Word — è universale.

Il problema è che il mondo reale è pieno di PDF, DOCX, PPTX, XLSX, immagini scansionate — e convertirli in Markdown di solito richiede strumenti complicati, abbonamenti a servizi online, o risultati mediocri.

**todomd** risolve questo passando il lavoro pesante a due strumenti seri: **docling** di IBM, che gestisce la struttura del documento, e **ocrmac**, che usa il motore OCR nativo di macOS per riconoscere il testo nelle immagini e nei PDF scansionati. Lo script è l'interfaccia elegante che li mette insieme.


## GLI INGREDIENTI

Anche qui, come per tutti gli strumenti artigianali che funzionano davvero, le dipendenze sono poche e precise.

**macOS** — ocrmac usa il framework Vision di Apple, quindi questo strumento è pensato per Mac.

**docling** — il motore di conversione sviluppato da IBM Research, installabile con pip:

```
pip install docling
```

**ocrmac** — il wrapper per il motore OCR di macOS:

```
pip install ocrmac
```

Nessun abbonamento, nessun dato che va su server esterni. Tutto gira in locale sul vostro Mac.


## COME SI USA

**Modalità diretta** — passate il file come argomento:

```
todomd documento.pdf
```

Funziona anche con più file in una volta sola:

```
todomd relazione.pdf presentazione.pptx tabella.xlsx
```

**Modalità interattiva** — lanciate lo script senza argomenti e vi chiede il path del file:

```
todomd  
📂 Path del file: 
```

Utile quando lavorate da terminale e preferite non digitare path lunghi — potete anche trascinare il file direttamente nella finestra del terminale.

C'è anche una guida rapida integrata:

```
todomd --help
```


## IL FLUSSO INTERATTIVO

Dopo aver specificato il file, lo script fa due domande.

**Prima: la lingua del documento.** Presenta un menu numerato con sei lingue — italiano, inglese, francese, tedesco, spagnolo, portoghese. L'italiano è il predefinito, quindi se il vostro documento è in italiano basta premere Invio.

```
🌐 Lingua dei documenti:  
   1) 🇮🇹  Italiano   \[it-IT\]  ← predefinito  
   2) 🇬🇧  English    \[en-US\]  
   ...  
Scelta \[1\]: 
```

La lingua è importante perché guida il motore OCR nel riconoscimento dei caratteri — un documento in tedesco con le sue umlaut viene trattato diversamente da uno in italiano.

**Seconda: i placeholder per le immagini.** Quando un documento contiene immagini, avete due scelte: includere le immagini nel documento convertito, oppure inserire un placeholder — cioè un segnaposto testuale nel punto in cui si trovava l'immagine. Il placeholder è il predefinito, e di solito è la scelta giusta: mantiene la struttura del documento senza appesantire il file Markdown con dati binari.

```
🖼️  Placeholder per le immagini? \[S/n\]: 
```


## COSA SUCCEDE DURANTE LA CONVERSIONE

Dopo le due domande, lo script avvia docling in background e mostra uno spinner animato mentre elabora:

```
◈ documento.pdf  
  ⠹ elaborazione...
```

Il cursore sparisce per non distrarre, lo spinner gira, e quando docling ha finito:

```
  ✔ Completato
```

Se il file di output esiste già nella cartella, lo script ve lo segnala e chiede conferma prima di sovrascrivere — nessuna sorpresa.

Se qualcosa va storto, mostra le prime righe di errore dal log in modo da capire subito cosa non ha funzionato.


## IL RISULTATO

Il file Markdown viene salvato **nella stessa cartella del file sorgente**, con lo stesso nome e estensione `.md`. Se avete convertito `relazione.pdf`, trovate `relazione.md` accanto al PDF originale.

Alla fine lo script mostra un riepilogo chiaro:

```
  ✦ Conversioni completate! (3/3)  
  
  → /path/to/relazione.md  
  → /path/to/presentazione.md  
  → /path/to/tabella.md
```

Se uno o più file non sono stati convertiti, li elenca separatamente così sapete subito cosa rivedere.


## I FORMATI SUPPORTATI

Vale la pena elencarli perché sono davvero tanti: **PDF** (inclusi quelli scansionati grazie all'OCR), **DOCX**, **PPTX**, **XLSX**, **HTML**, **TXT**, immagini **PNG**, **JPEG**, **TIFF**, file **LaTeX** — e altri ancora. In pratica, se avete un documento in un formato ragionevole, todomd sa cosa farne.


## UN DETTAGLIO TECNICO CHE FA LA DIFFERENZA

C'è una cosa che distingue todomd dagli script improvvisati: gestisce correttamente l'interruzione con **Ctrl+C**. Se premete Ctrl+C durante l'elaborazione, lo script non lascia processi zombie in giro — termina docling in modo pulito, rimuove i file temporanei di log e ripristina il cursore nel terminale. Queste cose sembrano dettagli, ma chi lavora molto da terminale sa quanto fastidio fanno gli script scritti male che si comportano male quando li interrompi.


## CHIUSURA

todomd è uno strumento piccolo e preciso. Non cerca di fare tutto — fa una cosa sola, la fa bene, e si appoggia a motori seri per il lavoro pesante.

Se lavorate con documenti di vario tipo e volete un flusso veloce per portarli in Markdown — per archiviarli, per indicizzarli, per elaborarli ulteriormente con altri strumenti — questo script vi farà risparmiare un sacco di tempo.

Il link per scaricarlo è in descrizione. Alla prossima. 📄
