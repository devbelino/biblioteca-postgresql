📚 Sistema de Biblioteca – PostgreSQL

Projeto de banco de dados relacional desenvolvido para simular o funcionamento de uma biblioteca, com foco em modelagem conceitual, lógica e física, utilizando PostgreSQL.

O projeto foi criado como prática de estudos em Banco de Dados, aplicando regras de negócio reais, integridade referencial e procedimentos armazenados.

---

🎯 Objetivo do Projeto

Aplicar conceitos fundamentais e intermediários de banco de dados relacional, incluindo:
- Modelagem no BRModelo
- Normalização
- Regras de negócio no próprio banco
- Uso de constraints e procedures
- Organização e documentação de um projeto SQL

---

🧩 Modelagem de Dados

O banco foi modelado inicialmente no **BRModelo**, separando corretamente:
- Modelo conceitual
- Modelo lógico
- Modelo físico

Principais entidades:
- Categorias
- Livros
- Usuários
- Empréstimos
- Multas
- Funcionários
- Pagamentos

Os relacionamentos possuem cardinalidades bem definidas, garantindo coerência com as regras de negócio da biblioteca.

---

🛠️ Tecnologias Utilizadas

- PostgreSQL
- PL/pgSQL
- BRModelo
- Git e GitHub

---

⚙️ Funcionalidades Implementadas

- Cadastro de livros e categorias
- Cadastro de usuários
- Controle de empréstimos e devoluções
- Geração de multas por atraso
- Controle de funcionários
- Processamento de pagamentos mensais
- Cálculo automático de salário líquido via procedure

---

📂 Estrutura do Repositório

biblioteca-postgresql/
│
├── sql/
│ ├── 01_criacao_tabelas.sql
│ ├── 02_procedure_pagamentos.sql
│ ├── 03_inserts_teste.sql
│ └── 04_consultas_exemplo.sql
│
├── diagramas/
│ ├── modelo-conceitual.brmodelo
│ └── modelo-conceitual.png
│
├── docs/
│ ├── regras_de_negocio.md
│ └── dicionario_de_dados.md
│
└── README.md
