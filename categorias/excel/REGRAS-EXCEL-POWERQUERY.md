# Regras: Excel com Power Query embutido

Metodologia para planilhas Excel que usam Power Query (M) como camada de transformação, com
`ListObject` (Tabela nomeada) como camada de apresentação. Complementa a skill
[`critical-dev-surgeon`](../../geral/skills/critical-dev-surgeon.md) e a
[`REGRA LIVE`](../../geral/REGRAS-GERAIS.md) com o que é específico deste ambiente.

## Fonte de verdade: a query viva, não a skill/arquivo

Antes de propor qualquer mudança, extrair o estado vivo: ler o código M atual de todas as queries
relevantes (`.Formula`) e inspecionar a estrutura das Tabelas nomeadas (`ListObject`) e das abas.
Isso substitui a leitura de documentação/skills como fonte de verdade — aqui quem manda é a query
viva + o `ListObject`, não cache nem resumo anterior.

## Ao planejar

- O plano deve listar: queries/tabelas a **CRIAR**, queries/passos a **MODIFICAR** e
  queries/tabelas/abas que **NÃO devem ser tocadas**.
- Cada etapa com escopo claro e independente: aplicável sem quebrar a cadeia de refresh das
  demais queries.
- Sem refatorações fora de escopo no plano.
- Finalizar com: queries/tabelas/conexões impactadas, dependências de refresh (quais queries
  consomem a alterada) e riscos críticos (ex.: colisão de chave, quebra de tipo, perda de dado na
  aba).

## Respeitar a arquitetura existente

- Cada query com responsabilidade única — não empilhar transformações não relacionadas num único
  `let` gigante.
- Separar camada de transformação (queries) da camada de apresentação (`ListObject`/planilha,
  incluindo faixas por linha de negócio) — nunca colocar cálculo de negócio em célula da aba que
  pertence à query.
- Merge+expand no padrão de passo nomeado (`let origem = NestedJoin(...), expansao =
  ExpandTableColumn(...) in expansao`).
- Trabalhar sempre pela Tabela nomeada, nunca no intervalo bruto de células.
- Divisão por complexidade: se uma query acumular mais de uma responsabilidade ou o `let` ficar
  longo demais para leitura, propor quebra em queries intermediárias (ex.: `BASE` → `+ESTOQUE` →
  `+LINHA_B` → `+ADICIONAL`).

## Rastreabilidade sem git

Como normalmente não há versionamento nesse ambiente: antes de mudar, gerar cópia datada do
arquivo e registrar o que a query fazia; conferir alterações manuais recentes do usuário (via
estado vivo) para não conflitar.

## Ao implementar

- Alterar ou criar **somente** as queries, passos ou tabelas necessárias para a tarefa. Não tocar
  em query/aba/`ListObject` fora do escopo.
- Aplicar sempre via Tabela nomeada / código M — nunca no intervalo bruto de células.
- Antes de escrever: extrair o `.Formula` vivo da(s) query(ies) alvo para partir do estado real
  (preserva edição manual).
- Depois de aplicar: acionar o refresh e **aguardar de fato** o motor terminar — refresh do Power
  Query é assíncrono, não ler o resultado antes de concluir.
- Ao final, revisar de verdade, não resumir: extrair novamente o código M da(s) query(ies)
  alterada(s) e ler linha a linha; conferir na Tabela nomeada o refresh sem erro, a contagem de
  linhas/colunas e uma amostra dos dados. Corrigir se necessário.
