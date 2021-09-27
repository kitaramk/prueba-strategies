-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: db_springboot_backend
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Guzman','2020-01-01','prueba@gmail.com','Andres'),(2,'Landa','2020-01-02','prueba@gmail.com','Ingrid'),(3,'Hernandez','2010-01-01','1prueba@gmail.com','Mauricio'),(4,'Guzman','2020-01-01','prueba@gmail.com','Pedro'),(5,'Guzman','2020-01-01','prueba@gmail.com','Fernando'),(6,'Guzman','2020-01-01','prueba@gmail.com','Antonio'),(7,'Guzman','2020-01-01','prueba@gmail.com','Julio'),(8,'Guzman','2020-01-01','prueba@gmail.com','Sara'),(9,'Guzman','2020-01-01','prueba@gmail.com','Maria'),(10,'Guzman','2020-01-01','prueba@gmail.com','Andrea'),(11,'Guzman','2005-10-10','prueba@gmail.com','Karla'),(12,'Guzman','2010-05-10','prueba@gmail.com','Gabriela'),(13,'Guzman','2020-05-14','prueba@gmail.com','Lucia'),(14,'Guzman','2021-05-05','prueba@gmail.com','Federica');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_pelicula`
--

DROP TABLE IF EXISTS `historico_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_pelicula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `precio_alq` decimal(19,2) DEFAULT NULL,
  `precio_vent` decimal(19,2) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `pelicula_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3hyaqxlsgiofcbp7r5xfknq4u` (`pelicula_id`),
  CONSTRAINT `FK3hyaqxlsgiofcbp7r5xfknq4u` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_pelicula`
--

LOCK TABLES `historico_pelicula` WRITE;
/*!40000 ALTER TABLE `historico_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `disponibilidad` bigint DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio_alq` decimal(19,2) DEFAULT NULL,
  `precio_ven` decimal(19,2) DEFAULT NULL,
  `stock` bigint DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Luca es un monstruo marino que vive debajo de un pueblo de la costa italiana. Cuando sale a la superficie, adquiere una apariencia humana, y conoce a un nuevo amigo, igual que él',1,NULL,2.25,5.50,10,'Luca'),(2,'Una peligrosa conspiración, relacionada con su pasado, persigue a Natasha Romanoff, también conocida como Viuda Negra',0,NULL,2.75,6.00,5,'Black Widow'),(3,'Monsters, Incorporated es la fábrica de sustos más grande en el mundo de los monstruos y James P. Sullivan es uno de sus mejores asustadores',1,NULL,2.25,5.50,10,'Monsters In'),(4,'Una peligrosa conspiración, relacionada con su pasado, persigue a Natasha Romanoff, también conocida como Viuda Negra',0,NULL,2.75,6.00,5,'Black Jack'),(5,'Un padre que padece una discapacidad mental debe luchar para ganar de nuevo la custodia de su querida hija.',1,NULL,2.25,5.50,10,'Yo soy Sam'),(6,'Los habitantes de un pequeño pueblo cercano al desierto pasan de la incredulidad al pánico cuando se encuentran con una serie de muertes inexplicables.',0,NULL,2.75,6.00,5,'Temblores');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_historial`
--

DROP TABLE IF EXISTS `pelicula_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula_historial` (
  `pelicula_id` bigint NOT NULL,
  `historial_id` bigint NOT NULL,
  UNIQUE KEY `UK_c8gfctx86ahqsk5kf23i4ospx` (`historial_id`),
  KEY `FKct71gh82fmq6gdmiyqdgkhxcn` (`pelicula_id`),
  CONSTRAINT `FKct71gh82fmq6gdmiyqdgkhxcn` FOREIGN KEY (`pelicula_id`) REFERENCES `pelicula` (`id`),
  CONSTRAINT `FKppybjsjsqq3q2ml29v4a99h9b` FOREIGN KEY (`historial_id`) REFERENCES `historico_pelicula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_historial`
--

LOCK TABLES `pelicula_historial` WRITE;
/*!40000 ALTER TABLE `pelicula_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `pelicula_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` bigint DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `total` decimal(19,2) DEFAULT NULL,
  `pelicula` bigint DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp60fllkyeky9pvf8xr1f5jhex` (`pelicula`),
  KEY `FKqfbdwuu2isbwwnx1uky39930w` (`usuario_id`),
  CONSTRAINT `FKp60fllkyeky9pvf8xr1f5jhex` FOREIGN KEY (`pelicula`) REFERENCES `pelicula` (`id`),
  CONSTRAINT `FKqfbdwuu2isbwwnx1uky39930w` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bjxn5ii7v7ygwx39et0wawu0q` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER',NULL),(2,'ROLE_ADMIN',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `estatus` bit(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pass` varchar(60) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_863n1y3x0jalatoir4325ehal` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'landa','estefany_04_93@hotmail.es',_binary '','ingrid','$2a$10$YjZ8QrCyEMiaO.fgpmm2AO.3RFRyV1v.tAW5B9hS9bTSM/1bcYVUS',NULL,'admin'),(2,'landa','estefany_04_93@hotmail.es',_binary '','otro','$2a$10$I1mqSgW1WWjgkfTLvMiwL.sQEr.4MPLManoMqCAh5Xu/25vxDGeT.',NULL,'customer');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_pelicula`
--

DROP TABLE IF EXISTS `usuario_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_pelicula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fec_alquiler` date DEFAULT NULL,
  `fec_entrega` date DEFAULT NULL,
  `mora` decimal(19,2) DEFAULT NULL,
  `pelicula` tinyblob,
  `usuario` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_pelicula`
--

LOCK TABLES `usuario_pelicula` WRITE;
/*!40000 ALTER TABLE `usuario_pelicula` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_roles`
--

DROP TABLE IF EXISTS `usuario_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `usuario_id` bigint NOT NULL,
  `roles_id` bigint NOT NULL,
  KEY `FKr5p0u8r15jjo6u7xr1928hsld` (`roles_id`),
  KEY `FKqblnumndby0ftm4c7sg6uso6p` (`usuario_id`),
  CONSTRAINT `FKqblnumndby0ftm4c7sg6uso6p` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKr5p0u8r15jjo6u7xr1928hsld` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_roles`
--

LOCK TABLES `usuario_roles` WRITE;
/*!40000 ALTER TABLE `usuario_roles` DISABLE KEYS */;
INSERT INTO `usuario_roles` VALUES (1,1),(2,2),(2,1);
/*!40000 ALTER TABLE `usuario_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-27  9:28:51
