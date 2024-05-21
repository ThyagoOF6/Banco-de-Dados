CREATE TABLE tb_departamento (
    id int8, 
    nome varchar(100), 
    PRIMARY KEY (id)
);

CREATE TABLE tb_empregado (
    id int8, 
    nome varchar(100), 
    dept_id int8,
    PRIMARY KEY (id),
    FOREIGN KEY (dept_id) REFERENCES tb_departamento
);

INSERT INTO tb_departamento (id, nome) VALUES (1, 'Financeiro');
INSERT INTO tb_departamento (id, nome) VALUES (2, 'Recursos Humanos');
INSERT INTO tb_departamento (id, nome) VALUES (3, 'Comercial');

INSERT INTO tb_empregado (id, nome, dept_id) VALUES (1, 'Maria', 1);
INSERT INTO tb_empregado (id, nome, dept_id) VALUES (2, 'João', 2);
INSERT INTO tb_empregado (id, nome, dept_id) VALUES (3, 'Ana', 1);
INSERT INTO tb_empregado (id, nome, dept_id) VALUES (4, 'Carlos', null);

SELECT *
FROM tb_empregado
INNER JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id

SELECT * 
FROM tb_empregado
LEFT OUTER JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id

SELECT *
FROM tb_empregado
RIGHT OUTER JOIN tb_departamento ON  tb_empregado.dept_id = tb_departamento.id

SELECT *
FROM tb_empregado
FULL OUTER JOIN tb_departamento ON tb_empregado.dept_id = tb_departamento.id