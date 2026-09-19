<#
.SYNOPSIS
    Template genérico para injetar/atualizar uma medida DAX diretamente no modelo tabular (TOM) de
    uma sessão local do Power BI Desktop.

.DESCRIPTION
    Parametrizado — sem caminho, cliente, tabela ou medida hardcoded. Copie para o projeto e
    preencha os parâmetros (ou passe via linha de comando) antes de usar.
    Requer o Power BI Desktop aberto com o modelo carregado, e o DAX Studio instalado (fornece as
    DLLs do Tabular Object Model usadas aqui).

    Ver REGRAS-POWERBI.md, regra 1 (extrair antes de modificar) e regra 6 (encoding UTF-8).

.PARAMETER PbiPort
    Porta local da sessão do Power BI Desktop (muda a cada sessão — descobrir via DAX Studio
    "Connect" ou gerenciador de tarefas / diagnóstico de portas).

.PARAMETER TableName
    Nome da tabela que contém a medida no modelo.

.PARAMETER MeasureName
    Nome da medida a criar/atualizar.

.PARAMETER DaxFilePath
    Caminho do arquivo .dax com a expressão (sem o "NomeDaMedida = " na frente — o script remove
    esse prefixo se existir).

.PARAMETER DaxStudioDllPath
    Pasta com as DLLs do TOM. Por padrão, a instalação padrão do DAX Studio do usuário atual.
#>
param(
    [string]$DaxStudioDllPath = "$env:LOCALAPPDATA\Programs\DAX Studio\bin",
    [Parameter(Mandatory = $true)][string]$PbiPort,
    [Parameter(Mandatory = $true)][string]$TableName,
    [Parameter(Mandatory = $true)][string]$MeasureName,
    [Parameter(Mandatory = $true)][string]$DaxFilePath
)

[System.Reflection.Assembly]::LoadFrom("$DaxStudioDllPath\Microsoft.AnalysisServices.Tabular.dll") | Out-Null
[System.Reflection.Assembly]::LoadFrom("$DaxStudioDllPath\Microsoft.AnalysisServices.Core.dll") | Out-Null

$server = New-Object Microsoft.AnalysisServices.Tabular.Server
$server.Connect("localhost:$PbiPort")
$db = $server.Databases[0]
$table = $db.Model.Tables[$TableName]

if (-not $table) {
    $server.Disconnect()
    throw "Tabela '$TableName' não encontrada no modelo."
}

# Sempre -Encoding UTF8 ao ler: sem isso o PowerShell lê em ANSI e destrói acentos (REGRAS-POWERBI.md, regra 6)
$dax = Get-Content -Path $DaxFilePath -Encoding UTF8 -Raw
$dax = $dax -replace "(?s)^\s*$([regex]::Escape($MeasureName))\s*=\s*", ''

if ($table.Measures.ContainsName($MeasureName)) {
    $table.Measures[$MeasureName].Expression = $dax
} else {
    $server.Disconnect()
    throw "Medida '$MeasureName' não encontrada na tabela '$TableName'. Crie a medida no modelo antes de injetar via script, ou adapte este template para criá-la."
}

$db.Model.SaveChanges()
$server.Disconnect()
Write-Output "INJECTED_SUCCESSFULLY"
