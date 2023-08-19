INSERT INTO clientes (cliente_id, nome, rua, numero_casa) VALUES
(1, 'João Silva', 'Rua Valentino', '12'),
(2, 'Maria Souza', 'Rua Cachoeira', '21'),
(3, 'Carlos Santos', 'Rua Pe. Maurício', '212');


INSERT INTO veiculos (veiculo_id, modelo, cor, placa, cliente_id) VALUES
(1, 'Fiat Uno', 'Branco', 'ABCD123', 3),
(2, 'VW Gol', 'Prata', 'WXYZ456', 1),
(3, 'Lamborgui Asterion', 'Azul', 'EFGH789', 2);


INSERT INTO mecanicos (mecanico_id, nome, contato, endereco, especialidade) VALUES
(1, 'Marcos Azevedo', '123-456-7890', 'R Conceição N 224', 'Suspensão e Direção'),
(2, 'Ana Santos', '987-654-3210', 'R Salgueiro Verde 44', 'Motor'),
(3, 'Rogério Oliveira', '555-555-5555', 'R Valadares N 97', 'Mecânico Geral');


INSERT INTO ordens_de_servicos (numero, data_emisao, valor, status, data_conclusao, veiculo_id, mecanico_id) VALUES
(1, '2023-08-01', 350.00, 'EM ANDAMENTO', NULL, 1, 2),
(2, '2023-08-02', 500.00, 'CONCLUIDO', '2023-08-05', 3, 1),
(3, '2023-08-03', 200.00, 'EM ANDAMENTO', NULL, 2, 3);


INSERT INTO servicos (servicos_id, descricao, valor) VALUES
(1, 'Troca de óleo', 50.00),
(2, 'Troca de pneus', 100.00),
(3, 'Reparo no motor', 200.00);


INSERT INTO itens_servico (ordens_de_servicos_numero, servico_id) VALUES
(2, 2),
(1, 3),
(3, 1);


INSERT INTO pecas (peca_id, descricao, valor) VALUES
(1, 'Filtro de óleo', 10.00),
(2, 'Pneu aro 15', 50.00),
(3, 'Vela de ignição', 5.00);

