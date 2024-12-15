CREATE DATABASE  IF NOT EXISTS `proyecto1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto1`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto1
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS comentarios;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE comentarios (
  comentario_id int NOT NULL AUTO_INCREMENT,
  producto_id int DEFAULT NULL,
  comentario_texto text,
  PRIMARY KEY (comentario_id),
  KEY producto_id (producto_id),
  CONSTRAINT comentarios_ibfk_1 FOREIGN KEY (producto_id) REFERENCES productos (product_id)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES comentarios WRITE;
/*!40000 ALTER TABLE comentarios DISABLE KEYS */;
INSERT INTO comentarios VALUES (1,1,'El anillo de oro es perfecto, excelente calidad y diseño.'),(2,2,'El collar de plata es hermoso, pero esperaba que fuera un poco más grande.'),(3,3,'La pulsera de diamantes es espectacular, definitivamente una buena compra.'),(4,4,'El reloj de lujo es increíble, pero el precio es elevado.'),(5,5,'Los aretes de perlas son elegantes, ideales para ocasiones especiales.'),(6,6,'El collar de oro rosa es muy bonito, a mi esposa le encantó.'),(7,7,'El anillo de compromiso es impresionante, mi pareja quedó encantada.'),(8,8,'El broche vintage es un regalo perfecto, tiene un diseño muy especial.'),(9,9,'Los gemelos de plata son un buen detalle, aunque el cierre podría mejorar.'),(10,10,'El colgante de zafiro es una joya única, definitivamente lo recomiendo.'),(11,1,'El anillo es perfecto, superó mis expectativas.'),(12,1,'Muy buen diseño y excelente calidad.'),(13,2,'El collar tiene un acabado hermoso, ideal para regalo.'),(14,2,'La plata es de alta calidad, lo recomiendo.'),(15,3,'La pulsera es aún más hermosa en persona.'),(16,3,'El detalle de los diamantes es simplemente increíble.'),(17,4,'El reloj es lujoso y elegante, un accesorio imprescindible.'),(18,4,'El empaque del reloj es impecable, muy satisfecho.'),(19,5,'Los aretes son ideales para eventos formales, muy bonitos.'),(20,5,'Perfecto para regalar, le encantaron a mi madre.'),(21,6,'El collar de oro rosa tiene un diseño moderno, excelente compra.'),(22,6,'Buen tamaño y color, la calidad es impresionante.'),(23,7,'El anillo de compromiso fue perfecto para mi propuesta.'),(24,7,'Un diseño clásico que nunca pasa de moda.'),(25,8,'El broche tiene un diseño muy único, me encantó.'),(26,8,'La calidad del broche es increíble, lo recomiendo mucho.'),(27,9,'Los gemelos son elegantes y discretos, perfectos para reuniones.'),(28,9,'El material es de calidad, buen producto por el precio.'),(29,10,'El colgante es muy delicado, ideal para ocasiones especiales.'),(30,10,'Excelente producto, el zafiro tiene un color muy bonito.'),(31,11,'El reloj minimalista es moderno y combina con todo.'),(32,11,'Muy cómodo y funcional, perfecto para uso diario.'),(33,12,'El anillo de esmeralda es impresionante, vale cada centavo.'),(34,12,'Gran calidad y diseño, un producto único.'),(35,13,'La pulsera de plata es perfecta para usar a diario.'),(36,13,'Tiene un diseño sencillo pero elegante, me encanta.'),(37,14,'Los aretes de rubí tienen un color hermoso, gran compra.'),(38,14,'Muy elegantes y de excelente calidad.'),(39,15,'El broche de diamantes tiene un diseño espectacular.'),(40,15,'Un producto de alta calidad, muy satisfecho.'),(41,1,'Un diseño sofisticado, perfecto para cualquier ocasión.'),(42,2,'La calidad del collar es excepcional, el brillo de la plata destaca.'),(43,3,'El tamaño de la pulsera es ideal y muy cómoda de usar.'),(44,4,'Me encanta el diseño moderno del reloj, súper recomendado.'),(45,5,'Los aretes son pequeños pero elegantes, justo lo que buscaba.'),(46,6,'El collar de oro rosa llegó en perfecto estado y antes de lo esperado.'),(47,7,'El anillo tiene un diseño clásico que encanta a cualquiera.'),(48,8,'El broche tiene un toque vintage que lo hace muy especial.'),(49,9,'Los gemelos son de excelente calidad, ideales para reuniones formales.'),(50,10,'El colgante es hermoso y el zafiro resalta mucho.'),(51,11,'El reloj es minimalista pero muy elegante, me encanta.'),(52,12,'El anillo de esmeralda tiene un diseño único, es muy bonito.'),(53,13,'La pulsera tiene detalles finos, perfecta para regalar.'),(54,14,'Los aretes de rubí son más hermosos en persona, gran compra.'),(55,15,'El broche es perfecto, lo recomiendo para eventos importantes.');
/*!40000 ALTER TABLE comentarios ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS productos;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE productos (
  product_id int NOT NULL AUTO_INCREMENT,
  product_name varchar(255) NOT NULL,
  product_price decimal(10,2) NOT NULL,
  discount_price decimal(10,2) DEFAULT NULL,
  product_image varchar(255) DEFAULT NULL,
  tendencias varchar(2) DEFAULT NULL,
  descripcion varchar(255) NOT NULL,
  PRIMARY KEY (product_id),
  CONSTRAINT productos_chk_1 CHECK ((`tendencias` in (_utf8mb4'Si',_utf8mb4'No')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES productos WRITE;
/*!40000 ALTER TABLE productos DISABLE KEYS */;
INSERT INTO productos VALUES (1,'Anillo de Oro 18K',150.00,NULL,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg',NULL,'Anillo de oro puro con diseño clásico.'),(2,'Collar de Plata',75.00,65.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Collar de plata con incrustaciones de zirconias.'),(3,'Pulsera de Diamantes',1200.00,1100.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Pulsera de diamantes ideal para ocasiones especiales.'),(4,'Reloj de Lujo',2500.00,NULL,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Reloj suizo de alta gama.'),(5,'Aretes de Perlas',200.00,180.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg',NULL,'Aretes clásicos con perlas naturales.'),(6,'Collar de Oro Rosa',300.00,250.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Collar elegante de oro rosa.'),(7,'Anillo de Compromiso',500.00,NULL,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Anillo de compromiso con diamante central.'),(8,'Broche Vintage',150.00,120.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg',NULL,'Broche con diseño vintage en oro.'),(9,'Gemelos de Plata',80.00,NULL,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg',NULL,'Gemelos clásicos en plata.'),(10,'Colgante de Zafiro',350.00,300.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Colgante de zafiro azul con cadena de oro.'),(11,'Reloj Minimalista',200.00,NULL,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Reloj con diseño moderno y minimalista.'),(12,'Anillo de Esmeralda',400.00,350.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg',NULL,'Anillo de oro con esmeralda central.'),(13,'Pulsera de Plata',100.00,90.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg',NULL,'Pulsera sencilla de plata.'),(14,'Aretes de Rubí',600.00,NULL,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Aretes de oro con incrustaciones de rubíes.'),(15,'Broche de Diamantes',800.00,750.00,'https://i.pinimg.com/originals/3e/3f/e3/3e3fe300ba5559955bc55bd921932abb.jpg','SI','Broche decorativo con diamantes incrustados.');
/*!40000 ALTER TABLE productos ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-13 10:11:58
