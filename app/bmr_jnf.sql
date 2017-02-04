-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24-Jan-2017 às 16:11
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bmr_jnf`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avisos_clientes`
--

CREATE TABLE `avisos_clientes` (
  `id_aviso` int(11) NOT NULL,
  `id_visita` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nota` text COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(1) NOT NULL,
  `data_fim` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avisos_fornecedores`
--

CREATE TABLE `avisos_fornecedores` (
  `id_aviso_deslocacao` int(11) NOT NULL,
  `id_deslocacao` int(11) NOT NULL,
  `data` date NOT NULL,
  `tipo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nota` text COLLATE utf8_unicode_ci NOT NULL,
  `activo` int(1) NOT NULL,
  `data_fim` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `imagem1` varchar(50) NOT NULL DEFAULT 'upload/nada.png',
  `imagem2` varchar(50) NOT NULL,
  `obs` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`, `imagem1`, `imagem2`, `obs`) VALUES
(1, 'Ligeiros', 'upload/carro_small.jpg', '', 'VeÃ­culos ligeiros'),
(2, 'Pesados', 'upload/camioes.jpg', '', 'VeÃ­culos Pesados'),
(3, 'Maquinaria', 'upload/maq.jpg', '', 'Maquinaria de obras pÃºblicas'),
(4, 'Agricultura', 'upload/trator_small.jpg', '', 'Equipamentos AgrÃ­colas'),
(5, 'PeÃ§as', 'upload/parts_small.jpg', '', 'PeÃ§as usadas diversas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL DEFAULT '',
  `morada` text NOT NULL,
  `localidade` varchar(50) NOT NULL DEFAULT '',
  `cod_postal` varchar(50) NOT NULL DEFAULT '',
  `nif` int(11) NOT NULL DEFAULT '0',
  `telefone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Listagem de Clientes';

-- --------------------------------------------------------

--
-- Estrutura da tabela `deslocacoes`
--

CREATE TABLE `deslocacoes` (
  `id_deslocacao` int(11) NOT NULL,
  `data` date NOT NULL,
  `id_fornecedor` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `deslocacoes_equipamentos`
--

CREATE TABLE `deslocacoes_equipamentos` (
  `id_deslocacao` int(11) NOT NULL,
  `id_equipamento` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `notas` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamentos`
--

CREATE TABLE `equipamentos` (
  `id_equipamento` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `iuc` tinyint(1) NOT NULL DEFAULT '0',
  `num_serie` varchar(50) NOT NULL,
  `ano` varchar(10) NOT NULL,
  `data` date NOT NULL,
  `data_compra` date NOT NULL,
  `horas` int(20) NOT NULL,
  `localizacao` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `altura` varchar(50) NOT NULL,
  `largura` varchar(50) NOT NULL,
  `comprimento` varchar(50) NOT NULL,
  `peso` varchar(50) NOT NULL,
  `preco` varchar(50) NOT NULL,
  `mostrar_preco` tinyint(1) NOT NULL DEFAULT '0',
  `obs` text NOT NULL,
  `video` varchar(100) NOT NULL,
  `matricula` varchar(15) NOT NULL,
  `status_equip` int(1) NOT NULL COMMENT '1=proprio;2=visto_num_fornecedor;3=vendido',
  `last_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `equipamentos`
--

INSERT INTO `equipamentos` (`id_equipamento`, `id_categoria`, `id_sub_categoria`, `id_marca`, `id_modelo`, `iuc`, `num_serie`, `ano`, `data`, `data_compra`, `horas`, `localizacao`, `estado`, `altura`, `largura`, `comprimento`, `peso`, `preco`, `mostrar_preco`, `obs`, `video`, `matricula`, `status_equip`, `last_update`) VALUES
(3, 3, 2, 4, 5, 0, 'K30031', '1998', '0000-00-00', '0000-00-00', 6740, 'LourinhÃ£', 'Muito bom', '', '', '', '', '27000', 0, 'Fez apenas desaterros.', 'https://www.youtube.com/watch?v=Cv3jJfav1jA', '', 0, '0000-00-00 00:00:00'),
(6, 3, 4, 3, 14, 0, '2RM01324', '1997', '0000-00-00', '0000-00-00', 0, 'FundÃ£o', '', '', '', '', '', '38000', 0, '', 'https://www.youtube.com/watch?v=82J_dXmEpaM', '', 0, '0000-00-00 00:00:00'),
(8, 3, 1, 3, 8, 0, '75W03106', '1989', '0000-00-00', '0000-00-00', 22234, 'FundÃ£o', 'Bom', '', '', '', '', '29000', 0, '', '', '', 0, '0000-00-00 00:00:00'),
(12, 3, 4, 3, 18, 0, '5EJ00166', '1994', '0000-00-00', '0000-00-00', 0, 'FundÃ£o', 'Muito bom', '', '', '', '', '17500', 0, '', '', '', 0, '0000-00-00 00:00:00'),
(14, 3, 4, 3, 19, 0, '4CL00172', '0', '0000-00-00', '0000-00-00', 0, 'FundÃ£o', 'Muito bom', '', '', '', '', '40000', 0, '', '', '', 0, '0000-00-00 00:00:00'),
(20, 5, 20, 3, 24, 0, '2405313', '2014', '0000-00-00', '0000-00-00', 0, '-', '', '', '', '', '', '2900', 1, 'Centralina CAT nÃ£o programada e pode ser aplicada em vÃ¡rios equipamentos CAT como escavadoras, bulldozers, etc.', '', '', 0, '0000-00-00 00:00:00'),
(22, 1, 21, 12, 26, 0, 'BJ40LV-KCW/P', '1978', '0000-00-00', '0000-00-00', 0, 'FundÃ£o', 'Muito bom', '', '', '', '', '11500', 1, 'ReconstruÃ­do em 2012, foi completamente tratado e pintado. O motor foi recondicionado, levou pistons, segmentos, camisas, etc. Escape completo. Tem capota e duas portas inteiras extra. Ideal para todo o terreno.', '', '', 0, '0000-00-00 00:00:00'),
(24, 3, 3, 3, 28, 0, '8WN00354', '1998', '0000-00-00', '0000-00-00', 0, 'FundÃ£o', 'Muito bom', '', '', '', '', '65000', 0, 'Completamente reparada, em perfeitas condiÃ§Ãµes de funcionamento.', '', '', 0, '0000-00-00 00:00:00'),
(27, 3, 18, 15, 30, 0, '30400131', '1994', '0000-00-00', '0000-00-00', 0, 'FundÃ£o', 'Muito bom', '', '', '', '', '45000', 0, 'Britador CÃ³nico SecundÃ¡rio EstÃ¡tico', '', '', 0, '0000-00-00 00:00:00'),
(29, 3, 2, 16, 31, 0, '1 D5 02926', '2005', '0000-00-00', '0000-00-00', 4400, 'FundÃ£o', 'Muito bom', '', '', '', '', '14000', 0, 'Em perfeitas condiÃ§Ãµes de funcionamento.', '', '', 0, '0000-00-00 00:00:00'),
(30, 3, 8, 17, 32, 0, '189478', '2003', '0000-00-00', '0000-00-00', 6868, 'FundÃ£o', 'Muito bom', '', '', '', '', '18000', 0, 'Em perfeitas condiÃ§Ãµes de funcionamento.', '', '', 0, '0000-00-00 00:00:00'),
(31, 3, 18, 18, 33, 0, '12397', '2009', '0000-00-00', '0000-00-00', 1390, 'Torres Novas', 'Muito bom', '', '', '', '', '120000', 0, 'Triple deck screener.', 'https://www.youtube.com/watch?v=Rw0GuBbTetc&feature=youtu.be', '', 0, '0000-00-00 00:00:00'),
(32, 3, 4, 3, 34, 0, '2CK00344', '1994', '0000-00-00', '0000-00-00', 5510, 'FundÃ£o', 'Muito bom', '', '', '', '', '19000', 0, '', '', '', 0, '0000-00-00 00:00:00'),
(33, 3, 5, 19, 35, 0, '-', '2003', '0000-00-00', '0000-00-00', 11000, 'Vila do Conde', 'Muito Bom', '', '', '', '', '22000', 1, '', '', '', 0, '0000-00-00 00:00:00'),
(34, 3, 2, 19, 36, 0, 'SLP JS102WE0712530', '1998', '0000-00-00', '0000-00-00', 14000, 'Algarve', 'Bom', '', '', '', '', '25000', 0, 'Material rolante bom, bomba hidraulica nova, motor reconstruido em 2014.', '', '', 0, '0000-00-00 00:00:00'),
(35, 4, 23, 20, 37, 0, '11P0102', '2001', '0000-00-00', '0000-00-00', 0, 'Guarda', 'Muito Bom', '', '', '', '', '6000', 0, 'Re: 82 - Long: 290', '', '', 0, '0000-00-00 00:00:00'),
(36, 4, 24, 21, 38, 0, '', '2001', '0000-00-00', '0000-00-00', 0, 'Guarda', '', '', '', '', '', '3000', 0, '3 Cilindros - 26 Cv', '', '', 0, '0000-00-00 00:00:00'),
(37, 3, 5, 22, 39, 0, '031023063', '2000', '0000-00-00', '0000-00-00', 0, 'Vila do Conde', 'Muito Bom', '', '', '', '', '20000', 1, '', '', '', 0, '0000-00-00 00:00:00'),
(38, 3, 2, 24, 41, 0, '1808', '1995', '0000-00-00', '0000-00-00', 10300, '', 'Usado', '', '', '', '', '24000', 1, '', '', '', 0, '0000-00-00 00:00:00'),
(39, 3, 2, 23, 40, 0, '', '1983', '0000-00-00', '0000-00-00', 10638, '', '', '', '', '', '38500', '16000', 1, 'Balde com dentes  1 m3.', '', '', 0, '0000-00-00 00:00:00'),
(40, 2, 13, 25, 42, 0, '', '2005', '0000-00-00', '0000-00-00', 1080345, 'FundÃ£o', 'Usado', '', '', '', '14500', '', 0, 'A/c; Cruise control; Intarder; FarÃ³is automÃ¡ticos;', '', '', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `nome_fornecedor` varchar(50) NOT NULL DEFAULT '',
  `morada` text NOT NULL,
  `localidade` varchar(50) NOT NULL DEFAULT '',
  `cod_postal` varchar(50) NOT NULL DEFAULT '',
  `nif` int(11) NOT NULL DEFAULT '0',
  `telefone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Listagem de Fornecedores';

-- --------------------------------------------------------

--
-- Estrutura da tabela `fotos`
--

CREATE TABLE `fotos` (
  `id_foto` int(11) NOT NULL,
  `id_equipamento` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_local` int(11) NOT NULL,
  `principal` tinyint(1) NOT NULL,
  `obs` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fotos`
--

INSERT INTO `fotos` (`id_foto`, `id_equipamento`, `foto`, `id_local`, `principal`, `obs`) VALUES
(4, 3, 'upload/DSC09411.JPG', 1, 0, ''),
(5, 3, 'upload/DSC09445.JPG', 1, 0, ''),
(6, 3, 'upload/DSC09416.JPG', 1, 0, ''),
(7, 3, 'upload/DSC09412.JPG', 1, 0, ''),
(8, 3, 'upload/DSC09413.JPG', 1, 0, ''),
(9, 3, 'upload/DSC09428.JPG', 1, 0, ''),
(10, 3, 'upload/DSC09436.JPG', 1, 0, ''),
(11, 3, 'upload/DSC09417.JPG', 1, 0, ''),
(12, 3, 'upload/DSC09420.JPG', 1, 0, ''),
(22, 3, 'upload/DSC09415.JPG', 1, 1, ''),
(38, 6, 'upload/DSC09774.JPG', 1, 1, ''),
(39, 6, 'upload/DSC09770.JPG', 1, 0, ''),
(40, 6, 'upload/DSC09769.JPG', 1, 0, ''),
(41, 6, 'upload/DSC09771.JPG', 1, 0, ''),
(42, 6, 'upload/DSC09773.JPG', 1, 0, ''),
(43, 6, 'upload/DSC09772.JPG', 1, 0, ''),
(54, 8, 'upload/d6d.JPG', 1, 1, ''),
(55, 8, 'upload/d6d_1.JPG', 1, 0, ''),
(56, 8, 'upload/d6d_2.JPG', 1, 0, ''),
(57, 8, 'upload/d6d_3.JPG', 1, 0, ''),
(59, 8, 'upload/d6d_6.JPG', 2, 0, ''),
(61, 8, 'upload/d6d_4.JPG', 5, 0, ''),
(86, 12, 'upload/DSC00125.JPG', 1, 1, ''),
(87, 12, 'upload/DSC00111.JPG', 1, 0, ''),
(88, 12, 'upload/DSC00112.JPG', 1, 0, ''),
(89, 12, 'upload/DSC00108.JPG', 1, 0, ''),
(90, 12, 'upload/DSC00128.JPG', 1, 0, ''),
(99, 14, 'upload/DSC00150.JPG', 1, 1, ''),
(100, 14, 'upload/DSC00145.JPG', 1, 0, ''),
(104, 14, 'upload/DSC00152.JPG', 1, 0, ''),
(105, 14, 'upload/DSC00146.JPG', 1, 0, ''),
(106, 14, 'upload/DSC00149.JPG', 1, 0, ''),
(137, 20, 'upload/20140704_141559.jpg', 1, 1, ''),
(138, 20, 'upload/20140630_134830.jpg', 1, 0, ''),
(166, 22, 'upload/IMG_6057.JPG', 1, 1, ''),
(167, 22, 'upload/IMG_6051.JPG', 1, 0, ''),
(168, 22, 'upload/IMG_6052.JPG', 1, 0, ''),
(170, 22, 'upload/IMG_6124a.JPG', 1, 0, ''),
(171, 22, 'upload/IMG_6140.JPG', 1, 0, ''),
(172, 22, 'upload/IMG_6055.JPG', 2, 0, ''),
(173, 22, 'upload/IMG_6169.JPG', 2, 0, ''),
(174, 22, 'upload/IMG_6067.JPG', 2, 0, ''),
(175, 22, 'upload/IMG_6168a.JPG', 2, 0, ''),
(179, 24, 'upload/DSC00701.JPG', 1, 1, ''),
(180, 24, 'upload/DSC00698.JPG', 1, 0, ''),
(181, 24, 'upload/DSC00699.JPG', 1, 0, ''),
(182, 24, 'upload/DSC00703.JPG', 1, 0, ''),
(183, 24, 'upload/DSC00704.JPG', 4, 0, ''),
(184, 24, 'upload/DSC00705.JPG', 1, 0, ''),
(185, 24, 'upload/DSC00702.JPG', 1, 0, ''),
(186, 24, 'upload/DSC00710.JPG', 1, 0, ''),
(187, 24, 'upload/DSC00706.JPG', 2, 0, ''),
(188, 24, 'upload/DSC00707.JPG', 1, 0, ''),
(189, 24, 'upload/DSC00711.JPG', 1, 0, ''),
(190, 24, 'upload/DSC00709.JPG', 1, 0, ''),
(213, 27, 'upload/DSC00690.JPG', 1, 1, ''),
(214, 27, 'upload/DSC00691.JPG', 1, 0, ''),
(215, 27, 'upload/DSC00694.JPG', 1, 0, ''),
(216, 27, 'upload/DSC00696.JPG', 1, 0, ''),
(238, 29, 'upload/foto2.JPG', 1, 0, ''),
(239, 29, 'upload/foto4.JPG', 1, 0, ''),
(240, 29, 'upload/foto3.JPG', 1, 0, ''),
(241, 29, 'upload/foto5.JPG', 2, 0, ''),
(243, 30, 'upload/foto2m.JPG', 1, 0, ''),
(244, 30, 'upload/foto3m.JPG', 1, 0, ''),
(245, 30, 'upload/foto4m.JPG', 1, 0, ''),
(246, 30, 'upload/foto5m.JPG', 2, 0, ''),
(247, 30, 'upload/foto6m.JPG', 1, 0, ''),
(248, 30, 'upload/foto7m.JPG', 1, 0, ''),
(249, 29, 'upload/foto1Y.JPG', 1, 1, ''),
(250, 30, 'upload/foto1m.JPG', 1, 1, ''),
(251, 31, 'upload/842014-10-17 17.38.25.jpg', 1, 1, ''),
(252, 31, 'upload/232014-10-17 17.38.08.jpg', 1, 0, ''),
(253, 31, 'upload/372014-10-17 17.38.39.jpg', 1, 0, ''),
(254, 31, 'upload/462014-10-17 17.38.43.jpg', 1, 0, ''),
(255, 31, 'upload/92014-10-17 17.38.49.jpg', 1, 0, ''),
(256, 31, 'upload/442014-10-17 17.38.56.jpg', 1, 0, ''),
(257, 31, 'upload/782014-10-17 17.39.16.jpg', 1, 0, ''),
(258, 31, 'upload/462014-10-17 17.39.25.jpg', 1, 0, ''),
(259, 31, 'upload/312014-10-17 17.39.45.jpg', 1, 0, ''),
(260, 31, 'upload/352014-10-17 17.42.28.jpg', 1, 0, ''),
(261, 31, 'upload/972014-10-17 17.42.39.jpg', 1, 0, ''),
(262, 31, 'upload/502014-10-17 17.43.28.jpg', 1, 0, ''),
(263, 31, 'upload/522014-10-17 17.43.28.jpg', 1, 0, ''),
(264, 31, 'upload/762014-10-17 17.47.42.jpg', 1, 0, ''),
(265, 31, 'upload/942014-10-17 17.42.13.jpg', 1, 0, ''),
(266, 31, 'upload/982014-10-17 17.40.01.jpg', 1, 0, ''),
(267, 31, 'upload/632014-10-17 17.42.02.jpg', 1, 0, ''),
(268, 31, 'upload/702014-10-17 17.39.45.jpg', 1, 0, ''),
(269, 32, 'upload/40cat 918_3.JPG', 1, 1, ''),
(270, 32, 'upload/44cat 918_4.JPG', 1, 0, ''),
(271, 32, 'upload/52cat 918_2.JPG', 1, 0, ''),
(272, 32, 'upload/13cat 918_5.JPG', 1, 0, ''),
(274, 32, 'upload/78cat 918.JPG', 1, 0, ''),
(275, 32, 'upload/1cat 918_7.JPG', 1, 0, ''),
(277, 33, 'upload/33IMG_0526.JPG', 1, 1, ''),
(279, 33, 'upload/92IMG_0525.jpg', 1, 0, ''),
(280, 33, 'upload/64IMG_0527B.jpg', 1, 0, ''),
(281, 33, 'upload/59IMG_0527.jpg', 1, 0, ''),
(282, 33, 'upload/0IMG_0523.jpg', 1, 0, ''),
(283, 33, 'upload/82IMG_0524.jpg', 1, 0, ''),
(284, 33, 'upload/24IMG_0520.jpg', 1, 0, ''),
(285, 33, 'upload/3IMG_0521.jpg', 1, 0, ''),
(287, 33, 'upload/92IMG_0522.jpg', 1, 0, ''),
(289, 34, 'upload/7020150217_130623.jpg', 1, 1, ''),
(290, 34, 'upload/3020150217_130643.jpg', 1, 0, ''),
(291, 34, 'upload/7420150217_130717.jpg', 1, 1, ''),
(292, 34, 'upload/5320150217_130658.jpg', 1, 0, ''),
(293, 34, 'upload/7420150217_130708.jpg', 1, 0, ''),
(294, 34, 'upload/8320150217_131418.jpg', 1, 0, ''),
(295, 34, 'upload/5320150217_131409.jpg', 1, 0, ''),
(296, 35, 'upload/43DSC03605.JPG', 1, 1, ''),
(297, 35, 'upload/83DSC03606.JPG', 1, 0, ''),
(298, 35, 'upload/47DSC03607.JPG', 1, 0, ''),
(299, 35, 'upload/89DSC03608.JPG', 1, 0, ''),
(300, 35, 'upload/23DSC03609.JPG', 1, 0, ''),
(301, 35, 'upload/87DSC03614.JPG', 1, 0, ''),
(302, 35, 'upload/64DSC03615.JPG', 1, 0, ''),
(303, 35, 'upload/1DSC03617.JPG', 1, 0, ''),
(304, 35, 'upload/91DSC03622.JPG', 1, 0, ''),
(305, 35, 'upload/86DSC03619.JPG', 1, 0, ''),
(306, 35, 'upload/72DSC03623.JPG', 1, 0, ''),
(307, 35, 'upload/1DSC03638.JPG', 1, 0, ''),
(308, 35, 'upload/91DSC03636.JPG', 1, 0, ''),
(309, 35, 'upload/82DSC03634.JPG', 1, 0, ''),
(310, 36, 'upload/16DSC03654.JPG', 1, 1, ''),
(311, 36, 'upload/87DSC03656.JPG', 1, 0, ''),
(312, 36, 'upload/45DSC03658.JPG', 1, 0, ''),
(313, 36, 'upload/25DSC03660.JPG', 1, 0, ''),
(314, 36, 'upload/64DSC03661.JPG', 1, 0, ''),
(315, 36, 'upload/56DSC03665.JPG', 1, 0, ''),
(316, 36, 'upload/37DSC03663.JPG', 1, 0, ''),
(317, 36, 'upload/47DSC03666.JPG', 1, 0, ''),
(318, 36, 'upload/28DSC03681.JPG', 1, 0, ''),
(319, 36, 'upload/89DSC03675.JPG', 1, 0, ''),
(320, 36, 'upload/98DSC03677.JPG', 1, 0, ''),
(321, 37, 'upload/86IMG_4745.JPG', 1, 1, ''),
(324, 37, 'upload/91IMG_4744.JPG', 1, 0, ''),
(325, 37, 'upload/72IMG_4738.JPG', 1, 0, ''),
(326, 37, 'upload/90IMG_4741.JPG', 1, 0, ''),
(327, 37, 'upload/87IMG_4740.JPG', 1, 0, ''),
(328, 37, 'upload/56IMG_4739.JPG', 1, 0, ''),
(329, 37, 'upload/80IMG_4742.JPG', 1, 0, ''),
(330, 37, 'upload/46IMG_4746.JPG', 1, 0, ''),
(331, 38, 'upload/86Akerman voorkant.jpg', 1, 1, ''),
(332, 38, 'upload/20Akerman voor zijaanzicht.jpg', 1, 0, ''),
(333, 38, 'upload/34Akerman H7M zijkant.jpg', 1, 0, ''),
(334, 38, 'upload/72Akerman achterkant.jpg', 1, 0, ''),
(336, 38, 'upload/22Akerman Cabine.jpg', 1, 0, ''),
(337, 38, 'upload/85Akerman hydrauliek.jpg', 1, 0, ''),
(338, 38, 'upload/30Akerman Volvo motor.jpg', 1, 0, ''),
(339, 39, 'upload/20IMG_20150512_170753 a.jpg', 1, 1, ''),
(340, 39, 'upload/82IMG_20150512_170906 a.jpg', 1, 0, ''),
(341, 39, 'upload/62IMG_20150512_170944 a.jpg', 1, 0, ''),
(342, 39, 'upload/41IMG_20150512_170834 a.jpg', 1, 0, ''),
(343, 39, 'upload/82IMG_20150512_170927 a.jpg', 1, 0, ''),
(344, 39, 'upload/9IMG_20150512_171047 a.jpg', 1, 0, ''),
(345, 39, 'upload/51IMG_20150512_171015 a.jpg', 1, 0, ''),
(346, 39, 'upload/56IMG_20150512_171128 a.jpg', 1, 0, ''),
(347, 40, 'upload/67DSC05816.JPG', 1, 1, ''),
(348, 40, 'upload/39DSC05819.JPG', 1, 0, ''),
(349, 40, 'upload/94DSC05818.JPG', 1, 0, ''),
(350, 40, 'upload/59DSC05823.JPG', 1, 0, ''),
(351, 40, 'upload/100DSC05824.JPG', 1, 0, ''),
(354, 40, 'upload/74DSC05849.JPG', 1, 0, ''),
(355, 40, 'upload/100DSC05850.JPG', 1, 0, ''),
(356, 40, 'upload/12DSC05825.JPG', 1, 0, ''),
(357, 40, 'upload/100DSC05839.JPG', 1, 0, ''),
(358, 40, 'upload/26DSC05843.JPG', 1, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_logins`
--

CREATE TABLE `main_logins` (
  `id_main_logins` int(11) NOT NULL,
  `ssid` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `modulo` varchar(50) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `hora_logout` datetime DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `res` varchar(50) DEFAULT NULL,
  `browser` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Listagem de Logins';

--
-- Extraindo dados da tabela `main_logins`
--

INSERT INTO `main_logins` (`id_main_logins`, `ssid`, `login`, `modulo`, `datahora`, `hora_logout`, `ip`, `res`, `browser`) VALUES
(266, 'ql75kgennho2mp4unf5joaula0', 'user', 'gestao', '2012-03-02 00:03:31', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(261, 'bga6dhps5osn4rmns52ub759d1', 'admin', 'gestao', '2012-03-01 23:03:58', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(262, '4od7subngai402fkko6do42453', 'admin', 'gestao', '2012-03-01 23:03:05', '2012-03-02 00:03:10', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(263, '0dm6ukvmp3f5gri6g8f74au1q6', 'admin', 'administrador', '2012-03-02 00:03:15', '2012-03-02 00:03:28', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(264, 's57qquut6cmf4aa6302gbub064', 'user', 'gestao', '2012-03-02 00:03:35', '2012-03-02 00:03:12', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(265, 'etg08muktbloljhcs8uk7ksd93', 'admin', 'administrador', '2012-03-02 00:03:16', '2012-03-02 09:03:01', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(267, '', 'admin', '', '2012-03-03 10:03:44', NULL, '192.168.1.80', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(268, 'a48u5sjepgoh83hmul0lveaal4', 'admin', 'administrador', '2012-03-03 10:03:50', NULL, '192.168.1.80', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(269, 'ijefci69tr3qc1c0kbracmavh5', 'admin', 'administrador', '2012-03-03 10:03:48', NULL, '93.102.129.84', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(270, '', 'admin', '', '2012-03-05 10:03:41', NULL, '2.82.23.22', 'nok', 'Mozilla/5.0 (Windows NT 5.1; rv:10.0.2) Gecko/2010'),
(271, 'ngj3bk8gs5pu140pihjt2flie2', 'admin', 'administrador', '2012-03-05 22:03:01', '2012-03-05 22:03:46', '188.81.242.211', 'ok', 'Mozilla/5.0 (Linux; U; Android 4.0.3; pt-pt; Trans'),
(272, '21uea7bhnnnrsguc8oriq6p0p6', 'admin', 'administrador', '2012-03-05 22:03:47', NULL, '188.81.242.211', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(273, '4nug4u9ffli33qa9vbqq6v0732', 'user', 'gestao', '2012-03-05 22:03:42', NULL, '188.81.242.211', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(274, 'i0ls14nvee4d82at9nnohiluv6', 'user', 'gestao', '2012-03-05 22:03:05', NULL, '188.81.242.211', 'ok', 'Mozilla/5.0 (Linux; U; Android 4.0.3; pt-pt; Trans'),
(275, 'ac3etnosp64ru1a1cu5pc635m6', 'admin', 'administrador', '2012-03-12 12:03:12', NULL, '2.82.1.216', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(276, '2s9nv7g46q3b4dbr3ihg0fnfs3', 'admin', 'administrador', '2012-03-12 22:03:57', '2012-03-12 22:03:38', '188.80.246.94', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(277, 'uovl0mpvn1qhbi72q5nblsguc4', 'admin', 'administrador', '2012-03-12 22:03:43', '2012-03-12 22:03:58', '188.80.246.94', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(278, 'pfagcs2j92tseomcsmj7mrih01', 'user', 'gestao', '2012-03-12 22:03:08', NULL, '188.80.246.94', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(279, '5j0bghikuahbsv81gfs18i29e5', 'admin', 'administrador', '2012-03-12 22:03:38', NULL, '188.80.246.94', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(280, '3tfoar21v1djh7nan6uosadg63', 'user', 'gestao', '2012-03-12 22:03:26', NULL, '188.80.246.94', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(281, 'u20ckchk83a796sp70p0t92ob4', 'user', 'gestao', '2012-03-14 18:03:02', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(282, 'dvq1gnuumttqpcifjus4pkekk1', 'user', 'gestao', '2012-03-14 22:03:20', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(283, 'o8rsume24qrdveogg2cvi22oo0', 'user', 'gestao', '2012-03-14 22:03:45', '2012-03-14 22:03:28', '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(284, 'naiq9raj9057cm9eorj12f3cu0', 'admin', 'administrador', '2012-03-14 22:03:37', '2012-03-14 23:03:21', '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(285, 'c719gr24iho13qatbr2ecfmtm5', 'user', 'gestao', '2012-03-14 23:03:24', '2012-03-14 23:03:36', '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(286, 'f4eeuv6887rcbtvu6e80j242l3', 'admin', 'administrador', '2012-03-14 23:03:44', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(287, '5tls77b12b2lrci2hp6nigrkd7', 'admin', 'administrador', '2012-03-19 22:03:26', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(288, 'sqgsq81ub9a87f2v2bmcrjott4', 'user', 'gestao', '2012-03-19 22:03:31', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(289, '', 'user', '', '2012-03-19 22:03:11', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(290, '', 'user', '', '2012-03-19 22:03:18', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(291, 'l512u24dt71vtlia1gef1a4fu5', 'user', 'gestao', '2012-03-19 22:03:26', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(292, 'aiqqd046na071cgdof1jqdac15', 'admin', 'administrador', '2012-03-21 22:03:26', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(293, '9r08vvngi60vmrjqj91hsus9d6', 'user', 'gestao', '2012-03-21 22:03:33', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(294, 'aqhh26qdpua7ksuobt3pdgj3n2', 'user', 'gestao', '2012-03-21 22:03:35', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(295, 'meqktdlqljbcojlg4jnj8fj3o4', 'user', 'gestao', '2012-03-23 18:03:01', '2012-03-23 19:03:29', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(296, 'qrbo28timc4l9m306jsmhgpqm7', 'user', 'gestao', '2012-03-23 19:03:38', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(297, 'dtegikl06vklmnlp8f3s0v3re4', 'user', 'gestao', '2012-03-26 22:03:41', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(298, 'sjj41ubgt3jbn1oae95dk2lar1', 'admin', 'administrador', '2012-03-26 22:03:03', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(299, 'jimsncdv3lepuf43lckhl1t6f2', 'user', 'gestao', '2012-03-26 22:03:33', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(300, 'ae31ghcbdqamd846qlgstm22e3', 'user', 'gestao', '2012-03-29 22:03:42', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(301, '54e2p92p1h8tctjthc3hebecj5', 'user', 'gestao', '2012-03-29 22:03:09', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(302, '1qdqpo0foth2857kh3c5vbmi60', 'user', 'gestao', '2012-04-02 21:04:09', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(303, '', 'admin', '', '2012-04-02 21:04:18', NULL, '192.168.1.65', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(304, '9hpvk75nfqs8352ru4erjem1n3', 'admin', 'administrador', '2012-04-02 21:04:31', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(305, 's97ice5dptn1d7c7vbblnl2uo1', 'user', 'gestao', '2012-04-02 21:04:24', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(306, 'lvj049vhn9pufmfcjmat13h8f0', 'user', 'gestao', '2012-04-02 22:04:09', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(307, 'b0svo4ss7kh747gj43c0u41qa1', 'user', 'gestao', '2012-04-10 22:04:36', '2012-04-11 09:04:02', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(308, 'mbq2g4a1ukd2vk0lc6vfqgn177', 'user', 'gestao', '2012-04-10 22:04:42', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(309, '', 'admin', '', '2012-04-10 22:04:17', NULL, '192.168.1.65', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(310, '11ssai4o6ehs9neuuep2e2gu06', 'user', 'gestao', '2012-04-10 22:04:14', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(311, 'cb7n6d5iu7mohrj2jsd8h4mh90', 'user', 'gestao', '2012-04-15 10:04:55', '2012-04-15 16:04:07', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(312, '', 'user', '', '2012-04-16 21:04:31', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(313, 'hg3sons9bkmglk7fthqfijd353', 'user', 'gestao', '2012-04-16 21:04:38', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(314, 'g1jknh4h1gu3tmhulqlf0acbh2', 'user', 'gestao', '2012-04-16 21:04:31', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(315, 'kutp2fa3dglh8f0herl2b8one4', 'admin', 'administrador', '2012-04-16 22:04:39', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(316, '5hb4ve8k02o2usi8t5pdkqnb83', 'user', 'gestao', '2012-04-23 12:04:04', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(317, 'sk4vf218d9pupnes4n6772ih56', 'user', 'gestao', '2012-04-23 22:04:28', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(318, 'icb0fthj675nqqton0efoob5b5', 'admin', 'administrador', '2012-04-23 22:04:34', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(319, 'p4cqofpogcsrfna2vg2f8ekor0', 'admin', 'administrador', '2012-04-23 22:04:38', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(320, 'u52uhm6l1kpq7ctch4s9uj2722', 'user', 'gestao', '2012-04-23 22:04:43', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(321, '6eg6mc9kfghpvbhmlqqd0geg66', 'user', 'gestao', '2012-04-23 23:04:58', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(322, '', '', '', '2012-04-27 12:04:50', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(323, 'f805co56pibu1c0ckt1fmvb8r6', 'user', 'gestao', '2012-04-27 12:04:57', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(324, 't4patufr9an3qktcsffi6hupn2', 'user', 'gestao', '2012-04-29 22:04:12', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(325, 'ira84f5cmj3658hoa1a32bv4o6', 'user', 'gestao', '2012-04-29 22:04:15', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(326, '7nntetihq08mece2vl9jt2u134', 'admin', 'administrador', '2012-04-29 22:04:22', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(327, 'obhj8kq9c37bqg1s9t50ju6704', 'user', 'gestao', '2012-05-03 10:05:48', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(328, '871gdf7ir31sh1dqn06n8scea1', 'user', 'gestao', '2012-05-04 18:05:41', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(329, 'j7c8mddfd2sh2a17i0d5s01o50', 'user', 'gestao', '2012-05-04 22:05:25', '2012-05-05 10:05:25', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(330, 'vio2saj9cvsiip3l6e3cklo1g7', 'admin', 'administrador', '2012-05-04 22:05:14', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(331, '4dsjaus2eeuqph8a1ujj2ppl02', 'user', 'gestao', '2012-05-05 10:05:29', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(332, '98r4m6r62hj5qt9ips139pb9b2', 'user', 'gestao', '2012-05-05 11:05:52', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(333, 'basfp0rghq1e8uul6r8nvlopq1', 'user', 'gestao', '2012-05-07 22:05:49', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(334, 'hd6ms0mavg2rhhhd1459f3p976', 'user', 'gestao', '2012-05-08 22:05:19', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(335, 'r78oipj71fsbcq14min431gh33', 'user', 'gestao', '2012-05-08 23:05:56', NULL, '192.168.1.65', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(336, '4iktjv3qclvihaveoak900q394', 'user', 'gestao', '2012-05-10 16:05:45', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(337, 'a238cgnu5cft79m3kohocfmgf1', 'user', 'gestao', '2012-05-10 19:05:23', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(338, 'ic7gtfkgah7e906lsah6if3r97', 'user', 'gestao', '2012-05-10 19:05:07', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(339, 'rrnapi4r0osnk42s59ndvh4174', 'user', 'gestao', '2012-05-09 11:05:46', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(340, 's4ac8lsh4c36ctgjhkvusoo966', 'user', 'gestao', '2012-05-09 12:05:54', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(341, 'va4o01dkr21gnegdqlme478ua7', 'user', 'gestao', '2012-05-09 12:05:16', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(342, 'b9asfma3hcbee4ch5uasgpvsm5', 'user', 'gestao', '2012-05-09 12:05:22', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(343, 'sfhv962bnmfu1dpe3q62ipi9r2', 'USER', 'gestao', '2012-05-09 12:05:17', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(344, 'b6rcj8j9a693frlbf961bk5gd7', 'user', 'gestao', '2012-05-09 15:05:28', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(345, 'q71qags7dl0tjtf75ibv74ufv5', 'user', 'gestao', '2012-05-09 15:05:00', '2012-05-09 16:05:20', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(346, 'emb1j601pg15ijcpt5blccobc5', 'user', 'gestao', '2012-05-09 20:05:10', '2012-05-09 20:05:21', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(347, 'u3n2tf4e5ph4k23amncrncdii6', 'user', 'gestao', '2012-05-12 17:05:55', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(348, 'rn5q4c81g4k9u6cjj1vki4q7n0', 'user', 'gestao', '2012-05-14 13:05:46', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(349, 'kppei6vujl9dhipoij6m2r0ia0', 'user', 'gestao', '2012-05-14 13:05:34', '2012-05-14 15:05:49', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(350, 'pd4ofo5pbbi3vvlhf3nta1gjv5', 'user', 'gestao', '2012-05-14 15:05:21', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(351, '7196tn67t13p8ofgpqnqkrivn5', 'user', 'gestao', '2012-05-14 15:05:22', '2012-05-14 15:05:37', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(352, 'jlrptfhsts6bqfj4aph84vnhm1', 'user', 'gestao', '2012-05-15 10:05:56', '2012-05-15 10:05:27', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(353, '254dbcadbgs9o8n05gjvbup1j3', 'user', 'gestao', '2012-05-15 10:05:22', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(354, 'ivh956rk0jjtb65ocg397q5gq1', 'user', 'gestao', '2012-05-15 11:05:48', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(355, 'a7l2sqefvt2d5v3mt4sfrlmr86', 'user', 'gestao', '2012-05-15 11:05:19', '2012-05-15 11:05:27', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(356, 'qu3e0hks24rbftf58hrh1rc405', 'user', 'gestao', '2012-05-15 16:05:49', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(357, '176i502scu7i4m6lo8t2e3tg07', 'user', 'gestao', '2012-05-16 20:05:38', '2012-05-16 20:05:54', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(358, 'ft93ln43orhdbcbuvu91r2h5l0', 'user', 'gestao', '2012-05-16 20:05:57', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(359, 'sdgorkvnfmhk8aagrd2q79kg22', 'user', 'gestao', '2012-05-16 20:05:08', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(360, 'bac7rhi61vth3e9lksc7t450c6', 'user', 'gestao', '2012-05-17 20:05:44', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(361, 'h6v4qliod7992sc28e96am5m82', 'user', 'gestao', '2012-05-19 13:05:56', '2012-05-19 13:05:53', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(362, 'fq0cnqor53h2qt5v1fg28sm670', 'user', 'gestao', '2012-05-22 12:05:53', '2012-05-22 13:05:18', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(363, '49pf5r3meoj2n7aev3ntji8gn5', 'user', 'gestao', '2012-05-22 16:05:57', '2012-05-22 17:05:52', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(364, 'fv9fkli7gr1l2533rj92ndce70', 'user', 'gestao', '2012-05-29 16:05:34', '2012-05-29 16:05:19', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(365, '23tuou81earqhdfctbfvr2e747', 'user', 'gestao', '2012-05-29 16:05:14', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(366, 'd69st7ctu7qrp6qucdhpcm9ar1', 'user', 'gestao', '2012-05-29 18:05:49', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(367, 'mnahb6ejnq6hh2quat7d7cgpj4', 'user', 'gestao', '2012-05-29 20:05:02', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(368, '', 'USER', '', '2012-06-01 16:06:26', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(369, '7crs4p9kfl4b7cu6vecfp8jeq6', 'user', 'gestao', '2012-06-01 16:06:38', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(370, '0gpoq0idsim5sno434jmqp74f2', 'user', 'gestao', '2012-06-01 16:06:16', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(371, '', 'user', '', '2012-06-01 17:06:27', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(372, '59hk6pubh77d689o8602r355k5', 'user', 'gestao', '2012-06-01 17:06:38', '2012-06-01 17:06:23', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(373, 'vsm6ph8jgga4rrjmp91i39dh75', 'user', 'gestao', '2012-06-01 20:06:39', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(374, '1ul8u763sjspn0lk7o8iobsak1', 'user', 'gestao', '2012-06-02 18:06:53', '2012-06-02 18:06:58', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(375, 'gdopp8i2bifkea37lhdi1ut5a4', 'user', 'gestao', '2012-06-06 11:06:00', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(376, 'vgaajr4gs7ku42fpetoh6egsf0', 'user', 'gestao', '2012-06-06 12:06:43', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(377, 'hug3ogh7cinfgb9lqpogohnak1', 'user', 'gestao', '2012-06-06 13:06:16', '2012-06-06 13:06:54', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(378, 'tl756u4b8u2m2kq0r5b5rvru73', 'user', 'gestao', '2012-06-06 19:06:47', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(379, '3a2prt5eli0to340vn5urmacl6', 'user', 'gestao', '2012-06-18 15:06:52', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(380, '8fjmjbd6fkchugfig788c3dka5', 'user', 'gestao', '2012-06-20 19:06:26', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(381, '2si6i84hhe3hf5gtb573i89e01', 'user', 'gestao', '2012-06-20 20:06:10', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(382, 't3a8s4o9qlfar8untnpjjno3d6', 'user', 'gestao', '2012-06-21 12:06:27', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(383, '2i41akhdkme193cs2o2f5i2746', 'user', 'gestao', '2012-06-29 12:06:42', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(384, '9t37e6chqotu622gmdfiahtnn5', 'user', 'gestao', '2012-07-02 15:07:06', '2012-07-02 18:07:22', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(385, 'plot5pecnrgd7nurhcqje50kr1', 'user', 'gestao', '2012-07-03 15:07:19', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(386, 'noq2s4etcbf0gjkchg1b0im2n5', 'user', 'gestao', '2012-07-03 20:07:26', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(387, 'khbbuhcd31g9f0pndstip1nr82', 'user', 'gestao', '2012-07-04 12:07:25', '2012-07-04 12:07:14', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(388, 'g4g6cdqag11cdet3a96b12ru43', 'user', 'gestao', '2012-07-04 12:07:21', '2012-07-04 12:07:08', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(389, 'reb5etel266uf1snh40b1d8u27', 'user', 'gestao', '2012-07-04 12:07:30', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(390, 'b1fji68kn7kkvdb5r72fe4hnq6', 'user', 'gestao', '2012-07-04 16:07:36', '2012-07-04 16:07:18', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(391, '8pbog1n3nrvg4sibbahn9h61b2', 'user', 'gestao', '2012-07-04 16:07:48', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(392, 'or8psg7ekgtnm33hag68o8mac6', 'user', 'gestao', '2012-07-04 16:07:45', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(393, '51tdlvj6uhvjbg3q3nf0t9qa60', 'user', 'gestao', '2012-07-04 20:07:30', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(394, '5tv7u9q6rtlj8ccap6qs6jkn96', 'user', 'gestao', '2012-07-04 20:07:57', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(395, 'undqe7g4qi0t14sa8bu8svn052', 'user', 'gestao', '2012-07-04 20:07:14', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64; rv:13.0) Gecko'),
(396, 'ajtg1956ud5q6rc8bc2okhcjl3', 'user', 'gestao', '2012-07-04 20:07:05', '2012-07-04 20:07:54', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(397, '', 'vendas', '', '2012-07-04 20:07:57', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(398, '1qvcba176go5cbvfbdi4elsbq3', 'vendas', 'vendas', '2012-07-04 20:07:35', '2012-07-04 20:07:16', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(399, 'ob5a0aukq3srr5njerj5b1vdr7', 'vendas', 'vendas', '2012-07-04 20:07:22', '2012-07-04 20:07:50', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(400, 'rog0n35g8b4ltju0u83r1m7mk3', 'vendas', 'vendas', '2012-07-04 20:07:54', '2012-07-04 20:07:12', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(401, 'nsiv0emj6hj21vidsmdp1764f1', 'vendas', 'vendas', '2012-07-04 20:07:17', '2012-07-04 20:07:25', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(402, '27693arg7ed8ppdvcusie9fe76', 'vendas', 'vendas', '2012-07-04 20:07:12', '2012-07-04 20:07:17', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(403, 'cbj54a428a1pvqv0or8uqh4n50', 'user', 'gestao', '2012-07-04 20:07:25', '2012-07-04 20:07:45', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(404, 'and85kqmqedctece60uqnsnos3', 'vendas', 'vendas', '2012-07-04 20:07:38', '2012-07-04 20:07:02', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(405, 'rvdr0hlkv4njmehtjhvok7nbl5', 'user', 'gestao', '2012-07-04 20:07:14', '2012-07-04 21:07:52', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(406, '6iq96hb0e5gdq4kh45nkev2c42', 'user', 'gestao', '2012-07-04 21:07:52', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(407, '344nt20os9213vm5pi5fhdok82', 'user', 'gestao', '2012-07-05 10:07:25', NULL, '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(408, 'l75l1jok6cke7u935dbd2c0h06', 'user', 'gestao', '2012-07-05 10:07:27', NULL, '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(409, '94cumt49adc0buqfmkc1vt5f53', 'user', 'gestao', '2012-07-05 10:07:57', '2012-07-05 11:07:09', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(410, 'am5aik257fc4ugj92tlotpsf04', 'user', 'gestao', '2012-07-05 11:07:04', '2012-07-05 12:07:46', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(411, '', 'USE', '', '2012-07-05 19:07:21', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(412, 've2r07rqbdgdpqaje4eh5u4pg5', 'user', 'gestao', '2012-07-05 19:07:31', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(413, 'clsi22g6hb2pja0ed6g4htegt4', 'user', 'gestao', '2012-07-06 11:07:30', '2012-07-06 12:07:38', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(414, '53m3hmhfedjfi52lemf4pij575', 'user', 'gestao', '2012-07-06 12:07:09', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(415, '4mdk7cp7ag6s6nsv75pda3isf2', 'user', 'gestao', '2012-07-06 12:07:11', '2012-07-06 12:07:01', '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(416, '8q9ribalsmkkq97crl1npokio0', 'user', 'gestao', '2012-07-06 12:07:32', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(417, '8383s17aftsvuqb6ep5bbketb3', 'user', 'gestao', '2012-07-06 13:07:27', '2012-07-06 13:07:12', '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(418, '9ukom97o576fhbs4r4ftjnt9o0', 'user', 'gestao', '2012-07-06 13:07:27', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(419, 'tpllf2s1raad31ofoma3h0hl57', 'user', 'gestao', '2012-07-06 13:07:05', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(420, 's84mk7df9cdr9q9m9rgtttik72', 'user', 'gestao', '2012-07-06 15:07:55', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(421, 'fv4fjtnabicrfeqq172dn27ac5', 'user', 'gestao', '2012-07-06 15:07:16', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(422, 'rg3qiblgfkoqnm0ibg1tnfgf45', 'user', 'gestao', '2012-07-06 15:07:45', '2012-07-06 15:07:32', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(423, '85muvtthoeesgtb1a64tgsdjn2', 'USER', 'gestao', '2012-07-06 16:07:39', '2012-07-06 17:07:56', '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(424, 'n8is0lk63a61lhv7inm3fca256', 'user', 'gestao', '2012-07-06 17:07:17', '2012-07-06 17:07:48', '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(425, 's27hopmpst3kqa8u8qeolksqb3', 'user', 'gestao', '2012-07-06 17:07:40', '2012-07-06 17:07:39', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(426, '', 'user', '', '2012-07-06 17:07:01', NULL, '192.168.0.92', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(427, '', 'USER', '', '2012-07-06 17:07:19', NULL, '192.168.0.92', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(428, 'jsut7cd7aaioj0apj44clvjct1', 'USER', 'gestao', '2012-07-06 17:07:08', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(429, 'obe27ga8dt4o8etih3r6nqg7o0', 'user', 'gestao', '2012-07-06 20:07:11', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(430, 'et3dmaaguavv75ec221f4er7f5', 'user', 'gestao', '2012-07-07 12:07:55', '2012-07-07 12:07:56', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(431, 'svgnapmk6joig3uvq3a76rulp7', 'user', 'gestao', '2012-07-07 12:07:43', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(432, '2usnffcqdif1l8insr4dvn73j3', 'user', 'gestao', '2012-07-07 16:07:05', '2012-07-07 16:07:52', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(433, 'qlvq9f1pq390v5738iv0qmmrj1', 'user', 'gestao', '2012-07-07 20:07:29', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(434, 'u50cffbic6fh2qcv9k4f9lp395', 'user', 'gestao', '2012-07-07 20:07:55', '2012-07-07 20:07:12', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(435, 'e5cdqg4p2ij99jqublvikcj066', 'user', 'gestao', '2012-07-09 11:07:11', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(436, 's5g9aekulp60je9qt45tisk4k4', 'user', 'gestao', '2012-07-09 17:07:49', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(437, 'blbsvr8efp5kr0ibdpc04qr922', 'user', 'gestao', '2012-07-09 19:07:31', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(438, '6f55rlt4vshqke885ve6deivh0', 'user', 'gestao', '2012-07-09 19:07:09', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(439, 'dph3lunf22or7brc3109vvr4a6', 'user', 'gestao', '2012-07-09 19:07:53', '2012-07-09 19:07:06', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(440, 'c74mc1pqia6iric5t0ht7147n5', 'vendas', 'vendas', '2012-07-09 19:07:11', '2012-07-09 19:07:19', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(441, 'epquih360ba8p8vhcvf4uh6c12', 'user', 'gestao', '2012-07-09 19:07:21', '2012-07-09 20:07:38', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(442, '', 'Luiscar', '', '2012-07-09 20:07:49', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(443, '', 'luiscar', '', '2012-07-09 20:07:01', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(444, '', 'user', '', '2012-07-09 20:07:05', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(445, '2vknsb7pb0e692gl4d1hcu9387', 'Luiscar', 'gestao', '2012-07-09 20:07:27', '2012-07-09 20:07:39', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(446, '16jlos9fbn87r8d522gmma0nj4', 'fnuno', 'vendas', '2012-07-09 20:07:48', '2012-07-09 20:07:12', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(447, '', 'user', '', '2012-07-09 20:07:24', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(448, '26jjv4cin20g3o9bpf106o5qg2', 'Luiscar', 'gestao', '2012-07-09 20:07:40', '2012-07-09 20:07:51', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(449, 'dl06s2of14e8p59c0142lsm6d1', 'luiscar', 'gestao', '2012-07-09 20:07:59', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(450, 'cdbt3vkm3aq319eghkg1l1rct7', 'fnuno', 'vendas', '2012-07-09 20:07:46', '2012-07-09 20:07:54', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(451, '505gqmt9ko94di9uareml1d1p4', 'luiscar', 'gestao', '2012-07-09 20:07:05', '2012-07-09 20:07:29', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(452, '52grlml7b3150407t8qe6sj8d2', 'fnuno', 'vendas', '2012-07-09 20:07:45', '2012-07-09 20:07:47', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(453, '', 'luiscar', '', '2012-07-09 20:07:57', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(454, 'ku9qafs55rufll3o61nh3rgnn5', 'luiscar', 'gestao', '2012-07-09 20:07:09', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(455, 'ue319ld5goi6gpjsa90hc4kda7', 'luiscar', 'gestao', '2012-07-09 20:07:04', '2012-07-09 20:07:44', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(456, '2pv1ud3s565efs7n3i5rbccbs6', 'fnuno', 'vendas', '2012-07-10 11:07:14', '2012-07-10 11:07:24', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(457, '8uuuc5vf2nk099kddavjf060p6', 'luiscar', 'gestao', '2012-07-10 11:07:35', '2012-07-10 11:07:47', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(458, '', 'fnuno', '', '2012-07-10 11:07:28', NULL, '192.168.0.74', 'nok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(459, '0ftg3km9ptatqa0vuoq5rqsbe7', 'fnuno', 'vendas', '2012-07-10 11:07:55', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(460, 'cjnkplgc326gis17ievu8jjnd6', 'luiscar', 'gestao', '2012-07-10 12:07:41', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(461, 'nn41ompt0a9398js7c8dlmuj82', 'luiscar', 'gestao', '2012-07-10 15:07:12', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(462, '7vqh93de21g6rq5a685kbu7l65', 'fnuno', 'vendas', '2012-07-10 15:07:31', '2012-07-10 15:07:40', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(463, 'se666dh5bpk2o6j5kibjck6nf6', 'acarvalho', 'gestao', '2012-07-10 15:07:49', '2012-07-10 15:07:47', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(464, 'a9gtvdksdcee383eauog8pce86', 'fnuno', 'vendas', '2012-07-10 15:07:51', '2012-07-10 16:07:36', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(465, 'mlubgp6hspfv16g4l3bb6q2t45', 'fnuno', 'vendas', '2012-07-10 15:07:55', '2012-07-10 15:07:36', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(466, '', 'user', '', '2012-07-10 15:07:43', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(467, 'uu1mlu9acvbift7k3mgb2inch0', 'luiscar', 'gestao', '2012-07-10 15:07:22', '2012-07-10 15:07:17', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(468, 's90rn29u7uclkg43ktirc9v890', 'ap', 'gestao', '2012-07-10 15:07:25', '2012-07-10 15:07:55', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(469, 'rakf5h3odmlconmociu9s4g3h0', 'luiscar', 'gestao', '2012-07-10 15:07:05', '2012-07-10 17:07:26', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(470, '7tt39nk59r9lp650rah4u8vlt3', 'luiscar', 'gestao', '2012-07-10 16:07:45', '2012-07-10 16:07:29', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(471, 'ddsuo3qr86dik1o3jtarr1tn92', 'fnuno', 'vendas', '2012-07-10 16:07:39', '2012-07-10 16:07:12', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(472, 'fgtlm7p70s239pfb2a6p2cuo66', 'luiscar', 'gestao', '2012-07-10 16:07:21', '2012-07-10 16:07:04', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(473, '', 'apap', '', '2012-07-10 16:07:34', NULL, '192.168.0.123', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(474, '', 'user', '', '2012-07-10 16:07:18', NULL, '192.168.0.123', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(475, 'ss9i21825pq9ti6i84h79l6b25', 'luiscar', 'gestao', '2012-07-10 17:07:34', NULL, '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(476, '20f22hasq5q1i6mo7p15djhp94', 'fnuno', 'vendas', '2012-07-10 17:07:51', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(477, 'e6mo9g864e23jglm0ddsngseb0', 'ap', 'gestao', '2012-07-10 17:07:48', '2012-07-10 18:07:09', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(478, '', 'luiscar', '', '2012-07-10 18:07:33', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(479, '', 'luiscar', '', '2012-07-10 18:07:43', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(480, 'qop4ba6uqop53uirpbvq09s411', 'luiscar', 'gestao', '2012-07-10 18:07:54', '2012-07-10 18:07:22', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(481, '', 'user', '', '2012-07-11 19:07:12', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(482, '', 'user', '', '2012-07-11 19:07:40', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(483, '', '', '', '2012-07-11 19:07:54', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(484, '', '', '', '2012-07-11 19:07:34', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(485, '', 'LUIS', '', '2012-07-11 19:07:57', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(486, '', 'user', '', '2012-07-12 16:07:48', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(487, '', '1978', '', '2012-07-12 17:07:19', NULL, '192.168.0.15', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(488, 'o2nkdpru46lfa0mlspshb0ha90', 'LUISCAR', 'gestao', '2012-07-18 12:07:57', '2012-07-18 12:07:17', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(489, 'fcnngtcr04a1eac5k2jr070e90', 'luiscar', 'gestao', '2012-07-18 13:07:45', '2012-07-18 16:07:13', '192.168.0.15', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(490, '1jih9b3ak9ck6tjehkkbu4kao7', 'luiscar', 'gestao', '2012-07-18 18:07:23', '2012-07-18 19:07:17', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(491, '', 'ap', '', '2012-07-18 19:07:45', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(492, '', 'ap', '', '2012-07-18 19:07:50', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(493, '', 'ap', '', '2012-07-18 19:07:57', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(494, 'nf1adso0uegtka9sanae9sakd5', 'ap1', 'rececionista', '2012-07-18 19:07:36', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(495, '', 'ap', '', '2012-07-18 19:07:37', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(496, 'ap13ccqjgsej21t9sj26glfkd0', 'ap1', 'rececionista', '2012-07-18 19:07:42', '2012-07-18 19:07:22', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(497, 'rv8csr3m0gogq9jq76sefutt62', 'luiscar', 'gestao', '2012-07-18 19:07:26', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(498, '17m73vgr1k7q7hsi7qqgfug3s4', 'luiscar', 'gestao', '2012-07-18 19:07:50', '2012-07-18 19:07:29', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(499, 'am7e1b9au6q7v75and9kb1gri6', 'ap1', 'rececionista', '2012-07-18 19:07:34', '2012-07-18 19:07:53', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(500, '', 'ap', '', '2012-07-18 19:07:57', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(501, '', 'ap', '', '2012-07-18 19:07:29', NULL, '192.168.0.123', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(502, 'seo94lf9qn1oo7ecahr5nl5ab0', 'ap', 'rececionista', '2012-07-18 19:07:54', '2012-07-18 19:07:05', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(503, 'p0jie28193qg6l8ci0sja987g1', 'ap', 'rececionista', '2012-07-18 19:07:09', '2012-07-18 19:07:33', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(504, 'vv01fbc5btu3csu1dn3j02dnp5', 'ap', 'rececionista', '2012-07-18 19:07:36', '2012-07-18 20:07:02', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(505, 'oor2khneg7rn2t0u6bibnjp731', 'fnuno', 'vendas', '2012-07-18 20:07:40', '2012-07-18 20:07:13', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(506, '', 'luiscar', '', '2012-07-18 20:07:20', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(507, '', 'luiscar', '', '2012-07-18 20:07:54', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(508, 'cv5bikm2376g80q4mg4dt8drf7', 'luiscar', 'gestao', '2012-07-18 20:07:06', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(509, '', 'luiscar', '', '2012-07-19 18:07:25', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(510, '8f3g2fiv2nl4iaf0d68bsfpbm1', 'luiscar', 'gestao', '2012-07-19 18:07:34', '2012-07-19 18:07:10', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(511, 'thgmcu04itgi2emnhgjuh2tbq0', 'fnuno', 'vendas', '2012-07-19 18:07:20', '2012-07-19 18:07:44', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(512, 'i79b59avibdhok4j2tg3ciav12', 'ap', 'rececionista', '2012-07-19 18:07:58', '2012-07-19 19:07:24', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(513, 'pqn5bg79v1bvpmbu96k5n9irp3', 'fnuno', 'vendas', '2012-07-20 12:07:05', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:13.0) Gecko/201001'),
(514, '', 'acarvalho', '', '2012-07-20 17:07:44', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(515, 'm1e1shfpgea2hd62sr62h4oi52', 'luiscar', 'gestao', '2012-07-20 17:07:02', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(516, '5lpfa3ous64a51m3mjeqqkglg7', 'ap', 'rececionista', '2012-07-20 17:07:06', '2012-07-20 17:07:44', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(517, 'hhs7kh4ufrvksvnshn5hsnvbc0', 'acarvalho', 'gestao', '2012-07-20 17:07:55', '2012-07-20 17:07:08', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(518, '6p8pf0pbapf8ildfqldn2cguj0', 'la', 'rececionista', '2012-07-20 17:07:13', '2012-07-20 17:07:34', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(519, 'oa4dis8gv6jfiq1k622am99li3', 'ap', 'rececionista', '2012-07-20 17:07:42', '2012-07-20 17:07:46', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(520, 'o0c4t5l1er1ghb6m2p4aiesn13', 'fnuno', 'vendas', '2012-07-20 17:07:53', '2012-07-20 17:07:09', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(521, 'fgfk7nie5c7olmn53i86ohjml6', 'luiscar', 'gestao', '2012-07-20 17:07:22', '2012-07-20 18:07:02', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(522, '6kpj2k7fqcaklke6lda5861fa6', 'acarvalho', 'gestao', '2012-07-20 17:07:58', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(523, 'n1jd24q1r9kbefhm5jsifm7c14', 'ap', 'rececionista', '2012-07-20 17:07:04', '2012-07-20 18:07:54', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(524, '8bbt464pb9mmrgi7uump7e7ak5', 'ap', 'rececionista', '2012-07-20 18:07:04', '2012-07-20 18:07:51', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(525, '', 'ap', '', '2012-07-20 18:07:53', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(526, 'g7ilqcu2hj45m6c4vnpm6bfo15', 'ap', 'rececionista', '2012-07-20 18:07:57', '2012-07-20 18:07:24', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(527, 'gh8j8f7tjftdp45rqln1linhc4', 'fnuno', 'vendas', '2012-07-20 18:07:42', '2012-07-20 18:07:41', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(528, 'oegkrhapc4nvfluluvhu9dd945', 'ap', 'rececionista', '2012-07-20 18:07:48', '2012-07-20 18:07:27', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(529, '97299lr6euqebeiuun5m8f7395', 'fnuno', 'vendas', '2012-07-20 18:07:35', '2012-07-20 18:07:11', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(530, 'tgd4sbfmrbipctl95jnlkncln6', 'fnuno', 'vendas', '2012-07-20 19:07:00', '2012-07-20 19:07:04', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(531, '835unfesj1cvdggi70psk3kmf5', 'luiscar', 'gestao', '2012-07-20 19:07:15', '2012-07-20 19:07:01', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(532, 'd8l6rvshjgmn9khh7ou46abh62', 'fnuno', 'vendas', '2012-07-20 19:07:07', '2012-07-20 19:07:38', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(533, '', 'luiscar', '', '2012-07-20 19:07:49', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(534, 'st930cshrcqkht0rdkb7gt71l1', 'luiscar', 'gestao', '2012-07-20 19:07:04', '2012-07-20 20:07:35', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(535, '', 'JC', '', '2012-07-20 19:07:22', NULL, '192.168.0.103', 'nok', 'Mozilla/5.0 (Windows NT 6.1; rv:13.0) Gecko/201001'),
(536, '1586lolbut51d4ohbgm7barkn7', 'la', 'rececionista', '2012-07-20 19:07:30', '2012-07-20 19:07:35', '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1; rv:13.0) Gecko/201001'),
(537, '', 'jc', '', '2012-07-20 19:07:44', NULL, '192.168.0.103', 'nok', 'Mozilla/5.0 (Windows NT 6.1; rv:13.0) Gecko/201001'),
(538, 'kh64dfiu6bvfmqhdj1ui7dkl67', 'la', 'rececionista', '2012-07-20 19:07:14', NULL, '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.11 (K'),
(539, '', 'la', '', '2012-07-20 20:07:02', NULL, '192.168.0.103', 'nok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.11 (K'),
(540, '82601li9a8m1moo1fn0u1ai9n7', 'la', 'rececionista', '2012-07-20 20:07:13', '2012-07-20 20:07:15', '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.11 (K'),
(541, '33c4jcbkctlldg4b3obfa3o5m5', 'luiscar', 'gestao', '2012-07-20 20:07:33', NULL, '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.11 (K'),
(542, 'e9rqa7puvp857qf5ijka7hfil0', 'luiscar', 'gestao', '2012-07-20 20:07:44', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(543, 'nljmp78657d287reif2v4dhj81', 'JC', 'gestao', '2012-07-20 21:07:06', NULL, '192.168.0.10', 'ok', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (K'),
(544, '2ghd6hbrg10fhkpfk70817l533', 'luiscar', 'gestao', '2012-07-21 12:07:25', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(545, '0en46okjuojtmf3q8mqf5u1i96', 'acarvalho', 'gestao', '2012-07-21 13:07:12', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(546, 'rrl1bkq40rjanch0uvgp1hlqk2', 'JC', 'gestao', '2012-07-21 13:07:36', NULL, '192.168.0.10', 'ok', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.11 (K'),
(547, '', 'acarvalho', '', '2012-07-23 10:07:26', NULL, '192.168.0.92', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(548, 'berh7128pceetuffuri20tb9l4', 'acarvalho', 'gestao', '2012-07-23 10:07:07', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(549, '7ij5fog1cqhdphfvtkvm35s1k1', 'luiscar', 'gestao', '2012-07-23 10:07:48', '2012-07-23 10:07:18', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(550, '9sf6av824sd6e99r48n0h9kd45', 'luiscar', 'gestao', '2012-07-23 11:07:03', '2012-07-23 12:07:52', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(551, 'ojtka2e8ijm8sdvhpf1ctvdko4', 'lUISCAR', 'gestao', '2012-07-23 13:07:32', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(552, 'cje80pl5tvd1q6bi922f8bq0n0', 'luiscar', 'gestao', '2012-07-23 16:07:47', '2012-07-23 17:07:47', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(553, '', 'luiscra', '', '2012-07-23 18:07:04', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(554, '', 'luiscar', '', '2012-07-23 18:07:12', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(555, 'nj385q04qqj0jo0pn800o6bri7', 'luiscar', 'gestao', '2012-07-23 18:07:21', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(556, '', 'luiscar', '', '2012-07-24 10:07:27', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(557, '15lr5kgtr5ks4ht8c1jgk29ae5', 'luiscar', 'gestao', '2012-07-24 10:07:40', '2012-07-24 10:07:16', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(558, '0itu0h4ff7pt386jrkdk14qda5', 'ap', 'rececionista', '2012-07-24 11:07:21', '2012-07-24 11:07:27', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(559, '43s01v2dma3uj64ra6q6fk83k7', 'ap', 'rececionista', '2012-07-24 11:07:35', '2012-07-24 11:07:13', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(560, 'vmkvu09vvaudbv97mqrtt48l46', 'ap', 'rececionista', '2012-07-24 11:07:46', '2012-07-24 12:07:55', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(561, 'rn3n8qlujab802keq4ss8s4kf7', 'ap', 'rececionista', '2012-07-24 15:07:53', '2012-07-24 18:07:13', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(562, '05bs00mv5e6q72jfhgk61jqh26', 'luiscar', 'gestao', '2012-07-24 19:07:17', '2012-07-24 19:07:56', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(563, 'ds00q9igq1egplugtoeacbsvl2', 'acarvalho', 'gestao', '2012-07-24 19:07:44', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(564, 'tm0vicgh5qdr49cko82abp1rs0', 'ap', 'rececionista', '2012-07-25 11:07:32', '2012-07-25 12:07:52', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(565, '86g0istqsd60m2qf387rpbrrv7', 'ap', 'rececionista', '2012-07-25 16:07:25', NULL, '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(566, 'vaqkjrjmnsiuvneb6q1jk10du2', 'luiscar', 'gestao', '2012-07-25 18:07:28', '2012-07-25 19:07:05', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(567, 'nb14pt6ioij0odieiv0napfnr6', 'LUISCAR', 'gestao', '2012-07-25 19:07:18', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(568, '13178sc7vtkg4q7gta0sg6rva0', 'acarvalho', 'gestao', '2012-07-26 12:07:24', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(569, '7djacapg1f0o147pehdn2l1ko1', 'ap', 'rececionista', '2012-07-26 17:07:09', NULL, '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(570, 'okmmcoi7t3qbitgmpqrql50v26', 'luiscar', 'gestao', '2012-07-26 19:07:18', '2012-07-26 19:07:27', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(571, '2tuvet5vhjmmue8ipca8kq9j80', 'luiscar', 'gestao', '2012-07-26 19:07:32', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(572, '1f1g782l84jo0jctb3jk6shm12', 'luiscar', 'gestao', '2012-07-27 19:07:47', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(573, 'fj9lnsjp2p10pkcm3h5s2piki1', 'luiscar', 'gestao', '2012-07-27 19:07:34', '2012-07-27 19:07:45', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;');
INSERT INTO `main_logins` (`id_main_logins`, `ssid`, `login`, `modulo`, `datahora`, `hora_logout`, `ip`, `res`, `browser`) VALUES
(574, 'k9ikgp5ghpkbcnmjkc7jgtse86', 'acarvalho', 'gestao', '2012-07-27 19:07:34', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(575, '1lmia2rketksigk9f2dodg9581', 'luiscar', 'gestao', '2012-07-27 20:07:37', '2012-07-27 20:07:03', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(576, 'vj34llqsv65kpf77sr9c0u9ak6', 'acarvalho', 'gestao', '2012-07-28 12:07:45', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(577, '8sk1aplipng7tp857bnu9rjnm7', 'luiscar', 'gestao', '2012-07-28 13:07:15', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(578, '', 'LUISCAR', '', '2012-07-28 18:07:38', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(579, '7nc95obvldhf4pe5i7bbroitj1', 'luiscar', 'gestao', '2012-07-28 18:07:47', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(580, 'l0clrn6hvrddgvhqcmfdj1bkp1', 'luiscar', 'gestao', '2012-07-28 18:07:57', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(581, 'lnvluvnfkorsf0mk0l73cg2131', 'luiscar', 'gestao', '2012-07-28 18:07:30', '2012-07-28 19:07:36', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(582, '7jcm3dbho69ci7m031m5f81hq5', 'fnuno', 'vendas', '2012-07-30 11:07:10', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(583, 'un4s9778l0us5k5pt53tj2vaq4', 'luiscar', 'gestao', '2012-07-30 12:07:09', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(584, '2e20kvk4o1v5sj5dfh2rgv1515', 'luiscar', 'gestao', '2012-07-30 12:07:09', '2012-07-30 12:07:18', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(585, 'vf7vedk7o9eg9jr6dh8vl6eqm3', 'LUISCAR', 'gestao', '2012-07-30 13:07:46', '2012-07-30 13:07:28', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(586, 'dgt8nhqhu02ob3hs3hfj265ot3', 'LUISCAR', 'gestao', '2012-07-30 13:07:45', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(587, 'spj097v4o4tqnfuj9vogm5evv4', 'acarvalho', 'gestao', '2012-07-30 16:07:26', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(588, 'jl60tfthkm3ave5urrp5atb311', 'acarvalho', 'gestao', '2012-07-31 10:07:50', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(589, 'bu5tkc2h3p5qaf25c3pm78u455', 'LUISCAR', 'gestao', '2012-07-31 11:07:55', '2012-07-31 11:07:35', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(590, 'sta7e3aplsqjls738ae82q9vb4', 'luiscar', 'gestao', '2012-07-31 13:07:20', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(591, '4t8ljft5j7seo7d0mhvlj2sib3', 'luiscar', 'gestao', '2012-07-31 16:07:58', '2012-07-31 16:07:37', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(592, 'nb82mbtl0g1lektrv3r49ao4s1', 'luiscar', 'gestao', '2012-07-31 17:07:16', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(593, 'qa9qupnikfp1a9brrf6qvojv33', 'luiscar', 'gestao', '2012-07-31 19:07:38', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(594, 'do2lm9e0mf6k5jmlmda1nmbjp0', 'luiscar', 'gestao', '2012-08-01 13:08:49', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(595, '1fs4ga2tl08imq6i9ens30d5v4', 'luiscar', 'gestao', '2012-08-01 16:08:33', '2012-08-01 16:08:44', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(596, 'j2lu2l4qfu0q3pk4oldv0a6pd0', 'luiscar', 'gestao', '2012-08-01 19:08:40', '2012-08-01 20:08:12', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(597, 'g9joo55eop1lut2q5q0fm5kh17', 'fnuno', 'vendas', '2012-08-02 10:08:33', '2012-08-02 16:08:13', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(598, '7tls7ckbqc37okafjo8cc985m2', 'LUISCAR', 'gestao', '2012-08-02 12:08:02', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(599, '92vlncuv49o9maalck38h8nri0', 'acarvalho', 'gestao', '2012-08-02 13:08:11', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(600, '', 'LUISCAR', '', '2012-08-02 16:08:25', NULL, '192.168.0.74', 'nok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(601, '51tn3993e41catk74b342fjcm4', 'LUISCAR', 'gestao', '2012-08-02 16:08:49', '2012-08-02 16:08:48', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(602, 'me55aia00sn7ijr2fftfeipb23', 'fnuno', 'vendas', '2012-08-02 16:08:50', '2012-08-02 16:08:37', '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(603, '', 'LUISCAR', '', '2012-08-02 16:08:21', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(604, '14qog8qo22i3l506uglqo3aeb0', 'luiscar', 'gestao', '2012-08-02 16:08:32', '2012-08-02 16:08:47', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(605, 'rvhug6ikifitmerum8mg8i4fm4', 'fnuno', 'vendas', '2012-08-02 16:08:56', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(606, 'mrpfv5v4tro3ho4id2qoi5rji5', 'fnuno', 'vendas', '2012-08-03 12:08:06', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(607, '74taiv78t3ps1kk62l8c29j3k6', 'acarvalho', 'gestao', '2012-08-03 15:08:37', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(608, 'prdqu8diers66c8l4riboqeaa5', 'acarvalho', 'gestao', '2012-08-04 13:08:03', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(609, 'cm53dev5rqqt988mlnp78e49m3', 'acarvalho', 'gestao', '2012-08-06 10:08:03', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(610, 'a3lqb7ph6a4j6cvk1u31lgfgt4', 'acarvalho', 'gestao', '2012-08-06 11:08:46', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(611, 'eh66uejjio9gu9uc052dd0mqi6', 'fnuno', 'vendas', '2012-08-06 12:08:49', NULL, '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(612, '44hjv6rur0hlo6ootr49qm9hv5', 'acarvalho', 'gestao', '2012-08-07 10:08:25', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(613, 'v2hv1s0r9hkpv66dooss6k17l4', 'acarvalho', 'gestao', '2012-08-07 19:08:59', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(614, 'v2cbskuudvqi6kb5l7k9ql6631', 'acarvalho', 'gestao', '2012-08-08 10:08:59', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(615, 'gah7k5900ldl8gpe6npfgemm76', 'acarvalho', 'gestao', '2012-08-10 19:08:05', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(616, '', 'luiscar', '', '2012-08-11 13:08:27', NULL, '192.168.0.103', 'nok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KH'),
(617, 'fvdcdnc0giu7hjthfm21sodeu5', 'acarvalho', 'gestao', '2012-08-11 13:08:04', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(618, 'srcf1h5fhldjc0mld7ni6h1iq1', 'luiscar', 'gestao', '2012-08-11 13:08:11', '2012-08-11 13:08:08', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(619, '', 'luiscar', '', '2012-08-11 13:08:35', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(620, '', 'Luiscar', '', '2012-08-11 17:08:46', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(621, 'g9slr7o5ofkjp7ce9rnahuqd60', 'luiscar', 'gestao', '2012-08-11 17:08:17', '2012-08-11 20:08:26', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(622, 'j560len034u4bv81u9t0q0n2e1', 'LUISCAR', 'gestao', '2012-08-11 20:08:07', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(623, 'goajl3o4hjrktlon9a0ljj9rs2', 'luiscar', 'gestao', '2012-08-13 15:08:08', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(624, 'bu09qg3dr2c5uir45mmud4m2g4', 'acarvalho', 'gestao', '2012-08-13 15:08:25', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(625, '6hvg2bafdf5n92ll1bgg33ljj6', 'luiscar', 'gestao', '2012-08-16 13:08:00', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(626, 'lvelqofk48js45thvb2b6r6p33', 'acarvalho', 'gestao', '2012-08-16 15:08:19', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(627, '37qdovvgami7usl8525u8upso4', 'LUISCAR', 'gestao', '2012-08-16 18:08:11', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(628, 'qimdg9ptj0pvonpd8nbdg6ogf5', 'Acarvalho', 'gestao', '2012-08-16 19:08:53', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(629, 'mqv66ntaqr1r3uha9ncbbu7p46', 'acarvalho', 'gestao', '2012-08-17 11:08:21', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(630, 's0luojb03agfdql1dthpttd7u1', 'luiscar', 'gestao', '2012-08-18 12:08:44', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(631, '4cu2b70kg22rgnv84r7mp5ea83', 'luiscar', 'gestao', '2012-08-18 12:08:38', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64; rv:14.0) Gecko'),
(632, 'psjhmmsenkm1v6r343o822rf06', 'fnuno', 'vendas', '2012-08-18 13:08:03', '2012-08-18 13:08:23', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(633, '6fl6mc5fo78b0v8t6hohk3opm6', 'acarvalho', 'gestao', '2012-08-18 13:08:43', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(634, 'uhr193cl79khtco0m54485me84', 'luiscar', 'gestao', '2012-08-18 13:08:52', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(635, '86dsnsfh1p1nrj0qokcefe2v12', 'luiscar', 'gestao', '2012-08-18 13:08:40', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(636, 'fmas9a5r985oajo6tuav30brh5', 'luiscar', 'gestao', '2012-08-18 19:08:59', '2012-08-18 19:08:02', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(637, 'ohrghhclma2jb21r5v0bsufg92', 'fnuno', 'vendas', '2012-08-18 19:08:13', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(638, 'iddi3hrnde35ph0bd3b61tsro7', 'fnuno', 'vendas', '2012-08-18 19:08:56', '2012-08-18 19:08:27', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(639, '0vklo9f4doooib969hr1shlkb0', 'Luiscar', 'gestao', '2012-08-18 19:08:37', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(640, '7l4p44cupbts9oomskgi1t7k87', 'luiscar', 'gestao', '2012-08-18 19:08:18', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(641, '8s3t5ogg8fae94vkqlbs6kkkd2', 'luiscar', 'gestao', '2012-08-20 10:08:35', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(642, '5j8qe15anttb27p2biedbjjnc6', 'luiscar', 'gestao', '2012-08-20 11:08:36', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(643, 'dc9ief69o0fsrbp65nqemp8rj3', 'acarvalho', 'gestao', '2012-08-20 12:08:42', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(644, 'mntoqb78m836o53erg653ph9d4', 'la', 'rececionista', '2012-08-20 13:08:12', NULL, '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KH'),
(645, '06sle4ohai6rmuurjariu13a54', 'la', 'rececionista', '2012-08-20 13:08:48', NULL, '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KH'),
(646, 'sq34h88vjeba7e8jjfos1godl0', 'la', 'rececionista', '2012-08-20 13:08:06', '2012-08-20 13:08:23', '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KH'),
(647, 'jlrhe6imktpqb7n47pd9dej7c2', 'Luiscar', 'gestao', '2012-08-20 13:08:11', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(648, 'qjruk68vekrj6gqnss7m1jbhi5', 'luiscar', 'gestao', '2012-08-20 13:08:36', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(649, 'qdfmap66qdqtsj48j0ls1ghnu6', 'luiscar', 'gestao', '2012-08-20 15:08:14', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(650, '45ir970hj51dodr3hfrrpctj52', 'acarvalho', 'gestao', '2012-08-20 15:08:05', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(651, 'p0tf8g0e4o5s1n5end6re55ut0', 'luiscar', 'gestao', '2012-08-20 16:08:58', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(652, '61deu8h1pcg9l8bv8rlcobqqc5', 'Luiscar', 'gestao', '2012-08-20 19:08:18', '2012-08-20 20:08:33', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(653, 'sl6et4jp87hcnjl20qmpktmm26', 'acarvalho', 'gestao', '2012-08-21 11:08:04', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(654, 'm1b23vgve91kvvtf9dnbte15g2', 'fnuno', 'vendas', '2012-08-21 11:08:36', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(655, '1qfdajm6qpvvn88gjel8s4lga4', 'luiscar', 'gestao', '2012-08-21 12:08:10', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(656, 'l4ofnks59a5u4cfvtt0of25bq7', 'acarvalho', 'gestao', '2012-08-21 17:08:49', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(657, 'caaa69t48j1p7o89ppivt96l06', 'fnuno', 'vendas', '2012-08-21 18:08:41', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(658, 'v8r12n2g0vm3lb6phfsg2ilbl1', 'fnuno', 'vendas', '2012-08-22 11:08:12', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(659, '5sl4lboaqrhtaetam6dpsjfv40', 'la', 'rececionista', '2012-08-22 13:08:57', '2012-08-22 13:08:00', '192.168.0.103', 'ok', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.1 (KH'),
(660, 'lj3pk7mbffhcs1ojh1l7sa1rv2', 'acarvalho', 'gestao', '2012-08-23 12:08:47', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(661, 'f03oqg1q2bprigs1k2svpa2vp5', 'luiscar', 'gestao', '2012-08-23 12:08:10', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(662, '06bu6q78jkskv2lf9rq8j9ce40', 'luiscar', 'gestao', '2012-08-23 12:08:00', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(663, 'fd2eji6i4omlmg6hqv7a7jf7r2', 'LUISCAR', 'gestao', '2012-08-23 12:08:00', '2012-08-23 12:08:34', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(664, '43rtfoqre5tupk0skuld3ek5k2', 'acarvalho', 'gestao', '2012-08-24 12:08:26', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(665, 'dn2qe5tnq5fdcuqpbvnukdpfo3', 'LUISCAR', 'gestao', '2012-08-24 13:08:25', '2012-08-24 15:08:18', '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(666, 'eqvc2h925grj4pubprlqvg8m23', 'fnuno', 'vendas', '2012-08-24 16:08:17', '2012-08-24 16:08:04', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(667, '5brvit49fvlfbg4jp4u9e32g67', 'fnuno', 'vendas', '2012-08-24 16:08:03', '2012-08-24 16:08:18', '192.168.0.123', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0;'),
(668, 't5hn79uieknrerd9ma22iju473', 'luiscar', 'gestao', '2012-08-25 14:08:45', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(669, 'vroq70tfmjaafr18a7ihqi1qf4', 'luiscar', 'gestao', '2012-08-25 18:08:12', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(670, '5lasvc7f922v1fjld5qmie2bd2', 'acarvalho', 'gestao', '2012-08-25 19:08:58', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(671, 'urt70rh3bot8h6i3bso2c9gp44', 'acarvalho', 'gestao', '2012-08-27 11:08:32', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(672, '3bck1qkasftiqpo92mf1pvntl3', 'fnuno', 'vendas', '2012-08-28 18:08:02', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(673, 'fa8iv9ohkgnf1n9t5jea2cvbl2', 'luiscar', 'gestao', '2012-08-29 17:08:13', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0;'),
(674, '', 'ACARVALHO', '', '2012-08-29 17:08:39', NULL, '192.168.0.92', 'nok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(675, 'pk8e4hbs8lrhpk5e3d6gn11fs5', 'acarvalho', 'gestao', '2012-08-29 17:08:04', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(676, 'qbs5kh94lfje2hqge37te8lm67', 'fnuno', 'vendas', '2012-08-29 17:08:27', NULL, '192.168.0.74', 'ok', 'Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/201001'),
(677, 'hdjbfsli9nmtm953v7t6318aa3', 'acarvalho', 'gestao', '2012-08-30 12:08:02', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(678, 'c4buo7mm9se5upov0c3dg1c0b7', 'acarvalho', 'gestao', '2012-08-30 17:08:42', NULL, '192.168.0.92', 'ok', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;'),
(679, '', 'teste', '', '2012-08-31 19:08:41', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(680, '0ktiivlfvvmd062n2mqmoqu7j4', 'teste', 'gestao', '2012-08-31 19:08:11', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(681, 'f6pm8apvahfee84viu9hlm7fr1', 'fnuno', 'vendas', '2012-08-31 20:08:24', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.0; WOW64) AppleWebKit/53'),
(682, '1arcpm7n073gcqrj617afdv5v3', 'fnuno', 'vendas', '2012-09-24 16:09:36', '2012-09-24 16:09:30', '::1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(683, '', 'admin', '', '2012-10-08 19:10:17', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(684, '80d7c4c0553b22a67e660f4fbb710dd9', 'teste', 'gestao', '2012-10-17 11:10:29', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(685, '', 'admin', '', '2012-12-19 12:12:27', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(686, '', 'user', '', '2012-12-19 12:12:32', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(687, 'a7a397752bbd03e5f6a575e39d4d5aa0', 'teste', 'gestao', '2012-12-19 12:12:02', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(688, '', 'admin', '', '2013-03-22 14:03:00', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(689, '', 'vendas', '', '2013-03-22 14:03:06', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(690, 'f8f228b2fc0eaf65986173cb4d653203', 'fnuno', 'vendas', '2013-03-22 14:03:39', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(691, '', 'luiscar', '', '2013-06-10 10:06:52', NULL, '127.0.0.1', 'nok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(692, 'bf76c8282c65c75d206eaf32ac1dbe88', 'teste', 'gestao', '2013-06-10 10:06:06', '2013-06-10 11:06:33', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(693, '86541fec27a72ac50a34e9233ff09d74', 'teste', 'rececionista', '2013-06-10 11:06:38', '2013-06-10 12:06:44', '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(694, '352dd9cd103be3619b2d7d1c3d45fc5a', 'teste', 'gestao', '2013-06-10 12:06:02', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(695, 'adf8f7e9ac637904dad8d29acf570fc0', 'teste', 'gestao', '2013-07-16 10:07:02', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(696, 'ce6e15ff84174cfddbc250f008510acb', 'teste', 'gestao', '2013-08-07 14:08:43', NULL, '127.0.0.1', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(697, '', 'admin', '', '2015-10-27 23:10:03', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(698, '', 'teste', '', '2015-10-27 23:10:57', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(699, '8preep6qbb5pkd2j7vgv28kpp2', 'teste', 'gestao', '2015-10-27 23:10:42', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(700, 'a3pfk0m08p7ldjc77kr0nuae93', 'teste', 'gestao', '2015-10-27 23:10:09', '2015-10-27 23:10:54', '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(701, '5a5nnlh7s9kffd737cp8af6f02', 'teste', 'gestao', '2015-10-27 23:10:23', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(702, '', 'admin', '', '2015-11-10 22:11:32', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(703, '', 'admin', '', '2015-11-10 22:11:04', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(704, '', 'admin', '', '2015-11-10 22:11:00', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(705, '', 'admin', '', '2015-11-10 22:11:06', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(706, 'oacn662elub920rg9n8es5a5t2', 'teste', 'gestao', '2015-11-10 22:11:59', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(707, '', 'admin', '', '2015-11-28 21:11:23', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(708, '1fs6juc8anktkfuf511kd2beu5', 'teste', 'gestao', '2015-11-28 21:11:33', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(709, '', 'teste', '', '2015-11-28 21:11:10', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(710, '', 'teste', '', '2015-11-28 21:11:21', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(711, '', 'Teste', '', '2015-11-28 21:11:22', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(712, '', 'admin', '', '2015-11-28 21:11:34', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(713, '', 'admin', '', '2015-11-28 21:11:45', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(714, '', 'teste', '', '2015-11-28 21:11:57', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(715, '', 'teste', '', '2015-11-28 21:11:19', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(716, 'rmcrev5mkg70glqe2r1hv9opc5', 'teste', '', '2015-11-28 21:11:33', '2015-11-28 21:11:09', '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(717, '', 'teste', '', '2015-11-28 21:11:15', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(718, '', 'teste', '', '2015-11-28 21:11:24', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(719, '', 'Teste', '', '2015-11-28 21:11:30', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(720, '', 'teste', '', '2015-11-28 21:11:42', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(721, '', 'teste', '', '2015-11-28 21:11:27', NULL, '::1', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(722, '8qhu83bomq29fliembgndv20r3', 'teste', '', '2015-11-28 21:11:43', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(723, '6k0el3t77dj806ltl0fro0uhm1', 'teste', '', '2015-11-28 22:11:34', '2015-11-28 22:11:05', '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(724, 'd628sn1fn6a01v8jc0evtrv0c3', 'teste', '', '2015-11-28 22:11:11', '2015-11-28 22:11:01', '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(725, '36fcncpvbihf4ug301mne0s9r1', 'teste', '', '2015-11-28 22:11:08', NULL, '::1', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(726, '', 'tester', '', '2015-11-29 11:11:57', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(727, 'rm2ke1teef19n28tdtqc92brq4', 'teste', '', '2015-11-29 11:11:38', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(728, 'kt99javjs6ioocsg6bs9cftev7', 'teste', '', '2015-12-02 21:12:13', '2015-12-02 21:12:16', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(729, 'g5ss6cohk88p9vkog79bvh4ui7', 'teste', '', '2015-12-02 21:12:32', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(730, '68m7ujid74eajcd679okqo58r4', 'teste', '', '2015-12-10 22:12:55', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(731, '5hln6m383skjsq40n7p9lb0902', 'teste', '', '2015-12-13 10:12:24', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(732, 'ekao2qje2p53f3u5a96rgsa0l7', 'teste', '', '2015-12-16 21:12:05', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(733, 'nheheciv8cerbuar4ckkkq6n37', 'teste', '', '2015-12-17 22:12:52', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(734, 'mngac8g0u07t78760jk0pv7iq5', 'teste', '', '2015-12-17 23:12:40', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(735, 'nrkt9lk44u205cv75lod12eof5', 'teste', '', '2015-12-17 23:12:48', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(736, 'glcrf8v9nt8u8l1sc485jf7gt7', 'teste ', '', '2015-12-26 15:12:28', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(737, 'rf7j8hsbron4n03h1ar96at2b5', 'teste', '', '2015-12-26 15:12:58', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(738, 'tcpnmr162298d3apbpovao92g1', 'teste ', '', '2015-12-27 17:12:59', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(739, '7412m61hd7tqhl85vmqmahh1f0', 'teste ', '', '2015-12-28 15:12:53', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(740, 'pjjr0g9vq5vab76d74rbe8qjo2', 'teste ', '', '2015-12-28 21:12:43', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(741, 'kcbtgjtf9j9ofnjirq3ik184q1', 'teste', '', '2015-12-29 11:12:35', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(742, 'vqi626sfi55lbk90m3bg3qcog4', 'teste', '', '2015-12-29 11:12:11', '2015-12-29 11:12:54', '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(743, 'c9cgp5k9doemfsq0pq8nsk3uf6', 'teste', '', '2015-12-29 12:12:18', '2015-12-29 12:12:47', '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(744, 'm05frjno8jhfm29ee2fu385l21', 'teste', '', '2015-12-29 12:12:20', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(745, 'ufr12oq95futikrlt1p4mp60l1', 'teste', '', '2015-12-29 12:12:27', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(746, '7a3jocs65jcp14h5fvipel8sr2', 'teste', '', '2015-12-29 22:12:56', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(747, 'j6q3f13u5if8v6egvo9ivjgtc4', 'teste', '', '2015-12-30 00:12:40', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(748, 'd0p3sni18slc2egn1ras927nk1', 'teste', '', '2015-12-30 14:12:19', '2015-12-30 14:12:07', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(749, 'k0nq3fe50squqv5dnb6qh5jut6', 'teste', '', '2015-12-30 14:12:09', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(750, 'iu5on86pg0jl0r57h071cr0967', 'teste', '', '2015-12-30 18:12:02', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(751, 'rnkgb6hqbs9up6gs09s8kjmvm7', 'teste', '', '2015-12-30 18:12:11', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(752, '0rtr04cao1kahanregtp0ml5h2', 'teste', '', '2015-12-31 12:12:38', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(753, '7ueamot4qevie8v7aq6rsc3387', 'teste', '', '2015-12-31 12:12:56', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(754, '16g3bv7tq29etsskr1gm3qrhe1', 'teste', '', '2016-01-01 21:01:17', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(755, 'q72ka3lr131sgn227u7lfq8q40', 'teste', '', '2016-01-02 15:01:50', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(756, '6nmjsd00fjnfispebb2h3dheq3', 'teste', '', '2016-01-05 10:01:09', NULL, '193.78.85.153', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(757, 'cpv1h3s7i6pmisbrneoldoif42', 'teste', '', '2016-01-05 12:01:00', '2016-01-05 12:01:45', '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(758, 'a4q49uh5vcbj7p3cpgo7tb4t24', 'teste', '', '2016-01-05 12:01:49', '2016-01-05 12:01:21', '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(759, 'hrujvqdc1uce147vni929elr33', 'teste', '', '2016-01-05 12:01:24', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(760, 'fvtvjdgpbi88nalgemsvcl41e3', 'teste', '', '2016-01-05 21:01:18', '2016-01-05 22:01:36', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(761, '6tl5if0e51fcgm0rodf02dccl4', 'teste', '', '2016-01-05 22:01:17', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(762, 'ubtfegequsp1gsoklh49stfav7', 'teste', '', '2016-01-06 18:01:03', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(763, 'c8dggs01blleq0gfdb042i07a5', 'teste', '', '2016-01-06 18:01:37', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(764, 'pr0p8stfdjobvj0hctl3ruro31', 'teste', '', '2016-01-09 12:01:29', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(765, 'd0k0jioc1ms10skrm6d12rb2f1', 'teste', '', '2016-01-09 14:01:17', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(766, 'lbgcjfokphenkp67baagsu4lj5', 'teste', '', '2016-01-09 16:01:07', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(767, 'hmfhd52tk3fqor3h7ekem8ffu5', 'teste', '', '2016-01-09 18:01:39', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(768, '5bdo511nrg8fvk3ilnb8c2hpj6', 'teste', '', '2016-01-10 01:01:29', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(769, 'scstjtvq39iitrburdshqd1dk2', 'teste', '', '2016-01-10 10:01:49', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(770, 'oucjjno90cfkain6uqg2ami7v4', 'teste', '', '2016-01-10 14:01:45', '2016-01-10 16:01:59', '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(771, '2diaa9v3sg3v0pg50c7m338ai1', 'teste', '', '2016-01-10 16:01:06', '2016-01-10 16:01:07', '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(772, 'l70tf0338hulq6ndblalhh2hf1', 'teste', '', '2016-01-10 16:01:10', '2016-01-11 00:01:31', '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(773, '5plulddgalarca0oqv5s9l42a4', 'teste', '', '2016-01-11 00:01:35', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(774, '2hj00nqvqtja9gg6klcceegiv3', 'teste', '', '2016-01-11 00:01:28', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(775, 'vot7muevoqasbk7mdakqn34nj3', 'teste', '', '2016-01-11 10:01:55', NULL, '213.13.123.197', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(776, '', '', '', '2016-01-11 13:01:47', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(777, '', '', '', '2016-01-11 13:01:52', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(778, '', '', '', '2016-01-11 13:01:45', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(779, '', '', '', '2016-01-11 13:01:47', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(780, '', '', '', '2016-01-11 13:01:50', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(781, '', '', '', '2016-01-11 13:01:54', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(782, '', '', '', '2016-01-11 13:01:57', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(783, '', '', '', '2016-01-11 13:01:00', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(784, '', '', '', '2016-01-11 13:01:05', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(785, '', '', '', '2016-01-11 13:01:07', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(786, '', '', '', '2016-01-11 13:01:08', NULL, '109.51.154.34', 'nok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(787, 'p4tvpg9a72sn6p1htfimjgf385', 'Teste', '', '2016-01-11 13:01:36', NULL, '109.51.154.34', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; HTC One_M8 Buil'),
(788, 'c2bmak3h3bp9pf6q8o9hblqdi7', 'teste', '', '2016-01-11 22:01:34', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(789, '6daslqmjchhl2el6o5qv3tt8l5', 'teste', '', '2016-01-17 11:01:30', '2016-01-17 17:01:16', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(790, 'pdv954pi252esv2faera6urge5', 'teste', '', '2016-01-17 17:01:17', '2016-01-17 17:01:04', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(791, '', 'teste', '', '2016-01-17 17:01:06', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(792, '3sb9h544u0oqkoqi6e9l9g5fd5', 'teste', '', '2016-01-17 17:01:10', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(793, 'anfv4j44ipn70km9lf1tbvpl33', 'teste', '', '2016-01-17 19:01:36', '2016-01-17 19:01:29', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(794, '', 'teste', '', '2016-01-17 19:01:32', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(795, '9fo1ecdn0o0043gci2ei67ms21', 'teste', '', '2016-01-17 19:01:04', '2016-01-17 19:01:06', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(796, '', 'teste', '', '2016-01-17 19:01:08', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(797, 'i3dsmh4g700klao2hii69ss136', 'teste', '', '2016-01-17 19:01:59', '2016-01-17 19:01:02', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(798, '', 'teste', '', '2016-01-17 19:01:05', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(799, '', 'teste', '', '2016-01-17 19:01:55', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(800, '', 'teste', '', '2016-01-17 19:01:26', NULL, '109.51.194.169', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(801, 'q6sobp8sg903v0696qfv2g2lr7', 'teste', '', '2016-01-17 19:01:27', '2016-01-17 19:01:29', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(802, 'g9i6btqen6vta1qu9n5jl0cbv2', 'teste', '', '2016-01-17 19:01:32', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(803, 'ijm6jb7t2ocb06fbpshg6ch4f6', 'teste', '', '2016-01-18 22:01:12', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(804, 'vc8dj094p1ahddn2nab5hlv2h7', 'teste', '', '2016-01-19 10:01:16', NULL, '81.193.246.107', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(805, 'c3lf50dbcok09r8ee49r7if265', 'teste', '', '2016-01-19 12:01:54', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(806, 'h4oq5mual6kk7ene7ct8ovm8b3', 'teste', '', '2016-01-19 22:01:31', '2016-01-19 23:01:26', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(807, 'snlfiv0203tjkumoleubgbkuv6', 'teste', '', '2016-01-19 23:01:28', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(808, '4m1pdrel367c46n27cg76145m2', 'teste', '', '2016-01-20 21:01:24', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(809, 'sga52qqud80t1plo792g1npkf4', 'teste', '', '2016-01-20 22:01:12', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(810, 'v446jelhfth5uf5juj9l8anp06', 'teste', '', '2016-01-21 09:01:52', NULL, '62.169.70.157', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(811, 'poqpla45atge7rj7rv8ecl2ba0', 'teste', '', '2016-01-21 21:01:24', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(812, 'f0h3l7e98dr9db04a56mbotn85', 'teste', '', '2016-01-21 22:01:36', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(813, 'b0ot9tjlbksblcrdmgiak69150', 'teste', '', '2016-01-21 23:01:22', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(814, 'an1p50f6e422m63ggtmksplis6', 'teste', '', '2016-01-22 18:01:04', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(815, '7nmg66k8uv344bua78c7p023o6', 'teste', '', '2016-01-23 15:01:49', '2016-01-23 15:01:14', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(816, '5fqbvulece5if2v287fk5jdob5', 'teste', '', '2016-01-23 15:01:16', '2016-01-23 15:01:54', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(817, 'lhuqnt4tkk3v60bdb7gbuu8vp7', 'teste', '', '2016-01-23 15:01:56', '2016-01-23 15:01:16', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(818, 'iv5d1qaor1ah1obpj931icabs5', 'teste', '', '2016-01-23 15:01:18', '2016-01-23 15:01:08', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(819, 'vv0auimltfqstmjh456lgpgkc6', 'teste', '', '2016-01-23 15:01:10', '2016-01-23 15:01:50', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(820, '8j3ntde1gm3k39bachnbvnrga2', 'teste', '', '2016-01-23 15:01:51', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(821, 'qi08t8kduirs71dri7agoasf25', 'teste', '', '2016-01-23 15:01:36', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(822, 'k5cjhrrvd72dena59m3ojfrk64', 'teste', '', '2016-01-24 19:01:05', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(823, 'hsaj8i7147gho6u09glst1v0e4', 'teste', '', '2016-01-24 20:01:23', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(824, 'asofk9clsd87p3l6klddv2t1o7', 'teste', '', '2016-01-25 18:01:27', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(825, 'p3s2prvqggfvaehutdbu7btua4', 'teste', '', '2016-01-25 21:01:20', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(826, 'gsq22m2hvguuu9eqmnl3366kq2', 'teste', '', '2016-01-25 21:01:37', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(827, 'g7k6lkk6fcju3ji7gsklc7pra7', 'teste', '', '2016-01-26 09:01:49', NULL, '62.169.70.156', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(828, 'hkdb829urb0e2psch3e9upr380', 'teste', '', '2016-01-27 18:01:20', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(829, '1mf9j4lkvocpj3lk0higjdmg46', 'teste', '', '2016-01-28 09:01:44', '2016-01-28 22:01:15', '62.169.70.156', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(830, 'imlflpcf6urp9u35t2ie2reck6', 'teste', '', '2016-01-28 22:01:29', NULL, '62.169.70.156', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(831, 'qroj0t0892qp7kp0p302bnnrj4', 'teste', '', '2016-01-28 22:01:36', NULL, '92.250.58.33', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(832, '5r2hkko4salgc7s19dfsfob0g3', 'teste', '', '2016-01-28 22:01:29', NULL, '46.50.3.149', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS'),
(833, 'd847p5drp8gdci9qcbes6keff6', 'teste', '', '2016-01-29 14:01:47', NULL, '193.78.85.153', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/53'),
(834, 'gpmhrcn61keqnv055t6ta297v0', 'teste', '', '2016-01-29 17:01:58', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(835, 's9h9f86d2a507dudroqon1lks7', 'teste', '', '2016-01-30 18:01:25', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(836, 'qhpiadsu6c6ig1dcfkojkg4g82', 'teste', '', '2016-01-31 10:01:42', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(837, '0kesu4hd1s5cklb4niu4col6n7', 'teste', '', '2016-01-31 11:01:18', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(838, 'krem4315l6vljt11vmhmem9l93', 'teste', '', '2016-01-31 11:01:41', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; '),
(839, 'i79u2seblo6jse4f1r4rm8coh6', 'teste', '', '2016-01-31 11:01:09', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(840, 'b6m0eaurkr5i4kulo1ndt5lo41', 'teste', '', '2016-01-31 12:01:48', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(841, 'r2fighdi6hka7dvnchoj2qco03', 'teste', '', '2016-01-31 19:01:49', '2016-01-31 22:01:50', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(842, '4palaekbmsu78fdpcbsck26qf6', 'teste', '', '2016-01-31 22:01:28', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(843, 'of6qpraplblkvho1tmb850jk07', 'teste', '', '2016-02-02 08:02:05', NULL, '62.169.70.157', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(844, 'nm639qu9j77a1jfnhl89k61n90', 'teste', '', '2016-02-02 14:02:19', NULL, '188.82.153.217', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(845, '8dkechidaje7boacgjr608r7v7', 'teste', '', '2016-02-02 22:02:09', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(846, 'nvhv16j5bmolu8ss80l86l4aa3', 'teste', '', '2016-02-03 00:02:35', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(847, 'l6ceap4g347g0jkihui5mvqcb1', 'teste', '', '2016-02-04 08:02:16', NULL, '62.169.70.157', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(848, 'tt7u6r1pfsaibv7o2ockb9l047', 'teste', '', '2016-02-05 10:02:22', NULL, '213.13.123.197', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(849, 'ljbs26ebv1ie3iec5aogikhc42', 'teste', '', '2016-02-06 19:02:28', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(850, 'lhvd0on5qhrjvi3c84jjqci905', 'teste', '', '2016-02-06 19:02:26', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac '),
(851, 'iun5oiamnmia3p5mtkt3pg1fn3', 'teste', '', '2016-02-08 22:02:50', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(852, 'givr014cqfqmbkid88je6m59l2', 'teste', '', '2016-02-09 10:02:12', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(853, 'hng61j5qb9eg0p9pio0r7uf8d3', 'teste', '', '2016-02-09 10:02:19', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(854, 'b4ee83eg9spfv8jf1urnnh5uh5', 'teste', '', '2016-02-09 13:02:20', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(855, 'andlclt1bvmdti8ih6fr6hv7e0', 'teste', '', '2016-02-09 21:02:27', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(856, 'iv2ug3lbhid7q1735b3svojr81', 'teste', '', '2016-02-09 22:02:07', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(857, 'obhjtf37mmsvse4qpnqqqap943', 'teste', '', '2016-02-10 18:02:48', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(858, 'l2bdman0vkhjh2c49de3nljae5', 'teste', '', '2016-02-10 23:02:49', NULL, '62.169.70.157', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(859, '', 'test', '', '2016-02-11 09:02:44', NULL, '46.50.34.158', 'nok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS'),
(860, 'svr8vkd3timvucv42vsi6npr14', 'teste', '', '2016-02-11 09:02:59', NULL, '46.50.34.158', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS'),
(861, 'in01p7lhjbcpddbhj9narem2t2', 'teste', '', '2016-02-11 10:02:06', NULL, '62.169.70.159', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(862, 'g79a0t9quvja4gu3ksegu4i7i6', 'teste', '', '2016-02-11 12:02:10', NULL, '62.169.70.159', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(863, 'r9sl7j6evftgbhouj3l0joi0j1', 'teste', '', '2016-02-11 21:02:07', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(864, 'ru6tjnub34apd1teftf0km8r05', 'teste', '', '2016-02-12 09:02:48', NULL, '213.13.123.197', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(865, '4h9qnch6b4vudtav6aq3d6shr3', 'teste', '', '2016-02-12 18:02:14', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(866, 'cd7cn769o3k8ll0p3ibqfbcil7', 'teste', '', '2016-02-13 10:02:03', '2016-02-13 19:02:08', '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(867, '7e4198jrjqv834de83ggc04cm6', 'teste', '', '2016-02-13 19:02:13', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(868, 'kuqdlk9ni3e77ubv9kuhmd86h3', 'teste', '', '2016-02-14 10:02:27', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(869, '48isr1gkvhrps0vunslg5ndma6', 'teste', '', '2016-02-14 10:02:59', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(870, 'gpgerconso0f35vt55t7cut6o6', 'teste', '', '2016-02-14 20:02:37', NULL, '213.30.9.254', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(871, '7728cpqlhlttjqhl8389hdapo5', 'teste', '', '2016-02-16 09:02:56', NULL, '62.169.70.154', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(872, '96pmi8f7f4fi68m08c9e9ce890', 'teste', '', '2016-02-16 23:02:38', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(873, 'tbq5gs3i2cegncdlhsfi94n3h5', 'teste', '', '2016-02-17 22:02:18', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(874, 'gp4v34qq5csod0943la1jasht6', 'teste', '', '2016-02-18 10:02:03', '2016-02-18 14:02:26', '62.169.70.148', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(875, '3pkb1sdthn9i1i930uafhkbf25', 'teste', '', '2016-02-18 14:02:32', NULL, '62.169.70.148', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(876, 'mt0vh9to9pjk2gi3fvdk9t98c4', 'teste', '', '2016-02-19 14:02:52', '2016-02-19 14:02:39', '89.214.159.12', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(877, 'lol1unqvqgf2iettk60sfsic35', 'teste', '', '2016-02-19 14:02:43', NULL, '89.214.159.12', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(878, '75atmn4jk3laa6of4ekpi8mee1', 'teste', '', '2016-02-20 18:02:24', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(879, '59vk7e44ko9fkhtf7e18q2jrd4', 'teste', '', '2016-02-23 12:02:57', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(880, '8mio6hgvpob482p8d13vac9325', 'teste', '', '2016-02-23 22:02:49', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(881, '6m4qpndaocuhul1mss7iccsve7', 'teste', '', '2016-02-23 22:02:18', NULL, '83.223.250.1', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(882, 'q4i3pc7d99vovcn3cp8i8j8pv1', 'teste', '', '2016-02-23 22:02:41', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 6.0.1; GT-I9505 Build/'),
(883, 'kbcvr69cob7tljqhct91miedh2', 'Teste', '', '2016-02-23 23:02:35', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.1.1; Transformer TF1'),
(884, 'd2p7b3k507245mdpp8eiram3h4', 'teste', '', '2016-02-24 18:02:44', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(885, 'jodul30s2fofrtnj3vgp6okc05', 'teste', '', '2016-02-25 10:02:12', NULL, '62.169.70.154', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(886, 'the641j2pkbdoo2mnlmmha7u07', 'teste', '', '2016-02-26 22:02:23', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(887, 'i4s0pikjg4qpe430jghmkjmng6', 'teste', '', '2016-02-27 15:02:43', '2016-02-27 15:02:47', '188.80.156.151', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(888, 'db6e45o7vje5fms8j2n8ad35r5', 'maquidonas', '', '2016-02-27 15:02:59', '2016-02-27 16:02:07', '188.80.156.151', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(889, 'qh1be5rfg51g2mc4etcgenjro5', 'maquidonas', '', '2016-02-27 16:02:16', '2016-02-27 16:02:38', '188.80.156.151', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(890, 'g3qpstlkal0vv7ou99pajstpj4', 'maquidonas', '', '2016-02-27 16:02:19', NULL, '188.80.156.151', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(891, 'p3bj939lta9fd04fsvv2hcf8h3', 'maquidonas', '', '2016-02-27 17:02:11', NULL, '188.80.156.151', 'ok', 'Mozilla/5.0 (Windows NT 6.1; rv:44.0) Gecko/201001'),
(892, 'q0altqp9tb0k82pg5n2glmilc3', 'maquidonas', '', '2016-02-27 17:02:23', NULL, '188.80.156.151', 'ok', 'Mozilla/5.0 (iPad; CPU OS 9_2_1 like Mac OS X) App'),
(893, 't96fd8a30gg9vfqac04mr0t7n6', 'maquidonas', '', '2016-02-27 22:02:41', NULL, '46.50.38.190', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac '),
(894, '6jcc18h9jatbgme1rgv2um5hs3', 'teste', '', '2016-02-28 19:02:16', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(895, '9s591nm93ed98jv9pfbokro9m3', 'teste', '', '2016-03-01 21:03:51', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5');
INSERT INTO `main_logins` (`id_main_logins`, `ssid`, `login`, `modulo`, `datahora`, `hora_logout`, `ip`, `res`, `browser`) VALUES
(896, 'kqbup88bscbhdj6vgjdt9h3146', 'teste', '', '2016-03-03 22:03:45', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(897, 'iv58kqi9a3gdbl7jlct6ssve37', 'teste', '', '2016-03-05 11:03:00', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(898, '1m5aj249trt2duevgfvabvtt20', 'teste', '', '2016-03-06 15:03:24', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(899, '', 'maquidonas', '', '2016-03-06 16:03:57', NULL, '46.50.0.175', 'nok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac '),
(900, 'rhbdidevhkmqokjcqnth3otf90', 'teste', '', '2016-03-06 16:03:27', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(901, 'decrj2097q3ek514kntqc1g523', 'teste', '', '2016-03-07 21:03:09', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(902, 'oebc02id8cvf78akl8oksnd4r1', 'maquidonas', '', '2016-03-08 10:03:45', NULL, '81.193.246.107', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(903, 'hi6ob3uui1dhmf1vo7re70d426', 'teste', '', '2016-03-08 20:03:12', NULL, '109.51.132.24', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I950'),
(904, '8umtu82hftsahci4r0djcntoa6', 'teste', '', '2016-03-12 15:03:06', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(905, 'it3hdfsmqvug66m1n5vfj0ep85', 'maquidonas', '', '2016-03-15 12:03:35', NULL, '109.51.205.132', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(906, 'bgrn42fdhdqhtpe8ckl916j377', 'teste', '', '2016-03-15 19:03:30', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(907, 'h3cp0q914i92l1lqo3s01diig6', 'teste', '', '2016-03-16 18:03:25', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(908, 'qef45t69a5lms0but2596jmgo3', 'maquidonas', '', '2016-03-17 09:03:37', NULL, '81.193.246.107', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(909, '', '', '', '2016-03-17 09:03:55', NULL, '81.193.246.107', 'nok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(910, 'l4ng5458ghpvvgtti35bjarse0', 'maquidonas', '', '2016-03-17 09:03:59', NULL, '81.193.246.107', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(911, 'rgk523sa2q9e0mpu8n64km9t25', 'teste', '', '2016-03-17 22:03:40', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(912, 'indrp6t5b0ooh70alp2b8u4kr0', 'teste', '', '2016-03-23 22:03:59', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(913, 'e7hlld676bi6krfkr582fm78d0', 'maquidonas', '', '2016-03-25 12:03:50', NULL, '109.51.192.219', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(914, 'pup5o2a935tj9sjkf5vph061t4', 'teste', '', '2016-03-25 15:03:29', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(915, 'oqh0ngt8cbgk5tgg21rov36gj5', 'teste', '', '2016-03-29 21:03:37', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(916, 'td3eap51a5ka6ahkl21eda8v37', 'teste', '', '2016-03-30 21:03:38', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(917, 'rp5lthm06phu7ihetu5tumv4b5', 'teste', '', '2016-03-30 22:03:55', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(918, 'hrkkm948001093pph46jt44kn5', 'teste', '', '2016-03-31 21:03:51', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(919, '02met53fa5n04g71s9latou0l7', 'maquidonas', '', '2016-04-02 14:04:28', '2016-04-02 15:04:12', '188.80.112.19', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(920, 'onjkg8jgcfc80e7d2rh8csrmd4', 'maquidonas', '', '2016-04-02 15:04:30', '2016-04-02 15:04:21', '188.80.112.19', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko'),
(921, '', 'maquidonas', '', '2016-04-02 15:04:58', NULL, '188.80.112.19', 'nok', 'Mozilla/5.0 (iPad; CPU OS 9_3 like Mac OS X) Apple'),
(922, 'fbtc8pnp2lac9mshbredtn8l73', 'maquidonas', '', '2016-04-02 15:04:19', NULL, '188.80.112.19', 'ok', 'Mozilla/5.0 (iPad; CPU OS 9_3 like Mac OS X) Apple'),
(923, 'n3f0gkg4sjjhnrde8dkum87ka2', 'maquidonas', '', '2016-04-02 15:04:18', NULL, '188.80.112.19', 'ok', 'Mozilla/5.0 (iPad; CPU OS 9_3 like Mac OS X) Apple'),
(924, 'ssbkf7e8hpr7b91sp0jd3oh9c5', 'maquidonas', '', '2016-04-02 15:04:10', NULL, '188.80.117.136', 'ok', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko'),
(925, 'sp5rosgfrpkfu5nv6m8qglsfj1', 'maquidonas', '', '2016-04-02 15:04:52', NULL, '188.80.117.136', 'ok', 'Mozilla/5.0 (iPad; CPU OS 9_3 like Mac OS X) Apple'),
(926, 'vpsb22qp2kj4dd8jod5e0uk9s6', 'maquidonas', '', '2016-04-02 18:04:46', NULL, '46.50.48.150', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac '),
(927, 'jashcoliaip6e3dg2udv1rvt30', 'maquidonas', '', '2016-04-03 11:04:50', NULL, '46.50.16.34', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac '),
(928, 'uh4b6pr9qhr3bncin914gajoj6', 'maquidonas', '', '2016-04-04 17:04:39', NULL, '188.80.156.45', 'ok', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/201001'),
(929, 'qcts1pvs42eg85utrim3drdf66', 'maquidonas', '', '2016-04-06 16:04:34', NULL, '188.80.156.46', 'ok', 'Mozilla/5.0 (Windows NT 6.1; rv:45.0) Gecko/201001'),
(930, 'hssaubfou2852prk7ng5rcfvn7', 'teste', '', '2016-04-06 22:04:10', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(931, 'rk78st9hnv9of5uuu7i5f5g7e2', 'teste', '', '2016-04-10 17:04:11', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(932, 'b6d5aftf5qlu5rp1fshbpuap74', 'teste', '', '2016-04-10 18:04:07', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac '),
(933, '6qo3go7u2l5ucmssk9imhj5ah4', 'teste', '', '2016-04-10 18:04:40', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(934, '2adkskn1k6cgs2ktck18qfi7e2', 'teste', '', '2016-04-11 20:04:03', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(935, 'pf7m551t47vagtiao2mmmoq017', 'teste', '', '2016-04-11 20:04:36', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.1.1; Transformer TF1'),
(936, '8m9rjkk4k0dhdslvetebh0jkr3', 'teste', '', '2016-04-11 20:04:36', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_1 like Mac '),
(937, 'cak0cvaicgi51alm8dm8e297h1', 'teste', '', '2016-04-12 21:04:19', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(938, '8oqf369iqnf74g0dvbd1adg1q2', 'teste', '', '2016-04-12 21:04:04', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(939, 'hak7hmo220tnmg7c67oe88bbu0', 'teste', '', '2016-04-13 17:04:09', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(940, '81fh75epe32c61fgsf5ro11mm7', 'teste', '', '2016-04-13 19:04:19', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9505 Build/'),
(941, '0i15e5fmd7fuigu8vijjjbpj11', 'maquidonas', '', '2016-04-14 07:04:17', NULL, '46.50.35.170', 'ok', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2_1 like Mac '),
(942, 'edrrj5s1627ebs99bfk75tsi56', 'teste', '', '2016-04-14 20:04:23', NULL, '109.51.194.169', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(943, 'q4epo1dbtltpeh7trbsi220882', 'teste', '', '2016-05-07 21:05:32', NULL, '109.51.191.65', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(944, 'cegnjtto8usjp1pg5blrkjmua2', 'teste', '', '2016-05-15 20:05:57', NULL, '109.51.191.65', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(945, 'k6ikahipbs1tsrkru35qvg6hr4', 'teste', '', '2016-05-16 08:05:52', NULL, '83.240.240.198', 'ok', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/53'),
(946, 'llfqojf8rdr4djoih3rka6tc75', 'teste', '', '2016-05-16 22:05:36', NULL, '109.51.191.65', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(947, '40uevjk00tm5g690jcoon02970', 'teste', '', '2016-06-15 23:06:26', '2016-06-15 23:06:26', '109.51.188.77', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(948, 'egnq40kagsv7r0ph9eipp475a7', 'teste', '', '2016-06-15 23:06:21', NULL, '109.51.188.77', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(949, '9ue8vlldsfu4c3ib5s1p1vp4f2', 'teste', '', '2016-06-26 16:06:38', NULL, '109.51.191.65', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(950, 'rvaepiqb2luhc7oo1qm5ncg012', 'teste', '', '2016-06-26 16:06:48', '2016-06-26 17:06:38', '109.51.191.65', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(951, '46ko2sl0v98bfngct1evp5qpq7', 'teste', '', '2016-06-26 17:06:53', NULL, '109.51.191.65', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(952, 'oelimk0nbaqrnh5hk27umb1a44', 'teste', '', '2016-11-09 21:11:49', NULL, '109.51.188.77', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5'),
(953, 'sultl1bmvelimenu62lvict9v4', 'teste', '', '2016-11-24 23:11:40', NULL, '109.51.188.77', 'ok', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/5');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_menu_sub`
--

CREATE TABLE `main_menu_sub` (
  `id_main_menu_sub` int(11) NOT NULL,
  `main_menu_top__id_main_menu_top` int(10) NOT NULL DEFAULT '0',
  `nome` varchar(50) NOT NULL DEFAULT '',
  `sub_var` varchar(50) NOT NULL DEFAULT '',
  `extra_param` varchar(50) DEFAULT '',
  `class_icon` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Menus Inferiores';

--
-- Extraindo dados da tabela `main_menu_sub`
--

INSERT INTO `main_menu_sub` (`id_main_menu_sub`, `main_menu_top__id_main_menu_top`, `nome`, `sub_var`, `extra_param`, `class_icon`) VALUES
(7, 4, 'Clientes', 'clientes', '&table=clientes', 'group'),
(1, 1, 'Utilizadores', 'utilizadores', '&table=utilizadores', 'group'),
(2, 1, 'Modulos', 'modulos', '&table=main_modulos', 'modules'),
(3, 2, 'Logins', 'acessos', '&table=main_logins', 'manage_page'),
(4, 3, 'Menu Top', 'menu_top', '&table=main_menu_top', 'modules'),
(5, 3, 'Menu Sub', 'menu_sub', '&table=main_menu_sub', 'modules'),
(8, 4, 'Veiculos', 'veiculos', '&table=veiculos', 'car'),
(9, 4, 'Obras', 'obras', '&table=obras', 'modules_manage'),
(11, 11, 'IPO', 'ipo', '', 'manage'),
(16, 11, 'Importação', 'import', '', 'modules'),
(12, 4, 'Marcas', 'marcas', '&table=table_marcas', 'invoices'),
(13, 4, 'Notas', 'notas', '&table=notas_clientes', 'report'),
(10, 11, 'Pesquisa Clientes / Veiculos', 'pesq_clientes', '', 'group'),
(14, 11, 'Revisão', 'revisao', '', 'manage'),
(15, 11, 'Listagem', 'list', '', 'group'),
(120, 4, 'Utilizadores', 'utilizadores', '&table=utilizadores', 'group'),
(113, 13, 'Inserir Registo', 'inserir', '&opt=table_ins&table=pot_clientes', 'group'),
(114, 13, 'Listar P.Negócios', 'listar_pot', '&table=pot_clientes', 'manage'),
(117, 14, 'Inserir Registo', 'inserir', '&opt=table_ins&table=pot_clientes', 'group'),
(116, 13, 'Pesquisar', 'pesq_pot', '', 'group'),
(118, 14, 'Listar', 'listar_pot', '&table=pot_clientes', 'group'),
(119, 14, 'Pesquisar', 'pesq_pot', NULL, 'group'),
(121, 15, 'Pesquisa Clientes / Veiculos', 'pesq_clientes', '', 'group'),
(122, 16, 'Inserir visita', 'visita_cliente', '', 'manage'),
(123, 16, 'Listar Clientes', 'listar_clientes', '', 'manage'),
(124, 16, 'Criar cliente', 'ins_cliente', '', 'manage'),
(128, 17, 'Listar Fornecedores', 'listar_fornecedores', '', 'manage'),
(126, 16, 'Listar Visitas', 'listar_visitas', '', 'manage'),
(127, 17, 'Inserir Visita a Fornecedor', 'visita_fornecedor', '', 'manage'),
(129, 17, 'Criar Fornecedor', 'ins_fornecedor', '', 'manage'),
(130, 17, 'Listar Visitas a Fornecedores', 'listar_visitas_fornecedores', '', 'manage');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_menu_top`
--

CREATE TABLE `main_menu_top` (
  `id_main_menu_top` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `main_modulos__id_modulo` int(10) NOT NULL DEFAULT '0',
  `top_var` varchar(50) NOT NULL DEFAULT '',
  `extra_param` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Menus de topo';

--
-- Extraindo dados da tabela `main_menu_top`
--

INSERT INTO `main_menu_top` (`id_main_menu_top`, `nome`, `main_modulos__id_modulo`, `top_var`, `extra_param`) VALUES
(4, 'Gestão', 2, 'gestao', '&sub=clientes&table=clientes'),
(1, 'Administração', 1, 'administracao', '&sub=utilizadores&table=utilizadores'),
(2, 'Registos', 1, 'registos', '&sub=acessos&table=main_logins'),
(3, 'Configurações', 1, 'conf', '&sub=menu_top&table=main_menu_top'),
(11, 'Operações', 2, 'operacoes', '&sub=pesq_clientes'),
(14, 'Vendas', 3, 'vendas', '&sub=pesq_pot'),
(13, 'Vendas', 2, 'vendas', '&sub=pesq_pot'),
(15, 'Operações', 4, 'operacoes', '&sub=pesq_clientes'),
(16, 'w-Cliente', 2, 'cliente', '&sub=visita_cliente'),
(17, 'Fornecedor', 2, 'fornecedor', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_modulos`
--

CREATE TABLE `main_modulos` (
  `id_modulo` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL DEFAULT '',
  `modulo` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Listagem dos modulos do HPC2.0';

--
-- Extraindo dados da tabela `main_modulos`
--

INSERT INTO `main_modulos` (`id_modulo`, `descricao`, `modulo`) VALUES
(4, 'Módulo Rececionista', 'rececionista'),
(2, 'Módulo Principal', 'gestao'),
(3, 'Módulo Vendas', 'vendas'),
(1, 'Modulo de Administração', 'administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `main_modulos_users`
--

CREATE TABLE `main_modulos_users` (
  `id_modulo` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `predefinido` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `main_modulos_users`
--

INSERT INTO `main_modulos_users` (`id_modulo`, `id_user`, `predefinido`) VALUES
(1, 325, 1),
(2, 325, 0),
(3, 325, 0),
(4, 325, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `obs` text,
  `imagem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca`, `obs`, `imagem`) VALUES
(3, 'Caterpillar', 'Caterpillar', 'upload/cat.jpg'),
(4, 'Komatsu', '', 'upload/komatsu.jpg'),
(5, 'Volvo', '', 'upload/volvologo.jpg'),
(6, 'Daewoo', '', 'upload/daewoo.jpg'),
(7, 'Mercedes', '', 'upload/mercedes.jpg'),
(8, 'Lebrero', '', ''),
(9, 'Case', '', ''),
(10, 'Himoinsa', '', ''),
(11, 'Finlay', '', ''),
(12, 'Toyota', '', ''),
(13, 'Honda', '', ''),
(14, 'Fiat', '', ''),
(15, 'Nordberg Bergeaud', 'Britagem', ''),
(16, 'Yanmar', '', ''),
(17, 'Manitou', '', ''),
(18, 'EXTEC', '', ''),
(19, 'JCB', '', ''),
(20, 'IRRIFRANCE', '', ''),
(21, 'EUROGER', '', ''),
(22, 'New Holland', '', ''),
(23, 'Atlas', '', ''),
(24, 'Akerman', '', ''),
(25, 'DAF', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelos`
--

CREATE TABLE `modelos` (
  `id_modelo` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `obs` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `modelos`
--

INSERT INTO `modelos` (`id_modelo`, `id_marca`, `modelo`, `obs`) VALUES
(3, 3, '325 BLN', 'Excavadora de rastos'),
(4, 3, '926E', 'PÃ¡ de rodas'),
(5, 4, 'PC240 6K', 'Excavadora de rastos'),
(6, 5, 'A25C', 'Dumper'),
(7, 6, '225LC-V', 'Excavadora de rastos'),
(8, 3, 'D6D', 'Bulldozer de rastos'),
(9, 3, '910', 'PÃ¡ de rodas'),
(10, 5, 'FL12', 'Trator'),
(11, 7, '1840', 'Trator'),
(12, 5, 'L160', 'PÃ¡ de rodas'),
(13, 3, '442D', 'Retroescavadora'),
(14, 3, '938F', ''),
(15, 4, 'D65EX12', 'Trator de rastos'),
(16, 5, 'N10', 'CamÃµes basculantes'),
(17, 3, 'VM5', ''),
(18, 3, 'IT18F', ''),
(19, 3, '960F', ''),
(20, 3, '140G', ''),
(21, 3, '921C/2', ''),
(22, 4, 'WA470 5H', ''),
(23, 10, 'HSW505-T5', ''),
(24, 3, 'ECM', ''),
(25, 11, 'Fintec 542', ''),
(26, 3, 'Land Cruiser', ''),
(27, 13, 'Shadow', ''),
(28, 3, '135H', 'Niveladora'),
(29, 14, 'FD14', 'Bulldozer de rastos'),
(30, 15, '9 37', 'Britador CÃ³nico'),
(31, 16, 'B25V', 'Mini escavadora'),
(32, 17, 'MT 1333', 'ExtensÃ­vel'),
(33, 18, 'S7', ''),
(34, 3, '918F', ''),
(35, 19, '4CX', ''),
(36, 19, '330 JS', ''),
(37, 20, 'SUPER 1TP', ''),
(38, 21, '26CV', ''),
(39, 22, 'LB115', ''),
(40, 23, '2202 DLC', ''),
(41, 24, 'H7Mc', ''),
(42, 25, 'XF95.480', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notas_clientes`
--

CREATE TABLE `notas_clientes` (
  `id_notas_clientes` int(11) NOT NULL,
  `id_visita` int(10) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `tipo` varchar(50) NOT NULL DEFAULT '',
  `nota` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Notas Clientes';

-- --------------------------------------------------------

--
-- Estrutura da tabela `notas_fornecedores`
--

CREATE TABLE `notas_fornecedores` (
  `id_notas_fornecedores` int(11) NOT NULL,
  `id_deslocacao` int(10) NOT NULL DEFAULT '0',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `tipo` varchar(50) NOT NULL DEFAULT '',
  `nota` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Notas Fornecedores';

-- --------------------------------------------------------

--
-- Estrutura da tabela `sub_categorias`
--

CREATE TABLE `sub_categorias` (
  `id_sub_categoria` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `sub_categoria` varchar(50) NOT NULL,
  `imagem1` varchar(50) NOT NULL DEFAULT 'upload/nada.png',
  `imagem2` varchar(50) NOT NULL,
  `obs` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sub_categorias`
--

INSERT INTO `sub_categorias` (`id_sub_categoria`, `id_categoria`, `sub_categoria`, `imagem1`, `imagem2`, `obs`) VALUES
(1, 3, 'Bulldozers', 'upload/dozer.jpg', '', 'Tratores de rastos'),
(2, 3, 'Escavadoras', 'upload/escavadora.jpg', '', 'Escavadoras hidrÃ¡ulicas'),
(3, 3, 'Niveladoras', 'upload/niveladora.jpg', '', ''),
(4, 3, 'Carregadoras', 'upload/carregadoras.jpg', '', ''),
(5, 3, 'Retroescavadoras', 'upload/retroescavadora.jpg', '', ''),
(6, 3, 'Materiais', 'upload/materiais.jpg', '', ''),
(7, 3, 'Cilindros', 'upload/cilindro.jpg', '', ''),
(8, 3, 'Empilhadores', 'upload/empilhadores.jpg', '', ''),
(9, 3, 'Dumpers', 'upload/dumpers.jpg', '', ''),
(13, 2, 'Tratores', 'upload/trator.jpg', '', ''),
(14, 2, 'CamiÃµes', 'upload/camiao.jpg', '', 'CamiÃµes com caixa'),
(15, 1, 'AutomÃ³veis', 'upload/carro_categ.jpg', '', 'AutomÃ³veis ligeiros'),
(18, 3, 'Britagem', 'upload/britagem-01.jpg', '', 'Material de britagem'),
(19, 3, 'Geradores', 'upload/gerador.jpg', '', ''),
(20, 5, 'EletrÃ³nica', 'upload/eletronica-01.jpg', '', 'Componentes eletrÃ³nicos'),
(21, 1, '4x4', 'upload/4x4.jpg', '', 'AutomÃ³veis todo o terreno'),
(22, 1, 'Motociclos', 'upload/moto.jpg', '', ''),
(23, 4, 'Rega', 'upload/rega-02.jpg', '', ''),
(24, 4, 'Motores', 'upload/bomba_rega.jpg', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `ID_UTIL` int(11) NOT NULL,
  `LOGIN` varchar(50) DEFAULT '',
  `PASSW` varchar(51) DEFAULT '',
  `NOME` text,
  `main_modulos__id_modulo` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Gestão de Utilizadores';

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`ID_UTIL`, `LOGIN`, `PASSW`, `NOME`, `main_modulos__id_modulo`) VALUES
(325, 'teste', '698dc19d489c4e4db73e28a713eab07b', 'teste', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitas`
--

CREATE TABLE `visitas` (
  `id_visita` int(11) NOT NULL,
  `data` date NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitas_equipamentos`
--

CREATE TABLE `visitas_equipamentos` (
  `id_visita` int(11) NOT NULL,
  `id_equipamento` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avisos_clientes`
--
ALTER TABLE `avisos_clientes`
  ADD PRIMARY KEY (`id_aviso`);

--
-- Indexes for table `avisos_fornecedores`
--
ALTER TABLE `avisos_fornecedores`
  ADD PRIMARY KEY (`id_aviso_deslocacao`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `deslocacoes`
--
ALTER TABLE `deslocacoes`
  ADD PRIMARY KEY (`id_deslocacao`);

--
-- Indexes for table `deslocacoes_equipamentos`
--
ALTER TABLE `deslocacoes_equipamentos`
  ADD PRIMARY KEY (`id_deslocacao`,`id_equipamento`);

--
-- Indexes for table `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD PRIMARY KEY (`id_equipamento`,`id_categoria`,`id_sub_categoria`,`id_marca`,`id_modelo`),
  ADD KEY `id_modelo` (`id_modelo`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Indexes for table `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id_foto`,`id_equipamento`),
  ADD KEY `id_equipamento` (`id_equipamento`);

--
-- Indexes for table `main_logins`
--
ALTER TABLE `main_logins`
  ADD PRIMARY KEY (`id_main_logins`);

--
-- Indexes for table `main_menu_sub`
--
ALTER TABLE `main_menu_sub`
  ADD PRIMARY KEY (`id_main_menu_sub`);

--
-- Indexes for table `main_menu_top`
--
ALTER TABLE `main_menu_top`
  ADD PRIMARY KEY (`id_main_menu_top`);

--
-- Indexes for table `main_modulos`
--
ALTER TABLE `main_modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indexes for table `main_modulos_users`
--
ALTER TABLE `main_modulos_users`
  ADD PRIMARY KEY (`id_modulo`,`id_user`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indexes for table `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id_modelo`,`id_marca`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indexes for table `notas_clientes`
--
ALTER TABLE `notas_clientes`
  ADD PRIMARY KEY (`id_notas_clientes`);

--
-- Indexes for table `notas_fornecedores`
--
ALTER TABLE `notas_fornecedores`
  ADD PRIMARY KEY (`id_notas_fornecedores`);

--
-- Indexes for table `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD PRIMARY KEY (`id_sub_categoria`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`ID_UTIL`),
  ADD UNIQUE KEY `log` (`LOGIN`);

--
-- Indexes for table `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id_visita`);

--
-- Indexes for table `visitas_equipamentos`
--
ALTER TABLE `visitas_equipamentos`
  ADD PRIMARY KEY (`id_visita`,`id_equipamento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avisos_clientes`
--
ALTER TABLE `avisos_clientes`
  MODIFY `id_aviso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `avisos_fornecedores`
--
ALTER TABLE `avisos_fornecedores`
  MODIFY `id_aviso_deslocacao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deslocacoes`
--
ALTER TABLE `deslocacoes`
  MODIFY `id_deslocacao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `equipamentos`
--
ALTER TABLE `equipamentos`
  MODIFY `id_equipamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;
--
-- AUTO_INCREMENT for table `main_logins`
--
ALTER TABLE `main_logins`
  MODIFY `id_main_logins` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=954;
--
-- AUTO_INCREMENT for table `main_menu_sub`
--
ALTER TABLE `main_menu_sub`
  MODIFY `id_main_menu_sub` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `main_menu_top`
--
ALTER TABLE `main_menu_top`
  MODIFY `id_main_menu_top` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `main_modulos`
--
ALTER TABLE `main_modulos`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `notas_clientes`
--
ALTER TABLE `notas_clientes`
  MODIFY `id_notas_clientes` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notas_fornecedores`
--
ALTER TABLE `notas_fornecedores`
  MODIFY `id_notas_fornecedores` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `ID_UTIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;
--
-- AUTO_INCREMENT for table `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD CONSTRAINT `equipamentos_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelos` (`id_modelo`),
  ADD CONSTRAINT `equipamentos_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`),
  ADD CONSTRAINT `equipamentos_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `sub_categorias` (`id_categoria`);

--
-- Limitadores para a tabela `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fotos_ibfk_1` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamentos` (`id_equipamento`);

--
-- Limitadores para a tabela `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

--
-- Limitadores para a tabela `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `sub_categorias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
