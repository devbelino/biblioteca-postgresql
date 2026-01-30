CREATE OR REPLACE PROCEDURE realizar_pagamento(
    p_funcionario_id INT,
    p_mes_referencia VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_salario DECIMAL(10,2);
    v_descontos DECIMAL(10,2);
    v_liquido DECIMAL(10,2);
BEGIN
    SELECT salario INTO v_salario
    FROM funcionarios
    WHERE id = p_funcionario_id AND ativo = TRUE;
    
    IF v_salario IS NULL THEN
        RAISE EXCEPTION 'Funcionário não encontrado ou inativo';
    END IF;

    v_descontos := v_salario * 0.18;
    v_liquido := v_salario - v_descontos;

    INSERT INTO pagamentos (funcionario_id, mes_referencia, salario_bruto, descontos, salario_liquido, pago)
    VALUES (p_funcionario_id, p_mes_referencia, v_salario, v_descontos, v_liquido, TRUE);
    
	RAISE NOTICE 'Pagamento realizado! Líquido: R$ %', v_liquido;
END;
$$;
