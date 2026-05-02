# 🎧 SPEEDA — Come funziona?

## APERTURA

Avete mai registrato un audio e ritrovato che era troppo lento? O magari troppo veloce, e avreste voluto rallentarlo senza alterare il tono della voce?

Sì. Anche io.

Oggi vi mostro uno script che ho chiamato **speeda** e che risolve in modo elegante uno dei problemi più comuni di chi lavora con audio: cambiare la velocità mantenendo il tono originale.

## IL PROBLEMA

Quando registrate un audio — una lezione, un podcast, una nota vocale — spesso il risultato è troppo lento. Si parla troppo lentamente, ci sono troppi silenzi.

Esistono strumenti per cambiare la velocità, ma c'è un problema: raddoppiare la velocità significa raddoppiare la frequenza, e la voce diventa il doppio più alta, metallica, incomprensibile.

Questo script risolve il problema usando il filtro `atempo` di FFmpeg, che cambia la velocità mantenendo intatto il pitch — il tono della voce non cambia.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in bash e usa strumenti disponibili su macOS. Con qualche modifica minore funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**FFmpeg** — lo standard per l'elaborazione audio e video. Si installa con un solo comando:

```
brew install ffmpeg
```

Questo vi darà `ffmpeg` per l'elaborazione e il filtro `atempo` per cambiare la velocità senza alterare il pitch. Nient'altro.

## COME SI USA

Posizionatevi nella cartella del vostro audio e lanciate lo script:

```
./speeda
```

Oppure passate il file direttamente come argomento:

```
./speeda registrazione.mp3
```

Potete anche processare più file insieme:

```
./speeda \*.mp3
```

A questo punto lo script chiede il valore del filtro tempo. I preset comuni sono:

- `0.5` = 50% (metà velocità, audio più lento e più basso)

- `0.75` = 75% (leggermente più lento)

- `1.0` = 100% (velocità originale)

- `1.25` = 125% (25% più veloce)

- `1.5` = 150% (metà più veloce, voce normale)

- `2.0` = 200% (doppia velocità, voce più acuta ma comprensibile)

Potete inserire qualsiasi valore tra 0.5 e 100.

Lo script elabora tutti i file e li converte in MP3.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Valida i file** — controlla che esistano e che siano in un formato supportato. I formati supportati sono: mp3, wav, flac, ogg, aiff, m4a, mp4, mkv, avi, mov, webm.

**Applica il filtro `atempo`** — questo è il cuore dello script. Il filtro `atempo` di FFmpeg cambia la velocità dell'audio senza alterare il pitch. A differenza di altri metodi che semplicemente accelerano l'audio e quindi alzano il tono, `atempo` riesce a mantenere il tono originale intatto.

**Converte in MP3** — il file di output è sempre in formato MP3 a 192kbps, un buon compromesso tra qualità e dimensione.

**Salva il file** — il nome di output è il nome originale più il valore del filtro (esempio `registrazione\_1.5x.mp3`).

## IL RISULTATO

Alla fine nella cartella di lavoro trovate:

- I file audio originali, intatti

- I nuovi file audio con la velocità modificata

La voce rimane comprensibile e naturale perché il tono non è stato alterato. Un audio di 10 minuti a 1.5x diventa un audio di circa 6.7 minuti, senza che la voce sembri "di Chipmunk".

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Se registrate audio, per podcast, per lezioni, per note vocali, può farvi risparmiare tempo e frustrazione.

Lo script è liberamente modificabile: se avete esigenze diverse (formato di output diverso, bitrate diverso, preset di velocità differenti) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 🎧
