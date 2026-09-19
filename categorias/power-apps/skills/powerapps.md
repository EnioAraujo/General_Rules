---
name: Skill_PowerApps
description: >
  Skill especializada em desenvolvimento de aplicações com Microsoft Power Apps (Canvas Apps, Model-Driven Apps e Power Pages).
  Ative esta skill sempre que o usuário pedir para criar, arquitetar, otimizar, auditar ou depurar um Power App de qualquer tipo.
  Cobre Power Fx, Dataverse, SharePoint, SQL Server, ALM/Pipelines, Copilot/AI Builder, convenções de nomenclatura,
  performance, delegação, segurança e integração com o restante do Power Platform (Power Automate, Power BI, Copilot Studio).
  Use também quando o assunto for: connectors, coleções, variáveis, componentes reutilizáveis, soluções gerenciadas,
  ambientes Dev/Test/Prod, publicação, licenciamento ou boas práticas de UX em apps low-code.
  Esta skill DEVE ser ativada mesmo que o usuário mencione apenas "aplicativo no Power Platform", "app no Teams" ou "app corporativo Microsoft".
compatibility:
  tools_required: []
  dependencies: []
---

# 🚀 Skill_PowerApps — Guia Completo de Desenvolvimento

> Referência técnica consolidada a partir da documentação oficial Microsoft Learn (Power Apps, Power Fx, Power Platform ALM) e melhores práticas da comunidade (2024–2026).

---

## 📋 Índice

1. [Tipos de App — Quando usar cada um](#1-tipos-de-app)
2. [Power Fx — A linguagem de fórmulas](#2-power-fx)
3. [Fontes de Dados & Delegation](#3-fontes-de-dados--delegation)
4. [Convenções de Nomenclatura](#4-convenções-de-nomenclatura)
5. [Performance & Otimização](#5-performance--otimização)
6. [Componentes, Coleções & Variáveis](#6-componentes-coleções--variáveis)
7. [Segurança & Permissões](#7-segurança--permissões)
8. [ALM — Soluções, Pipelines & CI/CD](#8-alm--soluções-pipelines--cicd)
9. [Copilot & AI Builder (2025–2026)](#9-copilot--ai-builder-20252026)
10. [Integração com Power Platform](#10-integração-com-power-platform)
11. [UX & Design em Canvas Apps](#11-ux--design-em-canvas-apps)
12. [Licenciamento](#12-licenciamento)
13. [Padrões de Entrega de Código](#13-padrões-de-entrega-de-código)
14. [Referências Oficiais](#14-referências-oficiais)

---

## 1. Tipos de App

### Comparativo Rápido

| Característica | Canvas App | Model-Driven App | Power Pages |
|---|---|---|---|
| **Público** | Interno | Interno | Externo / Anônimo |
| **UI** | 100% customizável | Gerada pelo modelo de dados | Templates + low-code |
| **Fonte de dados** | 1 400+ conectores | **Somente Dataverse** | Dataverse |
| **Criação** | Tela em branco + drag-drop | Data model first | Templates de site |
| **Responsivo** | Manual | Automático | Automático |
| **Complexidade** | Baixa–Alta | Média–Alta | Baixa–Média |
| **Licença mínima** | M365 (SharePoint) ou Premium | Premium | Premium / Por usuário anônimo |

### 🎨 Canvas App
- Foco em **UX totalmente customizada**.
- Ideal para formulários, dashboards de campo, apps mobile e processos simples.
- Conecta-se a qualquer fonte via conectores (SharePoint, SQL, Dataverse, REST, Excel…).
- Fórmulas Power Fx controlam cada propriedade de cada controle.

### 🗃️ Model-Driven App
- Baseado no **modelo de dados do Dataverse** — tabelas, colunas e relacionamentos definem a UI.
- Formulários, visões, gráficos e dashboards gerados automaticamente.
- Excelente para CRM, ERP interno, processos complexos com regras de negócio.
- Suporta **Business Process Flows**, plugins, JavaScript client scripting.
- Em 2025: suporte a **Gen Pages** (React-based, canvas-like) e **In-App Agents** com IA generativa.

### 🌐 Power Pages
- Sites externos acessíveis por usuários não autenticados.
- Usa Dataverse como backend, com controle de permissões por perfil web.

---

## 2. Power Fx

> Power Fx é a linguagem de fórmulas open-source do Power Platform, inspirada no Excel. Declarativa, funcional e assíncrona.

### Categorias de Funções Essenciais

#### 📊 Dados & Tabelas
```
Filter(Tabela, condição)           // ✅ Delegável em Dataverse e SQL
Search(Tabela, texto, "coluna")    // ⚠️ NÃO delegável no SharePoint
LookUp(Tabela, condição)           // ✅ Delegável
SortByColumns(Tabela, "col", Asc)  // ✅ Delegável
Distinct(Tabela, coluna)           // Para dropdowns únicos
GroupBy(Tabela, "col", "grupo")    // Agrupamento local
AddColumns(Tabela, "nova", fórmula)// Adiciona coluna calculada
ShowColumns(Tabela, "col1","col2") // Projeta somente colunas necessárias
```

#### ✏️ CRUD
```
Patch(Tabela, Defaults(Tabela), {Campo: Valor})  // Criar registro
Patch(Tabela, registro, {Campo: NovoValor})       // Atualizar
Remove(Tabela, registro)                          // Deletar
SubmitForm(NomeFormulário)                        // Enviar formulário
```

#### 📦 Coleções
```
ClearCollect(colNome, Filter(Tabela, ...))  // Recarregar coleção
Collect(colNome, registro)                 // Adicionar à coleção
Remove(colNome, registro)                  // Remover da coleção
Clear(colNome)                             // Limpar coleção
```

#### 🔀 Lógica & Controle
```
If(condição, verdadeiro, falso)
Switch(valor, caso1, res1, caso2, res2, padrão)
IsBlank(valor) / IsEmpty(tabela)
Coalesce(v1, v2, v3)        // Retorna primeiro não-nulo
With({x: expr}, fórmula)    // Legibilidade e performance
And() / Or() / Not()
```

#### 🧭 Navegação
```
Navigate(Tela, ScreenTransition.Fade)
Navigate(Tela, ScreenTransition.None, {varParam: valor})
Back()
```

#### 📅 Data & Hora
```
Today()  /  Now()
DateDiff(data1, data2, TimeUnit.Days)
DateAdd(data, 30, TimeUnit.Days)
Text(Today(), "[$-pt-BR]dd/mm/aaaa")
```

#### 📝 Texto
```
Concatenate(txt1, txt2) // ou txt1 & " " & txt2
Text(numero, "R$ ##,##0.00")
Value("123,45")
Upper(txt) / Lower(txt) / Trim(txt)
Left(txt, n) / Mid(txt, início, tam) / Right(txt, n)
Len(txt)
StartsWith(txt, prefixo)  // ✅ Delegável (use no lugar de Search quando possível)
```

#### 🎨 Visual & Comportamento
```
RGBA(r, g, b, a)
ColorValue("#F15A22")
UpdateContext({varNome: valor})        // Variável de contexto (local à tela)
Set(gVarNome, valor)                   // Variável global
Notify("mensagem", NotificationType.Success)
Reset(controle)
```

### ⚠️ Pontos de Atenção
- **Ponto e vírgula (`;`)** como separador de fórmulas em sistemas PT-BR (vs vírgula em en-US).
- **Delegação**: funções como `Search`, `Len`, `Left`, `Or` com múltiplos campos **não** são delegadas no SharePoint.
- **Async**: todas as operações de dados são assíncronas — use `Concurrent()` para paralelizar chamadas.

```
// ✅ Bom: paralelizar carregamento inicial
Concurrent(
    ClearCollect(colFornecedores, Fornecedores),
    ClearCollect(colAreas, Areas),
    Set(gUsuario, User())
)
```

---

## 3. Fontes de Dados & Delegation

### Suporte a Delegação por Conector

| Fonte | Filter | Sort | Search | Aggregate |
|---|---|---|---|---|
| **Dataverse** | ✅ Completo | ✅ | ✅ | ✅ |
| **SQL Server** | ✅ Completo | ✅ | ✅ | ✅ |
| **SharePoint** | ⚠️ Limitado | ⚠️ Parcial | ❌ | ❌ |
| **Excel (OneDrive)** | ❌ | ❌ | ❌ | ❌ |
| **Dynamics 365** | ✅ (via Dataverse) | ✅ | ✅ | ✅ |

> 📌 **Limite padrão**: 500 registros para queries não-delegáveis. Máximo configurável: **2.000 registros**.  
> Para datasets > 2.000 linhas, a única solução real é garantir delegação ou migrar para Dataverse / SQL.

### Estratégias para Contornar Limites de Delegação

```
// ❌ Errado: Search não é delegável no SharePoint
Filter(Funcionarios, Search(Nome, txtBusca.Text, "Nome"))

// ✅ Correto: StartsWith é delegável
Filter(Funcionarios, StartsWith(Nome, txtBusca.Text))

// ✅ Filtro por usuário (delegável)
Filter(Pedidos, CriadoPor = User().Email)

// ✅ Filtro por data (delegável)
Filter(Registros, DataCriacao >= DateAdd(Today(), -30, TimeUnit.Days))

// ⚠️ Or com múltiplos campos = NÃO delegável
// ❌ Filter(Usuarios, Cargo = "Gerente" Or Cargo = "Supervisor")
// ✅ Solução: separar em dois filters e unir com union ou usar Dataverse
```

### Quando Usar Cada Fonte

| Cenário | Recomendação |
|---|---|
| Prototipagem rápida, times M365 sem licença premium | SharePoint Lists |
| App corporativo, +2.000 registros, regras complexas | **Dataverse** |
| Dados legados, ERP/BI existente | SQL Server / Azure SQL |
| Apenas visualização (read-only) | Excel via OneDrive (< 300 linhas) |

---

## 4. Convenções de Nomenclatura

### Controles (Canvas App)

| Tipo | Prefixo | Exemplo |
|---|---|---|
| Screen | `scr` | `scrDashboard` |
| Gallery | `gal` | `galFornecedores` |
| Form | `frm` | `frmCadastro` |
| Label | `lbl` | `lblTitulo` |
| Text Input | `txt` | `txtBusca` |
| Button | `btn` | `btnSalvar` |
| Dropdown | `drp` | `drpStatus` |
| ComboBox | `cmb` | `cmbArea` |
| Toggle | `tgl` | `tglAtivo` |
| Icon | `ico` | `icoEditar` |
| Image | `img` | `imgLogo` |
| HTML Text | `html` | `htmlConteudo` |
| Timer | `tmr` | `tmrAtualizacao` |
| DataTable | `tbl` | `tblRelatorio` |
| Container | `con` | `conHeader` |

### Variáveis

```
// Variáveis globais (Set) — prefixo 'g'
Set(gUsuario, User())
Set(gFornecedorSelecionado, galFornecedores.Selected)

// Variáveis de contexto (UpdateContext) — prefixo 'loc'
UpdateContext({locModoEdicao: true})
UpdateContext({locItemEditado: galItens.Selected})

// Booleanas — prefixo 'is' ou 'b'
Set(gIsAdmin, gUsuario.Email = "admin@empresa.com")
UpdateContext({locIsLoading: false})
```

### Coleções — prefixo `col`
```
ClearCollect(colTurnos, Turnos)
ClearCollect(colFornecedoresFiltrados, Filter(Fornecedores, Ativo = true))
```

### Soluções & Ambientes (ALM)
```
// Padrão: [SIGLA_EMPRESA]_[DOMÍNIO]_[FUNCIONALIDADE]
SUP_LOG_ControleTerceiros       // Solução
SUP_LOG_GestaoExpedicao

// Ambientes: [REGIÃO]_[TIPO]_[DEPTO]
BR_DEV_LOG
BR_TEST_LOG
BR_PROD_LOG
```

---

## 5. Performance & Otimização

### ✅ Boas Práticas

```
// 1. Use Concurrent para chamadas paralelas no App.OnStart
App.OnStart:
Concurrent(
    ClearCollect(colFornecedores, Fornecedores),
    Set(gUsuario, User())
)

// 2. Mova lógica pesada de OnStart para App.StartScreen ou primeira tela OnVisible
// (App.OnStart bloqueia o carregamento)

// 3. Use ShowColumns para reduzir colunas trafegadas
ClearCollect(
    colFornecedoresMin,
    ShowColumns(Fornecedores, "ID", "Nome", "Ativo")
)

// 4. Evite Gallery com mais de 500 itens sem delegação
// Use paginação com Filter + sortKey

// 5. Limite coleções locais a datasets pequenos (<500 linhas)
// Para grandes volumes: sempre delegar para o servidor

// 6. Reuse componentes em vez de duplicar controles
// (Power Apps Components Framework)

// 7. Evite muitas conexões de dados simultâneas (ideal: 1-5 por app)
// 110 listas SharePoint em um app = problema grave de performance
```

### ❌ Antipadrões Comuns

| ❌ Problema | ✅ Solução |
|---|---|
| `Search()` no SharePoint | Use `Filter()` com `StartsWith()` |
| `Collect()` sem `Clear()` antes | Use sempre `ClearCollect()` |
| Toda lógica no `App.OnStart` | Distribua entre telas com `OnVisible` |
| Muitos controles ocultos na tela | Use `Navigate()` para telas separadas |
| `If()` aninhado em 5+ níveis | Refatore com `Switch()` ou `With()` |
| Fórmulas duplicadas em cada tela | Crie variáveis globais ou componentes |

---

## 6. Componentes, Coleções & Variáveis

### Componentes Reutilizáveis (PCF / Canvas Components)
```
// Criar componente: Insert > New Component
// Propriedades customizadas: Input/Output/Behavior

// Exemplo de propriedade de entrada:
// ComponentProperty.TituloHeader (Text) -> exibido em lblTitulo.Text
```

### Escopo de Variáveis

| Tipo | Função | Escopo | Persiste? |
|---|---|---|---|
| **Global** | `Set()` | App inteiro | Sessão |
| **Contexto** | `UpdateContext()` | Tela atual | Sessão |
| **Coleção** | `ClearCollect()` | App inteiro | Sessão |
| **Env Variable** | Power Platform | Ambiente | Configurável |

### Padrão para Estado de Formulário
```
// Variáveis de controle de formulário
UpdateContext({
    locModo: "Novo",          // "Novo" | "Editar" | "Visualizar"
    locRegistroAtual: Blank()
})

// Ao selecionar item na gallery:
Select(btnEditar):
UpdateContext({
    locModo: "Editar",
    locRegistroAtual: galItens.Selected
})
Navigate(scrFormulario)

// No formulário:
frmCadastro.Mode = If(locModo = "Visualizar", FormMode.View, 
                  If(locModo = "Editar", FormMode.Edit, FormMode.New))
```

---

## 7. Segurança & Permissões

### Canvas Apps
- **Compartilhamento**: por usuário individual ou grupo AAD.
- **Conexões**: cada usuário usa suas próprias credenciais (delegated) ou credenciais do conector.
- **Dados sensíveis**: nunca armazene credenciais em variáveis ou coleções.
- **Environment Variables**: use para URLs, chaves de API, strings de conexão — nunca hard-coded.

### Model-Driven Apps + Dataverse
- **Security Roles**: controle granular (Create/Read/Update/Delete/Append) por tabela e coluna.
- **Row-level security**: Owner + Team + Business Unit.
- **Column-level security**: restringe acesso a campos sensíveis.
- **Field-level encryption**: disponível no Dataverse para dados críticos.

### Práticas de Segurança
```
// ✅ Use Environment Variables para configurações por ambiente
// (nunca hard-code URLs de API ou segredos)

// ✅ Valide dados no servidor (Power Automate / Dataverse Business Rules)
// não confie apenas em validação client-side (Power Fx)

// ✅ Não exponha informações de erro para o usuário final
If(IsError(resultado),
    Notify("Erro ao salvar. Tente novamente.", NotificationType.Error),
    Navigate(scrSucesso)
)
```

---

## 8. ALM — Soluções, Pipelines & CI/CD

### Estrutura de Ambientes Recomendada

```
DEV (Development)  →  TEST/UAT (Staging)  →  PROD (Production)
```

- **DEV**: onde makers constroem. Soluções unmanaged.
- **TEST**: validação funcional e UAT. Soluções managed.
- **PROD**: usuários finais. Soluções managed. Sem customizações diretas.

### Power Platform Pipelines (Nativo)

> Disponível a partir de **Managed Environments**. Configurado no Power Platform Admin Center.

**Etapas de configuração:**
1. Criar ambiente host (onde o pipeline é gerenciado).
2. Instalar app **Deployment Pipeline Configuration** no ambiente host.
3. Registrar os ambientes DEV, TEST e PROD no pipeline.
4. Adicionar permissões: `Deployment Pipeline Administrator` e `Deployment Pipeline User`.
5. Na solução: Pipelines → Deploy → selecionar estágio alvo.

**Checklist ALM:**
- ✅ Sempre trabalhe dentro de uma **Solution** com publisher customizado.
- ✅ Use **Environment Variables** para tudo que muda entre ambientes (URLs, IDs).
- ✅ Use **Connection References** — não hardcode conexões.
- ✅ Deploy como **Managed Solution** para TEST e PROD.
- ✅ Valide pre-deployment antes de promover.
- ✅ Integre com **Azure DevOps** ou **GitHub Actions** para cenários avançados de CI/CD.

### Integração Azure DevOps / GitHub Actions

```yaml
# Exemplo simplificado: GitHub Actions para Power Platform
name: Deploy Power Platform Solution
on:
  push:
    branches: [main]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Export solution from DEV
        uses: microsoft/powerplatform-actions/export-solution@v1
        with:
          environment-url: ${{ secrets.DEV_ENVIRONMENT_URL }}
          app-id: ${{ secrets.CLIENT_ID }}
          client-secret: ${{ secrets.CLIENT_SECRET }}
          tenant-id: ${{ secrets.TENANT_ID }}
          solution-name: 'MinhasolucaoNome'
          solution-output-file: 'out/Minhasolucao.zip'
      - name: Deploy to PROD
        uses: microsoft/powerplatform-actions/import-solution@v1
        with:
          environment-url: ${{ secrets.PROD_ENVIRONMENT_URL }}
          # ... credenciais de produção
          solution-input-file: 'out/Minhasolucao_managed.zip'
```

---

## 9. Copilot & AI Builder (2025–2026)

### Copilot em Power Apps (2025 Release Wave 1 & 2)

| Feature | Descrição |
|---|---|
| **Build with Copilot** | Describe em linguagem natural → Dataverse tables + Canvas App gerados automaticamente |
| **Plan Designer** | Gera tabelas, apps e fluxos a partir de requisitos de negócio |
| **Power Fx Copilot** | Converte linguagem natural em fórmulas Power Fx |
| **Smart Paste** | Cola dados não estruturados e cria campos automaticamente |
| **In-App Agents** | Agentes IA embutidos para ajudar usuários a navegar e inserir dados |
| **Agent Feed** | Espaço compartilhado para supervisionar ações dos agentes IA |
| **MCP Server** | Agentes externos (Copilot no Outlook, Teams) operam diretamente em Power Apps |

### Criando App com Copilot
```
1. Power Apps home → "Start with data" → "Create new data"
2. Digite: "Quero gerenciar terceiros por turno e fornecedor"
3. Copilot gera tabelas Dataverse: Terceiros, Turnos, Fornecedores
4. Revise e ajuste colunas no Copilot panel
5. Clique "Create App" → Canvas App 3 telas gerado automaticamente
```

### AI Builder — Capacidades Principais

| Modelo | Uso |
|---|---|
| **Document Processing** | Extração de dados de formulários/PDFs (NF, contratos) |
| **Object Detection** | Identificar produtos/objetos em imagens |
| **Text Classification** | Categorizar textos |
| **Prediction** | Modelos preditivos com dados Dataverse |
| **Prompt Builder** | Criação visual de prompts GenAI |
| **Sentiment Analysis** | Análise de sentimento |

```
// Usar AI Builder em Canvas App
// 1. Insert → AI Builder → Form Processor
// 2. Conectar ao modelo treinado
// 3. Acessar resultado:
Set(gResultadoIA, AIFormProcessor1.Fields.NumeroNF.Value)
```

---

## 10. Integração com Power Platform

### Power Apps ↔ Power Automate

```
// Chamar um Flow a partir de Canvas App
// No botão:
btnEnviar.OnSelect:
Set(gResultadoFlow, 
    MeuFlowDeEnvioEmail.Run(
        txtEmail.Text,
        txtMensagem.Text
    )
)

// O Flow retorna dados via "Respond to a Power App" step
Notify(gResultadoFlow.mensagem, NotificationType.Success)
```

### Power Apps ↔ Power BI

- Embed Power BI reports em Canvas Apps via **Power BI tile control**.
- Filtragem cruzada: selecionar item no app → filtrar relatório.
- **Power BI ↔ Power Apps visual**: embed um Canvas App dentro de um relatório Power BI.

### Power Apps ↔ Dataverse Custom Connectors

```
// Para fontes de dados externas não cobertas por conectores padrão:
// 1. Criar Custom Connector (Admin Center → Data → Custom Connectors)
// 2. Definir autenticação (API Key, OAuth, Basic)
// 3. Importar Swagger/OpenAPI ou configurar manualmente
// 4. Usar no Canvas App como qualquer conector
```

### Power Apps ↔ SharePoint

```
// Boas práticas de integração SharePoint:
// 1. Evite listas com +2.000 itens sem indexação de colunas
// 2. Crie índices nas colunas usadas em Filter/Sort
// 3. Limite colunas retornadas com ShowColumns
// 4. Considere migrar para Dataverse se performance degradar

// Exemplo: filtro eficiente com SharePoint
Filter(
    MinhaListaSP,
    Status = drpStatus.Selected.Value,  // ✅ delegável (Choice column)
    StartsWith(Titulo, txtBusca.Text)   // ✅ delegável
)
```

---

## 11. UX & Design em Canvas Apps

### Estrutura de Telas Recomendada

```
scr_Splash / scr_Loading    → Carregamento inicial (Concurrent data load)
scr_Dashboard               → Visão geral / KPIs
scr_Lista_[Entidade]        → Listagem com busca e filtros
scr_Detalhe_[Entidade]      → Visualização de registro
scr_Formulario_[Entidade]   → Criar / Editar
scr_Configuracoes           → Admin / Preferências
scr_Erro                    → Tela de fallback para erros críticos
```

### Padrão de Loading Screen
```
// App.OnStart:
Set(gIsCarregando, true);
Concurrent(
    ClearCollect(colDados1, Fonte1),
    ClearCollect(colDados2, Fonte2)
);
Set(gIsCarregando, false)

// scr_Loading.OnVisible:
If(!gIsCarregando, Navigate(scr_Dashboard, ScreenTransition.Fade))

// Spinner visível enquanto carrega:
conSpinner.Visible = gIsCarregando
```

### Responsividade
```
// Habilitar em: App Settings → Display → Scale to Fit → Off
// Usar containers com Layout automático (Horizontal/Vertical)
// Width: Parent.Width / 2 (para dividir tela em metades)
// Self.Height = App.Height - conHeader.Height - conFooter.Height
```

### Padrão de Formulário CRUD
```
// Gallery (lista) → Botão Novo / Selecionar item → Formulário

// frmCadastro:
DefaultMode = Switch(locModo,
    "Novo", FormMode.New,
    "Editar", FormMode.Edit,
    FormMode.View
)
Item = If(locModo = "Novo", Defaults(Tabela), locRegistroAtual)

// btnSalvar.OnSelect:
If(frmCadastro.Valid,
    SubmitForm(frmCadastro),
    Notify("Preencha todos os campos obrigatórios", NotificationType.Warning)
)

// frmCadastro.OnSuccess:
Notify("Salvo com sucesso!", NotificationType.Success);
Navigate(scr_Lista, ScreenTransition.None);
ClearCollect(colDados, Tabela)  // Refresh da coleção
```

---

## 12. Licenciamento

| Plano | Acesso | Quando usar |
|---|---|---|
| **Microsoft 365 (incluso)** | Canvas Apps com SharePoint/Teams | Apps simples com lista SharePoint |
| **Power Apps per App** | 1 app ou portal, por usuário/mês | Apps específicos para um grupo |
| **Power Apps per User** | Todos os apps do ambiente, por usuário/mês | Usuários que usam múltiplos apps |
| **Power Apps Premium** (via M365) | Conectores premium, Dataverse | Necessário para Dataverse e SQL |
| **Developer Plan** | Grátis, não-produção | Desenvolvimento e aprendizado |

> ⚠️ **Dataverse** e conectores premium (SQL Server, custom connectors) requerem **licença premium**.  
> SharePoint e conectores padrão funcionam com M365 básico.

---

## 13. Padrões de Entrega de Código

Ao gerar código Power Fx, sempre:

1. **Forneça o código completo** — sem snippets incompletos.
2. **Indique a propriedade** onde o código deve ser aplicado (`OnSelect`, `Items`, `Visible`, etc.).
3. **Marque erros como ❌** e a versão corrigida como ✅.
4. **Apresente múltiplas opções** (Opção 1, Opção 2) quando houver tradeoffs.
5. **Sinalize delegação**: indique ✅ delegável ou ⚠️ não-delegável para cada fórmula de consulta.
6. **Inclua tratamento de erro** em toda operação de escrita (Patch, SubmitForm, Remove).
7. **Documente variáveis** usadas: tipo (global/contexto/coleção) e escopo.
8. **Siga convenções de nomenclatura** desta skill (prefixos de controles, variáveis e coleções).
9. **Indique licença necessária** quando a solução requerer Dataverse ou conectores premium.
10. **Sugira ALM** — sempre oriente a trabalhar dentro de uma Solution para apps de produção.

### Template de Entrega

```
## 🎯 Objetivo
[Descreva o que o código resolve]

## 📋 Propriedades a configurar

| Controle | Propriedade | Código |
|---|---|---|
| btnSalvar | OnSelect | [código] |
| galItens | Items | [código] |

## ⚠️ Observações de Delegação
[indicar quais fórmulas são/não são delegáveis]

## 🔐 Licença necessária
[Standard / Premium / Dataverse]

## 🔄 Alternativas
Opção 1 — [descrição]
Opção 2 — [descrição]
```

---

## 14. Referências Oficiais

| Recurso | URL |
|---|---|
| Power Apps Docs | https://learn.microsoft.com/power-apps/ |
| Power Fx Reference (Canvas) | https://learn.microsoft.com/power-platform/power-fx/formula-reference-canvas-apps |
| Delegation Overview | https://learn.microsoft.com/power-apps/maker/canvas-apps/delegation-overview |
| SharePoint Delegation Table | https://learn.microsoft.com/power-apps/maker/canvas-apps/delegation-list#sharepoint |
| Dataverse Delegation Table | https://learn.microsoft.com/power-apps/maker/canvas-apps/delegation-list#microsoft-dataverse |
| ALM / Pipelines | https://learn.microsoft.com/power-platform/alm/pipelines |
| Copilot in Power Apps | https://learn.microsoft.com/power-apps/maker/canvas-apps/ai-overview |
| Power Apps 2025 Release Wave 1 | https://learn.microsoft.com/power-platform/release-plan/2025wave1/power-apps/ |
| Power Apps 2025 Release Wave 2 | https://learn.microsoft.com/power-platform/release-plan/2025wave2/power-apps/ |
| Model-Driven Best Practices | https://learn.microsoft.com/power-apps/developer/model-driven-apps/best-practices/ |
| Canvas App Coding Standards (Community) | https://www.matthewdevaney.com/power-apps-coding-standards-for-canvas-apps/ |

---

> 🏷️ **Versão da Skill**: 1.0 | **Atualizada em**: Abril/2026  
> 📚 **Fonte principal**: Microsoft Learn, Power Platform Blog, comunidade Matthew Devaney  
> 🔧 **Mantida por**: Claude como especialista em Power Platform
