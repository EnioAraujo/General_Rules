# Regras Essenciais para Projetos Power BI

Sempre que o assunto for Power BI ou houver manipulação de medidas DAX neste repositório, **ESTAS REGRAS DEVEM SER SEGUIDAS RIGOROSAMENTE**.

## 1. Regra de Ouro ([REGRA LIVE])
* **Extrair ANTES de modificar:** É obrigatório executar o script de extração (`extract_measures.ps1`) para puxar a medida ativa diretamente do modelo local do Power BI **ANTES** de iniciar qualquer edição ou fazer deploy. 
* **Motivo:** Isso garante que alterações manuais feitas previamente no Power BI Desktop não sejam sobrescritas ou perdidas por edições cegas.

## 2. Ao Planejar (Seja objetivo)
* **Estudo prévio:** Leia os arquivos relevantes (especialmente os arquivos de "Skill") antes de propor qualquer mudança.
* **Plano detalhado e escopo claro:** O plano deve listar: arquivos a criar, arquivos a modificar e arquivos que **NÃO devem ser tocados**. Cada etapa deve ter escopo claro e independente (implementável sem quebrar o restante).
* **Respeite a arquitetura:** Mantenha componentes isolados, respeite a responsabilidade única e **não** inclua lógica de negócio em UI.
* **Tamanho de Arquivo:** Se um arquivo ultrapassar ~200 linhas ou acumular mais de uma responsabilidade, proponha sua divisão no plano.
* **Escopo:** Não inclua refatorações fora do escopo no plano.
* **Finalização do Plano:** Encerre o plano com a estimativa de arquivos impactados e possíveis riscos ou dependências críticas.

## 3. Ao Implementar (Seja cirúrgico)
* **Precisão Cirúrgica:** Altere ou crie **SOMENTE** os arquivos necessários para a tarefa atual.
* **Arquitetura:** Respeite a arquitetura existente (componentes isolados, responsabilidade única, sem lógica de negócio em UI).
* **Sem invenções:** Não refatore código fora do escopo desta tarefa.
* **Divisão de Arquivos:** Se um arquivo ultrapassar ~200 linhas ou acumular mais de uma responsabilidade, divida-o.

## 4. Padrão de Nomenclatura para Novas Medidas
* **Identificação do Criador (IA):** Sempre que for criar uma **nova medida**, é obrigatório usar um prefixo para deixar claro que foi criada por você (IA). 
* **Regra de Nomenclatura:** O nome da nova medida deve obrigatoriamente começar com o prefixo `M_` (ex: `M_Total_Ocupado`). 
* **Pasta (Display Folder):** As novas medidas devem ser salvas em uma pasta que também contenha o identificador, adicionando `_M` no final do nome da pasta. Por exemplo: `MEDIDAS_OCUPAÇÃO_M` ou `MEDIDAS_CAPACIDADE_M`. 
* **Medidas HTML:** A partir de agora, todas as medidas HTML criadas e/ou modificadas devem obrigatoriamente ser direcionadas/salvas na tabela (pasta) `MEDIDAS_HTML`.
* **Reaproveitamento:** Analise e priorize o uso das medidas existentes no modelo (como `CAP NOMINAL`, `Capacidade Real`, `%_Real`, `Contagem_dEndereco` da pasta `MEDIDAS_CAPACIDADE`) nos próximos visuais e medidas que for criar, evitando redundâncias.

## 5. Organização de Arquivos
* **Regra de Diretórios:** Arquivos de processamento (`.ps1`, `.py`) e outros arquivos de dados/scripts devem SEMPRE ser salvos em suas respectivas pastas relacionadas (ex: `Scripts_Processamento` para scripts, `Medidas_DAX` para códigos DAX, `BACKUP` para backups). 
* **Raiz Limpa:** Se a pasta não existir, crie-a. Nunca salve ou deixe arquivos de script soltos na raiz do projeto.

## 6. Prevenção de Erros de Codificação (UTF-8 BOM vs ANSI)
* **Python lendo PowerShell:** O PowerShell do Windows (via `Out-File -Encoding UTF8`) salva arquivos com BOM. SEMPRE use `encoding="utf-8-sig"` no Python (`open()`) ao ler arquivos do projeto para evitar erros `Unexpected UTF-8 BOM`.
* **PowerShell lendo Python:** Quando o PowerShell for ler (`Get-Content`) um arquivo UTF-8 gerado pelo Python (ou por mim) para fazer deploy no Tabular Object Model (TOM), é **OBRIGATÓRIO** usar a flag explícita `-Encoding UTF8` (ex: `Get-Content $daxFile -Encoding UTF8 -Raw`). Ocultar essa flag fará o PowerShell ler em ANSI e destruirá todos os acentos da medida DAX no Power BI.
