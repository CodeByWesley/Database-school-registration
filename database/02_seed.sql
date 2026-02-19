-- Seed (dados fictícios) para testes locais
USE `CadastroEscolar`;

-- Limpa (opcional) para evitar conflito ao rodar o seed mais de uma vez
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM matriculas;
DELETE FROM alunos;
DELETE FROM turmas;
DELETE FROM salas;
DELETE FROM cursos;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE matriculas AUTO_INCREMENT = 1;
ALTER TABLE alunos AUTO_INCREMENT = 1;
ALTER TABLE turmas AUTO_INCREMENT = 1;
ALTER TABLE salas AUTO_INCREMENT = 1;
ALTER TABLE cursos AUTO_INCREMENT = 1;

-- =========================
-- cursos
-- =========================
INSERT INTO cursos (nome_curso, carga_horaria, nivel, status) VALUES
                                                                  ('Administração', 1000, 'Técnico', 'Ativo'),
                                                                  ('Informática', 1200, 'Técnico', 'Ativo'),
                                                                  ('Ciência da Computação', 3200, 'Graduação', 'Ativo');

-- =========================
-- salas
-- =========================
INSERT INTO salas (nome, capacidade, tipo) VALUES
                                               ('Lab 01', 30, 'Laboratório'),
                                               ('Sala 02', 40, 'Sala comum'),
                                               ('Lab 03', 28, 'Laboratório');

-- =========================
-- turmas (depende de cursos e salas)
-- =========================
INSERT INTO turmas (id_curso, turno, ano, semestre, vagas, id_sala) VALUES
                                                                        (1, 'Manhã', 2026, 1, 35, 2),
                                                                        (2, 'Tarde', 2026, 1, 30, 1),
                                                                        (3, 'Noite', 2026, 1, 28, 3);

-- =========================
-- alunos
-- Regras do seu schema: email e cpf são UNIQUE; cpf tem 11 chars; cep tem 8; estado tem 2
-- =========================
INSERT INTO alunos
(nome_aluno, nome_pai, nome_mae, email, cpf, senha, data_nascimento, rua, numero_da_casa, bairro, cidade, estado, cep)
VALUES
    ('João Silva', 'Carlos Silva', 'Maria Silva', 'joao.silva@email.com', '12345678901', 'Senha@123', '2003-05-10',
     'Rua das Flores', '120', 'Centro', 'Recife', 'PE', '50000000'),
    ('Ana Costa', 'Roberto Costa', 'Paula Costa', 'ana.costa@email.com', '98765432100', 'Senha@123', '2002-03-22',
     'Av. Boa Viagem', '500', 'Boa Viagem', 'Recife', 'PE', '51000000'),
    ('Lucas Lima', 'Marcos Lima', 'Renata Lima', 'lucas.lima@email.com', '11122233344', 'Senha@123', '2004-11-02',
     'Rua do Sol', '45A', 'Bairro Novo', 'Olinda', 'PE', '53000000');

-- =========================
-- matriculas (depende de alunos e turmas)
-- status: 'Matriculada' | 'Trancada' | 'Cancelada' | 'Concluida'
-- unique_aluno_turma impede duplicar o mesmo aluno na mesma turma
-- =========================
INSERT INTO matriculas (id_aluno, id_turma, data_matricula, status) VALUES
                                                                        (1, 2, '2026-02-01', 'Matriculada'),
                                                                        (2, 1, '2026-02-02', 'Matriculada'),
                                                                        (3, 3, '2026-02-03', 'Matriculada');
