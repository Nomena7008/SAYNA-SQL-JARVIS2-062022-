SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `Jarvis` DEFAULT CHARACTER SET latin1 ;
USE `Jarvis`;

-- -----------------------------------------------------
-- Table `Jarvis`.`Utilisateur`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Jarvis`.`Utilisateur` (
  `id_u` INT NOT NULL ,
  `prenom_u` VARCHAR(45) NULL ,
  `nom_u` VARCHAR(45) NULL ,
  `date_naissance` DATE NULL ,
  `email_u` VARCHAR(255) NULL ,
  `sexe_u` VARCHAR(45) NULL ,
  `mdp_u` VARCHAR(255) NULL ,
  PRIMARY KEY (`id_u`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Jarvis`.`Membre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Jarvis`.`Membre` (
  `Utilisateur_id_u` INT NOT NULL ,
  PRIMARY KEY (`Utilisateur_id_u`) ,
  CONSTRAINT `fk_Membre_Utilisateur`
    FOREIGN KEY (`Utilisateur_id_u` )
    REFERENCES `Jarvis`.`Utilisateur` (`id_u` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Membre_Utilisateur` ON `Jarvis`.`Membre` (`Utilisateur_id_u` ASC) ;


-- -----------------------------------------------------
-- Table `Jarvis`.`Co-proprietaire`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Jarvis`.`Co-proprietaire` (
  `Utilisateur_id_u` INT NOT NULL ,
  PRIMARY KEY (`Utilisateur_id_u`) ,
  CONSTRAINT `fk_Co-proprietaire_Utilisateur1`
    FOREIGN KEY (`Utilisateur_id_u` )
    REFERENCES `Jarvis`.`Utilisateur` (`id_u` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Co-proprietaire_Utilisateur1` ON `Jarvis`.`Co-proprietaire` (`Utilisateur_id_u` ASC) ;


-- -----------------------------------------------------
-- Table `Jarvis`.`Proprietaire`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `Jarvis`.`Proprietaire` (
  `Utilisateur_id_u` INT NOT NULL ,
  PRIMARY KEY (`Utilisateur_id_u`) ,
  CONSTRAINT `fk_Proprietaire_Utilisateur1`
    FOREIGN KEY (`Utilisateur_id_u` )
    REFERENCES `Jarvis`.`Utilisateur` (`id_u` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Proprietaire_Utilisateur1` ON `Jarvis`.`Proprietaire` (`Utilisateur_id_u` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
