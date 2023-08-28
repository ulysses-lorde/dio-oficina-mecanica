UPDATE ordens_servicos
SET valor_total = (
    SELECT COALESCE(SUM(s.valor), 0) + COALESCE(SUM(p.valor), 0)
    FROM os_servico oss
    LEFT JOIN servicos s ON oss.id_servico = s.id_servico
    LEFT JOIN os_peca op ON oss.id_os = op.numero_os
    LEFT JOIN pecas p ON op.id_peca = p.id_peca
    WHERE oss.numero_os = ordens_servicos.numero_os
)
WHERE numero_os = 1; -- Numero da ordem de serviço
