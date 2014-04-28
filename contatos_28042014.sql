CREATE DATABASE  IF NOT EXISTS `contatos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `contatos`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: contatos
-- ------------------------------------------------------
-- Server version	5.6.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `deptos`
--

DROP TABLE IF EXISTS `deptos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptos` (
  `id_depto` int(11) NOT NULL AUTO_INCREMENT,
  `depto_nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id_depto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptos`
--

LOCK TABLES `deptos` WRITE;
/*!40000 ALTER TABLE `deptos` DISABLE KEYS */;
INSERT INTO `deptos` (`id_depto`, `depto_nome`) VALUES (1,' -'),(2,'ABASTECIMENTO '),(3,'ACM'),(4,'ALMOXARIFADO'),(5,'COMERCIAL'),(6,'COMPRAS'),(7,'CONTABILIDADE'),(8,'DIRETORIA'),(9,'DOP'),(10,'EXPEDICAO'),(11,'FATURAMENTO'),(12,'FINANCEIRO'),(13,'FISCAL'),(14,'FROTA'),(15,'JURIDICO'),(16,'LICENCAS'),(17,'MANUTENCAO'),(18,'OPERACIONAL'),(19,'ORCAMENTO'),(20,'POS VENDA '),(21,'PRESIDENCIA'),(22,'PRICE'),(23,'PROGRAMACAO'),(24,'PROJETOS LOGISTICOS'),(25,'QUALIDADE'),(26,'RH'),(27,'SGF'),(28,'TI'),(29,'TRAFEGO'),(30,'SEGURANCA DO TRABALHO '),(31,'DP');
/*!40000 ALTER TABLE `deptos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiais`
--

DROP TABLE IF EXISTS `filiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filiais` (
  `id_filial` int(11) NOT NULL AUTO_INCREMENT,
  `filial_nome` varchar(150) NOT NULL,
  `filial_img` varchar(45) NOT NULL,
  `filiais_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_filial`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiais`
--

LOCK TABLES `filiais` WRITE;
/*!40000 ALTER TABLE `filiais` DISABLE KEYS */;
INSERT INTO `filiais` (`id_filial`, `filial_nome`, `filial_img`, `filiais_status`) VALUES (1,'PIRACICABA','Intranet_pira.jpg',1),(2,'ALUMINIO','Intranet_Aluminio.jpg',1),(3,'ARARAQUARA','Intranet_araraquara.jpg',1),(4,'CAMAÇARI','Intranet_camacari.jpg',1),(5,'CAMPO GRANDE','Intranet_campogrande.jpg',1),(6,'CATALÃO','Intranet_catalao.jpg',1),(7,'HORIZONTINA','Intranet_Horizontina.jpg',1),(8,'JACAREI','Intranet_jacarei.jpg',1),(9,'MONTE NEGRO','Intranet_montenegro.jpg',1),(10,'PINDAMONHANGABA','Intranet_pinda.jpg',1),(11,'SERRA','Intranet_serra.jpg',1),(12,'SOROCABA','Intranet_sorocaba.jpg',1);
/*!40000 ALTER TABLE `filiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_nome` varchar(150) CHARACTER SET ucs2 NOT NULL,
  `pessoa_filial` int(11) NOT NULL,
  `pessoa_depto` int(11) DEFAULT NULL,
  `pessoa_email` varchar(150) CHARACTER SET ucs2 DEFAULT NULL,
  `pessoa_ramal` varchar(4) CHARACTER SET ucs2 DEFAULT NULL,
  `pessoa_ramaldireto` varchar(15) CHARACTER SET ucs2 DEFAULT NULL,
  `pessoa_celulartim` varchar(15) CHARACTER SET ucs2 DEFAULT NULL,
  `pessoa_nextel` varchar(15) CHARACTER SET ucs2 DEFAULT NULL,
  `pessoa_status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_pessoa`),
  KEY `pessoa_filial_idx` (`pessoa_filial`),
  KEY `pessoa_depto_idx` (`pessoa_depto`),
  KEY `pesosa_status_idx` (`pessoa_status`),
  CONSTRAINT `pesosa_status` FOREIGN KEY (`pessoa_status`) REFERENCES `status` (`idstatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_depto` FOREIGN KEY (`pessoa_depto`) REFERENCES `deptos` (`id_depto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_filial` FOREIGN KEY (`pessoa_filial`) REFERENCES `filiais` (`id_filial`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` (`id_pessoa`, `pessoa_nome`, `pessoa_filial`, `pessoa_depto`, `pessoa_email`, `pessoa_ramal`, `pessoa_ramaldireto`, `pessoa_celulartim`, `pessoa_nextel`, `pessoa_status`) VALUES (1,'ALEXANDRE STABILE ',2,1,'alexandre.stabile@flechadeprata.com.br','- ','-','(19) 98217-1434','- ',1),(2,'DRIELE PAULO ',3,1,'driele.paulo@flechadeprata.com.br ','- ','-','(19) 98217-7452','- ',1),(3,'GUILHERME SANTOS ',3,1,'guilherme.santos@flechadeprata.com.br ','- ','-','(19) 98217-3246','- ',1),(4,'EBERTON SILVA',4,1,'eberton.silva@flechadeprata.com.br ','- ','-','(19) 98258-5921','- ',1),(5,'SIDINALDO SANTOS',4,1,'sidinaldo.santos@flechadeprata.com.br ','- ','-','(19) 98327-5511','- ',1),(6,'DAVI MATOS ',5,1,'davi.matos@flechadeprata.com.br ','- ','(67) 3358-1400 ','(19) 98217-6815','- ',1),(7,'JORCELINO BARBOSA ARANTES ',5,1,'jorcelino.arantes@flechadeprata.com.br ','- ','(67) 3358-1400 ','(19) 98217-1284','- ',1),(8,'MARIA LUIZA',5,1,'maria.luiza@flechadeprata.com.br ','- ','(67) 3358-1400 ','(19) 98258-6214','- ',1),(9,'ROBERTO JUNIOR ',5,1,'roberto.junior@flechadeprata.com.br ','- ','(67) 3358-1400 ','(19) 98217-7483','- ',1),(10,'RODRIGO SOUZA',5,1,'rodrigo.souza@flechadeprata.com.br ','- ','(67) 3358-1400 ','- ','- ',1),(11,'LEANDRO PIRES ',6,1,'leandro.pires@flechadeprata.com.br ','- ','-','(19) 98258-6152','- ',1),(12,'MARCIO KRAMPE ',7,1,'marcio.krampe@flechadeprata.com.br ','- ','-','(19) 98217-7742','- ',1),(13,'ANDRE OLIVEIRA',8,1,'andre.oliveira@flechadeprata.com.br ','- ','-','(19) 98217-6359','- ',1),(14,'FABIO ROCHA ',9,1,'fabio.rocha@flechadeprata.com.br ','- ','-','(19) 98217-7621','- ',1),(15,'FABIO SOUZA',10,1,'fabio.souza@flechadeprata.com.br ','- ','-','(19) 98217-7476','- ',1),(16,'VITOR BROTERO ',10,1,'vitor.brotero@flechadeprata.com.br ','- ','-','(19) 98327-5500','- ',1),(17,'ADRIANO SILVA',1,18,'adriano.silva@flechadeprata.com.br','1423','(19) 3429-0483','(19) 98217-1078','-',0),(18,'AGNALDO SILVA',1,5,'agnaldo.silva@flechadeprata.com.br','1411','(19) 3429-0471','(19) 98217-1730','5*16374',1),(19,'ALESSANDRA SILVA ',1,29,'alessandra.silva@flechadeprata.com.br ','1456','(19) 3429-0616','(19) 98128-2890','- ',1),(20,'ALEX DESTRO ',1,5,'alex.destro@flechadeprata.com.br ','1449','(19) 3429-0611','(19) 98217-7126','- ',1),(21,'ALINE LAUREANO ',1,11,'aline.laureano@flechadeprata.com.br','1461','(19) 3429-0621','-','-',0),(22,'ANA ALVES ',1,17,'anapaula.alves@flechadeprata.com.br ','1452','(19) 3429-0614','(19) 98258-6291','-',1),(23,'ANDRE COSTA',1,18,'andre.costa@flechadeprata.com.br ','1416','(19) 3429-0476','(19) 98217-7471','-',1),(24,'ANDREIA BETIOL ',1,13,'andreia.betiol@flechadeprata.com.br ','1474','(19) 3429-0634','- ','- ',1),(25,'ANGELO MACHI ',1,4,'angelo.machi@flechadeprata.com.br ','1476','(19) 3429-0636','(19) 98258-6026','- ',1),(26,'ANTONIO GRANZOTO ',1,11,'antonio.granzoto@flechadeprata.com.br ','1497','(19) 3429-0657','-','-',1),(27,'ANTONIO MIGUEL ',1,10,'antonio.miguel@flechadeprata.com.br ','1439','-','(19) 98258-6327','99*78884 ',1),(28,'BRUNA SANTOS ',1,12,'bruna.santos@flechadeprata.com.br ','1406','(19) 3429-1406','-','- ',1),(29,'BRUNO RAYA ',1,26,'bruno.raya@flechadeprata.com.br ','1493','(19) 3429-0653','(19) 98217-3007','- ',1),(30,'CARLA MATIAS ',1,3,'carla.matias@flechadeprata.com.br ','1498','(19) 3429-0658','(19) 98217-6778','- ',1),(31,'CARLA ROCHA ',1,13,'carla.rocha@flechadeprata.com.br ','-','-','(19) 98217-6885','- ',1),(32,'CHRISTIAN SANTOS',1,28,'christian.santos@flechadeprata.com.br','1483','(19) 3429-0643','(19) 98217-6777','-',1),(33,'DANIEL SANTOS ',1,30,'daniel.santos@flechadeprata.com.br ','1499','(19) 3429-0493','(19) 98258 -635','- ',1),(34,'DANIEL TORNISIELO ',1,28,'daniel.tornisielo@flechadeprata.com.br ','1437','(19) 3429-1437 ','(19) 98217-6905','- ',1),(35,'DANILO OLIVEIRA ',1,5,'danilo.oliveira@flechadeprata.com.br ','1402','(19) 3429-1402 ','(19) 98217-7839','- ',1),(36,'DEBORA SILVESTRE ',1,15,'debora.silvestre@flechadeprata.com.br ','1445','(19) 3429-0497','-','-',1),(37,'DIEGO BOTELHO',1,9,'diego.botelho@flechadeprata.com.br ','1464','(19) 3429-0624','(19) 98217-1802','-',1),(38,'EDUARDO FIGUEIREDO',1,23,'eduardo.figueiredo@flechadeprata.com.br ','1427','(19) 3429-0487','(19) 98217-1888','99*98055 ',1),(39,'ELIS CARDOZO ',1,12,'elis.cardozo@flechadeprata.com.br ','1455','(19) 3429-0615','-','- ',1),(40,'FABIO ASSARICE ',1,28,'fabio.assarice@flechadeprata.com.br ','- ','- ','(19) 98217-1239','- ',1),(41,'FELIPE BELLOTE ',1,6,'felipe.bellote@flechadeprata.com.br ','1442','(19) 3429-0494 ','- ','- ',1),(42,'GABRIEL ANDIA ',1,19,'gabriel.andi@flechadeprata.com.br ','1456','(19) 3429-0616','-','- ',1),(43,'GESSICA OVIDIO',1,20,'gessica.ovidio@flechadeprata.com.br ','1410','(19) 3429-0470','(19) 98217-7683','-',1),(44,'GIOVANA ANTONIOLLI ',1,31,'giovana.antoniolli@flechadeprata.com.br ','1496','(19) 3429-0656','(19) 98217-7308','- ',1),(45,'GISELE FERREIRA ',1,7,'giseli.ferreira@flechadeprata.com.br ','- ',NULL,'- ','-',1),(46,'GISLENE AMATI',1,12,'gislene.amati@flechadeprata.com.br ','1469','(19) 3429-0629','-','-',1),(47,'GUILHERME BARBOSA',1,10,'guilherme.barbosa@flechadeprata.com.br ','1426','(19) 3429-0486','(19) 98217-0970','5*14363 ',1),(48,'GUSTAVO GRACA ',1,18,'gustavo.graca@flechadeprata.com.br ','1418','(19) 3429-0478','(19) 98217-6949','- ',1),(49,'GUSTAVO SILVA ',1,23,'gustavo.silva@flechadeprata.com.br ','1424','(19) 3429-1439','-','-',1),(50,'HUGO AMSTALDEN ',1,12,'hugo.amstalden@flechadeprata.com.br ','1462','(19) 3429-0622','(19) 98217-1634','- ',1),(51,'HUGO COSTA ',1,5,'hugo.costa@flechadeprata.com.br ','1419','(19) 3429- 0479','(19) 98217-2726','- ',1),(52,'IGOR SIMOES ',1,17,'igor.simoes@flechadeprata.com.br ','1477','(19) 3429-0637','(19) 98217-7677','-',1),(53,'IVAN ROMAO ',1,17,'ivan.romao@flechadeprata.com.br ','1444','(19) 3429-0496','(19) 98217-7071','- ',1),(54,'JACQUELINE GARCIA ',1,20,'jacqueline.garcia@flechadeprata.com.br ','1404','(19) 3429-1404','(19) 98217-7252','- ',1),(55,'JAISON GONCALVES ',1,29,'jaison.goncalves@flechadeprata.com.br ','1460','(19) 3429-0620','(19) 98217-7786','99*142969 ',1),(56,'JENNIFER FERRAZZA',1,8,'jennifer.ferrazza@flechadeprata.com.br ','1487','(19) 3429-0647','(19) 98217-7931','-',1),(57,'JESSICA RAMOS',1,5,'jessica.ramos@flechadeprata.com.br ','1408','(19) 3429-1408','(19) 98217-6938','-',1),(58,'JHONNATHAN FERRAZA',1,8,'jhon@flechadeprata.com.br ','1485','(19) 3429-0645','(19) 98217-7961','-',1),(59,'JHONNY FERRAZZA',1,8,'jhonny.ferrazza@flechadeprata.com.br ','1486','(19) 3429-0646','(19) 98217-7078','-',1),(60,'JOSIANE DELABIO ',1,20,'josiane.delabio@flechadeprata.com.br','1405','(19) 3429-1405','(19) 98217-7353','-',1),(61,'JULIO FERREIRA ',1,5,'julio.ferreira@flechadeprata.com.br','1435','(19) 3429-1435','(19) 98217-7815',NULL,1),(62,'LARISSA MORAIS ',1,20,'larissa.morais@flechadeprata.com.br ','1409','(19) 3429-1409','(19) 98217-7317','- ',1),(63,'LEONARDO BIANCHIM ',1,26,'leonardo.bianchim@flechadeprata.com.br ','1473','(19) 3429-0633','(19) 98217-1441','- ',1),(64,'LEONARDO SOUZA',1,18,'leonardo.souza@flechadeprata.com.br','1421','(19) 3429-0481','(19) 98217-1847','-',1),(65,'LIDIANE SILVA ',1,5,'lidiane.silva@flechadeprata.com.br ','1433','(19) 3429-1433','- ','- ',1),(66,'LUCAS NOGUEIRA ',1,18,'lucas.nogueira@flechadeprata.com.br ','1479','(19) 3429-0639','-','- ',1),(67,'LUIZ FERRAZZA',1,21,'luiz.ferrazza@flechadeprata.com.br ','1488','(19) 3429-0648','(19) 98217-7837','-',1),(68,'MANOEL LIMA ',1,2,'manoel.lima@flechadeprata.com.br','1457','(19) 3429-0617','(19) 98217-7187','-',1),(69,'MARCELO PEREIRA ',1,11,'marcelo.pereira@flechadeprata.com.br ','1415','(19) 3429-0475','-','- ',1),(70,'MARCOS BIELAVSKI ',1,5,'marcos.bielavski@flechadeprata.com.br ','-','-','(19) 98217-7854','- ',1),(71,'MARCOS FERREIRA ',1,18,'marcos.ferreira@flechadeprata.com.br ','1478','(19) 3429-0638','(19) 98217-1585','-',1),(72,'MARINA PESCIM',1,12,'marina.pescim@flechadeprata.com.br','1438','(19) 3429-1438','(19) 98327-5544','- ',1),(73,'MATHEUS IZAQUE ',1,18,'matheus.izaque@flechadeprata.com.br ','1430','(19) 3429-1430','(19) 98217-7258','99*98488 ',1),(74,'MAYARA POLIZEL ',1,27,'mayara.polizel@flechadeprata.com.br ','1428','(19) 3429-0488','(19) 98217-6946','-',1),(75,'NATHALIA MARTINS ',1,5,'nathalia.martins@flechadeprata.com.br ','1434','(19) 3429-1434','(19) 98217-7140','-',1),(76,'NICOLI REIS ',1,26,'nicoli.reis@flechadeprata.com.br ','1463','(19) 3429-0623','-','- ',1),(77,'PORTARIA',1,26,'portaria.flecha@flechadeprata.com.br ','1484','(19) 3429-0644','(19) 98113-3663','-',1),(78,'PRISCILA REIS ',1,14,'priscila.reis@flechadeprata.com.br ','1480','(19) 3429-0640','(19) 98217-7092','- ',1),(79,'RAFAELA MELLEGA ',1,31,'rafaela.mellega@flechadeprata.com.br ','1492','(19) 3429-0652','(19) 98217-7137','-',1),(80,'REGIANE PEDRO ',1,31,'regiane.pedro@flechadeprata.com.br ','1466','(19) 3429-0626','-','-',1),(81,'RENATO TARARAM ',1,6,'renato.tararam@flechadeprata.com.br ','1412','(19) 3429-0472','(19) 98217-6827','99*144370 ',1),(82,'RICARDO RASERA',1,16,'ricardo.rasera@flechadeprata.coom.br ','1447','(19) 3429-0499','(19) 98217-6957','99*201088',1),(83,'ROBERTO DIAS ',1,17,'roberto.dias@flechadeprata.com.br ','- ',NULL,'-','-',1),(84,'SHEILA CUNHA',1,18,'sheila.cunha@flechadeprata.com.br ','1450','(19) 3429-0612','(19) 98327-0341','-',1),(85,'TAIS MARTINS ',1,6,'tais.martins@flechadeprata.com.br ','1432','(19) 3429-1432','-','- ',1),(86,'TELMA LIMA',1,11,'telma.lima@flechadeprata.com.br ','1459','(19) 3429-0619','(19) 98217-7382','-',1),(87,'THAIS BARBOSA ',1,7,'thais.barbosa@flechadeprata.com.br ','- ',NULL,'-','-',1),(88,'THIAGO SILVA ',1,21,'thiago.silva@flechadeprata.com.br ','1453','(19) 3429-0491','- ','- ',1),(89,'VAGNER PEREIRA ',1,7,'vagner.pereira@flechadeprata.com.br ','1471','(19) 3429-0631','(19) 98327-5522','-',1),(90,'VERONICA BENATTO ',1,7,'veronica.benatto@flechadeprata.com.br ','1472','(19) 3429-0632','-','- ',1),(91,'VICTOR VIEIRA',1,3,'victor.vieira@flechadeprata.com.br','1467','(19) 3429-0627','(19) 98217-7041','-',1),(92,'VINICIUS CASTRO',1,24,'vinicius.castro@flechadeprata.com.br ','1495','(19) 3429-0655','(19) 98217-6824','-',1),(93,'VIVIAN MIOTTO',1,25,'vivian.miotto@flechadeprata.com.br ','1481','(19) 3429-0641','-','-',1),(94,'WAGNER LARA ',1,23,'wagner.lara@flechadeprata.com.br ','1425','(19) 3429-0485','(19) 98355-2122','- ',1),(95,'YASMINE TEOTONIO ',1,26,'yasmine.teotonio@flechadeprata.com.br ','1400','(19) 3429-1400','-','- ',1),(96,'JOSE ROBERTO ',11,1,'jose.roberto@flechadeprata.com.br ','-','(27) 3185-5105 ','(19) 98217-1007','-',1),(97,'JEFERSON LIBORIO ',12,1,'jeferson.liborio@flechadeprata.com.br ','- ','- ','(19) 98217-7548','- ',1),(98,'SAMUEL GOES ',12,1,'samuel.goes@flechadeprata.com.br ','- ','- ','(19) 98327-5533','- ',1);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `idstatus` tinyint(4) NOT NULL,
  `status_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`idstatus`, `status_desc`) VALUES (0,'Inativo'),(1,'Ativo');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-28  0:08:32
