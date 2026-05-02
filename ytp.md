# 🎬 YTP — Come funziona?

## APERTURA

Avete mai voluto solo un frammento di un video YouTube — un estratto di una canzone, un momento specifico di un discorso — e ritrovato che dovevate scaricare l'intero video e poi tagliarlo?

Sì. Anche io.

Oggi vi mostro uno script che ho chiamato **ytp** e che risolve in modo elegante uno dei problemi più comuni di chi lavora con video: scaricare solo una porzione e velocizzarla.

## IL PROBLEMA

YouTube è pieno di contenuti interessanti: un assolo di chitarra in un live di 20 minuti, un discorso specifico in una conferenza di un'ora, un momento comico in un video lungo.

Il problema è che scaricare interi video per pochi secondi utili è uno spreco di tempo e spazio. E tagliare dopo richiede altri programmi.

Questo script risolve il problema. Gli date l'URL, il timecode iniziale e finale, e lui scarica solo quella porzione. E se volete, la velocizza.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche modifica minore funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**yt-dlp e ffmpeg** — due strumenti essenziali. Si installano con un solo comando:

```
brew install yt-dlp ffmpeg
```

- `yt-dlp` scarica da YouTube con supporto per porzioni

- `ffmpeg` velocizza il video

Nient'altro.

## COME SI USA

Lanci lo script:

```
./ytp
```

A questo punto lo script fa cinque domande.

**Prima:** l'URL del video YouTube.

**Seconda:** il timecode di inizio. Il formato è `HH:MM:SS` — esempio `00:01:30` per un minuto e mezzo dall'inizio.

**Terza:** il timecode di fine — esempio `00:05:45` per stoppare a 5 minuti e 45 secondi.

**Quarta:** la velocità. Default è `1.5x` — premete Invio per usare quello o scrivete altro (esempio `2` per doppia velocità, `0.75` per rallentare).

**Quinta:** il nome del file di output. Senza estensione — lo script aggiunge `.mp4` da solo.

Dopodichè lo script fa tutto da solo.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Scarica solo la porzione** — usa `--download-sections "\*$\{tc\_start\}-$\{tc\_end\}"` di yt-dlp per scaricare solo i secondi che vi servono. Il resto del video viene ignorato.

**Sceglie il formato** — cerca il miglior video in formato MP4 con audio M4A, o il miglior MP4 disponibile.

**Salva in /tmp** — il file temporaneo viene salvato in /tmp per essere velocizzato senza toccare la cartella corrente.

**Velocizza il video** — usa `ffmpeg` con due filtri:

- `setpts=PTS/$\{speed\}` per il video — rallenta o accelera senza alterare il pitch

- `atempo=$\{speed\}` per l'audio — tiene il tono naturale anche a velocità diverse

**Re-encoda** — usa il codec H.264 per il video e AAC per l'audio, così il file è compatibile con quasi tutti i dispositivi.

**Pulizia** — rimuove il file temporaneo dopo l'elaborazione.

## IL RISULTATO

Alla fine nella cartella di lavoro trovate:

- Il file video con la porzione scelta

- Già velocizzato alla velocità richiesta

- Pronto per essere condiviso o usato

Esempio di output:

```
📂 Cartella/  
├── mioEstratto.mp4
```

Un video di 4 minuti e 15 secondi scaricato e velocizzato a 1.5x diventa un file di circa 2 minuti e 50 secondi.

## NOTE

I timecode sono riferiti all'inizio del video. Se volete estrarre da 1:30 a 5:45 del video originale, indicate proprio `00:01:30` e `00:05:45`, non i secondi della porzione risultante.

La velocità massima è 2x — sopra può causare problemi con l'audio. Se servono velocità maggiori, meglio velocizzare in due passi.

Il file scaricato è sempre MP4. È il formato più compatibile, funziona su smartphone,tablet, TV, computer.

Lo script non scarica l'audio separatamente — tiene sempre traccia video e audio insieme.

## USI PRATICI

Questo script è utile per:

- Estrarre assoli musicali da live lunghi

- Creare clip da conferenze o lezioni

- Fare compilazioni di momenti specifici

- Accelerare parti lente di tutorial

- Creare preview di video più lunghi

È uno strumento perfetto per i creatori di contenuti che hanno bisogno di frammenti specifici senza scaricare tutto.

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se lavorate con video YouTube, per editing, per creare contenuti, può farvi risparmiare tempo e spazio.

Lo script è liberamente modificabile: se avete esigenze diverse (velocità default, formati diversi, cartella diversa) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 🎬

