-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para crud_manager
DROP DATABASE IF EXISTS `crud_manager`;
CREATE DATABASE IF NOT EXISTS `crud_manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `crud_manager`;

-- Copiando estrutura para tabela crud_manager.companies
DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `role` varchar(128) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.companies: ~7 rows (aproximadamente)
INSERT INTO `companies` (`id`, `name`, `role`, `start`, `end`, `user_id`) VALUES
	(1, 'Facebook', 'A', '2024-07-12', '2024-07-12', 1),
	(2, 'Nestlé', 'B', '2024-08-04', '2024-08-04', 1),
	(6, 'Loreal', 'a', '2024-08-04', '2024-08-04', 1),
	(7, 'Google', 'Engenheiro de Software', '2024-08-10', '2024-12-31', 2),
	(8, 'Apple', 'Desenvolvedor iOS', '2024-08-15', '2024-12-31', 3),
	(15, 'Microsoft', 'Desenvolvedor', '2024-09-10', '2025-01-31', 2),
	(18, 'Netflix', 'Gerente de Projetos', '2024-10-10', '2025-03-31', 5);

-- Copiando estrutura para tabela crud_manager.dependentes
DROP TABLE IF EXISTS `dependentes`;
CREATE TABLE IF NOT EXISTS `dependentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `parentesco` varchar(128) NOT NULL,
  `dataNasc` date NOT NULL,
  `infoSaude` varchar(128) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `dependentes_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.dependentes: ~3 rows (aproximadamente)
INSERT INTO `dependentes` (`id`, `nome`, `parentesco`, `dataNasc`, `infoSaude`, `seller_id`) VALUES
	(1, 'Ana Silva', 'Filha', '2015-06-10', 'Sem alergias', 4),
	(2, 'Pedro Silva', 'Filho', '2018-03-22', 'Alergia a amendoim', 4),
	(4, 'Marcos', 'Filho', '2024-06-30', 'nada a declarar', 12);

-- Copiando estrutura para tabela crud_manager.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `post_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.posts: ~8 rows (aproximadamente)
INSERT INTO `posts` (`id`, `content`, `post_date`, `user_id`) VALUES
	(1, 'Olá do Emerson', '2024-07-12', 1),
	(2, 'Olá da Luiza', '2024-07-12', 2),
	(3, 'Olá da Denise', '2024-07-12', 3),
	(4, 'Olá do Noé', '2024-07-12', 4),
	(5, 'Olá da Rosânia', '2024-07-12', 5),
	(6, 'Olá da Rosânia 1', '2024-07-12', 5),
	(7, 'Olá da Rosânia 2', '2024-07-12', 5),
	(8, 'Olá da Rosânia 3', '2024-07-12', 5);

-- Copiando estrutura para tabela crud_manager.sellers
DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `fone` varchar(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.sellers: ~5 rows (aproximadamente)
INSERT INTO `sellers` (`id`, `name`, `email`, `fone`, `company_id`) VALUES
	(4, 'Emily', 'emily@gmailL.com.br', '16997457833', 6),
	(5, 'Teste', 'ttttt@gmail.com', '156955566', 2),
	(12, 'Carlos Eduardo', 'carlos@gmail.com', '11987654321', 6),
	(13, 'Mariana Silva', 'mariana@gmail.com', '21987654321', 2),
	(14, 'Roberto Souza', 'roberto@gmail.com', '31987654321', 8);

-- Copiando estrutura para tabela crud_manager.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela crud_manager.users: ~5 rows (aproximadamente)
INSERT INTO `users` (`id`, `nome`, `sexo`, `email`) VALUES
	(1, 'Emerson Carvalho', 'M', 'emerson@mail.com'),
	(2, 'Luiza Carvalho', 'F', 'lu@mail.com'),
	(3, 'Elenice Carvalho', 'F', 'le@mail.com'),
	(4, 'Noé Carvalho', 'M', 'noe@mail.com'),
	(5, 'Rosânia Carvalho', 'F', 'ro@mail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
