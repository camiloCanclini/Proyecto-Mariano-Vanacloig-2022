-- MariaDB dump 10.19  Distrib 10.9.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Mariano
-- ------------------------------------------------------
-- Server version	10.9.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canchas`
--

DROP TABLE IF EXISTS `canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canchas` (
  `idCancha` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `direccion` varchar(255) NOT NULL,
  `fk_idClubProp` int(11) NOT NULL,
  `fk_tipoCancha` int(11) NOT NULL,
  PRIMARY KEY (`idCancha`),
  KEY `idClubProp` (`fk_idClubProp`),
  KEY `tipoCancha` (`fk_tipoCancha`),
  CONSTRAINT `canchas_ibfk_1` FOREIGN KEY (`fk_idClubProp`) REFERENCES `clubes` (`id`),
  CONSTRAINT `tipoCancha` FOREIGN KEY (`fk_tipoCancha`) REFERENCES `deportes` (`idDeporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clubes`
--

DROP TABLE IF EXISTS `clubes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clubes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombreClub` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deportes` (
  `idDeporte` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombreDeporte` varchar(255) NOT NULL,
  `jugadoresPorEquipos` int(2) NOT NULL,
  PRIMARY KEY (`idDeporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombreEquipo` varchar(255) NOT NULL,
  PRIMARY KEY (`idEquipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fechas`
--

DROP TABLE IF EXISTS `fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `fk_idCancha` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fk_idEquipo 1` int(11) NOT NULL,
  `fk_idEquipo2` int(11) NOT NULL,
  `desde_hs` time NOT NULL,
  `hasta_hs` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo1_fk` (`fk_idEquipo 1`),
  KEY `index4` (`fk_idEquipo2`),
  KEY `fechas_ibfk_1` (`fk_idCancha`),
  CONSTRAINT `fechas_ibfk_1` FOREIGN KEY (`fk_idCancha`) REFERENCES `canchas` (`idCancha`),
  CONSTRAINT `fk_equipo1` FOREIGN KEY (`fk_idEquipo 1`) REFERENCES `equipos` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipo2` FOREIGN KEY (`fk_idEquipo2`) REFERENCES `equipos` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipoUsuarios`
--

DROP TABLE IF EXISTS `tipoUsuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoUsuarios` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fk_tipo_usuario` int(11) DEFAULT NULL,
  `fk_id_equipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo` (`fk_id_equipo`),
  KEY `usuarios_ibfk_1` (`fk_tipo_usuario`),
  CONSTRAINT `fk_usuario-equipo` FOREIGN KEY (`fk_id_equipo`) REFERENCES `equipos` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`fk_tipo_usuario`) REFERENCES `tipoUsuarios` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 22:50:59
