$b64_1 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('banned_screenshot.png'))
$dataUrl_1 = 'data:image/png;base64,' + $b64_1

$b64_2 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('second_image.png'))
$dataUrl_2 = 'data:image/png;base64,' + $b64_2

$b64_3 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('face.png'))
$dataUrl_3 = 'data:image/png;base64,' + $b64_3

$html = Get-Content 'rust_gambling_simulator.html' -Raw
$html = $html.Replace('banned_screenshot.png', $dataUrl_1)
$html = $html.Replace('second_image.png', $dataUrl_2)
$html = $html.Replace('face.png', $dataUrl_3)
Set-Content 'rust_gambling_simulator.html' -Value $html -NoNewline
