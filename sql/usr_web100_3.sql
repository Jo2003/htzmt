-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 14. Dez 2017 um 14:50
-- Server-Version: 5.6.37
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `usr_web100_3`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `id` int(10) UNSIGNED NOT NULL,
  `datum` date NOT NULL,
  `wo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`id`, `datum`, `wo`) VALUES
(7, '2017-09-16', 'Dolmar');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `starterliste`
--

CREATE TABLE `starterliste` (
  `name` varchar(50) NOT NULL,
  `verein` varchar(50) NOT NULL,
  `ak` varchar(50) NOT NULL,
  `startnum` int(10) UNSIGNED NOT NULL,
  `evtid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `starterliste`
--

INSERT INTO `starterliste` (`name`, `verein`, `ak`, `startnum`, `evtid`) VALUES
('BOHN, Enrico', 'Bikepoint Rhön - Cube Store Rhön', 'Herren', 1, 7),
('HEUSING, Udo', 'Meiningen-Express', 'Herren', 2, 7),
('GOLDSCHMIDT, Angelo', 'Meininger MTB Club', 'Herren', 3, 7),
('BAUMANN, Helmuth', 'Skiclub Steinheid', 'Herren', 4, 7),
('RIPPERGER, Stefan', 'Meininger MTB Club', 'Herren', 5, 7),
('EHRLEIN, Sebastian&Valentin', 'Meiningen-Express', 'Gespanne', 6, 7),
('BRÜCKNER, Cornelia', 'KSZU Meiningen / Meininger MTB Club', 'Damen', 7, 7),
('HIEBEL, Udo', 'Zella-Mehlis', 'Herren', 8, 7),
('HORVATH, Rolf', 'Rad Art', 'Herren', 9, 7),
('BORZEL, Sebastian', 'PSV Meiningen', 'Herren', 10, 7),
('XXX, Xxx', '', 'Herren', 11, 7),
('VOLK, Mario', 'Walldörfer Rattenfänger', 'Herren', 12, 7),
('KLAPKA, Steffen', 'Meiningen', 'Herren', 13, 7),
('RUTKOWSKI, Josefine', 'PSV Meiningen', 'Damen', 14, 7),
('GOSCH, Lars', 'TSV Meiningen', 'Herren', 15, 7),
('GRIMM, Sandro', 'TSV Meiningen', 'Herren', 16, 7),
('GRIMM, Isabell', 'TSV Meiningen', 'Damen', 17, 7),
('KÖHLER, Ronald', 'Meiningen-Express', 'Herren', 18, 7),
('REICH, Olaf', '1.Thüringer Telemarkverein', 'Herren', 19, 7),
('DRÖßMAR, Steven', 'Meininger MTB Club', 'Herren', 20, 7),
('SCHÄFER, Frank', 'Bermbach', 'Herren', 21, 7),
('SAUER, Rainer', 'Meiningen-Express', 'Herren', 22, 7),
('HEBENSTREIT, Bernd', 'TSV Meiningen', 'Herren', 23, 7),
('KAISER, Maximilian', 'TV Barchfeld', 'Herren', 24, 7),
('JAEKEL, Peter', 'GMRLV Laufgruppe Süd', 'Herren', 25, 7),
('KLEIN, Enrico', 'Meininger MTB Club', 'Herren', 26, 7),
('LIEMEN, Eike', 'SV Handwerk Erfurt / Radscheune Erfurt', 'Damen', 27, 7),
('DIEZ, Udo', 'Suhl', 'Herren', 28, 7),
('SEMISCH, Mario', 'Sportteam Stadtwerke Meiningen', 'Herren', 29, 7),
('VOLK, Stefanie', 'Bewegungs-Millionäre', 'Damen', 30, 7),
('HESSE, Mike', 'VV 70 Meiningen', 'Herren', 31, 7),
('ERBE, Thomas', 'RhönSTEIGer', 'Herren', 32, 7),
('NOACK, Sebastian', 'Bärfelser Säcke', 'Herren', 33, 7),
('KÖHLER, Steffen', 'SWV Goldlauter', 'Herren', 34, 7),
('PFAFF, Torsten', 'TV Barchfeld', 'Herren', 35, 7),
('ROGOLL, Mario', 'radschuppen.net', 'Herren', 36, 7),
('MALZAHN, Kai', 'Meininger MTB Club', 'Herren', 37, 7),
('ANACKER, Patrick', 'Meininger MTB Club', 'Herren', 38, 7),
('RUTKOWSKI, Nils', 'Meiningen-Express', 'Herren', 39, 7),
('STUMPF, Volker', 'Run & Bike Club Schmalkalden', 'Herren', 40, 7),
('THOMAS, Raimund', 'Schweinfurt', 'Herren', 41, 7),
('SCHNEIDER, Birgit', 'Miesbach', 'Damen', 42, 7),
('SCHNEIDER, Ronny', 'SV Parsberg', 'Herren', 43, 7),
('DOHL, Matthias', 'TREK-Fahrrad Eberhardt-Kurhaus-Wplus-KS', 'Herren', 44, 7),
('WEBER, Benno', '1.Suhler MTB-Club / epic-trails.com', 'Herren', 45, 7),
('GÖPFERT, Andreas', 'Meiningen-Express', 'Herren', 46, 7),
('KOOP, Stefan', 'TC Suhl', 'Herren', 47, 7),
('MÖLLER, Stephan', 'Biker Crew Vachdorf', 'Herren', 48, 7),
('BECKERT, Mario', 'Bad Neustadt', 'Herren', 49, 7),
('SEIFERT, Marco', 'Biker Crew Vachdorf', 'Herren', 50, 7),
('JACOBI, Andreas', 'RSC Turbine Erfurt', 'Herren', 51, 7),
('DOHL, Kevin', 'TREK-Fahrrad Eberhardt-Kurhaus-Wplus-KS', 'Herren', 52, 7),
('WOLF, Tobias', 'FSG Konsum Langenfeld', 'Herren', 53, 7),
('LÜBBERT, Steffen', 'Meiningen-Express', 'Herren', 54, 7),
('FLACHSBART, Sebastian', 'Fahrrad Schmidt Tabarz', 'Herren', 55, 7),
('BOHMS, Martin', 'FSG Konsum Langenfeld', 'Herren', 56, 7),
('FREIMUTH, Christian', 'LG Naked Woodrunners', 'Herren', 57, 7),
('HESSE, Mathias', 'Trek Team Fahrrad Eberhardt', 'Herren', 58, 7),
('HOFMANN, Christiane', 'Mittelsdorf Motorsport', 'E-Bike Damen', 59, 7),
('BARTHEL, Michael', 'Concordia Strullendorf', 'E-Bike Herren', 60, 7),
('WOLFF, Rene', 'TSV Gera Westvorte', 'Herren', 61, 7),
('STEINBACH, Maik', 'Grabfeld Mountainbiker', 'Herren', 62, 7),
('ABT, Marcel', 'Meininger MTB Club', 'Herren', 63, 7),
('MEIßNER, Jonny', 'SV Werra 07 Hildburghausen', 'Herren', 64, 7),
('HOFFMANN, Dieter', 'Team Monaco', 'Herren', 65, 7),
('WIECZORREK, Alexander', 'Meininger MTB Club', 'Herren', 66, 7),
('STEITZ, Julia', 'Walldörfer Rattenfänger', 'Damen', 67, 7),
('LUX, Matthias', 'RSC Turbine Erfurt', 'Herren', 68, 7),
('NAHSER, Daniel', 'Utendorf', 'Herren', 69, 7),
('LORKE, Andreas', 'Addinol Racing Eisenach', 'Herren', 70, 7),
('WAGLER, Julius', 'RSC Turbine Erfurt', 'Herren', 71, 7),
('RIESEL, Manfred', 'Meiningen-Express', 'Herren', 72, 7),
('SCHMIDT, Ronny', 'Trek Team Fahrrad Eberhardt', 'Herren', 73, 7),
('GRÜTTNER, Tobias', 'Ostwest-Express Nordhausen', 'Herren', 74, 7),
('HEROLD, Peggy', 'BSG Fiskus Erfurt', 'Damen', 75, 7),
('STEUBE, Martin', 'RSV 2002 Eisenach', 'Herren', 76, 7),
('DIEMAR, Michael', 'Kühndorf', 'Herren', 77, 7),
('ZÖSCHE, Karsten', 'LG Rippershausen', 'Herren', 78, 7),
('JACH, Jörg', 'Radteam Oberstadt', 'Herren', 79, 7),
('SEMMLER, Steffen', '1.Thüringer Telemarkverein', 'Herren', 80, 7),
('BAUER, Ralf', 'Schmiedefeld', 'Herren', 81, 7),
('FRIEß, Kai', 'Meininger MTB Club', 'Herren', 82, 7),
('GROß, Torsten', '1.Thüringer Telemarkverein', 'Herren', 83, 7),
('WEIß, Uwe', 'TOKO Raceing Team', 'Herren', 84, 7),
('SCHMIDT, Christine', 'Meininger Drachen', 'Damen', 85, 7),
('TIRSCHMANN, Jan', 'Meininger Drachen', 'Herren', 86, 7),
('WEINLICH, Peter', 'Meiningen-Express', 'Herren', 87, 7),
('LUCK, Benjamin', 'Belrieth', 'Herren', 88, 7),
('HANF, Michael', 'Belrieth', 'Herren', 89, 7),
('EPPINGER, Nancy', 'Meininger MTB Club', 'Damen', 90, 7),
('LANGE, Karsten', 'Run & Bike Club Schmalkalden', 'Herren', 91, 7),
('BÖRNER, Fabio', 'Werrataldojo e.V.', 'Juniorrace - Jungen', 151, 7),
('KIRSCH, Chantal', 'PSV Meiningen', 'Juniorrace - Mädchen', 152, 7),
('HORN, Armin', 'SV Turbine Hohenwarte', 'Juniorrace - Jungen', 153, 7),
('HORN, Arthur', 'SV Turbine Hohenwarte', 'Juniorrace - Jungen', 154, 7),
('OELKE, Felix', 'PSV Meiningen', 'Juniorrace - Jungen', 155, 7),
('HÜTHER, Philipp', 'Wasserfreunde Meiningen', 'Juniorrace - Jungen', 156, 7),
('SEMISCH, Emma Maria', 'Wasserwacht Meiningen', 'Juniorrace - Mädchen', 157, 7),
('KEMMERZEHL, Dusty', 'Walldorf', 'Juniorrace - Jungen', 158, 7),
('MAI, Victoria', 'EVG Meiningen', 'Juniorrace - Mädchen', 159, 7),
('HARTER, Mike', 'Meininger MTB Club', 'Juniorrace - Jungen', 160, 7),
('BASTUBBE, Greta', 'PSV Meiningen', 'Juniorrace - Mädchen', 161, 7),
('MANGANELLI, Alessia Lucia', 'Meininger Wasserfreunde', 'Juniorrace - Mädchen', 162, 7),
('MANGANELLI, Angelo', 'Meininger Wasserfreunde', 'Juniorrace - Jungen', 163, 7),
('WEIGEL, Emil', 'Empor Dreißigacker', 'Juniorrace - Jungen', 164, 7),
('MITTELSDORF, Zoe', 'Träbes', 'Juniorrace - Mädchen', 165, 7),
('FRITZ, Marlin', 'PSV Meiningen', 'Juniorrace - Jungen', 166, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wettkampf`
--

CREATE TABLE `wettkampf` (
  `id` int(10) UNSIGNED NOT NULL,
  `evtid` int(10) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `wettkampf`
--

INSERT INTO `wettkampf` (`id`, `evtid`, `name`) VALUES
(10, 7, 'Bergzeitfahren');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zeiten`
--

CREATE TABLE `zeiten` (
  `id` int(10) UNSIGNED NOT NULL,
  `compid` int(10) UNSIGNED NOT NULL,
  `startnum` int(10) UNSIGNED NOT NULL,
  `zeit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `zeiten`
--

INSERT INTO `zeiten` (`id`, `compid`, `startnum`, `zeit`) VALUES
(194, 10, 155, '0:12:51.70'),
(195, 10, 152, '0:13:58.00'),
(196, 10, 164, '0:16:34.00'),
(197, 10, 153, '0:16:40.50'),
(198, 10, 154, '0:17:11.90'),
(199, 10, 158, '0:17:25.50'),
(200, 10, 163, '0:19:32.50'),
(201, 10, 160, '0:20:02.50'),
(202, 10, 157, '0:24:50.00'),
(203, 10, 162, '0:26:06.30'),
(204, 10, 161, '0:26:09.70'),
(205, 10, 165, '0:29:23.80'),
(206, 10, 166, '0:21:07.80'),
(207, 10, 9, '0:24:28.60'),
(208, 10, 1, '0:26:34.00'),
(209, 10, 5, '0:30:15.90'),
(210, 10, 24, '0:26:06.90'),
(211, 10, 60, '0:17:31.10'),
(212, 10, 10, '0:31:10.30'),
(213, 10, 4, '0:32:47.70'),
(214, 10, 19, '0:29:25.50'),
(215, 10, 36, '0:25:11.90'),
(216, 10, 25, '0:28:23.70'),
(217, 10, 26, '0:28:10.00'),
(218, 10, 3, '0:34:25.40'),
(219, 10, 37, '0:26:08.40'),
(220, 10, 59, '0:20:41.20'),
(221, 10, 32, '0:27:23.90'),
(222, 10, 45, '0:24:36.40'),
(223, 10, 44, '0:24:38.20'),
(224, 10, 58, '0:21:32.80'),
(225, 10, 14, '0:32:39.00'),
(226, 10, 40, '0:26:22.90'),
(227, 10, 51, '0:24:01.80'),
(228, 10, 52, '0:24:06.60'),
(229, 10, 41, '0:27:29.40'),
(230, 10, 27, '0:31:09.60'),
(231, 10, 49, '0:25:54.20'),
(232, 10, 21, '0:33:47.50'),
(233, 10, 18, '0:35:17.60'),
(234, 10, 71, '0:22:36.00'),
(235, 10, 13, '0:37:13.60'),
(236, 10, 74, '0:21:44.20'),
(237, 10, 47, '0:29:17.70'),
(238, 10, 2, '0:40:19.90'),
(239, 10, 12, '0:37:58.80'),
(240, 10, 46, '0:29:53.00'),
(241, 10, 54, '0:28:25.70'),
(242, 10, 55, '0:28:30.80'),
(243, 10, 53, '0:29:17.30'),
(244, 10, 31, '0:34:50.90'),
(245, 10, 70, '0:24:53.60'),
(246, 10, 38, '0:33:22.90'),
(247, 10, 39, '0:33:24.60');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wo` (`wo`);

--
-- Indizes für die Tabelle `starterliste`
--
ALTER TABLE `starterliste`
  ADD PRIMARY KEY (`startnum`,`evtid`),
  ADD KEY `name` (`name`),
  ADD KEY `verein` (`verein`);

--
-- Indizes für die Tabelle `wettkampf`
--
ALTER TABLE `wettkampf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evtid` (`evtid`);

--
-- Indizes für die Tabelle `zeiten`
--
ALTER TABLE `zeiten`
  ADD PRIMARY KEY (`compid`,`startnum`,`zeit`,`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT für Tabelle `wettkampf`
--
ALTER TABLE `wettkampf`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `zeiten`
--
ALTER TABLE `zeiten`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
