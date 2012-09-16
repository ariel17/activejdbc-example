--
-- SQL script for table initialization.
--

USE activejdbc-example;

--
-- Table auth_users
-- 
CREATE TABLE auth_users (
    id int(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    enabled TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table providers
--
CREATE TABLE providers (
    id int(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    enabled TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table notifications
--
CREATE TABLE notifications(
    id int(11) NOT NULL AUTO_INCREMENT,
    provider_id int(11) NOT NULL,
    url VARCHAR(255) NOT NULL,
    method VARCHAR(10) NOT NULL,
    error_mail VARCHAR(255) NOT NULL,
    error_text VARCHAR(255),
    PRIMARY KEY (id),
    KEY FK_notifications_provider_id (provider_id),
    CONSTRAINT FK_notifications_provider_id FOREIGN KEY (provider_id) REFERENCES providers (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
