[System.Reflection.Assembly]::LoadFrom("C:\Users\enio.sales\AppData\Local\Programs\DAX Studio\bin\Microsoft.AnalysisServices.Tabular.dll") | Out-Null
[System.Reflection.Assembly]::LoadFrom("C:\Users\enio.sales\AppData\Local\Programs\DAX Studio\bin\Microsoft.AnalysisServices.Core.dll") | Out-Null

$server = New-Object Microsoft.AnalysisServices.Tabular.Server
$server.Connect("localhost:53018")
$db = $server.Databases[0]
$table = $db.Model.Tables["MEDIDAS_FORMAT_RUAS"]

$dax = Get-Content -Path "C:\Users\enio.sales\SUPPORTE ARM VENDAS E LOG INTEGRADA LTDA\OP - SOUZA CRUZ - Documentos\DASH OCUPACAO BI\PWR_PBIP\M_Cards_HTML_PROTOTIPO_FLEX_V2.dax" -Encoding UTF8 -Raw
$dax = $dax -replace '(?s)^\s*M_Cards_HTML_PROTOTIPO_FLEX_V2\s*=\s*', ''

$measureName = "M_Cards_HTML_PROTOTIPO_FLEX_V2"
if ($table.Measures.ContainsName($measureName)) {
    $table.Measures[$measureName].Expression = $dax
}

$db.Model.SaveChanges()
$server.Disconnect()
Write-Output "INJECTED_SUCCESSFULLY"
