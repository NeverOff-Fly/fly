# Memória e Documentação do Projeto: Fly 🦋

Este documento serve como a **"memória central"** do projeto. Se você é um novo desenvolvedor (ou uma IA assistente) chegando agora no projeto, leia este arquivo para entender o contexto, a arquitetura e as regras de colaboração.

## 1. O que é o projeto?
**Fly** é uma loja de roupas com foco em oferecer uma experiência premium, dinâmica e com design moderno.

## 2. Arquitetura e Integrações
O modelo de negócios envolve a plataforma **Montink** (Print on Demand - impressão sob demanda).
Como a Montink não possui uma API pública direta para criar lojas customizadas em Next.js, nós adotamos uma arquitetura de **Headless E-commerce**:

* **Backend / Motor de Vendas:** **Yampi** (Plataforma gratuita sem mensalidade, que possui integração oficial com a Montink). A Yampi cuidará do checkout, produtos e comunicação com a estamparia da Montink.
* **Frontend / Nossa Interface:** Construído do zero usando **Next.js + React**. Ficará hospedado gratuitamente na **Vercel**.
* **Comunicação:** O nosso código frontend (este repositório) fará requisições para a API REST da Yampi para resgatar os produtos e montar o catálogo na tela.

## 3. Stack Tecnológico
* **Framework:** Next.js (App Router)
* **Linguagem:** TypeScript
* **Estilização:** CSS Vanilla (Módulos CSS) para garantir máxima customização e atingir o nível "premium" de design exigido. Não estamos usando TailwindCSS por padrão, a não ser que haja uma mudança na diretriz arquitetural.

## 4. Como rodar o projeto localmente
Para trabalhar neste projeto na sua máquina:
1. Clone o repositório do GitHub.
2. Certifique-se de ter o Node.js instalado.
3. Abra o terminal na pasta raiz e instale os pacotes:
   ```bash
   npm install
   ```
4. Inicie o servidor de desenvolvimento:
   ```bash
   npm run dev
   ```
5. Acesse `http://localhost:3000`.

## 5. Fluxo de Trabalho (Git Workflow)
Temos mais de uma pessoa trabalhando no repositório, portanto **não deve-se comitar diretamente na branch `main`**. Siga a regra abaixo para evitar problemas e conflitos:

1. **Atualize sua máquina:** Antes de começar o dia, rode `git pull origin main`.
2. **Crie uma ramificação (branch):** Para cada nova tarefa/feature, crie uma branch isolada:
   ```bash
   git checkout -b feature-nome-da-sua-tarefa
   ```
3. **Trabalhe e salve:**
   ```bash
   git add .
   git commit -m "feat: descrição curta do que você fez"
   ```
4. **Envie para nuvem:**
   ```bash
   git push -u origin feature-nome-da-sua-tarefa
   ```
5. **Mesclar (Merge):** Vá no repositório do GitHub, abra um **Pull Request (PR)** e, se tudo estiver certo e não houver conflitos com o trabalho de outro membro, realize o **Merge** para a `main`.

---
*Última atualização: Junho de 2026 - Estrutura base inicializada.*
