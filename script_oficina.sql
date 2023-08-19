-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`clientes` (
  `cliente_id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `rua` VARCHAR(100) NULL,
  `numero_casa` VARCHAR(45) NULL,
  PRIMARY KEY (`cliente_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`veiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`veiculos` (
  `veiculo_id` INT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `placa` CHAR(7) NOT NULL,
  `cliente_id` INT NOT NULL,
  PRIMARY KEY (`veiculo_id`, `cliente_id`),
  INDEX `fk_veiculos_clientes_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_veiculos_clientes`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `oficina`.`clientes` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`mecanicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`mecanicos` (
  `mecanico_id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `contato` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(50) NOT NULL,
  `especialidade` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`mecanico_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`ordens_de_servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`ordens_de_servicos` (
  `numero` INT NOT NULL,
  `data_emisao` VARCHAR(45) NULL,
  `valor` FLOAT NOT NULL,
  `status` ENUM('CONCLUIDO', 'EM ANDAMENTO') NULL,
  `data_conclusao` VARCHAR(45) NULL,
  `veiculo_id` INT NOT NULL,
  `mecanico_id` INT NOT NULL,
  PRIMARY KEY (`numero`, `veiculo_id`, `mecanico_id`),
  INDEX `fk_ordens_de_servicos_veiculos1_idx` (`veiculo_id` ASC) VISIBLE,
  INDEX `fk_ordens_de_servicos_mecanicos1_idx` (`mecanico_id` ASC) VISIBLE,
  CONSTRAINT `fk_ordens_de_servicos_veiculos1`
    FOREIGN KEY (`veiculo_id`)
    REFERENCES `oficina`.`veiculos` (`veiculo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordens_de_servicos_mecanicos1`
    FOREIGN KEY (`mecanico_id`)
    REFERENCES `oficina`.`mecanicos` (`mecanico_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`servicos` (
  `servicos_id` INT NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`servicos_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`pecas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`pecas` (
  `peca_id` INT NOT NULL,
  `descricao` VARCHAR(50) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`peca_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`itens_de_pecas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`itens_de_pecas` (
  `iten_de_peca_id` INT NOT NULL,
  `os_numero` INT NOT NULL,
  PRIMARY KEY (`iten_de_peca_id`, `os_numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`itens_peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`itens_peca` (
  `peca_id` INT NOT NULL,
  `orden_de_servico_numero` INT NOT NULL,
  PRIMARY KEY (`peca_id`, `orden_de_servico_numero`),
  INDEX `fk_pecas_has_ordens_de_servicos_ordens_de_servicos1_idx` (`orden_de_servico_numero` ASC) VISIBLE,
  INDEX `fk_pecas_has_ordens_de_servicos_pecas1_idx` (`peca_id` ASC) VISIBLE,
  CONSTRAINT `fk_pecas_has_ordens_de_servicos_pecas1`
    FOREIGN KEY (`peca_id`)
    REFERENCES `oficina`.`pecas` (`peca_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pecas_has_ordens_de_servicos_ordens_de_servicos1`
    FOREIGN KEY (`orden_de_servico_numero`)
    REFERENCES `oficina`.`ordens_de_servicos` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`itens_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`itens_servico` (
  `ordens_de_servicos_numero` INT NOT NULL,
  `servico_id` INT NOT NULL,
  PRIMARY KEY (`ordens_de_servicos_numero`, `servico_id`),
  INDEX `fk_ordens_de_servicos_has_servicos_servicos1_idx` (`servico_id` ASC) VISIBLE,
  INDEX `fk_ordens_de_servicos_has_servicos_ordens_de_servicos1_idx` (`ordens_de_servicos_numero` ASC) VISIBLE,
  CONSTRAINT `fk_ordens_de_servicos_has_servicos_ordens_de_servicos1`
    FOREIGN KEY (`ordens_de_servicos_numero`)
    REFERENCES `oficina`.`ordens_de_servicos` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordens_de_servicos_has_servicos_servicos1`
    FOREIGN KEY (`servico_id`)
    REFERENCES `oficina`.`servicos` (`servicos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
