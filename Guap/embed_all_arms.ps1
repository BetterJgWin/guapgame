$b64_1 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('banned_screenshot.png'))
$dataUrl_1 = 'data:image/png;base64,' + $b64_1

$b64_2 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('second_image.png'))
$dataUrl_2 = 'data:image/png;base64,' + $b64_2

$b64_3 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('face.png'))
$dataUrl_3 = 'data:image/png;base64,' + $b64_3

$b64_4 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('leftarm.png'))
$dataUrl_4 = 'data:image/png;base64,' + $b64_4

$b64_5 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('rightarm.png'))
$dataUrl_5 = 'data:image/png;base64,' + $b64_5

$html = Get-Content 'rust_gambling_simulator.html' -Raw
$html = $html.Replace('banned_screenshot.png', $dataUrl_1)
$html = $html.Replace('second_image.png', $dataUrl_2)
$html = $html.Replace('face.png', $dataUrl_3)
$html = $html.Replace('leftarm.png', $dataUrl_4)
$html = $html.Replace('rightarm.png', $dataUrl_5)
Set-Content 'rust_gambling_simulator.html' -Value $html -NoNewline
