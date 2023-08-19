use oficina;

-- Qual o modelo de veículo de cada cliente
select c.nome, v.modelo as 'modelo_carro' , v.cor
from clientes c
inner join veiculos v
on c.cliente_id = v.cliente_id;

-- Quais são as ordens de servico para cada veiculo
select v.modelo as 'carro', s.descricao as 'servico'
from servicos s inner join itens_servico i
on s.servicos_id = i.servico_id
inner join ordens_de_servicos os
on i.ordens_de_servicos_numero = os.numero
inner join veiculos v
on v.veiculo_id = os.veiculo_id;

-- Quais mecanicos já concluíram seus servicos
select m.nome, count(os.status) as total_concluidos
from ordens_de_servicos os
inner join mecanicos m on m.mecanico_id = os.mecanico_id
where os.status = 'CONCLUIDO'
group by m.nome;
