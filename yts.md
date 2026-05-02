# 📝 YTS — Come funziona?

## APERTURA

Avete mai voluto leggere i sottotitoli di un video YouTube per copiarli, tradurli, o usarli con un'intelligenza artificiale, e ritrovato che erano in un formato impossibile da elaborare?

Sì. Anche io.

Oggi vi mostro uno script che ho chiamato **yts** e che risolve in modo elegante uno dei problemi più comuni di chi lavora con contenuti testuali: scaricare i sottotitoli di un video YouTube in un formato pulito e utilizzabile.

## IL PROBLEMA

YouTube ha sottotitoli automatici per quasi tutti i video, ma sono in formato SRT — un formato con timecode, numeri di sequenza, tag HTML, e ripetizioni. Non sono adatti per essere letti, tradotti, o passati a un'AI.

Esistono strumenti per scaricare i sottotitoli, ma il formato di output è sempre quello grezzo, pieno di rumore.

Questo script risolve il problema. Gli date l'URL del video e lui scarica i sottotitoli, li pulisce, e li converte nel formato che vi serve.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche modifica minore funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**yt-dlp e detox** — due strumenti essenziali. Si installano con un solo comando:

```
brew install yt-dlp detox
```

- `yt-dlp` scarica i sottotitoli da YouTube

- `detox` pulisce i nomi file (opzionale)

Nient'altro.

## COME SI USA

Lanci lo script:

```
./yts
```

A questo punto lo script fa cinque domande.

**Prima:** dove volete salvare il file? Potete scegliere la cartella predefinita `~/Desktop/SOTTOTITOLI` o inserire un percorso personalizzato.

**Seconda:** quale lingua dei sottotitoli? Esempio `it` per italiano, `en` per inglore, `es` per spagnolo. Default è `en`.

**Terza:** l'URL del video YouTube.

**Quarta:** il formato di output. Tre opzioni:

- `1` → Markdown \[.md\] — formato ideale per AI e lettura

- `2` → Testo puro \[.txt\] — senza formattazione

- `3` → SRT \[.srt\] — il formato originale con timecode

Default è Markdown.

Dopodichè lo script scarica i sottotitoli e li converte.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Scarica i sottotitoli** — usa `yt-dlp` con `--write-subs` e `--write-auto-subs` per ottenere i sottotitoli (ufficiali o automatici) nella lingua richiesta. Non scarica il video.

**Converte in SRT** — se i sottotitoli sono in altro formato, li converte in SRT.

**Pulisce il nome** — usa `detox` per rendere il nome del file safe (senza spazi, caratteri speciali).

**Converti in formato pulito** — la funzione `\_yts\_to\_txt` fa il lavoro principale:

- Rimuove i numeri di sequenza SRT

- Rimuove i timecode

- Rimuove i tag HTML come `\<c\>`

- Rimuove le linee duplicate

- Unisce tutto in un flusso continuo

- Segna la punteggiatura con doppio a capo per paragrafi

- Sigla le abbreviazioni comuni (Dr, Mr, ecc.) per non spezzare le frasi

**Salva il file** — il nome è il titolo del video più `\_clean` più l'estensione scelta.

## IL RISULTATO

Alla fine nella cartella scelta trovate:

- Il file con i sottotitoli puliti

- Privo di timecode, numeri, tag

- In formato Markdown o TXT leggibile

Esempio di output:

```
~/Desktop/SOTTOTITOLI/  
├── Introduzione\_allo\_Studio\_della\_Fisica\_clean.md
```

Il contenuto è testo puro, pronto per essere usato con un'AI, tradotto, o copiato.

## FORMATO MARKDOWN

Il formato Markdown è particolarmente utile per LLM. Il testo è diviso in paragrafi separati da righe vuote, con la punteggiatura corretta. È esattamente il formato che un'AI si aspetta per lavorare al meglio.

Esempio di cosa ottenete:

```
It was the best of times, it was the worst of times. In  
that age, believe me, no doubt, it was the age of wisdom.  
  
It was the epoch of belief. It was the epoch of  
incredulity...
```

Invece di:

```
1  
00:00:01,000 --\> 00:00:05,000  
It was the best of times, it was the worst of times. In  
  
2  
00:00:05,000 --\> 00:00:08,000  
that age, believe me, no doubt, it was the age of wisdom.  
  
3  
00:00:08,000 --\> 00:00:12,000  
It was the epoch of belief. It was the epoch of  
\<font color="\#00FF00"\>incredulity\</font\>...
```

## NOTE

Lo script scarica solo i sottotitoli, non il video. È velocissimo.

Se il video non ha sottotitoli nella lingua richiesta, lo script fallisce. Provate con un'altra lingua.

Il formato SRT serve solo se vi servono i timecode — per esempio per creare sottotitoli per un video.

Lo script tiene solo i sottotitoli scaricati, non il video. È perfetto per estrarre il testo da lezioni, conferenze, tutorial.

## USI PRATICI

Questo script è utile per:

- Estrarre il testo da un video educativo

- Creare appunti da tutorial

- Tradurre sottotitoli con un'AI

- Creare documenti da interviste

- Analizzare il discorso di un talk

È uno strumento perfetto per ricercatori, studenti, creatori di contenuti che hanno bisogno solo del testo.

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se lavorate con contenuti YouTube, per ricerca, per studio, per AI, può farvi risparmiare tempo e frustrazione.

Lo script è liberamente modificabile: se avete esigenze diverse (formato diverso, cartella diversa, pulizia diversa) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 📝

