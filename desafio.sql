CREATE TABLE tb_regiao
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR NOT NULL,
	localidade_s FLOAT NOT NULL,
	localidade_w FLOAT NOT NULL,
	descricao VARCHAR(20)
);

CREATE TABLE tb_vinicola
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	descricao VARCHAR(40),
	fone VARCHAR(12),
	email VARCHAR(20),
	regiao_id INT NOT NULL,
	FOREIGN KEY(regiao_id) REFERENCES tb_regiao(id)
);

CREATE TABLE tb_tipo_vinho
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL
);

CREATE TABLE tb_vinho
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	tipo_id INT NOT NULL,
	preco FLOAT,
	vinicola_id INT NOT NULL,
	FOREIGN KEY(tipo_id) REFERENCES tb_tipo_vinho(id),
	FOREIGN KEY(vinicola_id) REFERENCES tb_vinicola(id)
);

INSERT INTO tb_regiao(nome, localidade_s, localidade_w, descricao) VALUES('Vale Central', 33.8088, 70.7644, 'Chile');
INSERT INTO tb_regiao(nome, localidade_s, localidade_w, descricao) VALUES('Serra Gaúcha', 29.3746, 50.8764, 'Sul do Brasil');

ALTER TABLE tb_vinicola ALTER COLUMN descricao TYPE VARCHAR(80);

INSERT INTO tb_vinicola(nome, descricao, fone, email, regiao_id) VALUES('Santa Rita', 'localizada no valle delmaipo e tem mais de 100 anos de história', null, 'santa@gmail.com', 1);
INSERT INTO tb_vinicola(nome, descricao, fone, email, regiao_id) VALUES('Santa Carolina', null, '3395-4422', 'carolina@gmail.com', 1);
INSERT INTO tb_vinicola(nome, descricao, fone, email, regiao_id) VALUES('Garibaldi', 'Vinícola situada na serra gaúcha', '9822-3344', 'garibaldi@gmail.com', 2);

DELETE FROM tb_vinicola WHERE id in (4, 5, 6);

INSERT INTO tb_tipo_vinho(nome) VALUES('Tinto');
INSERT INTO tb_tipo_vinho(nome) VALUES('Branco');
INSERT INTO tb_tipo_vinho(nome) VALUES('Rose');
INSERT INTO tb_tipo_vinho(nome) VALUES('Bordeaux');

ALTER TABLE tb_vinho ADD COLUMN preco FLOAT NOT NULL;
UPDATE tb_vinho SET preco = id

DROP TABLE tb_vinho;

INSERT INTO tb_vinho(nome, tipo_id, preco, vinicola_id) VALUES('Amanda', 1, 100.0, 1);
INSERT INTO tb_vinho(nome, tipo_id, preco, vinicola_id) VALUES('Belinha', 2, 200.0, 1);
INSERT INTO tb_vinho(nome, tipo_id, preco, vinicola_id) VALUES('Camila', 4, 65.0, 2);
INSERT INTO tb_vinho(nome, tipo_id, preco, vinicola_id) VALUES('Daniela', 3, 89.0, 2);
INSERT INTO tb_vinho(nome, tipo_id, preco, vinicola_id) VALUES('Eduarda', 1, 55.0, 3);
INSERT INTO tb_vinho(nome, tipo_id, preco, vinicola_id) VALUES('Fernanda', 2, 70.0, 3);