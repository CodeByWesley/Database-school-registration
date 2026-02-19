-- Schema gerado a partir do dump do phpMyAdmin (CadastroEscolar)
-- Objetivo: pronto para subir no GitHub (somente estrutura)

CREATE DATABASE IF NOT EXISTS `CadastroEscolar`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `CadastroEscolar`;

-- =========================
-- TABELA: cursos
-- =========================
CREATE TABLE IF NOT EXISTS `cursos` (
                                        `id_curso` INT(11) NOT NULL AUTO_INCREMENT,
    `nome_curso` VARCHAR(100) DEFAULT NULL,
    `carga_horaria` INT(11) DEFAULT NULL,
    `nivel` VARCHAR(50) DEFAULT NULL,
    `status` VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY (`id_curso`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
-- TABELA: salas
-- =========================
CREATE TABLE IF NOT EXISTS `salas` (
                                       `id_sala` INT(11) NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) DEFAULT NULL,
    `capacidade` INT(11) DEFAULT NULL,
    `tipo` VARCHAR(30) DEFAULT NULL,
    PRIMARY KEY (`id_sala`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
-- TABELA: turmas
-- =========================
CREATE TABLE IF NOT EXISTS `turmas` (
                                        `id_turma` INT(11) NOT NULL AUTO_INCREMENT,
    `id_curso` INT(11) NOT NULL,
    `turno` VARCHAR(20) DEFAULT NULL,
    `ano` INT(11) DEFAULT NULL,
    `semestre` INT(11) DEFAULT NULL,
    `vagas` INT(11) DEFAULT NULL,
    `id_sala` INT(11) NOT NULL,
    PRIMARY KEY (`id_turma`),
    KEY `idx_turmas_id_curso` (`id_curso`),
    KEY `idx_turmas_id_sala` (`id_sala`),
    CONSTRAINT `fk_turmas_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
    CONSTRAINT `fk_turmas_id_sala` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
-- TABELA: alunos
-- =========================
CREATE TABLE IF NOT EXISTS `alunos` (
                                        `id_aluno` INT(11) NOT NULL AUTO_INCREMENT,
    `nome_aluno` VARCHAR(100) DEFAULT NULL,
    `nome_pai` VARCHAR(255) DEFAULT NULL COMMENT 'nome do pai',
    `nome_mae` VARCHAR(255) DEFAULT NULL COMMENT 'nome da mae',
    `email` VARCHAR(100) NOT NULL COMMENT 'email do aluno',
    `cpf` VARCHAR(11) NOT NULL COMMENT 'cpf do aluno',
    `senha` VARCHAR(15) NOT NULL COMMENT 'senha do aluno',
    `data_nascimento` DATE NOT NULL COMMENT 'data de nascimento do aluno',
    `rua` VARCHAR(150) DEFAULT NULL COMMENT 'rua do endereco',
    `numero_da_casa` VARCHAR(20) DEFAULT NULL,
    `bairro` VARCHAR(100) DEFAULT NULL COMMENT 'bairro',
    `cidade` VARCHAR(100) DEFAULT NULL COMMENT 'cidade',
    `estado` VARCHAR(2) DEFAULT NULL COMMENT 'estado (UF)',
    `cep` VARCHAR(8) DEFAULT NULL COMMENT 'CEP',
    PRIMARY KEY (`id_aluno`),
    UNIQUE KEY `email` (`email`),
    UNIQUE KEY `cpf` (`cpf`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
-- TABELA: matriculas
-- =========================
CREATE TABLE IF NOT EXISTS `matriculas` (
                                            `id_matricula` INT(11) NOT NULL AUTO_INCREMENT,
    `id_aluno` INT(11) NOT NULL,
    `id_turma` INT(11) NOT NULL,
    `data_matricula` DATE DEFAULT NULL,
    `status` ENUM('Matriculada','Trancada','Cancelada','Concluida') NOT NULL,
    PRIMARY KEY (`id_matricula`),
    UNIQUE KEY `unique_aluno_turma` (`id_aluno`,`id_turma`),
    KEY `idx_matricula_aluno` (`id_aluno`) USING BTREE,
    KEY `idx_matricula_turma` (`id_turma`) USING BTREE,
    CONSTRAINT `fk_matricula_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
    CONSTRAINT `fk_matriculas_id_turma` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
