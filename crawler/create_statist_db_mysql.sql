CREATE DATABASE IF NOT EXISTS statist_db;

USE statist_db;

CREATE TABLE IF NOT EXISTS persons (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(2048) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS keywords (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(2048) NOT NULL,
  person_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_keywords_persons FOREIGN KEY (person_id) 
    REFERENCES persons(id)
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS sites (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(256) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS pages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  url VARCHAR(2048) NOT NULL,
  site_id INT UNSIGNED NOT NULL,
  found_date_time DATETIME,
  last_scan_date DATETIME, 
  PRIMARY KEY (id),
  CONSTRAINT fk_pages_sites FOREIGN KEY (site_id) 
    REFERENCES sites(id)
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS person_page_ranks (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  person_id INT UNSIGNED NOT NULL,
  page_id INT UNSIGNED NOT NULL,
  rank INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_ranks_persons FOREIGN KEY (person_id) 
    REFERENCES persons(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_ranks_pages FOREIGN KEY (page_id) 
    REFERENCES pages(id)
    ON DELETE CASCADE
) ENGINE=InnoDB;