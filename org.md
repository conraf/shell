# 📁 ORG — Come funziona?

## APERTURA

Avete mai scaricato una cartella piena di file sparsi — immagini, PDF, documenti — e ritrovato un caos totale senza logica?

Sì. Anche io.

Oggi vi mostro uno script che ho chiamato **org** e che risolve in modo elegante uno dei problemi più comuni di chi ha a che fare con molti file: organizzarli in sottocartelle.

## IL PROBLEMA

Quando raccogliete file da fonti diverse — scaricati dal web, ricevuti via email, estratti da archivi — spesso finiscono tutti nella stessa cartella, senza ordine. Centinaia di file mescolati, impossibili da navigare.

Potete creare le cartelle a mano, una per uno, ma è noioso. E se i file sono tanti, diventa impraticabile.

Questo script risolve il problema in una riga. Prende ogni file e lo mette nella sua cartella.

## GLI INGREDIENTI

Per usarlo vi serve solo una cosa:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche piccola modifica funziona anche su Linux.

Non serve Homebrew, non serve FFmpeg. Lo script usa solo comandi integrati nella shell.

## COME SI USA

Posizionatevi nella cartella disordinata e lanciate lo script:

```
./org
```

E il gioco è fatto. Lo script:

- Prende ogni file nella cartella corrente

- Crea una sottocartella con lo stesso nome del file (senza estensione)

- Sposta il file dentro quella cartella

Esempio: se avete `foto\_vacanza.jpg`, lo script crea la cartella `foto\_vacanza/` e ci mette dentro il file.

## COSA SUCCEDE DIETRO LE QUINTE

Lo script è elegantemente semplice. Ecco cosa fa:

**Cicla su ogni file** — `.` significa "solo file regular", esclude cartelle e nascosti.

**Estrae il nome senza estensione** — `$\{file:r\}` in zsh rimuove l'estensione dal nome. `pippo.pdf` diventa `pippo`.

**Crea la cartella** — `mkdir -p` crea la sottocartella, anche se non esiste.

**Sposta il file** — `mv` sposta il file nella sua cartella.

Il risultato è una struttura pulita: ogni file nella sua cartella omonima.

## IL RISULTATO

Prima:

```
📂 Cartella/  
  ├── foto1.jpg  
  ├── foto2.png  
  ├── documento.pdf  
  ├── appunti.txt  
  └── musica.mp3
```

Dopo:

```
📂 Cartella/  
  ├── 📂 foto1/  
  │   └── foto1.jpg  
  ├── 📂 foto2/  
  │   └── foto2.png  
  ├── 📂 documento/  
  │   └── documento.pdf  
  ├── 📂 appunti/  
  │   └── appunti.txt  
  └── 📂 musica/  
      └── musica.mp3
```

## NOTE

Lo script ignora le cartelle e i file nascosti. Funziona solo su file regolari.

Attenzione: lo script moves i file, non li copia. Il file originale non esiste più nella cartella principale. Se volete preservare gli originali, fatene prima una copia.

Se un file ha lo stesso nome di una cartella esistente, lo script sposta comunque il file dentro quella cartella. Usate con cautela.

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se organizzate download, raccolte, archivi, può farvi risparmiare minuti di lavoro noioso.

Lo script è liberamente modificabile: se avete esigenze diverse (copia invece di sposta, ignora certi formati, crea cartelle con estensione) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 📁

