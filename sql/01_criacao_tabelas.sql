CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) UNIQUE NOT NULL,
	descricao TEXT  
);

CREATE TABLE livros(
 	id SERIAL PRIMARY KEY,
 	titulo VARCHAR(100) NOT NULL,
 	autor  VARCHAR(100) NOT NULL,
 	isbn VARCHAR(20) UNIQUE,
 	ano_publicacao INT CHECK (ano_publicacao > 0 AND ano_publicacao <= EXTRACT(YEAR FROM CURRENT_DATE)),
 	quantidade_total INT DEFAULT 1 CHECK (quantidade_total > 0),
 	quantidade_disponivel INT DEFAULT 1 CHECK (quantidade_disponivel >= 0),
 	categoria_id INT NOT NULL REFERENCES categorias(id) ON DELETE RESTRICT,
 	CONSTRAINT check_disponivel_menor_total CHECK (quantidade_disponivel <= quantidade_total)
);

CREATE TABLE usuarios(
	id SERIAL PRIMARY KEY,
	nome_completo VARCHAR(100) NOT NULL,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	telefone VARCHAR(15),
	data_nascimento DATE NOT NULL CHECK (data_nascimento <= CURRENT_DATE AND data_nascimento >= '1900-01-01'),
	data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE emprestimos(
	id SERIAL PRIMARY KEY,
	livro_id INT NOT NULL REFERENCES livros(id) ON DELETE RESTRICT,
	usuario_id INT NOT NULL REFERENCES usuarios(id) ON DELETE RESTRICT,
	data_emprestimo DATE DEFAULT CURRENT_DATE,
	data_devolucao_prevista DATE NOT NULL,
	data_devolucao_real DATE,
	status VARCHAR(20) DEFAULT 'ativo' CHECK (status IN ('ativo', 'devolvido', 'atrasado')),
	CONSTRAINT check_devolucao_prevista CHECK (data_devolucao_prevista > data_emprestimo),
	CONSTRAINT check_devolucao_real CHECK (
		data_devolucao_real IS NULL OR 
		data_devolucao_real >= data_emprestimo
		)
);

CREATE TABLE multas(
	id SERIAL PRIMARY KEY,
	valor DECIMAL(10, 2) NOT NULL CHECK (valor > 0),
	motivo TEXT,
	pago BOOLEAN DEFAULT FALSE,
	data_geracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	emprestimo_id INT NOT NULL REFERENCES emprestimos(id) ON DELETE RESTRICT
);

CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY,
	nome_completo VARCHAR(100),
	cpf VARCHAR(14) NOT NULL,
	email VARCHAR (100) UNIQUE NOT NULL,
	cargo VARCHAR(50) NOT NULL,
	salario DECIMAL(10, 2) NOT NULL CHECK (salario > 0),
	data_contratacao DATE DEFAULT CURRENT_DATE,
	ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE pagamentos(
	id SERIAL PRIMARY KEY,
	funcionario_id INT NOT NULL REFERENCES funcionarios(id) ON DELETE RESTRICT,
	mes_referencia VARCHAR(7) NOT NULL,
	salario_bruto DECIMAL(10, 2) NOT NULL,
	descontos DECIMAL(10, 2) DEFAULT 0,
	salario_liquido DECIMAL(10, 2) NOT NULL,
	data_pagamento DATE DEFAULT CURRENT_DATE,
	pago BOOLEAN DEFAULT FALSE,
	UNIQUE(funcionario_id, mes_referencia)
);
