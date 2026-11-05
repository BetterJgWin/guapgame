$b64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('banned_screenshot.png'))
$dataUrl = 'data:image/png;base64,' + $b64
$html = Get-Content 'rust_gambling_simulator.html' -Raw
$html = $html.Replace('banned_screenshot.png', $dataUrl)
Set-Content 'rust_gambling_simulator.html' -Value $html -NoNewline
