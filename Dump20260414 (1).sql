-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: produtos_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `tb_cadastro_prod`
--

DROP TABLE IF EXISTS `tb_cadastro_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cadastro_prod` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `desc_produto` varchar(255) DEFAULT NULL,
  `data_lote` varchar(10) DEFAULT NULL,
  `marca_produto` varchar(60) DEFAULT NULL,
  `categoria_prod` varchar(100) DEFAULT NULL,
  `qnt_dis_prod` int DEFAULT NULL,
  `preco_custo` decimal(10,2) DEFAULT NULL,
  `preco_venda` decimal(10,2) DEFAULT NULL,
  `foto_prod` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cadastro_prod`
--

LOCK TABLES `tb_cadastro_prod` WRITE;
/*!40000 ALTER TABLE `tb_cadastro_prod` DISABLE KEYS */;
INSERT INTO `tb_cadastro_prod` VALUES (1,'Pneu Dianteiro 80/100-18','2026-04-14','Pirelli','Pneus',15,120.00,195.00,''),(2,'Pneu Traseiro 90/90-18','2026-04-14','Metzeler','Pneus',12,150.00,245.00,''),(3,'Kit Relação Completo','2026-04-14','DID','Transmissão',20,75.00,135.00,''),(4,'Pastilha de Freio Dianteira','2026-04-14','Cobreq','Freios',40,15.00,38.00,''),(5,'Lona de Freio Traseira','2026-04-14','Diafrag','Freios',35,12.00,29.00,''),(6,'Óleo Mobil 20W50 1L','2026-04-14','Mobil','Lubrificantes',100,22.00,35.00,''),(8,'Vela de Ignição G7HS','2026-04-14','NGK','Motor',50,8.00,19.50,''),(9,'Cabo de Embreagem','2026-04-14','Soretto','Cabos',18,9.50,26.00,''),(10,'Filtro de Ar Titan 150','2026-04-14','Valflex','Filtros',25,11.00,28.50,''),(11,'Amortecedor Traseiro Par','2026-04-14','Cofap','Suspensão',4,190.00,330.00,''),(12,'Lâmpada Farol H4 35W','2026-04-14','Philips','Elétrica',30,10.50,24.00,''),(13,'Disco de Freio Dianteiro','2026-04-14','Scud','Freios',8,55.00,98.00,''),(14,'Câmara de Ar Aro 18','2026-04-14','Tortuga','Pneus',45,18.00,42.00,''),(15,'Retentor de Bengala','2026-04-14','Corteco','Suspensão',20,14.00,45.00,''),(16,'Manete de Freio Prata','2026-04-14','Cometa','Guidão',15,12.00,32.00,''),(17,'Retrovisor Par Mod. Original','2026-04-14','GVS','Acessórios',22,25.00,55.00,''),(18,'Kit Cilindro e Pistão 125','2026-04-14','MetalLeve','Motor',5,160.00,295.00,''),(19,'Junta do Cabeçote','2026-04-14','Vedamotors','Motor',12,5.00,14.00,''),(20,'Manopla Esportiva Preta','2026-04-14','Circuit','Acessórios',15,14.50,35.00,'');
/*!40000 ALTER TABLE `tb_cadastro_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_movimentacoes`
--

DROP TABLE IF EXISTS `tb_movimentacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_movimentacoes` (
  `id_mov` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `tipo_operacao` varchar(10) NOT NULL,
  `quantidade` int NOT NULL,
  `data_movimentacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `vendidos` int DEFAULT '0',
  `valor_total_venda` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id_mov`),
  KEY `fk_produto` (`id_produto`),
  CONSTRAINT `fk_produto` FOREIGN KEY (`id_produto`) REFERENCES `tb_cadastro_prod` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_movimentacoes`
--

LOCK TABLES `tb_movimentacoes` WRITE;
/*!40000 ALTER TABLE `tb_movimentacoes` DISABLE KEYS */;
INSERT INTO `tb_movimentacoes` VALUES (1,11,'VENDA',5,'2026-04-14 17:54:04',0,0.00);
/*!40000 ALTER TABLE `tb_movimentacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vendas`
--

DROP TABLE IF EXISTS `tb_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total_item` decimal(10,2) GENERATED ALWAYS AS ((`quantidade` * `valor_unitario`)) VIRTUAL,
  `forma_pagamento` varchar(20) DEFAULT NULL,
  `data_venda` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venda`),
  KEY `fk_produto_venda` (`id_produto`),
  CONSTRAINT `fk_produto_venda` FOREIGN KEY (`id_produto`) REFERENCES `tb_cadastro_prod` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vendas`
--

LOCK TABLES `tb_vendas` WRITE;
/*!40000 ALTER TABLE `tb_vendas` DISABLE KEYS */;
INSERT INTO `tb_vendas` (`id_venda`, `id_produto`, `quantidade`, `valor_unitario`, `forma_pagamento`, `data_venda`) VALUES (1,11,5,330.00,NULL,'2026-04-14 17:54:04');
/*!40000 ALTER TABLE `tb_vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-14 17:55:31
