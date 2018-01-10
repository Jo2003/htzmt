-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 10. Jan 2018 um 14:39
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
(1, '2018-01-12', 'Oberhof');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `starterliste`
--

CREATE TABLE `starterliste` (
  `name` varchar(50) NOT NULL,
  `verein` varchar(50) NOT NULL,
  `ak` varchar(50) NOT NULL,
  `startnum` int(10) UNSIGNED NOT NULL,
  `compid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `starterliste`
--

INSERT INTO `starterliste` (`name`, `verein`, `ak`, `startnum`, `compid`) VALUES
('BOHN, Enrico', 'Bikepoint Rhön - Cube Store Rhön', 'Herren', 1, 4),
('HEUSING, Udo', 'Meiningen-Express', 'Herren', 2, 4),
('GOLDSCHMIDT, Angelo', 'Meininger MTB Club', 'Herren', 3, 4),
('BAUMANN, Helmuth', 'Skiclub Steinheid', 'Herren', 4, 4),
('RIPPERGER, Stefan', 'Meininger MTB Club', 'Herren', 5, 4),
('EHRLEIN, Sebastian&Valentin', 'Meiningen-Express', 'Gespanne', 6, 4),
('BRÜCKNER, Cornelia', 'KSZU Meiningen / Meininger MTB Club', 'Damen', 7, 4),
('HIEBEL, Udo', 'Zella-Mehlis', 'Herren', 8, 4),
('HORVATH, Rolf', 'Rad Art', 'Herren', 9, 4),
('BORZEL, Sebastian', 'PSV Meiningen', 'Herren', 10, 4),
('XXX, Xxx', '', 'Herren', 11, 4),
('VOLK, Mario', 'Walldörfer Rattenfänger', 'Herren', 12, 4),
('KLAPKA, Steffen', 'Meiningen', 'Herren', 13, 4),
('RUTKOWSKI, Josefine', 'PSV Meiningen', 'Damen', 14, 4),
('GOSCH, Lars', 'TSV Meiningen', 'Herren', 15, 4),
('GRIMM, Sandro', 'TSV Meiningen', 'Herren', 16, 4),
('GRIMM, Isabell', 'TSV Meiningen', 'Damen', 17, 4),
('KÖHLER, Ronald', 'Meiningen-Express', 'Herren', 18, 4),
('REICH, Olaf', '1.Thüringer Telemarkverein', 'Herren', 19, 4),
('DRÖßMAR, Steven', 'Meininger MTB Club', 'Herren', 20, 4),
('SCHÄFER, Frank', 'Bermbach', 'Herren', 21, 4),
('SAUER, Rainer', 'Meiningen-Express', 'Herren', 22, 4),
('HEBENSTREIT, Bernd', 'TSV Meiningen', 'Herren', 23, 4),
('KAISER, Maximilian', 'TV Barchfeld', 'Herren', 24, 4),
('JAEKEL, Peter', 'GMRLV Laufgruppe Süd', 'Herren', 25, 4),
('KLEIN, Enrico', 'Meininger MTB Club', 'Herren', 26, 4),
('LIEMEN, Eike', 'SV Handwerk Erfurt / Radscheune Erfurt', 'Damen', 27, 4),
('DIEZ, Udo', 'Suhl', 'Herren', 28, 4),
('SEMISCH, Mario', 'Sportteam Stadtwerke Meiningen', 'Herren', 29, 4),
('VOLK, Stefanie', 'Bewegungs-Millionäre', 'Damen', 30, 4),
('HESSE, Mike', 'VV 70 Meiningen', 'Herren', 31, 4),
('ERBE, Thomas', 'RhönSTEIGer', 'Herren', 32, 4),
('NOACK, Sebastian', 'Bärfelser Säcke', 'Herren', 33, 4),
('KÖHLER, Steffen', 'SWV Goldlauter', 'Herren', 34, 4),
('PFAFF, Torsten', 'TV Barchfeld', 'Herren', 35, 4),
('ROGOLL, Mario', 'radschuppen.net', 'Herren', 36, 4),
('MALZAHN, Kai', 'Meininger MTB Club', 'Herren', 37, 4),
('ANACKER, Patrick', 'Meininger MTB Club', 'Herren', 38, 4),
('RUTKOWSKI, Nils', 'Meiningen-Express', 'Herren', 39, 4),
('STUMPF, Volker', 'Run & Bike Club Schmalkalden', 'Herren', 40, 4),
('THOMAS, Raimund', 'Schweinfurt', 'Herren', 41, 4),
('SCHNEIDER, Birgit', 'Miesbach', 'Damen', 42, 4),
('SCHNEIDER, Ronny', 'SV Parsberg', 'Herren', 43, 4),
('DOHL, Matthias', 'TREK-Fahrrad Eberhardt-Kurhaus-Wplus-KS', 'Herren', 44, 4),
('WEBER, Benno', '1.Suhler MTB-Club / epic-trails.com', 'Herren', 45, 4),
('GÖPFERT, Andreas', 'Meiningen-Express', 'Herren', 46, 4),
('KOOP, Stefan', 'TC Suhl', 'Herren', 47, 4),
('MÖLLER, Stephan', 'Biker Crew Vachdorf', 'Herren', 48, 4),
('BECKERT, Mario', 'Bad Neustadt', 'Herren', 49, 4),
('SEIFERT, Marco', 'Biker Crew Vachdorf', 'Herren', 50, 4),
('JACOBI, Andreas', 'RSC Turbine Erfurt', 'Herren', 51, 4),
('DOHL, Kevin', 'TREK-Fahrrad Eberhardt-Kurhaus-Wplus-KS', 'Herren', 52, 4),
('WOLF, Tobias', 'FSG Konsum Langenfeld', 'Herren', 53, 4),
('LÜBBERT, Steffen', 'Meiningen-Express', 'Herren', 54, 4),
('FLACHSBART, Sebastian', 'Fahrrad Schmidt Tabarz', 'Herren', 55, 4),
('BOHMS, Martin', 'FSG Konsum Langenfeld', 'Herren', 56, 4),
('FREIMUTH, Christian', 'LG Naked Woodrunners', 'Herren', 57, 4),
('HESSE, Mathias', 'Trek Team Fahrrad Eberhardt', 'Herren', 58, 4),
('HOFMANN, Christiane', 'Mittelsdorf Motorsport', 'E-Bike Damen', 59, 4),
('BARTHEL, Michael', 'Concordia Strullendorf', 'E-Bike Herren', 60, 4),
('WOLFF, Rene', 'TSV Gera Westvorte', 'Herren', 61, 4),
('STEINBACH, Maik', 'Grabfeld Mountainbiker', 'Herren', 62, 4),
('ABT, Marcel', 'Meininger MTB Club', 'Herren', 63, 4),
('MEIßNER, Jonny', 'SV Werra 07 Hildburghausen', 'Herren', 64, 4),
('HOFFMANN, Dieter', 'Team Monaco', 'Herren', 65, 4),
('WIECZORREK, Alexander', 'Meininger MTB Club', 'Herren', 66, 4),
('STEITZ, Julia', 'Walldörfer Rattenfänger', 'Damen', 67, 4),
('LUX, Matthias', 'RSC Turbine Erfurt', 'Herren', 68, 4),
('NAHSER, Daniel', 'Utendorf', 'Herren', 69, 4),
('LORKE, Andreas', 'Addinol Racing Eisenach', 'Herren', 70, 4),
('WAGLER, Julius', 'RSC Turbine Erfurt', 'Herren', 71, 4),
('RIESEL, Manfred', 'Meiningen-Express', 'Herren', 72, 4),
('SCHMIDT, Ronny', 'Trek Team Fahrrad Eberhardt', 'Herren', 73, 4),
('GRÜTTNER, Tobias', 'Ostwest-Express Nordhausen', 'Herren', 74, 4),
('HEROLD, Peggy', 'BSG Fiskus Erfurt', 'Damen', 75, 4),
('STEUBE, Martin', 'RSV 2002 Eisenach', 'Herren', 76, 4),
('DIEMAR, Michael', 'Kühndorf', 'Herren', 77, 4),
('ZÖSCHE, Karsten', 'LG Rippershausen', 'Herren', 78, 4),
('JACH, Jörg', 'Radteam Oberstadt', 'Herren', 79, 4),
('SEMMLER, Steffen', '1.Thüringer Telemarkverein', 'Herren', 80, 4),
('BAUER, Ralf', 'Schmiedefeld', 'Herren', 81, 4),
('FRIEß, Kai', 'Meininger MTB Club', 'Herren', 82, 4),
('GROß, Torsten', '1.Thüringer Telemarkverein', 'Herren', 83, 4),
('WEIß, Uwe', 'TOKO Raceing Team', 'Herren', 84, 4),
('SCHMIDT, Christine', 'Meininger Drachen', 'Damen', 85, 4),
('TIRSCHMANN, Jan', 'Meininger Drachen', 'Herren', 86, 4),
('WEINLICH, Peter', 'Meiningen-Express', 'Herren', 87, 4),
('LUCK, Benjamin', 'Belrieth', 'Herren', 88, 4),
('HANF, Michael', 'Belrieth', 'Herren', 89, 4),
('EPPINGER, Nancy', 'Meininger MTB Club', 'Damen', 90, 4),
('LANGE, Karsten', 'Run & Bike Club Schmalkalden', 'Herren', 91, 4),
('BÖRNER, Fabio', 'Werrataldojo e.V.', 'Juniorrace - Jungen', 151, 4),
('KIRSCH, Chantal', 'PSV Meiningen', 'Juniorrace - Mädchen', 152, 4),
('HORN, Armin', 'SV Turbine Hohenwarte', 'Juniorrace - Jungen', 153, 4),
('HORN, Arthur', 'SV Turbine Hohenwarte', 'Juniorrace - Jungen', 154, 4),
('OELKE, Felix', 'PSV Meiningen', 'Juniorrace - Jungen', 155, 4),
('HÜTHER, Philipp', 'Wasserfreunde Meiningen', 'Juniorrace - Jungen', 156, 4),
('SEMISCH, Emma Maria', 'Wasserwacht Meiningen', 'Juniorrace - Mädchen', 157, 4),
('KEMMERZEHL, Dusty', 'Walldorf', 'Juniorrace - Jungen', 158, 4),
('MAI, Victoria', 'EVG Meiningen', 'Juniorrace - Mädchen', 159, 4),
('HARTER, Mike', 'Meininger MTB Club', 'Juniorrace - Jungen', 160, 4),
('BASTUBBE, Greta', 'PSV Meiningen', 'Juniorrace - Mädchen', 161, 4),
('MANGANELLI, Alessia Lucia', 'Meininger Wasserfreunde', 'Juniorrace - Mädchen', 162, 4),
('MANGANELLI, Angelo', 'Meininger Wasserfreunde', 'Juniorrace - Jungen', 163, 4),
('WEIGEL, Emil', 'Empor Dreißigacker', 'Juniorrace - Jungen', 164, 4),
('MITTELSDORF, Zoe', 'Träbes', 'Juniorrace - Mädchen', 165, 4),
('FRITZ, Marlin', 'PSV Meiningen', 'Juniorrace - Jungen', 166, 4);

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
(1, 1, 'Test'),
(4, 1, 'Test 2');

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
(1, 4, 155, '0:12:51.70'),
(2, 4, 152, '0:13:58.00'),
(3, 4, 164, '0:16:34.00'),
(4, 4, 153, '0:16:40.50'),
(5, 4, 154, '0:17:11.90'),
(6, 4, 158, '0:17:25.50'),
(7, 4, 163, '0:19:32.50'),
(8, 4, 160, '0:20:02.50'),
(9, 4, 157, '0:24:50.00'),
(10, 4, 162, '0:26:06.30'),
(11, 4, 161, '0:26:09.70'),
(12, 4, 165, '0:29:23.80'),
(13, 4, 166, '0:21:07.80'),
(14, 4, 9, '0:24:28.60'),
(15, 4, 1, '0:26:34.00'),
(16, 4, 5, '0:30:15.90'),
(17, 4, 24, '0:26:06.90'),
(18, 4, 60, '0:17:31.10'),
(19, 4, 10, '0:31:10.30'),
(20, 4, 4, '0:32:47.70'),
(21, 4, 19, '0:29:25.50'),
(22, 4, 36, '0:25:11.90'),
(23, 4, 25, '0:28:23.70'),
(24, 4, 26, '0:28:10.00'),
(25, 4, 3, '0:34:25.40'),
(26, 4, 37, '0:26:08.40'),
(27, 4, 59, '0:20:41.20'),
(28, 4, 32, '0:27:23.90'),
(29, 4, 45, '0:24:36.40'),
(30, 4, 44, '0:24:38.20'),
(31, 4, 58, '0:21:32.80'),
(32, 4, 14, '0:32:39.00'),
(33, 4, 40, '0:26:22.90'),
(34, 4, 51, '0:24:01.80'),
(35, 4, 52, '0:24:06.60'),
(36, 4, 41, '0:27:29.40'),
(37, 4, 27, '0:31:09.60'),
(38, 4, 49, '0:25:54.20'),
(39, 4, 21, '0:33:47.50'),
(40, 4, 18, '0:35:17.60'),
(41, 4, 71, '0:22:36.00'),
(42, 4, 13, '0:37:13.60'),
(43, 4, 74, '0:21:44.20'),
(44, 4, 47, '0:29:17.70'),
(45, 4, 2, '0:40:19.90'),
(46, 4, 12, '0:37:58.80'),
(47, 4, 46, '0:29:53.00'),
(48, 4, 54, '0:28:25.70'),
(49, 4, 55, '0:28:30.80'),
(50, 4, 53, '0:29:17.30'),
(51, 4, 31, '0:34:50.90'),
(52, 4, 70, '0:24:53.60'),
(53, 4, 38, '0:33:22.90'),
(54, 4, 39, '0:33:24.60');

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
  ADD PRIMARY KEY (`startnum`,`compid`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `wettkampf`
--
ALTER TABLE `wettkampf`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `zeiten`
--
ALTER TABLE `zeiten`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
