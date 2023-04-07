-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Apr 2023 um 16:02
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be18_cr5_animal_adoption_ayahelli`
--
CREATE DATABASE IF NOT EXISTS `be18_cr5_animal_adoption_ayahelli` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be18_cr5_animal_adoption_ayahelli`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adoption`
--

CREATE TABLE `adoption` (
  `id` int(11) NOT NULL,
  `date_adoption` date NOT NULL,
  `fk_animal_id` int(11) DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `live` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `dis` varchar(255) NOT NULL,
  `size` enum('small','medium','large') NOT NULL,
  `age` int(11) NOT NULL,
  `vaccinated` enum('Yes',' No') NOT NULL,
  `breed` varchar(50) NOT NULL,
  `status` enum('Adopted','Available') NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `animal`
--

INSERT INTO `animal` (`id`, `name`, `picture`, `live`, `location`, `dis`, `size`, `age`, `vaccinated`, `breed`, `status`) VALUES
(1, 'Bottle-nose', 'https://cdn.pixabay.com/photo/2023/04/02/09/24/rainbow-lorikeet-7894138__480.jpg', 'Wonosari', '62 Washington Hill', ' donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'small', 4, 'Yes', 'pigeon', 'Available'),
(2, 'White-throated', 'https://cdn.pixabay.com/photo/2019/08/19/07/45/corgi-4415649__480.jpg', 'Cadiz', '86706 Old Gate Terrace', ' donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'small', 3, 'Yes', 'dog', 'Available'),
(3, 'Pferd', 'https://cdn.pixabay.com/photo/2013/10/17/20/59/horse-197199__480.jpg', 'Austria', 'wien 1220', ' donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'medium', 8, 'Yes', 'horse', 'Available'),
(4, 'barasingha', 'https://cdn.pixabay.com/photo/2018/05/07/10/48/husky-3380548__480.jpg', 'lendon', 'ma baaref 4324', ' et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit \r\n', 'small', 6, ' No', 'dog', 'Available'),
(5, 'sugar-brown', 'https://cdn.pixabay.com/photo/2017/04/02/22/36/easter-2197043__480.jpg', 'itlien', 'roma 23283 3e77', 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna', 'small', 2, 'Yes', 'rabbit', 'Available'),
(6, 'Hyena', 'https://cdn.pixabay.com/photo/2019/04/16/21/25/parrot-4132823__480.jpg', 'sudan', 'kman ma bgy97767', 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 'medium', 6, 'Yes', 'pigeon', 'Available'),
(7, 'Devil', 'https://cdn.pixabay.com/photo/2020/04/07/17/01/chicks-5014152__480.jpg', 'Egypt', 'elrehab 28/1', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'small', 1, 'Yes', 'pigoen', 'Available'),
(8, 'Kinkajou', 'https://cdn.pixabay.com/photo/2016/11/22/19/30/squirrel-1850210__480.jpg', 'ante vel ', 'jhedj 263637', 'ejcekjn jnfkjnfkj wnfkjn ffjnfkj nfrn knfkrn rnf nfnrfkn fnknfkernkerern rknreng nrgk nrgkn krkng.. ', 'large', 7, 'Yes', 'rat', 'Available'),
(9, 'Kudu', 'https://cdn.pixabay.com/photo/2018/01/09/11/04/dog-3071334__480.jpg', 'ufhjf', 'rfreg 344', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'large', 9, 'Yes', 'dog', 'Available'),
(10, 'greater', 'https://cdn.pixabay.com/photo/2018/05/11/08/11/dog-3389729__480.jpg', 'austria', 'vienna', 'sit amet eleifend pede libero quis orci nullam molestie nibh', 'small', 10, 'Yes', 'dog', 'Available'),
(11, 'Capuchin', 'https://cdn.pixabay.com/photo/2023/02/15/13/19/bird-7791901__480.jpg', 'efjj', 'fwrg 5647', 'pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem', 'large', 9, 'Yes', 'pigeon', 'Available'),
(12, 'max', 'https://cdn.pixabay.com/photo/2020/12/16/12/05/horse-5836459__480.jpg', 'austria', 'niederösterreich 2563', 'An ingenious code hidden in the works of Leonardo da Vinci. A desperate race through ', 'medium', 10, ' No', 'horse', 'Available');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `status` enum('user','adm') DEFAULT 'user',
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `password`, `date_of_birth`, `email`, `address`, `picture`, `status`, `phone_number`) VALUES
(1, 'userss', 'user', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e', '2023-03-30', 'user@hotmail.com', 'edefrfc 12', 'picuser.png', 'user', '0987656778');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adoption`
--
ALTER TABLE `adoption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_animal_id` (`fk_animal_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `adoption`
--
ALTER TABLE `adoption`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `adoption`
--
ALTER TABLE `adoption`
  ADD CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`fk_animal_id`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `adoption_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
