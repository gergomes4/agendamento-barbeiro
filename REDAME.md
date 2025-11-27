# Sistema de Agendamento para Barbearia — Banco de Dados MySQL

Repositório contendo o script SQL completo (DDL, DML, SELECT, UPDATE, DELETE) para o projeto acadêmico de banco de dados do Sistema de Agendamentos da Barbearia Estilo Livre.

## 🧱 Tecnologias
- MySQL
- MySQL Workbench

## 📦 Conteúdo
Este repositório contém um único arquivo completo:

- **script.sql**  
  Contém:
  - Criação do banco e tabelas (DDL)
  - Inserts das tabelas principais
  - Consultas SELECT
  - Comandos UPDATE
  - Comandos DELETE

## 🚀 Instruções de uso — MySQL Workbench

1. Abra o Workbench
2. Clique em **New Query Tab**
3. Cole TODO o conteúdo do `script.sql`
4. Clique em **⚡ Execute**
5. No menu lateral (Schemas), abra o banco **barbearia**
6. Clique nas tabelas → **Select Rows** para visualizar os dados

## 📂 Estrutura das tabelas

- **cliente** (id_cliente, nome, telefone, email)  
- **barbeiro** (id_barbeiro, nome, especialidade)  
- **servico** (id_servico, nome_servico, duracao_minutos, preco)  
- **agendamento** (FK cliente, barbeiro, servico + data + horário)  
- **historico_atendimento** (FK agendamento)  
- **pagamento** (FK agendamento)