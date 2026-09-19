---
name: tdd
description: >
  Ative esta skill sempre que o usuário pedir para escrever código com TDD, criar testes antes da
  implementação, ou pedir para identificar verbosidade/over-engineering/dívida técnica em código
  existente. Cobre o ciclo Red-Green-Refactor, a divisão de trabalho humano/IA no TDD assistido por
  agente, e um checklist de varredura de dívida técnica. Independente de linguagem ou stack.
---

# ✅ SKILL: Como Aplicar TDD (Test-Driven Development)

## 🎯 Objetivo da Skill

Ensinar como aplicar TDD de forma simples, repetível e eficaz, garantindo código seguro,
refatoração fácil e evolução contínua — inclusive com IA como copiloto ou como agente autônomo.

---

## 1. Ciclo Fundamental do TDD (Red → Green → Refactor)

### 1️⃣ RED – Escreva um teste que falha

- Defina o comportamento desejado antes do código.
- Escreva o teste mais simples possível.
- Rode o teste e confirme que **falha** (e falha pelo motivo certo — não por erro de sintaxe).

```ruby
def test_soma_basica
  assert_equal 4, soma(2, 2)
end
```

### 2️⃣ GREEN – Escreva o código mínimo para passar o teste

```ruby
def soma(a, b)
  a + b
end
```

### 3️⃣ REFACTOR – Melhore o código mantendo os testes verdes

- Limpe nomes, extraia métodos, remova duplicações.
- Garanta que todos os testes continuam passando.

---

## 2. TDD com agente de IA — divisão de trabalho (2026)

Com agentes que escrevem código de ponta a ponta, o risco central do TDD assistido por IA é um
padrão específico: **o agente escreve a implementação e, na sequência, gera testes que só
confirmam o que aquele código já faz.** Esses testes passam por construção — não porque validam o
requisito, mas porque foram moldados para bater com o que já foi escrito. Sem controle explícito
disso, a maioria dos agentes pula a fase Red inteira.

**Regra de ouro:** você é dono da especificação (o teste), o agente é dono da implementação — e
essa divisão não pode ser invertida.

- **Escreva (ou revise a fundo) o teste RED antes de pedir a implementação ao agente.** Se o
  agente sugerir o teste, leia-o com o mesmo rigor de uma revisão de código — ele precisa expressar
  o requisito, não o comportamento que o agente já tem em mente para a implementação.
- **Nunca aceitar teste e implementação gerados na mesma resposta como TDD.** Isso é escrever
  código e depois documentar o que ele faz — não validar o que ele deveria fazer.
- **Onde a IA rende mais:** montagem mecânica de teste — boilerplate de setup, mocks, fixtures,
  hooks. É trabalho tedioso que a IA resolve rápido e sem risco, porque não define o requisito, só
  o andaime em torno dele.
- **Trabalhe um comportamento por vez.** Um cenário, uma saída esperada, um exemplo — não uma
  feature inteira de uma vez. Escopo pequeno é o que torna o RED verificável e o GREEN mínimo de
  verdade.
- **Peça ao agente para rodar o teste e mostrar a falha antes de implementar.** Confirmar o Red é o
  que garante que o teste testa algo real (evita teste que "passa sempre").

---

## 3. Princípios Estratégicos

- **Comece sempre pelo comportamento externo.** Pergunte "o que precisa acontecer?" → transforme
  em teste.
- **Testes pequenos e focados.** Um teste deve validar um único comportamento.
- **Requisitos claros favorecem TDD.** TDD rende mais quando objetivo e critério de sucesso estão
  bem definidos desde o início — critério fraco ("faz funcionar") gera loop de esclarecimento em
  vez de loop de verificação.
- **Confie nos testes para evoluir o design.** O design emerge conforme os testes exigem — não o
  contrário.

---

## 4. Tipos essenciais de testes no TDD

- **Testes de unidade** — focados em funções e regras isoladas.
- **Testes de integração** — garantem que múltiplas partes trabalham juntas.
- **Testes contra regressão** — encontrou um bug? Escreva um teste que o reproduza **antes** da
  correção.

---

## 5. Fluxo prático recomendado

1. Defina o micro-objetivo (um comportamento).
2. Escreva o teste → confirme que falha, e pelo motivo certo.
3. Escreva (ou peça ao agente) o código mínimo para passar.
4. Execute os testes → tudo verde.
5. Refatore com segurança.
6. Verifique se o teste comunica o comportamento correto — um teste ilegível não documenta nada.

---

## 6. Checklist da Skill

- [ ] Escrevi (ou revisei) o teste antes da implementação?
- [ ] O teste falhou primeiro, pelo motivo certo?
- [ ] A implementação foi o mínimo para passar?
- [ ] Refatorei com os testes verdes?
- [ ] Evitei código sem propósito?
- [ ] O teste explica o comportamento, não a implementação?
- [ ] Se a IA gerou o teste: ele expressa o requisito, ou só confirma o código que ela mesma já
      tinha em mente?
- [ ] Commit está production-ready?

---

## 7. Identificação de Verbosidade e Over-Engineering

Antes de refatorar, é preciso saber **o que merece refatoração**. Esta seção complementa o ciclo
TDD com um protocolo de varredura de dívida técnica.

### Padrões de alerta

1. **Lógica duplicada** — o mesmo bloco de código (diff, validação, formatação) aparece em dois ou
   mais lugares com mínimas variações.
2. **Dependências mortas** — biblioteca instalada e configurada, mas sem nenhum ponto de uso real
   no projeto (ex.: `QueryClientProvider` sem `useQuery`).
3. **Wrappers desnecessários** — componente que apenas re-renderiza um filho sem acrescentar lógica
   (ex.: `<G cols={1}>`).
4. **Estilos inline repetidos** — o mesmo objeto de estilo com 4+ atributos copiado em 10+ lugares;
   candidato a constante ou classe utilitária.
5. **Arquivo monolítico** — arquivo único com +1000 linhas misturando hooks, UI, componentes e
   lógica de negócio; impossível testar unidades isoladas.

### Checklist diagnóstico

Faça estas perguntas antes de qualquer refatoração:

- [ ] Essa dependência é **realmente usada** em algum ponto do código?
- [ ] Esse bloco de código **existe em mais de um lugar** com mínimas variações?
- [ ] Esse wrapper/componente **acrescenta algo** além de passar props adiante?
- [ ] Esse estilo inline tem **4+ atributos** e está repetido **5+ vezes**?
- [ ] Esse arquivo tem **+1000 linhas** misturando responsabilidades distintas?
- [ ] Ao escrever o teste desta função, precisei importar **coisas demais** do mesmo arquivo? (sinal
      de acoplamento excessivo)

### Fluxo recomendado

1. **Identificar** o problema usando o checklist acima.
2. **Registrar** no arquivo de contexto/histórico do projeto (ex.: `CONTEXT.md`, `CHANGELOG.md`) —
   antes de qualquer alteração, não depois.
3. **Escrever o teste** que valida o comportamento atual (fase Red do TDD).
4. **Refatorar** mantendo o teste verde (fase Refactor do TDD).
5. **Confirmar** que a suíte de testes completa continua passando — não só o teste novo.
6. **Commitar** como `refactor(escopo): descrição` e atualizar o histórico do projeto.

---

## Conclusão

TDD não é sobre testes. É sobre **mudar código com segurança e rapidez**. Com IA no loop, o ganho
só se mantém se a divisão de trabalho for respeitada: humano define o requisito (teste), agente
implementa contra ele — nunca os dois ao mesmo tempo.
