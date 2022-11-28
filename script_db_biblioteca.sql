
-- TABELA ALUNO

CREATE TABLE Aluno (
	Matricula_aluno char(10) NOT NULL,
	PrimeiroNome_Aluno varchar(20) NOT NULL,
	Sobrenome_Aluno varchar(20) NOT NULL,
	Email_Aluno varchar(100) NOT NULL,
	CONSTRAINT pk_aluno PRIMARY KEY (matricula_aluno)
);

-- TABELA BIBLIOTECARIO
CREATE TABLE bibliotecario (
	RG_Biblio char(7) NOT NULL,
	PrimeiroNome_Biblio varchar(20) NOT NULL,
	SegundoNome_Biblio varchar(20) NOT NULL,
	Email_Biblio varchar(100),
	CONSTRAINT pk_bibliotecario PRIMARY KEY(rg_biblio)
);

-- TABELA AUTOR

CREATE TABLE Autor (
	ID_Autor SERIAL NOT NULL,
	PrimeiroNome_Autor varchar(20) NOT NULL,
	Sobrenome_Autor varchar(20) NOT NULL,
	CONSTRAINT pk_autor PRIMARY KEY(id_autor)
);

-- TABELA LIVRO

CREATE TABLE Livro (
	ISBN_Livro char(15) NOT NULL,
	Titulo_Livro varchar(50) NOT NULL,
	Genero_Livro  varchar(50) NOT NULL,
	DataPubli_Livro date NULL,
	ID_Autor INT NOT NULL,
	CONSTRAINT pk_livro PRIMARY KEY(ISBN_Livro), 
	CONSTRAINT fk_autor FOREIGN KEY(id_autor) REFERENCES autor(id_autor)		
);

-- TABELA EMPRESTIMO

CREATE TABLE emprestimo(
	ID_Emprestimo SERIAL NOT NULL,
	ID_Livro varchar(15) NOT NULL,
	ID_Aluno varchar(10) NOT NULL, 
	ID_Biblio varchar(7) NOT NULL,
	DataSaida_Emprestimo date NOT NULL,
	DataRetorno_Emprestimo date NOT NULL,
	CONSTRAINT pk_emprestimo PRIMARY KEY(ID_Emprestimo),
	CONSTRAINT fk_livro FOREIGN KEY(id_livro) REFERENCES livro (ISBN_Livro),
	CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno (Matricula_aluno),
	CONSTRAINT fk_biblio FOREIGN KEY (id_biblio) REFERENCES bibliotecario(rg_biblio)
);

-- INSERINDO DADOS NA TABELA ALUNO

INSERT INTO aluno(matricula_aluno, primeironome_aluno, sobrenome_aluno, email_aluno)
VALUES
	('2012234578','João', 'Souza', 'joazinho22@gmail.com'),
	('2012234548','Jonnes', 'Bezerra','joonnes@gmail.com'),
	('2012233578','Rafael', 'Souza', 'joonnes@gmail.com');


--//


-- INSERINDO DADOS NA TABELA BIBLIOTECARIO

INSERT INTO bibliotecario (rg_biblio, primeironome_biblio, segundonome_biblio, email_biblio)
VALUES 
	('3563478', 'Alexandre', 'Silva', 'alexandrebib@gmail.com'),
	('3568278', 'Carlos', 'Almeida', 'carlos@gmail.com'),
	('3528478', 'Rafael', 'Cardoso', 'rafa@gmail.com');
	

-- INSERINDO DADOS NA TABELA AUTOR

INSERT INTO autor (primeironome_autor, sobrenome_autor)
VALUES
	('Paul', 'Deitel'),
	('Hebert', 'S'),
	('Pearson', 'M');

--//

-- INSERINDO DADOS NA TABELA LIVRO

INSERT INTO livro(isbn_livro, titulo_livro, genero_livro, datapubli_livro, id_autor)
VALUES 
	('48949469416', 'Java: Como programar', 'Tecnologia', '09/02/2000', 1),
	('45646414654', 'Código Limpo', 'Tecnologia', '09/02/2010', 3),
	('45456465465', 'Cracking the coding interview', 'Tecnologia', '09/02/2004', 2);

--//

-- INSERINDO DADOS NA TABELA EMPRESTIMO

INSERT INTO emprestimo (id_livro, id_aluno, id_biblio, datasaida_emprestimo, dataretorno_emprestimo)
VALUES	
	('48949469416', '2012233578', '3563478', '15/09/2022', '30/09/2022'),
	('45456465465', '2012234548', '3568278', '20/09/2022', '26/09/2022'),
	('45646414654', '2012234578', '3528478', '08/09/2022', '30/10/2022');
	
-- CRIANDO USUÁRIO

-- CREATE USER donodb WITH ENCRYPTED PASSWORD '1234';

-- ATRIBUINDO O DONODB AO BANCO DE DADOS

-- ALTER DATABASE biblioteca OWNER TO donodb;
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO donodb;

-- CREATE USER dmluser WITH ENCRYPTED PASSWORD '1234';
-- GRANT SELECT, UPDATE, INSERT ON ALL TABLES IN SCHEMA public TO dmluser;

-- FILE CREATED BY CARLOS(2012130044) AND JONNES(2012130094) !!!
