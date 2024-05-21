CREATE TABLE tb_categoria(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(20) NOT NULL
);

CREATE TABLE tb_atividade(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	descricao VARCHAR(40),
	preco FLOAT,
	categoria_id INT NOT NULL,
	FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_bloco(
	id SERIAL PRIMARY KEY,
	inicio TIMESTAMP,
	fim TIMESTAMP,
	atividade_id INT NOT NULL,
	FOREIGN KEY(atividade_id) REFERENCES tb_atividade(id)
);

CREATE TABLE tb_participante(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	email VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE tb_participacao(
	participante_id INT,
	atividade_id INT,
	FOREIGN KEY(participante_id) REFERENCES tb_participante(id),
	FOREIGN KEY(atividade_id) REFERENCES tb_atividade(id)
);