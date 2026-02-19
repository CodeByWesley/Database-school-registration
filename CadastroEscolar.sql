-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-208392-db.mariadb-208392:16400
-- Tempo de geração: 17-Fev-2026 às 13:20
-- Versão do servidor: 11.1.2-MariaDB-1:11.1.2+maria~ubu2004
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `CadastroEscolar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `id_alunos` int(11) DEFAULT NULL,
  `nome_alunos` varchar(255) NOT NULL COMMENT 'nome do aluno',
  `nome_pai` varchar(255) DEFAULT NULL COMMENT 'nome do pai',
  `nome_mae` varchar(255) DEFAULT NULL COMMENT 'nome da mae',
  `email` varchar(100) NOT NULL COMMENT 'email do aluno',
  `cpf` varchar(11) NOT NULL COMMENT 'cpf do aluno',
  `senha` varchar(15) NOT NULL COMMENT 'senha do aluno',
  `data_nascimento` date NOT NULL COMMENT 'data de nascimento do aluno',
  `rua` varchar(150) DEFAULT NULL COMMENT 'rua do endereco',
  `numero` varchar(10) DEFAULT NULL COMMENT 'numero do endereco',
  `bairro` varchar(100) DEFAULT NULL COMMENT 'bairro',
  `cidade` varchar(100) DEFAULT NULL COMMENT 'cidade',
  `estado` varchar(2) DEFAULT NULL COMMENT 'estado (UF)',
  `cep` varchar(8) DEFAULT NULL COMMENT 'CEP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `nivel` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `matricula`
--

CREATE TABLE `matricula` (
  `id_matricula` int(11) DEFAULT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL,
  `data_matricula` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `capacidade` int(11) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `id_turma` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `semestre` int(11) DEFAULT NULL,
  `vagas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
