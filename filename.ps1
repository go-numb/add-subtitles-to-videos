# 自己ファイル名を取得し、
# 同名の動画ファイルから音声ファイルを切り出し、
# 字幕ファイル生成、
# 字幕ファイルを動画ファイルに付与する

try {
    $scriptName = $MyInvocation.MyCommand.Name
    $filename = [System.IO.Path]::GetFileNameWithoutExtension($scriptName)
    Write-Host "filename: $filename"

    $audioname = $filename + ".aac"
    $subtitlename = $filename + ".srt"

    ffmpeg -i "$filename.mp4" -vn -acodec aac -strict experimental -b:a 192k $audioname
    whisper $audioname --language Japanese
    ffmpeg -hwaccel auto -i "$filename.mp4" -vf "subtitles=$subtitlename,format=yuv420p" -c:v h264_nvenc -preset fast -crf 23 -c:a copy "$filename with srt.mp4"
}
catch {
    Write-Host "output [ERR]: $_"
}
# 10s
Start-Sleep -Seconds 10
