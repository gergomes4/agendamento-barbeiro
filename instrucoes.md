## 🚀 Como Executar no MySQL Workbench

### 1️⃣ Baixe o arquivo **agendamento-barbearia.sql**

### 2️⃣ Abra o MySQL Workbench  
Menu → File → Open SQL Script

### 3️⃣ Clique no botão ⚡ "Run"

Isso irá:

✔ Criar o banco  
✔ Criar todas as tabelas  
✔ Inserir os dados  
✔ Criar consultas  
✔ Executar UPDATE e DELETE  

---

## 📊 Estrutura das Tabelas
- **cliente** → dados dos clientes  
- **barbeiro** → dados dos barbeiros  
- **servico** → serviços oferecidos  
- **agendamento** → relaciona cliente + barbeiro + serviço + horário  

Com todas as chaves primárias e estrangeiras.

---

## 🔍 Consultas Disponíveis
O script inclui SELECTs com:

- JOIN  
- WHERE  
- ORDER BY  
- LIMIT  
- Filtros por cliente  
- Listagem de agendamentos completos  

---

## ✏️ Comandos de Atualização e Exclusão
Inclui:

- 3 comandos **UPDATE**  
- 3 comandos **DELETE**  

Todos com condições para evitar perda acidental de dados.

---

## 🧩 Modelo Utilizado
Usa relacionamentos diretos:

- Cliente 1:N Agendamentos  
- Barbeiro 1:N Agendamentos  
- Serviço 1:N Agendamentos  

---