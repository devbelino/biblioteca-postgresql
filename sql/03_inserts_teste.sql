INSERT INTO usuarios (id, nome, cpf, email, telefone, data_nascimento) VALUES
	(4, 'Bruno Belino Ferreira', '106.279.432-00', 'brunobelino@gmail.com', '(81) 98888-1111', '2005-07-05');

INSERT INTO livros (titulo, autor, isbn, ano_publicacao, quantidade_total, quantidade_disponivel, categoria_id) VALUES
('1984', 'George Orwell', '978-0451524935', 1949, 3, 2, 1),
('Clean Code', 'Robert C. Martin', '978-0132350884', 2008, 5, 3, 2),
('O Senhor dos Anéis', 'J.R.R. Tolkien', '978-0544003415', 1954, 4, 3, 1),
('Dom Casmurro', 'Machado de Assis', '978-8535911664', 1899, 2, 1, 1),
('Sapiens', 'Yuval Noah Harari', '978-0062316097', 2011, 4, 2, 1),
('Harry Potter', 'J.K. Rowling', '978-0439708180', 1997, 6, 5, 1);

INSERT INTO funcionarios (nome_completo, cpf, email, cargo, salario, data_contratacao) VALUES
('Carlos Eduardo Santos', '100.200.300-40', 'carlos.santos@biblioteca.com', 'Gerente', 4500.00, '2020-03-15'),
('Juliana Oliveira Lima', '200.300.400-50', 'juliana.lima@biblioteca.com', 'Bibliotecária Sênior', 3800.00, '2021-06-10'),
('Roberto Ferreira Costa', '300.400.500-60', 'roberto.costa@biblioteca.com', 'Bibliotecário', 3200.00, '2022-01-20'),
('Patrícia Almeida Souza', '400.500.600-70', 'patricia.souza@biblioteca.com', 'Atendente', 2500.00, '2022-08-05'),
('Fernando Silva Martins', '500.600.700-80', 'fernando.martins@biblioteca.com', 'Atendente', 2500.00, '2023-02-14'),
('Mariana Costa Ribeiro', '600.700.800-90', 'mariana.ribeiro@biblioteca.com', 'Auxiliar Administrativo', 2200.00, '2023-05-20'),
('Bruno Henrique Dias', '700.800.900-00', 'bruno.dias@biblioteca.com', 'Técnico de Acervo', 2800.00, '2023-09-10'),
('Amanda Cristina Rocha', '800.900.000-10', 'amanda.rocha@biblioteca.com', 'Estagiária', 1500.00, '2024-01-15');

-- Pagamentos de Novembro/2025
INSERT INTO pagamentos (funcionario_id, mes_referencia, salario_bruto, descontos, salario_liquido, pago) VALUES
(1, '11/2025', 4500.00, 810.00, 3690.00, TRUE),
(2, '11/2025', 3800.00, 684.00, 3116.00, TRUE),
(3, '11/2025', 3200.00, 576.00, 2624.00, TRUE),
(4, '11/2025', 2500.00, 450.00, 2050.00, TRUE),
(5, '11/2025', 2500.00, 450.00, 2050.00, TRUE),
(6, '11/2025', 2200.00, 396.00, 1804.00, TRUE),
(7, '11/2025', 2800.00, 504.00, 2296.00, TRUE),
(8, '11/2025', 1500.00, 270.00, 1230.00, TRUE);

-- Pagamentos de Dezembro/2025
INSERT INTO pagamentos (funcionario_id, mes_referencia, salario_bruto, descontos, salario_liquido, pago) VALUES
(1, '12/2025', 4500.00, 810.00, 3690.00, TRUE),
(2, '12/2025', 3800.00, 684.00, 3116.00, TRUE),
(3, '12/2025', 3200.00, 576.00, 2624.00, TRUE),
(4, '12/2025', 2500.00, 450.00, 2050.00, TRUE),
(5, '12/2025', 2500.00, 450.00, 2050.00, TRUE),
(6, '12/2025', 2200.00, 396.00, 1804.00, TRUE),
(7, '12/2025', 2800.00, 504.00, 2296.00, TRUE),
(8, '12/2025', 1500.00, 270.00, 1230.00, TRUE);

-- Pagamentos de Janeiro/2026 (alguns pendentes)
INSERT INTO pagamentos (funcionario_id, mes_referencia, salario_bruto, descontos, salario_liquido, pago) VALUES
(1, '01/2026', 4500.00, 810.00, 3690.00, TRUE),
(2, '01/2026', 3800.00, 684.00, 3116.00, TRUE),
(3, '01/2026', 3200.00, 576.00, 2624.00, FALSE),
(4, '01/2026', 2500.00, 450.00, 2050.00, FALSE),
(5, '01/2026', 2500.00, 450.00, 2050.00, FALSE),
(6, '01/2026', 2200.00, 396.00, 1804.00, FALSE),
(7, '01/2026', 2800.00, 504.00, 2296.00, FALSE),
(8, '01/2026', 1500.00, 270.00, 1230.00, FALSE);

-- Empréstimos que vencem em 1, 2 e 3 dias
INSERT INTO emprestimos (livro_id, usuario_id, data_emprestimo, data_devolucao_prevista, status) VALUES
(1, 1, CURRENT_DATE - 10, CURRENT_DATE + 1, 'ativo'),  
(1, 2, CURRENT_DATE - 11, CURRENT_DATE + 2, 'ativo'),  
(1, 3, CURRENT_DATE - 12, CURRENT_DATE + 3, 'ativo'), 
(1, 4, CURRENT_DATE - 13, CURRENT_DATE, 'ativo'); 
