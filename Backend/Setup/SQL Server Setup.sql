-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gamesimulationdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gamesimulationdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gamesimulationdb` DEFAULT CHARACTER SET utf8mb4 ;
USE `gamesimulationdb` ;

-- -----------------------------------------------------
-- Table `gamesimulationdb`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamesimulationdb`.`games` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `status` VARCHAR(100) NOT NULL,
  `num_companies` INT(11) NOT NULL DEFAULT 0,
  `num_periods` INT(11) NOT NULL DEFAULT 0,
  `periods_offset` INT(11) NOT NULL DEFAULT 0,
  `market_0_activation` TINYINT(1) NULL DEFAULT NULL,
  `market_1_activation` TINYINT(1) NULL DEFAULT NULL,
  `market_2_activation` TINYINT(1) NULL DEFAULT NULL,
  `market_3_activation` TINYINT(1) NULL DEFAULT NULL,
  `scenario_id` INT(11) NULL DEFAULT NULL,
  `game_version` VARCHAR(255) NULL DEFAULT NULL,
  `ideal_rd` INT(11) NOT NULL DEFAULT 0,
  `offset` INT(11) NULL DEFAULT NULL,
  `num_markets` INT(11) NULL DEFAULT NULL,
  `num_cells` INT(11) NULL DEFAULT NULL,
  `cost_industry_report` INT(11) NULL DEFAULT NULL,
  `cost_market_report` INT(11) NULL DEFAULT NULL,
  `current_period` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `gamesimulationdb`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamesimulationdb`.`teams` (
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `gamesimulationdb`.`gameteams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamesimulationdb`.`gameteams` (
  `game_id` INT(11) NOT NULL,
  `teams_name` VARCHAR(100) NOT NULL,
  `locked` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`game_id`, `teams_name`),
  INDEX `fk_games_has_teams_teams1_idx` (`teams_name` ASC),
  INDEX `fk_games_has_teams_games1_idx` (`game_id` ASC),
  CONSTRAINT `fk_games_has_teams_games1`
    FOREIGN KEY (`game_id`)
    REFERENCES `gamesimulationdb`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_has_teams_teams1`
    FOREIGN KEY (`teams_name`)
    REFERENCES `gamesimulationdb`.`teams` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `gamesimulationdb`.`turns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gamesimulationdb`.`turns` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `game_id` INT(11) NOT NULL,
  `turn_number` INT(11) NOT NULL,
  `submission_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP(),
  `team_name` VARCHAR(100) NULL DEFAULT NULL,
  `inputSolidVerkaufspreisInland` FLOAT NULL DEFAULT NULL,
  `inputIdealVerkaufspreisInland` FLOAT NULL DEFAULT NULL,
  `inputSolidVerkaufspreisAusland` FLOAT NULL DEFAULT NULL,
  `inputIdealVerkaufspreisAusland` FLOAT NULL DEFAULT NULL,
  `inputSolidFETechnik` FLOAT NULL DEFAULT NULL,
  `inputIdealFETechnik` FLOAT NULL DEFAULT NULL,
  `inputSolidFEHaptik` FLOAT NULL DEFAULT NULL,
  `inputIdealFEHaptik` FLOAT NULL DEFAULT NULL,
  `inputSolidProduktwerbungInland` FLOAT NULL DEFAULT NULL,
  `inputIdealProduktwerbungInland` FLOAT NULL DEFAULT NULL,
  `inputSolidProduktwerbungAusland` FLOAT NULL DEFAULT NULL,
  `inputIdealProduktwerbungAusland` FLOAT NULL DEFAULT NULL,
  `sumPR` FLOAT NULL DEFAULT NULL,
  `inputSolidLiefermengeSondermarkt` FLOAT NULL DEFAULT NULL,
  `inputSolidLiefermengeAusland` FLOAT NULL DEFAULT NULL,
  `inputIdealLiefermengeAusland` FLOAT NULL DEFAULT NULL,
  `sumVertriebspersonalInland` FLOAT NULL DEFAULT NULL,
  `sumVertriebspersonalAusland` FLOAT NULL DEFAULT NULL,
  `selectBranchenbericht` VARCHAR(100) NULL DEFAULT NULL,
  `selectIdealMarktbericht` VARCHAR(100) NULL DEFAULT NULL,
  `selectSolidMarktbericht` VARCHAR(100) NULL DEFAULT NULL,
  `inputSolidFertigungsmengen` FLOAT NULL DEFAULT NULL,
  `inputIdealFertigungsmengen` FLOAT NULL DEFAULT NULL,
  `inputSolidHilfsstoffe` FLOAT NULL DEFAULT NULL,
  `inputIdealHilfsstoffe` FLOAT NULL DEFAULT NULL,
  `inputSolidMaterialS` FLOAT NULL DEFAULT NULL,
  `inputMaterialI` FLOAT NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette01` VARCHAR(100) NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette08` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette01` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette08` VARCHAR(100) NULL DEFAULT NULL,
  `gesamtFertigungspersonal` FLOAT NULL DEFAULT NULL,
  `gesamtPersonalentwicklung` FLOAT NULL DEFAULT NULL,
  `gesamtGehaltsaufschlag` FLOAT NULL DEFAULT NULL,
  `gesamtInvestitionenBGA` FLOAT NULL DEFAULT NULL,
  `inputDarlehenS` FLOAT NULL DEFAULT NULL,
  `inputDarlehenM` FLOAT NULL DEFAULT NULL,
  `inputDarlehenL` FLOAT NULL DEFAULT NULL,
  `inputFestgeldDarlehen` FLOAT NULL DEFAULT NULL,
  `inputDividenden` FLOAT NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette02` VARCHAR(100) NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette03` VARCHAR(100) NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette04` VARCHAR(100) NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette05` VARCHAR(100) NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette06` VARCHAR(100) NULL DEFAULT NULL,
  `selectNeuAnlagenWerkstaette07` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette02` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette03` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette04` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette05` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette06` VARCHAR(100) NULL DEFAULT NULL,
  `selectAltAnlagenWerkstaette07` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `game_id` (`game_id` ASC),
  INDEX `team_name` (`team_name` ASC),
  CONSTRAINT `turns_ibfk_1`
    FOREIGN KEY (`game_id`)
    REFERENCES `gamesimulationdb`.`games` (`id`),
  CONSTRAINT `turns_ibfk_2`
    FOREIGN KEY (`team_name`)
    REFERENCES `gamesimulationdb`.`teams` (`name`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
