# Regras gerais de trabalho

Valem para **qualquer projeto** que aponte para este repositório, independente de plataforma,
linguagem ou ferramenta. Regras de categoria (`categorias/<nome>/`) complementam estas — nunca as
substituem, exceto se o `CLAUDE.md` do projeto sobrescrever algo explicitamente.

## 1. REGRA LIVE — estado real antes de qualquer ação

Antes de qualquer edição, consulta ou deploy, extrair/ler o código ou conteúdo ativo/vivo primeiro
(do sistema real, não de memória ou suposição), para preservar alterações manuais do usuário ou
feitas por outras IAs. Nunca reconstruir de memória o que pode ser lido agora.

## 2. Proibido editar em pedidos de leitura

Quando o usuário pedir apenas para "Verificar", "Avaliar", "Identificar", ou fizer uma pergunta, a
resposta deve ser somente análise/informação. Nenhuma edição de arquivo é permitida nesses casos,
mesmo que um problema óbvio seja encontrado — apenas reportar.

## 3. Análise em cadeia completa

Toda análise de código/configuração deve cobrir a cadeia relacionada por inteiro: verificar se
consultas, chamadas ou dependências com ligação direta ou indireta serão afetadas pelas alterações
propostas, antes de concluir.

## 4. REGRA MASTER — sigilo de credenciais e dados sensíveis

Cuidado extremo para nunca expor senhas, IPs, credenciais, tokens ou chaves em texto claro no chat
ou em arquivos deste tipo de repositório (especialmente se o repositório for público). Sempre
mascarar ou usar placeholders. O mesmo cuidado vale para nomes de cliente, empresa, domínio interno
e outros dados de negócio sensíveis quando o destino for um repositório público — generalizar em
vez de hardcodar. Ver também as instruções organizacionais de sigilo/LGPD já vigentes.

## 5. Update de arquivos de documentação — só quando pedido

Atualizar os arquivos de documentação do workspace **somente quando o usuário pedir**. Não
atualizar por iniciativa própria ao fim de uma tarefa.
**Exceção única:** se uma tarefa já em andamento deixou um documento **incoerente consigo mesmo**
(meio atualizado), terminar de deixá-lo coerente e avisar — um handoff contraditório engana mais
do que um desatualizado.

## 6. Execução e verificação

- **Ponto de retorno antes de alterar.** Confirmar que existe alguma forma de reverter a mudança
  (git, controle de versão, histórico de versões de uma biblioteca sincronizada, etc.). Onde não
  houver nenhum mecanismo de reversão, gerar cópia datada antes de alterar.
- **Sempre conferir a conexão com o ambiente antes de agir.** Uma ferramenta responder sem erro não
  prova que ela está falando com o ambiente/sessão certo. Confirmar explicitamente contra qual
  ambiente, sessão ou URL a ação vai valer — não assumir. (Lição já paga em projeto anterior de
  Power Apps: compilação sem erro não impedia o conteúdo de reverter sozinho, porque a checagem do
  resultado usava uma URL diferente da que sustentava a sessão viva — sintoma de ambiente errado,
  não de ferramenta quebrada.)
- **Aguardar o assíncrono terminar.** Instalação, build, refresh, job em fila: esperar a conclusão
  real antes de ler o resultado e concluir. Ler estado intermediário produz conclusão falsa.
- **Revisão real, não resumo.** Ao final, reler o artefato como ele ficou e conferir no sistema
  real — nunca substituir verificação por um resumo do que se acha que foi feito.
- **Em mudanças não triviais, explicitar CRIAR / MODIFICAR / NÃO-TOCAR.** O "não-tocar" é o que
  delimita o blast radius.

> Complementa a skill [`critical-dev-surgeon`](./skills/critical-dev-surgeon.md), que cobre o mesmo
> terreno em profundidade quando dispara. Estes itens valem **sempre**, não só quando ela dispara.

## 7. Conferência final obrigatória

**Antes de finalizar qualquer turno, verificar TUDO que foi criado ou alterado nele.** Diferente da
"revisão real" da regra 6, que fala do artefato principal: aqui a varredura é sobre **o turno
inteiro**, item por item, inclusive o que parece acessório — arquivos criados, arquivos editados,
docs atualizados, arquivos que deveriam ter sido apagados, numeração e ordem de seções, links
relativos, e o resultado no sistema real (servidor, ambiente, build).

- Listar o que foi tocado no turno e conferir **cada item**, sem exceção.
- A verificação é feita **lendo o estado final de verdade**, nunca lembrando do que se acha que foi
  escrito.
- **Conferir também as DECISÕES contra as especificações registradas**, não só os arquivos. Uma
  resposta de estranhamento do usuário a uma pergunta **não é**, por si só, cancelamento de escopo —
  em dúvida, a especificação escrita vale mais que a leitura da conversa.
- **Afirmação sobre dados exige ler a fonte.** Nunca concluir nada sobre o conteúdo dos dados
  (duplicata, valor errado, campo vazio) a partir de print ou memória — abrir o arquivo/consulta de
  origem e contar.
- Só depois disso escrever o resumo para o usuário — e o resumo reporta o que a conferência
  mostrou, não a intenção.

## 8. Seja menos verborrágico, não seja prolixo

Respostas direto ao ponto. Sem repetir o que já foi dito, sem explicação didática de
fórmula/conceito a menos que pedido, sem seção de "resumo" atrás de resumo. Reportar o que foi
feito e o essencial pra decidir o próximo passo — nada além disso.
