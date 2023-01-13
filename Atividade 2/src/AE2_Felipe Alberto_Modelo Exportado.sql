CREATE DATABASE  IF NOT EXISTS `LojaVinhos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LojaVinhos`;
-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: LojaVinhos
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Regiao`
--

DROP TABLE IF EXISTS `Regiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Regiao` (
  `codRegiao` bigint NOT NULL,
  `nomeRegiao` varchar(100) NOT NULL,
  `descricaoRegiao` text,
  PRIMARY KEY (`codRegiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regiao`
--

LOCK TABLES `Regiao` WRITE;
/*!40000 ALTER TABLE `Regiao` DISABLE KEYS */;
INSERT INTO `Regiao` VALUES (1,'Alentejo','A região do Alentejo está localizada ao centro-sul de Portugal.'),(2,'Bordeaux','Bordeaux é uma região francesa localizada ao oeste da França e está a cerca de 500km da capital, Paris.'),(3,'Douro','A região de Douro fica ao norte de Portugal. Considerada pela UNESCO como Patrimônio da humanidade.'),(4,'Toscana','A Toscana está localizada ao centro da Itália, abriga paisagens exuberantes e cidades medievais.'),(5,'Sardegna','Localizada no Nordeste da Itália, Sardenha é a segunda maior ilha do Mediterrâneo.');
/*!40000 ALTER TABLE `Regiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vinho`
--

DROP TABLE IF EXISTS `Vinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vinho` (
  `codVinho` bigint NOT NULL,
  `nomeVinho` varchar(50) NOT NULL,
  `tipoVinho` varchar(30) NOT NULL,
  `anoVinho` int NOT NULL,
  `descricaoVinho` text,
  `codVinicola` bigint NOT NULL,
  PRIMARY KEY (`codVinho`),
  KEY `codVinicola` (`codVinicola`),
  CONSTRAINT `Vinho_ibfk_1` FOREIGN KEY (`codVinicola`) REFERENCES `Vinicola` (`codVinicola`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vinho`
--

LOCK TABLES `Vinho` WRITE;
/*!40000 ALTER TABLE `Vinho` DISABLE KEYS */;
INSERT INTO `Vinho` VALUES (1,'Monte da Guiça','Tinto',2016,'O Monte da Guiça tinto apresenta enotas de frutas vermelhas, chocolate, especiarias e um toque de tosta de madeira.',1),(2,'Château Cos d\'Estournel','Tinto',2002,'Utiliza uma proporção considerável de Merlot e barricas novas de carvalho em seu Grand Vin, originando um vinho rico, potente e complexo, com um sedutor toque sedoso e incrível elegância.',2),(3,'TRePA','Tinto',2008,'Envolvido por muitas camadas de fruta madura, o que faz com que possa ser apreciado desde jovem ou ser guardado por muitos anos',3),(4,'Baffonero','Tinto',2007,'É um vinho bastante exuberante e expressivo, com a finesse que é a marca registrada dos vinhos do Château Lafite Rothschild.',4),(5,'Costamolino Vermentino di Sardegna','Branco',2017,'Um dos mais consagrados exemplos da casta Vermentino, o Costamolino é um branco rico e exuberante, com camadas de fruta e um delicioso toque de mel.',5);
/*!40000 ALTER TABLE `Vinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vinicola`
--

DROP TABLE IF EXISTS `Vinicola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vinicola` (
  `codVinicola` bigint NOT NULL,
  `nomeVinicola` varchar(100) NOT NULL,
  `descricaoVinicola` text,
  `foneVinicola` varchar(15) DEFAULT NULL,
  `emailVinicola` varchar(30) DEFAULT NULL,
  `codRegiao` bigint NOT NULL,
  PRIMARY KEY (`codVinicola`),
  KEY `codRegiao` (`codRegiao`),
  CONSTRAINT `Vinicola_ibfk_1` FOREIGN KEY (`codRegiao`) REFERENCES `Regiao` (`codRegiao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vinicola`
--

LOCK TABLES `Vinicola` WRITE;
/*!40000 ALTER TABLE `Vinicola` DISABLE KEYS */;
INSERT INTO `Vinicola` VALUES (1,'Vinícola Alentejo','Vinicola localizada em Portugal','(99)99999-9999','vinicolaalentejo@gmail.com',1),(2,'Vinícola Bordeaux','Vinicola localizada na França','(88)88888-8888','vinicolabordeaux@gmail.com',2),(3,'Vinícola Douro','Vinicola localizada em Portugal','(77)77777-7777','vinicoladouro@gmail.com',3),(4,'Vinícola Toscana','Vinicola localizada na Itália','(66)66666-6666','vinicolatoscana@gmail.com',4),(5,'Vinícola Sardegna','Vinicola localizada ena Itália','(55)55555-5555','veinicolasardegna@gmail.com',5);
/*!40000 ALTER TABLE `Vinicola` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-23 23:17:22
