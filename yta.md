# 🎵 YTA — Come funziona?

## APERTURA

Avete mai voluto scaricare la musica di un video YouTube per ascoltarla offline, e ritrovato con strumenti complessi che producevano file con nomi strani o formati incompatibili?

Sì. Anche io.

Oggi vi mostro uno script che ho chiamato **yta** e che risolve in modo elegante uno dei problemi più comuni di chi vuole solo l'audio: scaricare un singolo video da YouTube in MP3. Gli date l'URL del video e lui fa tutto: scarica, pulisce il nome, converte in MP3 320k.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche modifica minore funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**yt-dlp, ffmpeg e detox** — tre strumenti essenziali. Si installano con un solo comando:

```
brew install yt-dlp ffmpeg detox
```

- `yt-dlp` scarica da YouTube

- `ffmpeg` converte in MP3

- `detox` pulisce i nomi file

Nient'altro. Nessuna dipendenza esotica.

## COME SI USA

Lanci lo script:

```
./yta
```

A questo punto lo script fa due domande.

**Prima:** incollate il link al video YouTube. Supporta qualsiasi formato di URL — quello lungo, quello corto.

**Seconda:** scegliete la cartella di destinazione. Default è `~/Music/yt-mp3/`, così trovate tutto nello stesso posto. Potete lasciare vuoto per usare il default o scrivere un percorso personalizzato.

Dopodichè lo script fa tutto da solo.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Scarica l'audio** — usa `yt-dlp` con il formato `bestaudio` per ottenere la qualità audio migliore disponibile. Non scarica mai il video, solo l'audio.

**Pulisce il nome** — yt-dlp aggiunge sempre un ID YouTube tra parentesi quadre al nome del file. Lo script lo rimuove, così il nome è pulito.

**Applicca Detox** — il tool `detox` trasforma nomi con spazi, caratteri speciali, lettere maiuscole in nomi safe. Da `Imagine Dragons - Believer (Official Video).webm` a `imagine\_dragons\_-\_believer\_official\_video\_.webm`.

**Converte in MP3** — usa `ffmpeg` per convertire il file in MP3 a 320kbps, la qualità massima per MP3. Mantiene la frequenza standard di 44100 Hz.

**Pulizia** — rimuove il file originale dopo la conversione, tiene solo l'MP3.

## IL RISULTATO

Alla fine nella cartella `~/Music/yt-mp3/` trovate:

- Il file audio in formato MP3

- Nome pulito, senza ID YouTube

- Qualità 320kbps, pronto per qualsiasi dispositivo

Esempio di output:

```
~/Music/yt-mp3/  
├── Queen\_-\_Bohemian\_Rhapsody.mp3
```

Il file è già pronto. Nessun passaggio extra.

## NOTE

Lo script scarica un solo video alla volta, non una playlist. Per le playlist usate `yt-pl-mp3`.

Se il video è già in formato audio (esempio un video musicale), saltal a conversione e tiene l’audio originale.

Il tempo dipende dalla lunghezza del video e dalla vostra connessione. 

Lo script non supporta la coda — per scaricare più video, lanciate lo script più volte o usate `yt-pl-mp3`.

## DIFFERENZA CON YT-PL-MP3

| Caratteristica | yta | yt-pl-mp3 |
| - | - | - |
| Video | Singolo | Intera playlist |
| Cartella default | ~/Music/yt-mp3/ | ~/Music/yt-playlist-mp3/ |


In pratica:

- **yta** è per quando volete una canzone specifica

- **yt-pl-mp3** è per quando volete scaricare tutto da una playlist

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se scaricate musica da YouTube, per ascoltarla offline, per il vostro lettore MP3, per la macchina, può farvi risparmiare tempo e frustrazione.

Lo script è liberamente modificabile: se avete esigenze diverse (cartella diversa, qualità diversa, formato diverso) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 🎵

