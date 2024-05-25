#!/bin/bash
# Ask user to enter YouTube video URL
read -p "Enter the YouTube video URL: " url

# Ask user to enter atempo filter value (e.g., 1.5)
read -p "Enter the atempo filter value (e.g., 1.5): " atempo_value

# Ask user to enter output MP3 file name (e.g., song_name)
read -p "Enter the output MP3 file name (e.g., song_name): " mp3_file_name

# Download YouTube video using yt-dlp and convert it to WAV format
yt-dlp -x --audio-format wav "$url" --output "tmp.wav"

# Use ffmpeg to apply atempo filter and convert WAV to MP3
ffmpeg -i "tmp.wav" -filter:a "atempo=$atempo_value" "${mp3_file_name}.mp3"

# Remove temporary WAV file
rm -v tmp.wav

# Print completion message
echo "Audio download and processing completed!"