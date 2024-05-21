# Укажите путь к папке, содержащей текстовые файлы
$folderPath = "C:\MyOp"

# Укажите искомое слово и слово, на которое нужно заменить
$oldWord = "Mom"
$newWord = "Motheeeer"

# Получение списка текстовых файлов в указанной папке
$fileList = Get-ChildItem -Path $folderPath -Filter "*.txt" -File

# Проход по каждому файлу и замена слова
foreach ($file in $fileList) {
    # Чтение содержимого файла
    $content = Get-Content -Path $file.FullName

    # Замена слова
    $newContent = $content -replace $oldWord, $newWord

    # Запись измененного содержимого обратно в файл
    $newContent | Set-Content -Path $file.FullName
}

# Сохранение списка файлов в отдельный файл
$fileList | Select-Object FullName | Export-Csv -Path "C:\MyOp2\output.csv" -NoTypeInformation
