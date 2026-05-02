# 🎧 YT-PL-MP3 — Come funziona?

## APERTURA

Avete mai voluto scaricare tutte le canzoni di una playlist YouTube per ascoltarle offline?

Sì. Anche io.

Questo script risolve tutti questi problemi. Gli date l'URL della playlist e lui fa tutto il resto: scarica, pulisce i nomi, converte in MP3 320k.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche modifica minore funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**yt-dlp, ffmpeg e detox** — tre strumenti essenziali. Si installano con un solo comando:

```
brew install yt-dlp ffmpeg detox
```

- `yt-dlp` scarica da YouTube e altri siti

- `ffmpeg` converte in MP3

- `detox` pulisce i nomi file da caratteri speciali

## COME SI USA

Lancee lo script:

```
./yt-pl-mp3
```

A questo punto lo script fa tre domande.

**Prima:** incollate il link alla playlist YouTube. Funziona con qualsiasi playlist, anche privata se avete accesso.

**Seconda:** scegliete la cartella di destinazione. Default è una sottocartella in `~/Music/yt-playlist-mp3/` con data e ora, così tenete tutto ordinato. Potete lasciare vuoto per usare il default o scrivere un percorso personalizzato.

**Terza:** lo script fa tutto il resto. Mostra un progresso scaricando ogni video della playlist.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Scarica l'audio** — usa `yt-dlp` con il formato `bestaudio` per ottenere la qualità migliore disponibile. Scarica tutti i video della playlist con `--yes-playlist` e ignora gli errori singoli con `--ignore-errors`.

**Pulisce i nomi** — yt-dlp aggiunge sempre un ID YouTube tra parentesi al nome del file. Lo script lo rimuove prima di tutto, così il nome resta pulito.

**Applicca Detox** — il tool `detox` trasforma nomi con spazzi, caratteri speciali, lettere maiuscole in nomi safe per tutti i sistemi. Da `My Song (Official Video).webm` a `my\_song\_official\_video\_.webm`.

**Converte in MP3** — usa `ffmpeg` per convertire ogni file in MP3 a 320kbps, la qualità massima per MP3. Mantiene la frequenza standard di 44100 Hz.

**Pulizia** — rimuove i file originali dopo la conversione, tiene solo gli MP3.

## IL RISULTATO

Alla fine nella cartella trovate:

- Tutte le tracce della playlist, scaricate e convertite

- Nomi puliti, senza caratteri speciali

- Formato MP3 320kbps, pronto per qualsiasi dispositivo

- Cartella ordinata per data e ora

Esempio di output:

```
~/Music/yt-playlist-mp3/2024-01-15\_14-30-00/  
├── Imagine\_Dragons\_-\_Believer.mp3  
├── Ed\_Sheeran\_-\_Shape\_of\_You.mp3  
└── Queen\_-\_Bohemian\_Rhapsody.mp3
```

## NOTE

Lo script salta i video privati o non disponibili nella playlist. Se un video dà errore, passa al successivo senza fermarsi.

Il tempo dipende dalla playlist e dalla vostra connessione. 

Se interrompete lo script, i file già scaricati restano nella cartella. Potete rilanciare e riprendere da dove avete lasciato.

Lo script supporta anche formati audio nativi come .m4a — evita la conversione se il file è già MP3.

## CHIUSURA

Lo script è liberamente modificabile: se avete esigenze diverse (qualità diversa, formato diverso, cartella diversa) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 🎧

