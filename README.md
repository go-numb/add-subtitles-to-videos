# Adding subtitles to videos
- 自己ファイル名を取得し、
- 同名の動画ファイルから音声ファイルを切り出し、
- 字幕ファイル生成、
- 字幕ファイルを動画ファイルに付与する

私の環境では、OBSで録画した動画に字幕を付与しています。
余裕があれば、whisperの実行オプション[--model medium]以上を指定ください。

# Prerequisite
PowerShell
OpenAI Whisper
ffmpeg

# Usage
1. filename.ps1を動画と同フォルダ同階層に置く
2. 字幕を付与する動画のファイル名をコピーする（例: movie1.mp4
3. filename.ps1のファイル名を書き換える（例: movie1.ps1
4. .ps1ファイルを右クリックしてPowerShellで実行する

# Results
- 音声ファイルが生成
- 各種字幕ファイルが生成
- 字幕付き動画が生成