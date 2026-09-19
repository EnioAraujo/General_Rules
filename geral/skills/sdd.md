---
name: sdd
description: >
  Ative esta skill quando o usuário pedir para desenvolver uma feature/projeto a partir de uma
  especificação formal, pedir para "criar a spec antes do código", mencionar Spec-Driven
  Development, SDD, spec-kit, ou quando a tarefa for grande/ambígua o suficiente para que codar
  direto arrisque construir a coisa errada. Complementa (não substitui) TDD: SDD define O QUE
  construir e PORQUÊ antes de existir código; TDD garante que a implementação bate com o
  comportamento esperado depois que a spec já existe. Independente de linguagem, stack ou
  ferramenta de IA.
---

# 📐 SKILL: Spec-Driven Development (SDD)

## O que é e por que existe

SDD é a metodologia em que uma **especificação executável e versionada — não o código — é a fonte
de verdade**. Em vez de pedir para a IA inferir intenção a partir de prompts soltos e espalhados
pela conversa, a intenção é definida explicitamente antes de qualquer implementação: requisitos,
cenários, critérios de aceite, restrições e casos de borda vêm primeiro.

Ganhou tração em 2026 porque agentes de IA são muito bons em escrever código e muito ruins em
adivinhar o que a pessoa quis dizer. O gargalo do desenvolvimento sempre foi a clareza do que
construir antes da primeira linha — quando a IA acelera a geração de código sem melhorar a
qualidade da especificação, ela **amplifica** a disfunção existente em vez de corrigi-la.

**SDD complementa TDD, não substitui:** SDD resolve "o que construir e por quê" (a spec).
[TDD](./tdd.md) resolve "como garantir que o código bate com o esperado" (o teste). Um projeto
maduro usa os dois — a spec vira a fonte dos cenários que os testes TDD verificam.

---

## O ciclo (7 fases)

| Fase | Pergunta que responde | Artefato |
|---|---|---|
| **1. Constitution** | Quais princípios e restrições não são negociáveis neste projeto? | Princípios de qualidade, testes, arquitetura — vale para todas as specs futuras |
| **2. Specify** | O quê e por quê? (nunca "com qual stack") | `spec.md` — requisitos, cenários, critérios de aceite |
| **3. Clarify** | O que ficou ambíguo na spec? | Perguntas direcionadas respondidas e incorporadas — nunca prosseguir com ambiguidade assumida |
| **4. Plan** | Como, tecnicamente? | `plan.md` — arquitetura, linguagem/framework, modelo de dados, serviços externos |
| **5. Tasks** | Em que ordem, em unidades executáveis? | `tasks.md` — lista ordenada, cada item implementável de forma independente |
| **6. Implement** | Escrever o código | Código + testes gerados a partir do contexto estruturado nas fases anteriores |
| **7. Validate** | O que foi construído bate com a spec? | Verificação que fecha o loop entre intenção e execução |

**Regra prática:** mais clareza no início normalmente *reduz* o tempo total de entrega — o custo
aparente de "parar para especificar" é menor que o custo de retrabalho por ambiguidade descoberta
tarde. Pilotar com uma feature antes de escalar a metodologia para o projeto inteiro.

**Armadilha central:** especificar demais, cedo demais, sem validação. Uma spec longa e "completa"
escrita antes de qualquer aprendizado prático vira rígida — não se adapta ao que a implementação
ensina. Trate a spec como artefato vivo, não documento estático assinado uma vez.

---

## Três níveis de rigor (escolher conforme o risco da tarefa)

- **Spec-first** — a spec dispara a geração de código, mas não é mantida depois. Adequado para
  experimentos, protótipos, tarefas pequenas. Caminho enxuto: `specify → plan → tasks → implement`.
- **Spec-anchored** — spec e código são mantidos sincronizados ao longo do tempo; mudança no
  comportamento exige atualizar a spec. Adequado para features de produção. Adiciona `clarify`,
  `checklist` e `analyze` como portões de qualidade antes de `implement`.
- **Spec-as-source** — a spec é a fonte que o time edita; o código é tratado como artefato de
  build que ninguém toca diretamente. Nível mais rigoroso, reservado para domínios onde
  rastreabilidade total é obrigatória (regulado, crítico).

Escolher o nível conforme o risco e o tempo de vida esperado da feature — não usar spec-as-source
para um protótipo descartável, nem spec-first para algo que vai virar produção.

---

## Como aplicar nesta sessão (sem uma ferramenta de SDD instalada)

Quando não houver um toolkit de SDD configurado no projeto (GitHub Spec Kit, etc.), reproduzir o
ciclo manualmente:

1. **Antes de codar**, escrever (ou pedir para o usuário revisar) um `spec.md` curto: o quê, por
   quê, critérios de aceite, o que fica fora de escopo. Não incluir stack/tecnologia aqui.
2. **Perguntar o que está ambíguo** antes de prosseguir — não assumir e seguir. Isso é a mesma
   disciplina da regra "não presumir" já coberta em [`boas-praticas-dev`](./boas-praticas-dev.md).
3. Só depois de a spec estar clara, produzir o plano técnico (`plan.md`): arquitetura, decisões de
   stack, modelo de dados.
4. Quebrar o plano em tarefas pequenas e independentes (`tasks.md`) — mesmo princípio de escopo
   pequeno usado em [`tdd`](./tdd.md) e na skill [`critical-dev-surgeon`](./critical-dev-surgeon.md)
   (CRIAR / MODIFICAR / NÃO-TOCAR).
5. Implementar tarefa por tarefa, validando cada uma contra o critério de aceite da spec — não só
   contra "compilou"/"rodou".
6. Ao final, validar o conjunto contra a spec original, não contra a lembrança do que se pretendia
   construir.

---

## Ferramentas do ecossistema (2026)

Toda ferramenta grande de codificação com IA lançou sua própria variante de SDD: GitHub Spec Kit
(pipeline `constitution → specify → clarify → plan → tasks → implement`, com mais de 100 mil
estrelas e integrações em 30+ agentes), AWS Kiro, Cursor, OpenSpec, BMAD, Tessl, Google
Antigravity. Não é necessário adotar uma ferramenta específica para aplicar a metodologia — o
valor está na disciplina do ciclo, não no toolkit.

---

## Quando NÃO vale a pena

- Tarefa trivial de uma linha, ou correção pontual e reversível — o overhead de spec supera o
  ganho. Usar julgamento (mesmo princípio de trade-off de
  [`boas-praticas-dev`](./boas-praticas-dev.md)).
- Exploração genuína de design, onde o objetivo é justamente descobrir o requisito codando —
  nesse caso, prototipar primeiro e escrever a spec depois de haver algo a especificar.

---

## Checklist

- [ ] Existe uma spec (ainda que curta) antes da primeira linha de implementação?
- [ ] A spec descreve comportamento e critério de aceite — não escolhas de tecnologia?
- [ ] Ambiguidades foram perguntadas, não assumidas?
- [ ] O plano técnico só apareceu depois da spec aprovada?
- [ ] As tarefas são pequenas o suficiente para verificar cada uma isoladamente?
- [ ] A validação final compara com a spec escrita, não com a memória da intenção original?
