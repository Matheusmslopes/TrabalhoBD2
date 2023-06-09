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
Values ('alffredo', 'gisep', '48411203422', '1980-10-09', 'Rua do alem,373,Vila Velha, ES','M','00000', '88866555576', 1);
