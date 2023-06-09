-- A criação de índices pode melhorar o desempenho das consultas, mas também pode aumentar o tempo de inserção, atualização e exclusão de registros, pois os índices precisam ser atualizados -- 

-- Exemplos de algumas otimizações que podem ser usadas quem melhoram a velocidade de consultas na tabela funcionario --
CREATE INDEX idx_numero_departamento ON funcionario (numero_departamento);
CREATE INDEX idx_cpf_supervisor ON funcionario (cpf_supervisor);
CREATE INDEX idx_salario ON funcionario (salario);

-- Exemplos de algumas otimizações que podem ser usadas quem melhoram a velocidade de consultas na tabela Projeto --
CREATE INDEX idx_numero_departamento ON projeto (numero_departamento);
CREATE INDEX idx_nome_projeto ON projeto (nome_projeto);
CREATE INDEX idx_local_projeto ON projeto (local_projeto);




-- quando um funcionario novo for adicionado, se seu departamento for = 1, seu salario base vai ser 15000 --
DELIMITER //
CREATE TRIGGER definir_salario
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
    IF NEW.numero_departamento = 1 THEN
        SET NEW.salario = 15000;
    END IF;
END //
DELIMITER ;

INSERT INTO funcionario(primeiro_nome, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento )  
Values ('ze', 'ninguem', '48411203422', '1980-10-09', 'Rua do alem,373,Vila Velha, ES','M','00000', '88866555576', 1);
