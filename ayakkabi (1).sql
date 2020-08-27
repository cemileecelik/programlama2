-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 27 Ağu 2020, 11:55:10
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ayakkabi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayakkabi`
--

CREATE TABLE `ayakkabi` (
  `id` int(11) NOT NULL,
  `ayakkabi_isim` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `ayakkabi_fiyat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ayakkabi`
--

INSERT INTO `ayakkabi` (`id`, `ayakkabi_isim`, `ayakkabi_fiyat`) VALUES
(1174, '\nAdidas Erkek Basketbol Ayakkabı Da9997 Vs Pace\n', 287),
(1175, '\nNike BQ5671-003 revolution Koşu ve Yürüyüş Ayakkabısı\n', 306),
(1176, '\nNike AQ7481-401 Downshifter 9 Koşu Ayakkabısı\n', 314),
(1177, '\nAdidas F36162 Galaxy Koşu Ve Yürüyüş Ayakkabisi\n', 293),
(1178, '\nAdidas Eg8603 Runfalcon Koşu Ve Yürüyüş Ayakkabısı\n', 244),
(1179, '\nAdidas Çocuk Günlük Ayakkabı S82702 Stan Smith Cf J\n', 599),
(1180, '\nVans Old Skool Günlük Ayakkabı VN000D3HY28\n', 340),
(1181, '\nNike BQ3204-400 revolution Koşu ve Yürüyüş Ayakkabısı\n', 639),
(1182, '\nNike Air Force Shadow Spor Ayakkabı\n', 380),
(1183, '\nNike 812654-010 Tanjun Koşu Ve Yürüyüş Ayakkabısı\n', 379),
(1184, '\nNike 924206-001 Legend Trainer Antrenman Ayakkabısı\n', 170),
(1185, '\nLumberjack Vendor Erkek Spor Ayakkabı 100416555\n', 144),
(1186, '\nLumberjack Control Gri Erkek Koşu Ayakkabısı\n', 102),
(1187, '\nLumberjack Vendor Erkek Spor Ayakkabı 100416554\n', 100),
(1188, '\nKinetix Halley Tx M 9Pr Gri Erkek Sneaker Ayakkabı\n', 199),
(1189, '\nKinetix 100232708 Macon Günlük Erkek Spor Ayakkabı\n', 120),
(1190, '\nKinetix Karl Pu M Erkek Spor Ayakkabı 100483326\n', 157),
(1191, '\nPierre Cardin 10149 Günlük Sneakers Erkek Spor Ayakkabı\n', 148),
(1192, '\nU.S.Polo Assn. Lacivert Erkek Günlük Ayakkabı Spor 100417863 9F Franco 9Pr Laci\n', 100),
(1193, '\nU.S. Polo Assn. Camel 9Pr Beyaz Erkek Sneaker Ayakkabı\n', 150),
(1194, '\nLumberjack Agatha Erkek Ayakkabı 100497450 40\n', 90),
(1195, '\nKinetix Cosmo M Siyah Erkek Sneaker Ayakkabı\n', 255),
(1196, '\nKinetix Ray Açık Gri Erkek Koşu Ayakkabısı\n', 469),
(1197, '\nKinetix Flav M Siyah Erkek Sneaker\n', 312);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayakkabi`
--
ALTER TABLE `ayakkabi`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ayakkabi`
--
ALTER TABLE `ayakkabi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1198;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
