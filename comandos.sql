--Criando banco de dados--
CREATE DATABASE novobanco;

--Deletando Banco de dados ("dropar o banco")--
DROP DATABASE novobanco;

--Selecionar um banco para uso--
USE novobanco;

--Mostrando todos os banco de dados--
SHOW DATABASE;

--Criando tabela para o banco de dados--
CREATE TABLE clientes (nome VARCHAR(100), cpf CHAR(11), descricao MEDIUMTEXT);
CREATE TABLE <nome tabela> (<nome coluna <tipo dado(valor)>, <Vírgula para acrescentar mais de uma coluna>); 

--Deletando Tabela ("dropar tabela")--
DROP TABLE clientes;

--Alterando Tabelas--

Adição de colunas

ALTER TABLE clientes ADD COLUMN telefone VARCHAR(25);

Remoção de colunas

ALTER TABLE clientes ADD DROP COLUMN telefone;

Modificação de coluna

ALTER TABLE clientes MODIFY COLUMN nome VARCHAR(80);


--Alguns tipos de dados texto--
CHAR(x) aceita 0 a 255 caracteres
VARCHAR(x) aceita 0 a 65535 caracteres
TINYTEXT apenas texto com até 255 caracteres
MEDIUMTEXT apenas texto com até 16777215 caracteres
OBS: CHAR E VARCHAR aceitam números e caracteres especiais, seleção e inserção através de ""

--Alguns tipos de dados numéricos--
BIT(x): 1 a 64 caracteres
TINYINT(x): 1 a 255 caracteres
BOOL: 0 ou 1, 0 false, 1 true
INT(x): -2147483648 a -2147483647
OBS: Na inserção de dados, não é necessário "" entre os números  

--Alguns tipos de dados data--
DATE: Formato YYYY-MM-DD
DATETIME: Formato YYYY-MM-DD hh:mm:ss
TIMESTAMP: Formato DATETIME, porém datas entre 1970-2038
OBS: As datas são inseridas e selecionadas através de ""

--INSERT--
INSERT INTO clientes (nome, cpf, descricao) VALUES ("Gustavo", "11111111111", "Gustavo dados");

INSERT INTO exemplo (nome) VALUES("Gustavo"),("Lud"),("Guilherme"),("Adryano"),("Jorge"),("Gabriel");

--UPDATE--
UPDATE clientes SET nome = "Gustavo" WHERE nome = "gustavo";

UPDATE clientes SET<coluna=valor> where <condição>;

OBS: podemos inserir mais colunas, basta colcoar Vírgula

UPDATE clientes SET nome = "Gustavo", cpf = "321" WHERE nome = "gustavo";

--DELETE--

DELETE FROM clientes WHERE nome = "Gustavo";

Vai excluir a linha

--SELECT--
SELECT * FROM clientes;

Seleceionando certas colunas

SELECT nome, cpf FROM clientes;

Where onde 

Select * FROM clientes where id = 21331;

--Operadores de seleção (SELECT)--
Operadores de comparação

= (Igual a)
> (maior que)
< (Menor que)
>= (maior ou igual a)
<= (Menor ou igual a)
<> (Diferente de)
!< (Não é menor que)
!> (Não é maior que)
!= (Diferente de)

BETWEEN seleção de um intervalo ao outro

SELECT * FROM salarios WHERE salario BETWEEN 1000 AND 2000;
SELECT * FROM departamento_empregados WHERE departamento_no BETWEEN "D01" AND "D05";

LIKE seleção por meio de alguma padrão que pode acontecer em qualquer "lugar"

SELECT * FROM employees WHERE first_name LIKE '%stav%'

Retornará todos os resultados que contenham "stav" seja no começo, meio ou fim de uma palavra ou numa frase. 

IN seleçao entre um conjunto de valores específicos

SELECT * FROM departamento_empregados WHERE departamento_no IN ("D01","D02","D03");
SELECT * FROM setores WHERE setor IN ("Financeiro","Tecnologia da Informação");

Dessa forma fazemos um SELECT para coisas específicas

--Utilizando o DISTINCT--
Quando utlizado, faz com que sejam retornados apenas valores únicos daquela coluna. 

tabela nome |  retorno 
Gustavo     |  Gustavo
Gustavo     |  Vasconcelos
Vasoncelos  |

SELECT DISTINCT nome FROM clientes;
SELECT DISTINCT <coluna> FROM <tabela>;

--Operadores Lógicos--

AND: Recebe duas condições, e só retorna quando todas condiões são atendidas 

SELECT * FROM clientes WHERE salario > 1250 AND cargo = "programador"; 
SELECT * FROM clietnes WHERE salario > 10000 AND data_entrada > "1996-12-16" AND status = 1;

OR: Recebe duas condições, e só retorna quando pelo menos uma é atendida

SELECT * FROM clientes WHERE salario > 5000 OR cargo = "Administrador";
SELECT * FROM clientes WHERE salario > 5000 || cargo = "Administrador";

NOT: Negatica da afirmação

SELECT * FROM clientes WHERE cargo NOT = "Programador" AND NOT cargo = "Administrador";

--Ordenação--

ASC: Ascendente
DESC: Descendente

ORDER BY cliente.nome ASC
ORDER BY cliente.nome DESC

SELECT * FROM salarios ORDER BY data_entada ASC;

--Limitando buscas--

SELECT * FROM clientes LIMIT 100
SELECT * FROM clintes WHERE sexo = "M" ORDER BY data_entrada DESC LIMIT 200;

--Funções Internas--
SELECT MAX(<coluna>) FROM <tabela>;
SELECT MIN(<coluna>) FROM <tabela>;
SELECT COUNT(*) FROM salaries WHERE salary > 19999; 
SELECT AVG(salary) FROM salaries;
SELECT SUM(salary) FROM salaries;

MAX: Retorna o maior valor de query/coluna

SELECT MAX(salary) FROM salarios;

MIN: Retorna o menor valor de query/coluna

SELECT MIN(salary) FROM salarios;

COUNT: Retorna o número que corresponde com o "alvo"

SELECT COUNT(*) FROM  clientes WHERE sexo = "M";

Retorna a contagem das pessoas que são do sexo Masculino

AVG: Average, média, assim como o COUNT, o AVG retornará apenas o cálculo de media

SELECT SUM(salary) FROM salaries;

SUM: Soma, todos os valores de uma coluna

SELECT SUM(salary) FROM salaries;
SELECT SUM(salary) FROM salaries WHERE salary > 20000;

--ALIAS--

Serve para renomear uma coluna de forma temporária 

SELECT SUM(salary) AS soma_salario FROM salaries;

Retornará a soma de todos os salários, porém o nome da coluna será soma_salario

SELECT dept_no AS numero_departamento, dept_name AS nome_departamento FROM employees.departaments;
SELECT dept_no AS "Número do Departamento ", dept_name AS nome_departamento FROM employees.departaments;

--Constraints--

São regras que determinam como os campos são preenchidos, geralmente são adicionadas na 
criação da tabela. Ajuda na padronização e organização.

NOT NULL: não pode ser nulo

Criando um banco na mão:

CREATE DATABASE novobanco;

CREATE TABLE clientes (nome VARCHAR(100) NOT NULL, cpf CHAR(11) NOT NULL, descricao MEDIUMTEXT);

UNIQUE: Valor único, quando alocado em uma tablea, não é permitido que nesta tabela existam valores duplicados

ALTER TABLE clientes ADD COLUMN email VARCHAR(250) UNIQUE;

PRIMARY KEY: Chave única, por convenção é alocada apenas em uma coluna, normalmente na inseridas

CREATE TABLE produtos (
    id_cliente INT NOT NULL,
    nome VARCHAR(100),
    sku VARCHAR(10),
    PRIMARY KEY (id_cliente)
);

AUTO_INCREMENT: Auto incremeto de valores, normalmente é utilizada numa primary key de uma 
tabela para que ela fique se auto incrementando a cada novo INSERT nas outras colunas
ou seja quando existe um, insert, a tabela id_cliente, 
sairia de 1 para 2 e assim por diante.

CREATE TABLE produtos (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    sku VARCHAR(10)
);

FOREIGN KEY: Chave estrangeira, uma chave primária se torna uma chave estrangeira quando ela 
está em outra tabela 

tabela: produtos
    (PK)id_produto
    (FK)id_cor

CREATE TABLE pessoas(
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    nome VARCHAR(100) NOT NULL, 
    idade INT
);

CREATE TABLE endereços(
    id_endereço INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    rua VARCHAR(100),
    numero VACHAR(100),
    Id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoas(id_pessoa)
);

INDEX (performance e desempenho)

Adicionar um índice a uma coluna faz a consulta que envolva a mesma se torna mais rápida
Exemplo, uma tabela com 15 colunas, adicionando um índice a coluna 14, faz com que na busca
utilizando o WHERE, a coluna 14 é "alocada" como "1".

Tabela: employees
coluna index: first_name

outras colunas dessa tabela: id, last_name, gender, hire_date

passando o index para o first_name

CREATE INDEX index_nome ON employees(first_name);

SELECT * FROM employees WHERE first_name = "Gustavo";

Removendo INDEX (DROP INDEX)

DROP INDEX <nome> ON <tabela>;

DROP INDEX index_nome ON pessoas;

--JOIN--

Os JOINS servem para unir tabelas, duas ou mais. As tabelas geralmente possuem relação.
Os tipos mais comuns:

INNER JOIN

O INNER JOIN vai resultar nas colunas que fazem relação entre as tabelas.
Podemos determinar qual coluna resgatas após a instrução SELECT.
Utilizamos a instrução "ON" para determinar as colunas que precisam ser iguais.

Tabelas: employees e salaries
colunas em comum: employees.emp_no e salaries.emp_no

    --(tabela.nome_coluna)  (tabela.nome_coluna) (tabela.nome_coluna)--
SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees --tabela
INNER JOIN salaries --tabela 
ON employees.emp_no = salaries.emp_no --Ligação(ON) e comparação com a mesma tabela de cada tabela(nome_tabela.coluna_igual)
WHERE salaries.salary >= 1500;
ORDER BY salaries DESC;

LEFT JOIN

O LEFET JOIN retornará todos os dados da tabela da esquerda e os necessários da direita
Também é conhecido como LEFT OUTER JOIN.
Haverá dados retornados da tabela da esquerda mesmo se não correponder com a outra.

SELECT pessoas.nome, enderecos.* --Tabela left, fazendo o .* pega todas as colunas
FROM pessoas
LEFT JOIN enderecos
ON pessoas.id = enderecos.pessoa_id 

SELECT employees.first_name, employees.last_name, salaries.salary
FROM employees --tabela
LEFT JOIN salaries --tabela 
ON employees.emp_no = salaries.emp_no --Ligação(ON) e comparação com a mesma tabela de cada tabela(nome_tabela.coluna_igual)


RIGHT JOIN

O RIGHT JOIN é o contrário de LEFT JOIN

SELECT pessoas.nome, enderecos.* --Tabela left, fazendo o .* pega todas as colunas
FROM pessoas
LEFT JOIN enderecos
ON pessoas.id = enderecos.pessoa_id 

Fazendo JOIN com mais de uma tabela

SELECT employees.first_name, salaries.salary, titles.title
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
INNER JOIN titles 
ON employees.emp_no = titles.emp_no 