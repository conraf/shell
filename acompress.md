# 📀 ACOMPRESS — Come funziona?

## APERTURA

Avete mai registrato un audio lungo dieci minuti e poi ritrovovi con un file da 50 MB impossibile da inviare via email o caricare su Cloud?

Sì. Anche io.

Oggi vi mostro uno script che ho chiamato **acompress** e che risolve in modo elegante uno dei problemi più comuni di chi lavora con audio: comprimere un file alla dimensione esatta che vi serve.

## IL PROBLEMA

Quando registrate un audio — una lezione, un podcast, una riunione, una canzone — spesso il file risultante è troppo grande. Per mandarlo su WhatsApp, per caricarlo su un cloud con limiti di spazio, per metterlo su un CD, o semplicemente per risparmiare spazio sul telefono.

Il problema è che un audio non è come metterlo in uno zip: ridurre la dimensione significa perdere qualità. E trovare il bitrate giusto per ottenere una dimensione specifica — esempio, esattamente 10 MB — richiede calcoli non banali e tentativi ripetuti.

Questo script risolve il problema. Gli date la dimensione che volete, e lui fa i calcoli da solo.

## GLI INGREDIENTI

Per usarlo vi servono tre cose:

**Un Mac** — lo script è scritto in zsh e usa strumenti disponibili su macOS. Con qualche modifica minore funziona anche su Linux.

**Homebrew** — il gestore di pacchetti per Mac. Se non lo avete, un comando sul loro sito e siete a posto.

**FFmpeg** — lo standard per l'elaborazione audio e video. Si installa con un solo comando:

```
brew install ffmpeg
```

Questo vi darà `ffmpeg` per la conversione e `ffprobe` per leggere i metadati dell'audio. Nient'altro. Nessuna dipendenza esotica.

## COME SI USA

Posizionatevi nella cartella del vostro file audio e lanciate lo script:

```
./acompress
```

A questo punto lo script vi fa quattro domande.

**Prima:** qual è il percorso del file audio da comprimere? Potete scriverlo a mano o trascinarlo dalla cartella.

**Seconda:** volete convertire in mono? Questo dimezza la dimensione senza perdere troppa qualità, e risolve spesso il problema alla radice. Default è sì — premete Invio per accettare, o `n` per tenere stereo.

**Terza:** quale dimensione finale volete in MB? Esempio `5` o `2.5`. Lo script accetta numeri decimali con il punto.

**Quarta:** come volete chiamare il file di output? Default è il nome originale più la dimensionetarget (esempio `registrazione\_circa5MB.mp3`). Potete lasciare vuoto per usare il default o scrivere un nome personalizzato.

Dopodichè lo script mostra un riepilogo: durata, canali, target, bitrate calcolato, e chiede conferma. Premete `y` o Invio per procedere.

## COSA SUCCEDE DIETRO LE QUINTE

Una volta confermati i dati, lo script:

**Legge la durata** del file originale usando `ffprobe` — è il dato fondamentale per il calcolo.

**Calcola il bitrate** necessario per raggiungere la dimensione target. La formula è semplice:

```
bitrate = (dimensione in MB × 8192) / durata in secondi
```

Il numero 8192 è la costante che converte megabit in megabyte. Il risultato è in kbit/s, che è il formato che ffmpeg si aspettaper l'audio.

**Comprime il file** usando `ffmpeg` con il bitrate calcolato e il canale mono (se richiesto). Il file viene sovrascritto solo se esiste già un file con quel nome, altrimenti viene creato.

**Verifica il risultato** e mostra la dimensione finale esatta.

## IL RISULTATO

Alla fine nella cartella di lavoro trovate:

- Il file audio originale, intatto

- Il nuovo file audio compresso alla dimensione richiesta

Il bitrate calcolato è studiato per raggiungere il target il più vicino possibile. La dimensione finale dipende dalla complessità dell'audio — un brano con molti silenzi risulterà più piccolo dello stesso bitrate applicato a un brano molto dinamico.

## CHIUSURA

È uno strumento piccolo, fatto per risolvere un problema specifico. Ma se registrate audio, per podcast, per lezioni, per archiviare registrazioni, può farvi risparmiare tempo e frustrazione.

Lo script è liberamente modificabile: se avete esigenze diverse (formato di output diverso, calcolo del bitrate personalizzato, preset di qualità) il codice è leggibile e potete adattarlo senza difficoltà.

Alla prossima. 📀

