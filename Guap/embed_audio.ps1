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

$b64_6 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('feetback.png'))
$dataUrl_6 = 'data:image/png;base64,' + $b64_6

$b64_7 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('feetfront.png'))
$dataUrl_7 = 'data:image/png;base64,' + $b64_7

$b64_8 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('stomach.png'))
$dataUrl_8 = 'data:image/png;base64,' + $b64_8

$b64_win = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('win.m4a'))
$dataUrl_win = 'data:audio/mp4;base64,' + $b64_win

$b64_lose = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('losee.mp3'))
$dataUrl_lose = 'data:audio/mpeg;base64,' + $b64_lose

$b64_hall = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes('hall.m4a'))
$dataUrl_hall = 'data:audio/mp4;base64,' + $b64_hall

# Gather all images in New folder
$memoryFiles = Get-ChildItem -Path "New folder" -File
$memoryDataUrls = @()
foreach ($file in $memoryFiles) {
    $b64 = [Convert]::ToBase64String([System.IO.File]::ReadAllBytes($file.FullName))
    $ext = $file.Extension.TrimStart('.').ToLower()
    if ($ext -eq 'webp') { $mime = 'image/webp' } else { $mime = 'image/png' }
    $memoryDataUrls += "data:$mime;base64,$b64"
}
$jsArray = "['" + ($memoryDataUrls -join "','") + "']"

$html = Get-Content 'rust_gambling_simulator.html' -Raw
$html = $html.Replace('banned_screenshot.png', $dataUrl_1)
$html = $html.Replace('second_image.png', $dataUrl_2)
$html = $html.Replace('face.png', $dataUrl_3)
$html = $html.Replace('leftarm.png', $dataUrl_4)
$html = $html.Replace('rightarm.png', $dataUrl_5)
$html = $html.Replace('feetback.png', $dataUrl_6)
$html = $html.Replace('feetfront.png', $dataUrl_7)
$html = $html.Replace('stomach.png', $dataUrl_8)
$html = $html.Replace('win.m4a', $dataUrl_win)
$html = $html.Replace('losee.mp3', $dataUrl_lose)
$html = $html.Replace('hall.m4a', $dataUrl_hall)
$html = $html.Replace('__MEMORY_IMAGES_ARRAY__', $jsArray)

Set-Content 'rust_gambling_simulator.html' -Value $html -NoNewline
