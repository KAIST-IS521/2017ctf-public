-- MySQL Script generated by MySQL Workbench
-- Thu May 18 23:05:52 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET GLOBAL SQL_MODE = 'STRICT_ALL_TABLES';

-- -----------------------------------------------------
-- Schema bankDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bankDB` ;

-- -----------------------------------------------------
-- Schema bankDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bankDB` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `bankDB` ;

-- -----------------------------------------------------
-- Table `auth_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_table` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `auth_table` (
  `github_id` VARCHAR(20) NOT NULL,
  `reg_flag` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`github_id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `github_id_UNIQUE` ON `auth_table` (`github_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_table` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `user_table` (
  `user_id` VARCHAR(20) NOT NULL,
  `account_num` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_pw` VARCHAR(64) NOT NULL,
  `email` VARCHAR(45) NULL,
  `mobile` CHAR(11) NULL,
  `balance` BIGINT(24) NOT NULL DEFAULT 0,
  `github_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`account_num`, `user_id`),
  CONSTRAINT `fk_user_auth_github_id`
    FOREIGN KEY (`github_id`)
    REFERENCES `auth_table` (`github_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10020000000000000000;

SHOW WARNINGS;
CREATE UNIQUE INDEX `userID_UNIQUE` ON `user_table` (`user_id` ASC);

SHOW WARNINGS;
CREATE UNIQUE INDEX `account_num_UNIQUE` ON `user_table` (`account_num` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_user_auth_idx` ON `user_table` (`github_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tran_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tran_table` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `tran_table` (
  `tr_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tr_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `from_account` BIGINT(20) UNSIGNED NOT NULL,
  `to_account` BIGINT(20) UNSIGNED NOT NULL,
  `remit` INT UNSIGNED NOT NULL,
  `msg` VARCHAR(100) NULL,
  `from_balance` BIGINT(24) NOT NULL,
  `to_balance` BIGINT(24) NOT NULL,
  PRIMARY KEY (`tr_id`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `tr_id_UNIQUE` ON `tran_table` (`tr_id` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `withdraw_account_table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `withdraw_account_table` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `withdraw_account_table` (
  `withdraw_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL,
  `account_num` BIGINT(20) UNSIGNED NOT NULL,
  `github_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`withdraw_id`),
  CONSTRAINT `fk_withdraw_auth_github_id`
    FOREIGN KEY (`github_id`)
    REFERENCES `auth_table` (`github_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `withdraw_id_UNIQUE` ON `withdraw_account_table` (`withdraw_id` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_withdraw_auth_idx` ON `withdraw_account_table` (`github_id` ASC);

SHOW WARNINGS;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
