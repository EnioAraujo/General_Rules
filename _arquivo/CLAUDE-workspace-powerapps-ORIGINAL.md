# CLAUDE.md — Contexto permanente (enio.sales)

Este arquivo é carregado automaticamente no início de toda sessão do Claude
Code que rodar a partir desta pasta. Contém regras de trabalho fixas e um
ponteiro para o contexto do projeto em andamento.

## Regras permanentes de trabalho (definidas pelo usuário)

1. **REGRA LIVE** — Antes de qualquer edição, consulta ou deploy, extrair/ler
   o código ou conteúdo ativo/vivo primeiro (do sistema real, não de memória
   ou suposição), para preservar alterações manuais do usuário ou feitas por
   outras IAs.

2. **Proibido editar em pedidos de leitura** — Quando o usuário pedir apenas
   para "Verificar", "Avaliar", "Identificar", ou fizer uma pergunta, a
   resposta deve ser somente análise/informação. Nenhuma edição de arquivo é
   permitida nesses casos, mesmo que um problema óbvio seja encontrado —
   apenas reportar.

3. **Análise em cadeia completa** — Toda análise de código/configuração deve
   cobrir a cadeia relacionada por inteiro: verificar se consultas, chamadas
   ou dependências com ligação direta ou indireta serão afetadas pelas
   alterações propostas, antes de concluir.

4. **REGRA MASTER — sigilo de credenciais** — Cuidado extremo para nunca
   expor senhas, IPs, credenciais, tokens ou chaves em texto claro no chat.
   Sempre mascarar ou usar placeholders. (Ver também as instruções
   organizacionais sobre dados sensíveis/LGPD já vigentes para este usuário.)

5. **REGRA — Update de arquivos** (alterada em 17/09/2026) —
   Atualizar os arquivos de documentação do workspace **somente quando o usuário pedir**.
   Não atualizar por iniciativa própria ao fim de uma tarefa. A regra anterior mandava
   atualizá-los constantemente — não vale mais.
   Exceção única: se uma tarefa já em andamento deixou um documento **incoerente consigo
   mesmo** (meio atualizado), terminar de deixá-lo coerente e avisar — um handoff
   contraditório engana mais do que um desatualizado.

6. **REGRA — Execução e verificação**
   - **Ponto de retorno antes de alterar.** Esta pasta não é repositório git,
     mas é biblioteca do SharePoint sincronizada — o histórico de versões cobre
     isso. Onde não houver nenhuma das duas coisas, gerar cópia datada antes.
   - **Sempre conferir a conexão com o ambiente antes de agir.** Uma
     ferramenta responder sem erro não prova que ela está falando com o
     ambiente/sessão certo. Confirmar explicitamente contra qual ambiente,
     sessão ou URL a ação vai valer — não assumir. Caso pago em 14/09/2026
     (Canvas Apps): compilações foram bem-sucedidas mas o conteúdo
     revertia sozinho pouco depois, sem erro nem aviso; a causa era o
     usuário conferir o resultado por uma URL diferente da que sustenta a
     sessão viva (Play vs. edição do Studio) — sintoma de ambiente errado,
     não de ferramenta quebrada. Ver `Controle_de_terceiros/ESTADO-app-canvas.md`
     → rodada 7, item 3.
   - **Aguardar o assíncrono terminar.** Instalação, build, refresh, job em
     fila: esperar a conclusão real antes de ler o resultado e concluir. Ler
     estado intermediário produz conclusão falsa.
   - **Revisão real, não resumo.** Ao final, reler o artefato como ele ficou e
     conferir no sistema real — nunca substituir verificação por um resumo do
     que se acha que foi feito.
   - **Em mudanças não triviais, explicitar CRIAR / MODIFICAR / NÃO-TOCAR.**
     O "não-tocar" é o que delimita o blast radius.

   > Complementa a skill `critical-dev-surgeon` (instalada em
   > `~\.claude\skills\`), que cobre o mesmo terreno em profundidade quando
   > dispara. Estes quatro itens valem **sempre**, não só quando ela dispara.

7. **REGRA — Conferência final obrigatória** (definida em 15/09/2026) —
   **Antes de finalizar qualquer turno, verificar TUDO que foi criado ou
   alterado nele.** Não é o mesmo que a "revisão real" da regra 6, que fala do
   artefato principal: aqui a varredura é sobre **o turno inteiro**, item por
   item, inclusive o que parece acessório — arquivos criados, arquivos
   editados, docs atualizados, arquivos que deveriam ter sido apagados,
   numeração e ordem de seções, links relativos, e o resultado no sistema real
   (servidor, ambiente, build).
   - Listar o que foi tocado no turno e conferir **cada item**, sem exceção.
   - A verificação é feita **lendo o estado final de verdade**, nunca
     lembrando do que se acha que foi escrito.
   - **Conferir também as DECISÕES contra as especificações registradas**, não
     só os arquivos. Caso pago em 15/09/2026: marquei o "botão de voltar ao
     upload" como cancelado porque interpretei mal uma resposta do usuário,
     enquanto a especificação 09 do projeto dizia, por escrito, que ele havia
     pedido. Uma resposta de estranhamento a uma pergunta minha **não é**
     cancelamento de escopo — e, em dúvida, a especificação escrita vale mais
     que a minha leitura da conversa.
   - **Afirmação sobre dados exige ler a fonte.** Nunca concluir nada sobre o
     conteúdo dos dados (duplicata, valor errado, campo vazio) a partir de
     print ou memória — abrir o arquivo/consulta de origem e contar.
   - Só depois disso escrever o resumo para o usuário — e o resumo reporta o
     que a conferência mostrou, não a intenção.

8. **REGRA — Seja menos verborrágico, não seja prolixo** (definida em 18/09/2026) —
   Respostas direto ao ponto. Sem repetir o que já foi dito, sem explicação
   didática de fórmula/conceito a menos que pedido, sem seção de "resumo" atrás
   de resumo. Reportar o que foi feito e o essencial pra decidir o próximo passo
   — nada além disso.

## Apps em desenvolvimento

Cada app tem sua própria subpasta (mesmo padrão que o `abrir-claude.ps1`
espera para `-App <nome>`): um `CLAUDE.md` próprio com a URL do Studio, e os
docs de projeto daquele app especificamente — para não se misturarem com os
de outro app nem com os docs de ambiente abaixo.

- **`Controle_de_terceiros/`** — ⭐ **o projeto mais avançado**: portar o
  webapp Controlli (React/Supabase) para Canvas App + listas do SharePoint.
  - [`Controle_de_terceiros/PROJETO-controle-terceiros.md`](./Controle_de_terceiros/PROJETO-controle-terceiros.md) —
    regras de negócio, estrutura das listas, módulo de Lançamento de
    Presença e próximo passo. **Comece por aqui.**
  - [`Controle_de_terceiros/ESTADO-app-canvas.md`](./Controle_de_terceiros/ESTADO-app-canvas.md) —
    🔵 **handoff do app**: o que já está construído no Canvas, as regras do
    Controlli que faltam, as divergências conscientes e as armadilhas de
    Power Fx/YAML já pagas. **Comece por aqui ao retomar a construção do app.**
  - [`Controle_de_terceiros/SCHEMA-listas-vivo.md`](./Controle_de_terceiros/SCHEMA-listas-vivo.md) —
    nomes reais das colunas das 7 listas (exibição × interno). **Fonte da
    verdade para escrever fórmulas** — não seguem a convenção que a spec assumia.
  - [`Controle_de_terceiros/DESIGN-canvas.md`](./Controle_de_terceiros/DESIGN-canvas.md) —
    paleta e regras de layout portadas do `DESIGN.md` do Controlli, e o que
    não porta para Canvas.
  - [`Controle_de_terceiros/RUNBOOK-ajuste-catalogos.md`](./Controle_de_terceiros/RUNBOOK-ajuste-catalogos.md) —
    como as listas de catálogo foram ajustadas (Choice→Texto, colunas novas)
    e o que ficou adiado.
  - [`Controle_de_terceiros/FLOW-criar-listas-fase-crud.md`](./Controle_de_terceiros/FLOW-criar-listas-fase-crud.md) —
    ✅ concluído: como a `TB_REGISTROS_TERCEIROS` foi criada, com as
    armadilhas (renomear `Title`, índices com lista vazia).
- **`Relatorio_picking/`** — 🔴 **Rodada de 18/09/2026: decidido migrar a importação para
  Power Automate.** O componente PCF de upload ficou **preso numa versão antiga dentro do
  app** (ambiente tem a 0.0.7, o app não rebinda — reimportar, salvar, recarregar e limpar
  cache não resolveram). Nada do flow foi construído ainda.
  Ver "COMECE AQUI — Rodada de 2026-09-18" no `ESTADO-app-canvas.md`.
  - ✅ Aplicado no app em 18/09: cada importação **apaga a anterior**, decimal aceita `.` e
    `,`, "Realizado" conta por Hora Início+Fim (não por `DURACAO_MIN`), divisão por zero
    corrigida, grade ocupando o espaço vago.
  - 💡 **Saída barata enquanto não há flow:** salvar o export como **CSV separado por ponto e
    vírgula** — esse caminho funciona hoje.
  - 🔬 **Playwright disponível** (`%LOCALAPPDATA%\pw-rp`, `playwright-core` + Edge instalado,
    sem baixar browser): permite inspecionar o app rodando, injetar arquivo no seletor e ler
    erro do console. Foi o que fechou o diagnóstico. Receita no `ESTADO-app-canvas.md`.
  - 🔴 **Lição cara de 15/09: `compile_canvas` 0 erros + `sync_canvas` conferido NÃO provam
    que a mudança chegou ao app** — a sessão pode estar órfã e devolver as próprias
    gravações. **A prova é achar no que o servidor devolve algum traço de origem externa**
    (uma edição feita pelo usuário no Studio), ou conferir a árvore de controles.
  `CLAUDE.md` próprio com a URL do Studio já criado
  (`abrir-claude.ps1 -App Relatorio_picking` reconhece).
  - [`Relatorio_picking/ESTADO-app-canvas.md`](./Relatorio_picking/ESTADO-app-canvas.md) —
    🔵 **handoff do app**: próximo passo (é do usuário — testar CSV real e
    orientação de tela), o que já está construído, e as armadilhas de Power Fx
    já pagas nesta sessão. **Comece por aqui ao retomar a construção do app.**
  - [`Relatorio_picking/PROJETO-relatorio-picking.md`](./Relatorio_picking/PROJETO-relatorio-picking.md) —
    fluxo de negócio, mapeamento de campos (export do SAP → form), listas do
    SharePoint envolvidas, histórico das rodadas de construção.
  - [`Relatorio_picking/SCHEMA-listas-vivo.md`](./Relatorio_picking/SCHEMA-listas-vivo.md) —
    schema real das 2 listas conectadas (lido via MCP em 2026-09-15). Fonte da
    verdade para escrever fórmulas.
  - [`Relatorio_picking/ESPECIFICACOES-relatorio-picking.md`](./Relatorio_picking/ESPECIFICACOES-relatorio-picking.md) —
    🔴 **registro vivo**: toda especificação de negócio que o usuário der a
    partir de 2026-09-15 entra aqui (se ainda não estiver documentada em
    outro lugar do projeto). Conferir antes de assumir uma regra de negócio.
  - [`Relatorio_picking/contexto/RelatorioPicking_context.md`](./Relatorio_picking/contexto/RelatorioPicking_context.md) —
    contexto mais aprofundado de uma sessão anterior (27/07/2026): decisões de
    arquitetura de entrada, regras de negócio do TURNO, Office Script do parse.
    Parcialmente desatualizado (ver §3 do próprio arquivo).
- **`Evidencias_TPE/`** — ✅ **app já EM PRODUÇÃO** (Solução `app_evidencias_tpe` 1.0.0.1
  gerenciada). Registro fotográfico de itens recebidos por TPE: mestre-detalhe em 4 listas do
  SharePoint, fotos como anexo, e um fluxo do Power Automate que copia/renomeia as fotos para a
  biblioteca. Entrou neste workspace em **18/09/2026**, vindo de outro já organizado. Arquivos do
  padrão daqui foram criados, e `MSAPP/`/`_ARQUIVO/` foram podados a pedido do usuário
  (817 MB → 128 MB) — o resto do projeto não foi movido, renomeado ou reescrito.
  - ✅ URL do Studio **confirmada pelo usuário**: é o Ambiente de Desenvolvimento (`app-id` novo,
    nunca tinha sido anotado antes). Sem verificação automática ainda — o MCP `canvas-authoring`
    não conectou em 18/09. **Coautoria: estado desconhecido**, e o projeto nunca usou o fluxo MCP:
    sempre `pac canvas download` → editar → `pack` → Studio. Não existe `src/` com `.pa.yaml` aqui.
  - [`Evidencias_TPE/ESTADO-app-canvas.md`](./Evidencias_TPE/ESTADO-app-canvas.md) —
    🔵 **handoff do app**: o que ficou em aberto na entrada, estado funcional, a fila em ordem de
    risco (testar o botão Excluir → dívida do `runAfter` do `TPE_Apagar_Pasta`) e as regras vivas
    do projeto. **Comece por aqui ao retomar.**
  - [`Evidencias_TPE/SCHEMA-listas-vivo.md`](./Evidencias_TPE/SCHEMA-listas-vivo.md) —
    as 4 listas conectadas e os tipos que quebram fórmula (`DESC_TPE` é Pesquisa, `ITEM` tem de
    continuar Texto, `TPE_ID_NUM` existe só para delegar). **Fonte da verdade para fórmulas.**
  - [`Evidencias_TPE/EvidenciasTPE_context.md`](./Evidencias_TPE/EvidenciasTPE_context.md) —
    contexto completo do projeto, com o histórico por data e as armadilhas já pagas (o espaço no
    nome do app quebra o `pac`; `pac` devolve exit code 0 mesmo falhando; camada não gerenciada
    `Active` engole import gerenciado). O `ESTADO` aponta para as seções.
  - `Evidencias_TPE/GUIAS/`, `MSAPP/INDEX.md`, `PowerAutomate/` — guias clique a clique, índice
    dos `.msapp` e os exports `.zip` dos fluxos (única forma de ler o estado real de um fluxo).

## Ambiente (compartilhado entre todos os apps)

- [`MANUAL-canvas-apps.md`](./MANUAL-canvas-apps.md) — **manual de uso do dia a
  dia**: como abrir, comandos, alternar entre apps, solução de problemas.
  É o primeiro a consultar em dúvida operacional.
- [`PROJECT_CONTEXT.md`](./PROJECT_CONTEXT.md) — estado do **ambiente**
  (setup concluído) e checklist de instalação.
- [`progresso-setup-power-apps.md`](./progresso-setup-power-apps.md) — histórico
  detalhado de como o ambiente foi montado e das armadilhas encontradas.

## Ambiente conhecido

**Setup do ambiente concluído** (11-12/09/2026) — histórico completo, com
todas as armadilhas já pagas e como foram resolvidas (instalação do Git/
MinGit, SDK do .NET, precedência de PATH, marketplaces do plugin, os quatro
sintomas de timeout do MCP incluindo o IPv6 bloqueado, proxy SSL), está em
[`progresso-setup-power-apps.md`](./progresso-setup-power-apps.md) e
[`PROJECT_CONTEXT.md`](./PROJECT_CONTEXT.md). Não precisa reler esse
histórico para trabalhar nos apps — só ao diagnosticar falha de ambiente
(`abrir-claude.ps1` falhando, MCP `canvas-authoring` não conecta).

Fatos rápidos que valem para qualquer sessão:

- `C:\Users\enio.sales` **não é** um repositório git. Git instalado é o
  MinGit portátil (`%LOCALAPPDATA%\Programs\MinGit`, sem admin).
- 🔴 **Não existe CLI `claude` instalado nesta máquina.** O `claude.exe` usado
  é o **embutido na extensão do VS Code**
  (`~\.vscode\extensions\anthropic.claude-code-<versao>-win32-x64\...`) —
  caminho muda a cada atualização da extensão, não depender dele.
- Conta `SUPPORTE\enio.sales` **sem privilégios de administrador** —
  instalações precisam de caminho fora de `Program Files`, ou acionamento da TI.
- Proxy corporativo com inspeção SSL afeta **só Node/npm** (bundle de CAs
  próprio) — `SELF_SIGNED_CERT_IN_CHAIN` no npm é esperado, não indica pacote
  comprometido. `winget`/`Invoke-WebRequest`/`dotnet`/git usam o cert store do
  Windows e passam sem ajuste.
- 🔴 **IPv6 bloqueado na rede** — DNS devolve AAAA, mas o tráfego IPv6 é
  descartado sem resposta; atinge qualquer processo que tente IPv6 primeiro
  (sintoma: lentidão/timeout, não erro de TLS — eixo diferente do proxy
  acima). Para .NET a correção é `DOTNET_SYSTEM_NET_DISABLEIPV6=1`, já
  embutida no `abrir-claude.ps1`. `pac`/`npm` podem sofrer o mesmo bloqueio.
  Os quatro sintomas de timeout do MCP e como distingui-los: seção "IPv6
  bloqueado na rede" em `progresso-setup-power-apps.md`.
- Drive **C:** já ficou criticamente cheio antes — checar espaço livre antes
  de instalações grandes; nunca apagar nada sem aprovação explícita, item por
  item (ambiente corporativo).
- 🔴 **Sempre abrir o VS Code a partir de um PowerShell**, via
  [`abrir-claude.ps1`](./abrir-claude.ps1) desta pasta — ele força PATH,
  `MCP_TIMEOUT` e `DOTNET_SYSTEM_NET_DISABLEIPV6` no próprio processo, valida
  SDK/dnx/git/code/espaço, e só então abre o VS Code (o painel do Claude Code
  é filho desse processo e herda tudo). `-SomenteVerificar` checa sem abrir
  nada; `-UrlStudio <url>` valida a URL e copia `/configure-canvas-mcp <url>`
  para a área de transferência. **Feche todas as janelas do VS Code antes** —
  com uma instância já aberta, a nova nasce filha da antiga e herda o PATH
  errado.
