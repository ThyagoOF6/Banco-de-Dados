CREATE TABLE tb_usuario
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	email VARCHAR(40) NOT NULL,
	nascimento DATE,
	website VARCHAR(60),
	genero CHAR(1) NOT NULL,
	telefone VARCHAR(12),
	foto_de_perfil_id VARCHAR(60)
);

CREATE TABLE tb_seguidores
(
	seguidor_id INT,
	seguido_id INT,
	PRIMARY KEY(seguidor_id, seguido_id),
	FOREIGN KEY(seguidor_id) REFERENCES tb_usuario(id),
	FOREIGN KEY(seguido_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_postagem(
	id SERIAL PRIMARY KEY,
	texto VARCHAR(20),
	instante TIMESTAMP NOT NULL,
	autor_id INT NOT NULL,
	FOREIGN KEY(autor_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_album(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(40),
	instante_de_postagem TIMESTAMP NOT NULL,
	usuario_id INT NOT NULL,
	FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_foto(
	uri VARCHAR(60) PRIMARY KEY,
	instante_de_postagem TIMESTAMP NOT NULL,
	postagem_id INT,
	usuario_id INT NOT NULL,
	album_id INT,
	FOREIGN KEY(postagem_id) REFERENCES tb_postagem(id),
	FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id),
	FOREIGN KEY(album_id) REFERENCES tb_album(id)
);