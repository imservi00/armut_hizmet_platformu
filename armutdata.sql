-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 May 2025, 18:22:05
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `armutdata`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `altkategoriler`
--

CREATE TABLE `altkategoriler` (
  `AltKategoriID` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL,
  `AltKategoriAdi` varchar(255) NOT NULL,
  `ResimYolu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `altkategoriler`
--

INSERT INTO `altkategoriler` (`AltKategoriID`, `KategoriID`, `AltKategoriAdi`, `ResimYolu`) VALUES
(1, 1, 'Ev Temizliği', 'armut_resimler/temizlik_alt_resimler/ev_temizliği.png'),
(2, 1, 'Ofis Temizliği', 'armut_resimler/temizlik_alt_resimler/ofis_temizligi.jpg'),
(3, 1, 'Cam Temizliği', 'armut_resimler/temizlik_alt_resimler/cam_temizliği.jpg'),
(4, 1, 'Halı Yıkama', 'armut_resimler/temizlik_alt_resimler/halı-yıkama.png'),
(5, 1, 'Banyo Temizliği', 'armut_resimler/temizlik_alt_resimler/banyo-temizligi.jpg'),
(6, 1, 'Mutfak Temizliği', 'armut_resimler/temizlik_alt_resimler/mutfak_temizligi.jpg'),
(7, 1, 'İnşaat Sonrası Temizlik', 'armut_resimler/temizlik_alt_resimler/insaat_sonrasi_temizlik.jpeg'),
(8, 1, 'Derin Temizlik', 'armut_resimler/temizlik_alt_resimler/derin_temizlik.jpg'),
(9, 1, 'Dış Cephe Temizliği', 'armut_resimler/temizlik_alt_resimler/dis_cephe_temizligi.jpg'),
(10, 1, 'Mobilya Temizliği', 'armut_resimler/temizlik_alt_resimler/mobilya_temizligi.jpg'),
(11, 1, 'Endüstriyel Temizlik', 'armut_resimler/temizlik_alt_resimler/Endustriyel-Temizlik.jpg'),
(12, 1, 'Araba Temizliği', 'armut_resimler/temizlik_alt_resimler/araba_temizligi.jpeg'),
(13, 1, 'Havuz Temizliği', 'armut_resimler/temizlik_alt_resimler/havuz_temizligi.jpg'),
(14, 1, 'Balkon Temizliği', 'armut_resimler/temizlik_alt_resimler/balkon_temizligi.jpg'),
(15, 1, 'Yatak Temizliği', 'armut_resimler/temizlik_alt_resimler/yatak_temizligi.jpg'),
(16, 1, 'Oyun Alanı Temizliği', 'armut_resimler/temizlik_alt_resimler/oyun_alani_temizligi.jpeg'),
(17, 2, 'Boya Badana', 'armut_resimler/tadilat_alt_resimler/boya_badana.jpg'),
(18, 2, 'Elektrik Tesisatı', 'armut_resimler/tadilat_alt_resimler/elektrik_tesisati.jpg'),
(19, 2, 'Su Tesisatı', 'armut_resimler/tadilat_alt_resimler/su-tesisati.jpg'),
(20, 2, 'Parke Döşeme', 'armut_resimler/tadilat_alt_resimler/parke_doseme.png'),
(21, 2, 'Duvar Kağıdı Uygulama', 'armut_resimler/tadilat_alt_resimler/duvar-kagidi-uygulama.jpeg'),
(22, 2, 'Çatı Onarımı', 'armut_resimler/tadilat_alt_resimler/cati-onarim.jpg'),
(23, 2, 'Alçı ve Sıva İşleri', 'armut_resimler/tadilat_alt_resimler/alci_siva.jpg'),
(24, 2, 'Kapı ve Pencere Değişimi', 'armut_resimler/tadilat_alt_resimler/kapı_pencere.jpeg'),
(25, 2, 'Mutfak Yenileme', 'armut_resimler/tadilat_alt_resimler/mutfak_yenimele.jpg'),
(26, 2, 'Banyo Yenileme', 'armut_resimler/tadilat_alt_resimler/banyo-yenileme.jpg'),
(27, 2, 'Dekorasyon Hizmetleri', 'armut_resimler/tadilat_alt_resimler/dekorasyon.jpg'),
(28, 2, 'Mermer ve Fayans Döşeme', 'armut_resimler/tadilat_alt_resimler/mermer-fayans.jpg'),
(29, 2, 'Isı Yalıtımı', 'armut_resimler/tadilat_alt_resimler/isi-yalitim.jpeg'),
(30, 2, 'Ses Yalıtımı', 'armut_resimler/tadilat_alt_resimler/ses-yalıtımı.jpg'),
(31, 2, 'Küçük Tadilat İşleri', 'armut_resimler/tadilat_alt_resimler/kücük-tadilat.jpg'),
(32, 2, 'İnşaat İşleri', 'armut_resimler/tadilat_alt_resimler/insaat-isleri.jpg'),
(33, 3, 'Evden Eve Nakliyat', 'armut_resimler/nakliyat_alt_resimler/evden-eve-nakliyat.jpg'),
(34, 3, 'Ofis Nakliyatı', 'armut_resimler/nakliyat_alt_resimler/ofis_nakliyat.jpg'),
(35, 3, 'Şehirlerarası Nakliyat', 'armut_resimler/nakliyat_alt_resimler/sehirlerarasi-nakliyat.jpg'),
(36, 3, 'Kargo ve Kurye', 'armut_resimler/nakliyat_alt_resimler/kargo_ve_kurye.jpeg'),
(37, 3, 'Depolama Hizmetleri', 'armut_resimler/nakliyat_alt_resimler/depolama-hizmeti.jpg'),
(38, 3, 'Eşyaların Paketlenmesi', 'armut_resimler/nakliyat_alt_resimler/esyalarin_paketlenmesi.jpg'),
(39, 3, 'Ağır Yük Taşıma', 'armut_resimler/nakliyat_alt_resimler/ağır_yük_tasima.jpg'),
(40, 3, 'Uluslararası Nakliyat', 'armut_resimler/nakliyat_alt_resimler/uluslararasi-nakliyat.jpg'),
(41, 3, 'Elektronik Eşya Taşıma', 'armut_resimler/nakliyat_alt_resimler/elektronik_esya_tasima.jpg'),
(42, 3, 'Nakliyat Sigortası', 'armut_resimler/nakliyat_alt_resimler/nakliyat-sigortasi.jpg'),
(43, 3, 'Taşınma Planlama', 'armut_resimler/nakliyat_alt_resimler/tasinma-planlama.jpg'),
(44, 3, 'Yükleme ve Boşaltma', 'armut_resimler/nakliyat_alt_resimler/yükleme-ve-boşaltma.jpg'),
(45, 3, 'Hassas Eşya Taşıma', 'armut_resimler/nakliyat_alt_resimler/hassas-esya-tasima.jpg'),
(46, 3, 'Evcil Hayvan Nakliyatı', 'armut_resimler/nakliyat_alt_resimler/evcil-hayvan-nakliyat.jpg'),
(47, 3, 'Araç Taşıma', 'armut_resimler/nakliyat_alt_resimler/arac-tasima.jpg'),
(48, 3, 'Mobilya Taşıma', 'armut_resimler/nakliyat_alt_resimler/mobilya-tasima.jpg'),
(49, 4, 'Bilgisayar Tamiri', 'armut_resimler/tamir_alt_resimler/bilgisayar-tamiri.jpeg'),
(50, 4, 'Cep Telefonu Tamiri', 'armut_resimler/tamir_alt_resimler/cep_telefon-tamiri.png'),
(51, 4, 'Beyaz Eşya Tamiri', 'armut_resimler/tamir_alt_resimler/beyaz_esya_tamiri.jpg'),
(52, 4, 'Mobilya Tamiri', 'armut_resimler/tamir_alt_resimler/mobilya_tamir.jpg'),
(53, 4, 'Araç Tamiri', 'armut_resimler/tamir_alt_resimler/arac_tamiri.jpg'),
(54, 4, 'Elektrikli Cihaz Tamiri', 'armut_resimler/tamir_alt_resimler/ekeltrikli-cihaz-tamiri.jpg'),
(55, 4, 'Klima Tamiri', 'armut_resimler/tamir_alt_resimler/klima-tamiri.jpg'),
(56, 4, 'Televizyon Tamiri', 'armut_resimler/tamir_alt_resimler/televizyon-tamiri.jpg'),
(57, 4, 'Saat Tamiri', 'armut_resimler/tamir_alt_resimler/saat-tamiri.jpg'),
(58, 4, 'Hobi Cihazları Tamiri', 'armut_resimler/tamir_alt_resimler/hobi-cihazlar.png'),
(59, 4, 'Elektrik Panosu Tamiri', 'armut_resimler/tamir_alt_resimler/elektrik-panosu-tamiri.jpeg'),
(60, 4, 'Güvenlik Kamerası Tamiri', 'armut_resimler/tamir_alt_resimler/güvenlik-kamerası-tamiri.jpg'),
(61, 4, 'Ses Sistemi Tamiri', 'armut_resimler/tamir_alt_resimler/ses-sistemi-tamir.jpg'),
(64, 4, 'Tablet Tamiri', 'armut_resimler/tamir_alt_resimler/tablet-tamiri.jpg'),
(65, 5, 'Matematik', 'armut_resimler/ozel-ders-alt-resimler/matematik-ozel-ders.jpg'),
(66, 5, 'Fizik', 'armut_resimler/ozel-ders-alt-resimler/fizik_ozel_ders.jpg'),
(67, 5, 'Kimya', 'armut_resimler/ozel-ders-alt-resimler/kimya.jpg'),
(68, 5, 'Türkçe', 'armut_resimler/ozel-ders-alt-resimler/turkce.jpg'),
(69, 5, 'İngilizce', 'armut_resimler/ozel-ders-alt-resimler/ingilizce.jpg'),
(70, 5, 'Almanca', 'armut_resimler/ozel-ders-alt-resimler/almanca.png'),
(71, 5, 'Müzik (Piyano)', 'armut_resimler/ozel-ders-alt-resimler/piyano.jpg'),
(72, 5, 'Müzik (Gitar)', 'armut_resimler/ozel-ders-alt-resimler/giat.jpg'),
(73, 5, 'Resim Çizimi', 'armut_resimler/ozel-ders-alt-resimler/resim.jpg'),
(74, 5, 'Dans Dersleri', 'armut_resimler/ozel-ders-alt-resimler/dans-dersleri.jpg'),
(75, 5, 'Kodlama', 'armut_resimler/ozel-ders-alt-resimler/kodlama.jpg'),
(76, 5, 'Veritabanı Eğitimi', 'armut_resimler/ozel-ders-alt-resimler/veritabani.jpg'),
(77, 5, 'Yoga Eğitimi', 'armut_resimler/ozel-ders-alt-resimler/yoga-egitimi.jpg'),
(78, 5, 'Sınava Hazırlık', 'armut_resimler/ozel-ders-alt-resimler/sinava-hazirlik.jpg'),
(79, 5, 'Çocuklar İçin Eğitim', 'armut_resimler/ozel-ders-alt-resimler/cocuklar-icin-egitim.jpg'),
(80, 5, 'Tarih', 'armut_resimler/ozel-ders-alt-resimler/tarih.jpg'),
(81, 6, 'Diyetisyen', 'armut_resimler/saglik_alt_resimler/diyetisyen.png'),
(82, 6, 'Fizyoterapist', 'armut_resimler/saglik_alt_resimler/Fizyoterapist.jpg'),
(83, 6, 'Psikolog', 'armut_resimler/saglik_alt_resimler/psikolog.jpg'),
(84, 6, 'Kardiyolog', 'armut_resimler/saglik_alt_resimler/Kardiyolog.jpg'),
(85, 6, 'Ortopedi', 'armut_resimler/saglik_alt_resimler/Ortopedi.jpg'),
(86, 6, 'Göz Doktoru', 'armut_resimler/saglik_alt_resimler/Göz Doktoru.jpeg'),
(87, 6, 'Diş Hekimi', 'armut_resimler/saglik_alt_resimler/Diş Hekimi.jpg'),
(88, 6, 'Estetik Cerrahi', 'armut_resimler/saglik_alt_resimler/Estetik Cerrahi.jpg'),
(89, 6, 'Dermatolog', 'armut_resimler/saglik_alt_resimler/Dermatolog.jpg'),
(90, 6, 'Aile Hekimi', 'armut_resimler/saglik_alt_resimler/Aile Hekimi.jpg'),
(91, 6, 'Uzman Hemşire', 'armut_resimler/saglik_alt_resimler/Uzman Hemşire.jpg'),
(92, 6, 'Nörolog', 'armut_resimler/saglik_alt_resimler/Nörolog.jpg'),
(93, 6, 'Rehabilitasyon Hizmetleri', 'armut_resimler/saglik_alt_resimler/Rehabilitasyon Hizmetleri.jpg'),
(94, 6, 'Onkoloji', 'armut_resimler/saglik_alt_resimler/Onkoloji.jpg'),
(95, 6, 'Kadın Doğum', 'armut_resimler/saglik_alt_resimler/Kadın Doğum.png'),
(96, 6, 'Kulak Burun Boğaz', 'armut_resimler/saglik_alt_resimler/Kulak Burun Boğaz.jpg'),
(97, 7, 'Düğün Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Düğün Organizasyonu.jpg'),
(98, 7, 'Doğum Günü Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Doğum Günü Organizasyonu.jpg'),
(99, 7, 'Etkinlik Planlama', 'armut_resimler/organizasyon_alt_resimler/Etkinlik Planlama.jpg'),
(100, 7, 'Konser Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Konser Organizasyonu.jpeg'),
(101, 7, 'Fuar Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Fuar Organizasyonu.jpg'),
(102, 7, 'Parti Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Parti Organizasyonu.jpg'),
(103, 7, 'Kurumsal Etkinlikler', 'armut_resimler/organizasyon_alt_resimler/Kurumsal Etkinlikler.jpg'),
(104, 7, 'Ev Partisi Planlama', 'armut_resimler/organizasyon_alt_resimler/Ev Partisi Planlama.jpg'),
(105, 7, 'Mezuniyet Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Mezuniyet Organizasyonu.jpg'),
(106, 7, 'Festival Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Festival Organizasyonu.jpg'),
(107, 7, 'Kokteyl Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Kokteyl Organizasyonu.jpg'),
(108, 7, 'Nikah Planlama', 'armut_resimler/organizasyon_alt_resimler/Nikah Planlama.jpg'),
(110, 7, 'Outdoor Etkinlikler', 'armut_resimler/organizasyon_alt_resimler/Outdoor Etkinlikler.png'),
(111, 7, 'Seminer Organizasyonu', 'armut_resimler/organizasyon_alt_resimler/Seminer Organizasyonu.jpg'),
(112, 7, 'Workshop Planlama', 'armut_resimler/organizasyon_alt_resimler/Workshop Planlama.jpg'),
(113, 8, 'Freelance Yazılım Geliştirme', 'armut_resimler/diger_alt_resimler/Freelance Yazılım Geliştirme.jpg'),
(114, 8, 'Grafik Tasarım', 'armut_resimler/diger_alt_resimler/Grafik Tasarım.jpg'),
(115, 8, 'Çeviri Hizmetleri', 'armut_resimler/diger_alt_resimler/Çeviri Hizmetleri.jpg'),
(116, 8, 'Fotoğrafçılık', 'armut_resimler/diger_alt_resimler/Fotoğrafçılık.jpg'),
(117, 8, 'Video Çekimi ve Düzenleme', 'armut_resimler/diger_alt_resimler/Video Çekimi ve Düzenleme.jpg'),
(118, 8, 'Web Sitesi Tasarımı', 'armut_resimler/diger_alt_resimler/Web Sitesi Tasarımı.jpg'),
(119, 8, 'Sosyal Medya Yönetimi', 'armut_resimler/diger_alt_resimler/Sosyal Medya Yönetimi.png'),
(120, 8, 'Yazı ve Metin Yazarlığı', 'armut_resimler/diger_alt_resimler/Yazı ve Metin Yazarlığı.png'),
(121, 8, 'E-Ticaret Danışmanlığı', 'armut_resimler/diger_alt_resimler/E-Ticaret Danışmanlığı.jpg'),
(122, 8, 'Hukuk Danışmanlığı', 'armut_resimler/diger_alt_resimler/Hukuk Danışmanlığı.jpg'),
(123, 8, 'Finansal Danışmanlık', 'armut_resimler/diger_alt_resimler/Finansal Danışmanlık.jpg'),
(124, 8, 'Data Analizi', 'armut_resimler/diger_alt_resimler/Data Analizi.png'),
(125, 8, 'Mobil Uygulama Geliştirme', 'armut_resimler/diger_alt_resimler/Mobil Uygulama Geliştirme.jpeg'),
(126, 8, 'İçerik Üretimi', 'armut_resimler/diger_alt_resimler/İçerik Üretimi.jpg'),
(127, 8, 'SEO Optimizasyonu', 'armut_resimler/diger_alt_resimler/SEO Optimizasyonu.jpg'),
(128, 8, 'Pazarlama Stratejileri', 'armut_resimler/diger_alt_resimler/Pazarlama Stratejileri.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `geribildirimler`
--

CREATE TABLE `geribildirimler` (
  `GeriBildirimID` int(11) NOT NULL,
  `HizmetID` int(11) NOT NULL,
  `Puan` int(1) NOT NULL CHECK (`Puan` between 1 and 5),
  `Yorum` text DEFAULT NULL,
  `GeriBildirimTarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `geribildirimler`
--

INSERT INTO `geribildirimler` (`GeriBildirimID`, `HizmetID`, `Puan`, `Yorum`, `GeriBildirimTarihi`) VALUES
(1, 1, 5, 'Hizmet çok profesyoneldi, evim tertemiz oldu.', '2025-03-22 17:30:29'),
(2, 2, 4, 'Ofisim oldukça iyi temizlenmişti, teşekkürler.', '2025-03-22 17:30:29'),
(3, 3, 3, 'Camlar temiz ama küçük lekeler kalmıştı.', '2025-03-22 17:30:29'),
(4, 4, 5, 'Halı yıkama hizmeti çok kaliteli ve hızlıydı.', '2025-03-22 17:30:29'),
(5, 5, 4, 'Boya işçiliği harikaydı ancak biraz uzun sürdü.', '2025-03-22 17:30:29'),
(6, 6, 5, 'Elektrik tesisatı tamamen yenilendi, çok memnun kaldık.', '2025-03-22 17:30:29'),
(7, 7, 5, 'Su tesisatı tamiri hızlı ve sorunsuz yapıldı.', '2025-03-22 17:30:29'),
(8, 8, 4, 'Parkeler güzel döşendi ama birkaç yer yamuk duruyor.', '2025-03-22 17:30:29'),
(9, 9, 5, 'Eşyalarımı çok dikkatli taşıdılar, hiç hasar yoktu.', '2025-03-22 17:30:29'),
(10, 10, 4, 'Ofis taşımada iyi bir hizmet aldık, tavsiye ederim.', '2025-03-22 17:30:29'),
(11, 11, 3, 'Nakliyat sırasında birkaç eşya hasar gördü, biraz üzüldüm.', '2025-03-22 17:30:29'),
(12, 12, 5, 'Hassas eşya taşıma konusunda kusursuz hizmet.', '2025-03-22 17:30:29'),
(13, 13, 5, 'Bilgisayarım hızlıca tamir edildi, çok memnunum.', '2025-03-22 17:30:29'),
(14, 14, 4, 'Telefon tamiri iyiydi ama teslim süresi uzundu.', '2025-03-22 17:30:29'),
(15, 15, 5, 'Beyaz eşyam tamir edildi, çok profesyonel bir ekipti.', '2025-03-22 17:30:29'),
(16, 16, 4, 'Araç tamiri sağlam yapıldı ama fiyat biraz yüksekti.', '2025-03-22 17:30:29'),
(17, 17, 5, 'Matematik dersleri sayesinde sınavdan yüksek not aldım.', '2025-03-22 17:30:29'),
(18, 18, 5, 'Fizik dersleri oldukça faydalı oldu, teşekkürler.', '2025-03-22 17:30:29'),
(19, 19, 4, 'Kimya dersleri verimliydi ama biraz daha detaylı anlatılabilirdi.', '2025-03-22 17:30:29'),
(20, 20, 5, 'İngilizce dersleri gerçekten çok iyiydi, tavsiye ederim.', '2025-03-22 17:30:29'),
(21, 21, 5, 'Diyetisyen gerçekten çok ilgiliydi, sonuçlardan memnunum.', '2025-03-22 17:30:29'),
(22, 22, 4, 'Fizyoterapist çok profesyoneldi ama seanslar biraz pahalıydı.', '2025-03-22 17:30:29'),
(23, 23, 5, 'Psikolog seansları çok faydalı oldu, çok teşekkürler.', '2025-03-22 17:30:29'),
(24, 24, 5, 'Kardiyolog kontrolünden çok memnun kaldım, ekip harikaydı.', '2025-03-22 17:30:29'),
(25, 25, 5, 'Düğün organizasyonu mükemmeldi, her şey harikaydı.', '2025-03-22 17:30:29'),
(26, 26, 5, 'Etkinlik organizasyonu tam istediğimiz gibiydi.', '2025-03-22 17:30:29'),
(27, 27, 4, 'Kurumsal etkinlik için güzel bir iş çıkarıldı ama biraz gecikme oldu.', '2025-03-22 17:30:29'),
(28, 28, 5, 'Doğum günü partisi organizasyonu çok eğlenceliydi.', '2025-03-22 17:30:29'),
(29, 29, 5, 'Freelance yazılım projem çok profesyonel bir şekilde tamamlandı.', '2025-03-22 17:30:29'),
(30, 30, 4, 'Grafik tasarım hizmetleri güzeldi ama teslim süresi biraz uzundu.', '2025-03-22 17:30:29'),
(31, 31, 5, 'Web sitesi tasarımı tam istediğim gibi oldu, teşekkürler.', '2025-03-22 17:30:29'),
(32, 32, 4, 'SEO hizmetleri faydalıydı, ancak etkisini görmek zaman alıyor.', '2025-03-22 17:30:29');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hizmetalanlar`
--

CREATE TABLE `hizmetalanlar` (
  `HizmetAlanID` int(11) NOT NULL,
  `Ad` varchar(255) NOT NULL,
  `Soyad` varchar(255) NOT NULL,
  `Konum` varchar(255) DEFAULT NULL,
  `Telefon` varchar(50) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Sifre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `hizmetalanlar`
--

INSERT INTO `hizmetalanlar` (`HizmetAlanID`, `Ad`, `Soyad`, `Konum`, `Telefon`, `Email`, `Sifre`) VALUES
(1, 'Ahmet', 'Kaya', 'İstanbul', '5551111001', 'ahmet.kaya@example.com', '12345'),
(2, 'Mehmet', 'Demir', 'Ankara', '5551111002', 'mehmet.demir@example.com', '12345'),
(3, 'Ayşe', 'Yıldız', 'İzmir', '5551111003', 'ayse.yildiz@example.com', '12345'),
(4, 'Fatma', 'Çelik', 'Antalya', '5551111004', 'fatma.celik@example.com', '12345'),
(5, 'Ali', 'Öztürk', 'Bursa', '5551111005', 'ali.ozturk@example.com', '12345'),
(6, 'Zeynep', 'Aksoy', 'Adana', '5551111006', 'zeynep.aksoy@example.com', '12345'),
(7, 'Hasan', 'Eren', 'Gaziantep', '5551111007', 'hasan.eren@example.com', '12345'),
(8, 'Melis', 'Kurt', 'Eskişehir', '5551111008', 'melis.kurt@example.com', '12345'),
(9, 'Cem', 'Polat', 'Kayseri', '5551111009', 'cem.polat@example.com', '12345'),
(10, 'Burcu', 'Taş', 'Konya', '5551111010', 'burcu.tas@example.com', '12345'),
(11, 'Ece', 'Çetin', 'Trabzon', '5551111011', 'ece.cetin@example.com', '12345'),
(12, 'Emre', 'Aydın', 'Samsun', '5551111012', 'emre.aydin@example.com', '12345'),
(13, 'Tuba', 'Yılmaz', 'Malatya', '5551111013', 'tuba.yilmaz@example.com', '12345'),
(14, 'Serkan', 'Koç', 'Mersin', '5551111014', 'serkan.koc@example.com', '12345'),
(15, 'Dilara', 'Şimşek', 'Hatay', '5551111015', 'dilara.simsek@example.com', '12345'),
(16, 'Gökhan', 'Can', 'Balıkesir', '5551111016', 'gokhan.can@example.com', '12345'),
(17, 'Bahar', 'Bilgin', 'Sakarya', '5551111017', 'bahar.bilgin@example.com', '12345'),
(18, 'Tahir', 'Keskin', 'Aydın', '5551111018', 'tahir.keskin@example.com', '12345'),
(19, 'Gamze', 'Sezgin', 'Çanakkale', '5551111019', 'gamze.sezgin@example.com', '12345'),
(20, 'Cengiz', 'Altın', 'Zonguldak', '5551111020', 'cengiz.altin@example.com', '12345'),
(21, 'Selin', 'Arslan', 'Afyon', '5551111021', 'selin.arslan@example.com', '12345'),
(22, 'Ufuk', 'Erdoğan', 'Edirne', '5551111022', 'ufuk.erdogan@example.com', '12345'),
(23, 'Sibel', 'Başak', 'Yalova', '5551111023', 'sibel.basak@example.com', '12345'),
(24, 'Volkan', 'Kara', 'Tekirdağ', '5551111024', 'volkan.kara@example.com', '12345'),
(25, 'Hülya', 'Deniz', 'Amasya', '5551111025', 'hulya.deniz@example.com', '12345'),
(26, 'Kerem', 'Sağ', 'Isparta', '5551111026', 'kerem.sag@example.com', '12345'),
(27, 'Ebru', 'Orhan', 'Hakkari', '5551111027', 'ebru.orhan@example.com', '12345'),
(28, 'Caner', 'Beyaz', 'Kütahya', '5551111028', 'caner.beyaz@example.com', '12345'),
(29, 'Pelin', 'Güler', 'Sinop', '5551111029', 'pelin.guler@example.com', '12345'),
(30, 'Burak', 'Bilir', 'Artvin', '5551111030', 'burak.bilir@example.com', '12345'),
(31, 'Esra', 'Güneş', 'Muğla', '5551111031', 'esra.gunes@example.com', '12345'),
(32, 'Barış', 'Yaz', 'Giresun', '5551111032', 'baris.yaz@example.com', '12345'),
(33, 'Derya', 'Uzun', 'Ordu', '5551111033', 'derya.uzun@example.com', '12345'),
(34, 'Metin', 'Kılıç', 'Çorum', '5551111034', 'metin.kilic@example.com', '12345'),
(35, 'Aylin', 'Şahin', 'Düzce', '5551111035', 'aylin.sahin@example.com', '12345'),
(36, 'Furkan', 'Akın', 'Bolu', '5551111036', 'furkan.akin@example.com', '12345'),
(37, 'Sevda', 'Karaaslan', 'Şırnak', '5551111037', 'sevda.karaaslan@example.com', '12345'),
(38, 'Taner', 'Er', 'Van', '5551111038', 'taner.er@example.com', '12345'),
(39, 'Halil', 'İpek', 'Mardin', '5551111039', 'halil.ipek@example.com', '12345'),
(40, 'Betül', 'Tan', 'Batman', '5551111040', 'betul.tan@example.com', '12345'),
(41, 'Kemal', 'Bayram', 'Kars', '5551111041', 'kemal.bayram@example.com', '12345'),
(42, 'Hande', 'Sarı', 'Ardahan', '5551111042', 'hande.sari@example.com', '12345'),
(43, 'Orhan', 'Gün', 'Ağrı', '5551111043', 'orhan.gun@example.com', '12345'),
(44, 'Filiz', 'Gök', 'Erzincan', '5551111044', 'filiz.gok@example.com', '12345'),
(45, 'Murat', 'Deniz', 'Bayburt', '5551111045', 'murat.deniz@example.com', '12345'),
(46, 'Şule', 'Toprak', 'Tunceli', '5551111046', 'sule.toprak@example.com', '12345'),
(47, 'Doğan', 'Köse', 'Elazığ', '5551111047', 'dogan.kose@example.com', '12345'),
(48, 'Reyhan', 'Akça', 'Bingöl', '5551111048', 'reyhan.akca@example.com', '12345'),
(49, 'Ferhat', 'Çetin', 'Bitlis', '5551111049', 'ferhat.cetin@example.com', '12345'),
(50, 'Eren', 'Torun', 'Siirt', '5551111050', 'eren.torun@example.com', '12345');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hizmetler`
--

CREATE TABLE `hizmetler` (
  `HizmetID` int(11) NOT NULL,
  `HizmetVerenID` int(11) NOT NULL,
  `KategoriID` int(11) NOT NULL,
  `AltKategoriID` int(11) NOT NULL,
  `Aciklama` text DEFAULT NULL,
  `Fiyat` decimal(10,2) DEFAULT NULL,
  `OlusturmaTarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `hizmetler`
--

INSERT INTO `hizmetler` (`HizmetID`, `HizmetVerenID`, `KategoriID`, `AltKategoriID`, `Aciklama`, `Fiyat`, `OlusturmaTarihi`) VALUES
(1, 1, 1, 1, 'Deniz Kurt tarafından ev temizliği hizmeti', 500.00, '2025-03-22 17:29:03'),
(2, 2, 1, 2, 'Serkan Altın tarafından ofis temizliği hizmeti', 750.00, '2025-03-22 17:29:03'),
(3, 3, 1, 3, 'Ayşe Demir ile cam temizliği hizmeti', 300.00, '2025-03-22 17:29:03'),
(4, 4, 1, 4, 'Mehmet Kaya tarafından halı yıkama hizmeti', 400.00, '2025-03-22 17:29:03'),
(5, 5, 2, 5, 'Hakan Çelik tarafından boya badana işleri', 1500.00, '2025-03-22 17:29:03'),
(6, 6, 2, 6, 'Zeynep Kara ile elektrik tesisatı yenileme', 2000.00, '2025-03-22 17:29:03'),
(7, 7, 2, 7, 'Eren Yılmaz tarafından su tesisatı tamiri', 1800.00, '2025-03-22 17:29:03'),
(8, 8, 2, 8, 'Burcu Ak ile parke döşeme hizmeti', 2500.00, '2025-03-22 17:29:03'),
(9, 9, 3, 9, 'Onur Polat ile evden eve nakliyat hizmeti', 3500.00, '2025-03-22 17:29:03'),
(10, 10, 3, 10, 'Cem Gümüş tarafından ofis nakliyatı', 4500.00, '2025-03-22 17:29:03'),
(11, 11, 3, 11, 'Pelin Taş ile şehirlerarası nakliyat', 5000.00, '2025-03-22 17:29:03'),
(12, 12, 3, 12, 'Hasan Er ile hassas eşya taşıma', 3200.00, '2025-03-22 17:29:03'),
(13, 13, 4, 13, 'Mert Kurt tarafından bilgisayar tamiri', 600.00, '2025-03-22 17:29:03'),
(14, 14, 4, 14, 'Gamze Başar ile cep telefonu tamiri', 800.00, '2025-03-22 17:29:03'),
(15, 15, 4, 15, 'Ece Aslan tarafından beyaz eşya tamiri', 1000.00, '2025-03-22 17:29:03'),
(16, 16, 4, 16, 'Taner Bilgin ile araç tamiri hizmeti', 1500.00, '2025-03-22 17:29:03'),
(17, 17, 5, 17, 'Selin Demir ile matematik özel dersi', 200.00, '2025-03-22 17:29:03'),
(18, 18, 5, 18, 'Tuba Eren ile fizik özel dersleri', 250.00, '2025-03-22 17:29:03'),
(19, 19, 5, 19, 'Volkan Şahin ile kimya dersleri', 300.00, '2025-03-22 17:29:03'),
(20, 20, 5, 20, 'Aylin Kaya ile İngilizce özel dersi', 350.00, '2025-03-22 17:29:03'),
(21, 21, 6, 21, 'Derya Akın tarafından diyetisyen hizmetleri', 700.00, '2025-03-22 17:29:03'),
(22, 22, 6, 22, 'Tahir Beyaz ile fizyoterapi hizmetleri', 800.00, '2025-03-22 17:29:03'),
(23, 23, 6, 23, 'Harun Öz tarafından psikolog danışmanlığı', 1200.00, '2025-03-22 17:29:03'),
(24, 24, 6, 24, 'Mine Gül ile kardiyoloji uzmanlığı', 1500.00, '2025-03-22 17:29:03'),
(25, 25, 7, 25, 'Meltem Yılmaz ile düğün organizasyonu planlama', 5000.00, '2025-03-22 17:29:03'),
(26, 26, 7, 26, 'Kerem Polat ile etkinlik organizasyonu', 4500.00, '2025-03-22 17:29:03'),
(27, 27, 7, 27, 'Zehra Çetin ile kurumsal etkinlik yönetimi', 6000.00, '2025-03-22 17:29:03'),
(28, 28, 7, 28, 'Ferhat Başak ile doğum günü organizasyonu', 3500.00, '2025-03-22 17:29:03'),
(29, 29, 8, 29, 'Leyla Eren tarafından freelance yazılım geliştirme', 2000.00, '2025-03-22 17:29:03'),
(30, 30, 8, 30, 'Fatih Taş ile grafik tasarım projeleri', 1500.00, '2025-03-22 17:29:03'),
(31, 31, 8, 31, 'Yasemin Koç ile web sitesi tasarımı', 2500.00, '2025-03-22 17:29:03'),
(32, 32, 8, 32, 'Cemre Demir ile SEO ve içerik üretimi', 1800.00, '2025-03-22 17:29:03');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hizmetverenler`
--

CREATE TABLE `hizmetverenler` (
  `HizmetVerenID` int(11) NOT NULL,
  `SahisMiSirketMi` varchar(50) NOT NULL,
  `Ad` varchar(255) NOT NULL,
  `Soyad` varchar(255) NOT NULL,
  `Konum` varchar(255) DEFAULT NULL,
  `Telefon` varchar(50) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Sifre` varchar(100) DEFAULT NULL,
  `KategoriID` int(11) NOT NULL,
  `AltKategoriID` int(11) NOT NULL,
  `TanitimYazisi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `hizmetverenler`
--

INSERT INTO `hizmetverenler` (`HizmetVerenID`, `SahisMiSirketMi`, `Ad`, `Soyad`, `Konum`, `Telefon`, `Email`, `Sifre`, `KategoriID`, `AltKategoriID`, `TanitimYazisi`) VALUES
(1, 'Şirket', 'Deniz', 'Kurt', 'İstanbul', '5551234501', 'temizlik1@example.com', '12345', 1, 1, 'Ev temizliğinde uzman.'),
(2, 'Şahıs', 'Serkan', 'Altın', 'Ankara', '5551234502', 'temizlik2@example.com', '12345', 1, 2, 'Ofis temizliği profesyonel şekilde yapılır.'),
(3, 'Şirket', 'Ayşe', 'Demir', 'İzmir', '5551234503', 'temizlik3@example.com', '12345', 1, 3, 'Cam temizliği hizmetleri sunulur.'),
(4, 'Şahıs', 'Mehmet', 'Kaya', 'Antalya', '5551234504', 'temizlik4@example.com', '12345', 1, 4, 'Halı ve koltuk temizliğinde garantili hizmet.'),
(5, 'Şirket', 'Hakan', 'Çelik', 'Bursa', '5551234505', 'tadilat1@example.com', '12345', 2, 5, 'Boya badana işlerinde yılların tecrübesi.'),
(6, 'Şahıs', 'Zeynep', 'Kara', 'Adana', '5551234506', 'tadilat2@example.com', '12345', 2, 6, 'Elektrik tesisatı yenileme hizmetleri.'),
(7, 'Şirket', 'Eren', 'Yılmaz', 'Eskişehir', '5551234507', 'tadilat3@example.com', '12345', 2, 7, 'Su tesisatı tamiri ve bakımı.'),
(8, 'Şahıs', 'Burcu', 'Ak', 'Kayseri', '5551234508', 'tadilat4@example.com', '12345', 2, 8, 'Parke döşeme uzmanlığı.'),
(9, 'Şirket', 'Onur', 'Polat', 'Konya', '5551234509', 'nakliyat1@example.com', '12345', 3, 9, 'Evden eve nakliyat hizmeti verilir.'),
(10, 'Şahıs', 'Cem', 'Gümüş', 'Trabzon', '5551234510', 'nakliyat2@example.com', '12345', 3, 10, 'Ofis nakliyatında güvenilir hizmet.'),
(11, 'Şirket', 'Pelin', 'Taş', 'Samsun', '5551234511', 'nakliyat3@example.com', '12345', 3, 11, 'Şehirlerarası nakliyat hizmetleri.'),
(12, 'Şahıs', 'Hasan', 'Er', 'Malatya', '5551234512', 'nakliyat4@example.com', '12345', 3, 12, 'Hassas eşya taşımada uzman.'),
(13, 'Şirket', 'Mert', 'Kurt', 'Gaziantep', '5551234513', 'tamir1@example.com', '12345', 4, 13, 'Bilgisayar tamiri ve teknik destek.'),
(14, 'Şahıs', 'Gamze', 'Başar', 'Hatay', '5551234514', 'tamir2@example.com', '12345', 4, 14, 'Cep telefonu tamir hizmetleri.'),
(15, 'Şirket', 'Ece', 'Aslan', 'Kocaeli', '5551234515', 'tamir3@example.com', '12345', 4, 15, 'Beyaz eşya tamirinde uzman.'),
(16, 'Şahıs', 'Taner', 'Bilgin', 'Van', '5551234516', 'tamir4@example.com', '12345', 4, 16, 'Araç tamiri garantili hizmet.'),
(17, 'Şirket', 'Selin', 'Demir', 'Uşak', '5551234517', 'ders1@example.com', '12345', 5, 17, 'Matematik özel ders uzmanı.'),
(18, 'Şahıs', 'Tuba', 'Eren', 'Erzurum', '5551234518', 'ders2@example.com', '12345', 5, 18, 'Fizik derslerinde 10 yıllık deneyim.'),
(19, 'Şirket', 'Volkan', 'Şahin', 'Tekirdağ', '5551234519', 'ders3@example.com', '12345', 5, 19, 'Kimya öğretmeninden özel ders.'),
(20, 'Şahıs', 'Aylin', 'Kaya', 'Balıkesir', '5551234520', 'ders4@example.com', '12345', 5, 20, 'İngilizce konuşma pratiği.'),
(21, 'Şirket', 'Derya', 'Akın', 'Afyon', '5551234521', 'saglik1@example.com', '12345', 6, 21, 'Diyetisyen hizmetlerinde uzman.'),
(22, 'Şahıs', 'Tahir', 'Beyaz', 'Bolu', '5551234522', 'saglik2@example.com', '12345', 6, 22, 'Fizyoterapi hizmetleri.'),
(23, 'Şirket', 'Harun', 'Öz', 'Artvin', '5551234523', 'saglik3@example.com', '12345', 6, 23, 'Psikolog danışmanlık hizmetleri.'),
(24, 'Şahıs', 'Mine', 'Gül', 'Amasya', '5551234524', 'saglik4@example.com', '12345', 6, 24, 'Kardiyolog uzmanlığı.'),
(25, 'Şirket', 'Meltem', 'Yılmaz', 'Kırklareli', '5551234525', 'org1@example.com', '12345', 7, 25, 'Düğün organizasyonu planlaması.'),
(26, 'Şahıs', 'Kerem', 'Polat', 'Çanakkale', '5551234526', 'org2@example.com', '12345', 7, 26, 'Etkinlik ve konser planlama.'),
(27, 'Şirket', 'Zehra', 'Çetin', 'Yalova', '5551234527', 'org3@example.com', '12345', 7, 27, 'Kurumsal etkinlik yönetimi.'),
(28, 'Şahıs', 'Ferhat', 'Başak', 'Sinop', '5551234528', 'org4@example.com', '12345', 7, 28, 'Parti ve doğum günü organizasyonu.'),
(29, 'Şirket', 'Leyla', 'Eren', 'Ordu', '5551234529', 'diger1@example.com', '12345', 8, 29, 'Freelance yazılım geliştirme.'),
(30, 'Şahıs', 'Fatih', 'Taş', 'Giresun', '5551234530', 'diger2@example.com', '12345', 8, 30, 'Grafik tasarım projeleri.'),
(31, 'Şirket', 'Yasemin', 'Koç', 'Hakkari', '5551234531', 'diger3@example.com', '12345', 8, 31, 'Web sitesi tasarımı.'),
(32, 'Şahıs', 'Cemre', 'Demir', 'Isparta', '5551234532', 'diger4@example.com', '12345', 8, 32, 'SEO ve içerik üretimi.'),
(33, 'sahis', 'Saul', 'Goodman', 'Albuquerque', '(505) 842-5662', 'bettercallsaul@gmail.com', 'walterwhite31', 8, 122, 'Better Call Saul');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `KategoriID` int(11) NOT NULL,
  `KategoriAdi` varchar(255) NOT NULL,
  `ResimYolu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`KategoriID`, `KategoriAdi`, `ResimYolu`) VALUES
(1, 'Temizlik', 'armut_resimler/temizlik.png'),
(2, 'Tadilat', 'armut_resimler/tadilat.jpg'),
(3, 'Nakliyat', 'armut_resimler/nakliyat.jpg'),
(4, 'Tamir', 'armut_resimler/tamir.jpg'),
(5, 'Özel Ders', 'armut_resimler/ozel-ders.jpg'),
(6, 'Sağlık', 'armut_resimler/saglik.jpg'),
(7, 'Organizasyon', 'armut_resimler/organizasyon.jpg'),
(8, 'Diğer', 'armut_resimler/diger.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teklifler`
--

CREATE TABLE `teklifler` (
  `TeklifID` int(11) NOT NULL,
  `HizmetAlanID` int(11) DEFAULT NULL,
  `HizmetID` int(11) DEFAULT NULL,
  `HizmetVerenID` int(11) NOT NULL,
  `TeklifTutari` decimal(10,2) DEFAULT NULL,
  `Aciklama` text DEFAULT NULL,
  `TeklifTarihi` datetime DEFAULT current_timestamp(),
  `Durum` enum('beklemede','kabul edildi','reddedildi') DEFAULT 'beklemede'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `teklifler`
--

INSERT INTO `teklifler` (`TeklifID`, `HizmetAlanID`, `HizmetID`, `HizmetVerenID`, `TeklifTutari`, `Aciklama`, `TeklifTarihi`, `Durum`) VALUES
(5, 1, NULL, 33, 21312.00, 'deneme', '2025-05-27 18:16:50', 'kabul edildi'),
(6, 2, NULL, 33, 10000.00, 'Adam yaralama.', '2025-05-27 19:16:55', 'reddedildi');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `altkategoriler`
--
ALTER TABLE `altkategoriler`
  ADD PRIMARY KEY (`AltKategoriID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Tablo için indeksler `geribildirimler`
--
ALTER TABLE `geribildirimler`
  ADD PRIMARY KEY (`GeriBildirimID`),
  ADD KEY `HizmetID` (`HizmetID`);

--
-- Tablo için indeksler `hizmetalanlar`
--
ALTER TABLE `hizmetalanlar`
  ADD PRIMARY KEY (`HizmetAlanID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Tablo için indeksler `hizmetler`
--
ALTER TABLE `hizmetler`
  ADD PRIMARY KEY (`HizmetID`),
  ADD KEY `HizmetVerenID` (`HizmetVerenID`),
  ADD KEY `KategoriID` (`KategoriID`),
  ADD KEY `AltKategoriID` (`AltKategoriID`);

--
-- Tablo için indeksler `hizmetverenler`
--
ALTER TABLE `hizmetverenler`
  ADD PRIMARY KEY (`HizmetVerenID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `KategoriID` (`KategoriID`),
  ADD KEY `AltKategoriID` (`AltKategoriID`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Tablo için indeksler `teklifler`
--
ALTER TABLE `teklifler`
  ADD PRIMARY KEY (`TeklifID`),
  ADD KEY `HizmetID` (`HizmetID`),
  ADD KEY `HizmetVerenID` (`HizmetVerenID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `altkategoriler`
--
ALTER TABLE `altkategoriler`
  MODIFY `AltKategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- Tablo için AUTO_INCREMENT değeri `geribildirimler`
--
ALTER TABLE `geribildirimler`
  MODIFY `GeriBildirimID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Tablo için AUTO_INCREMENT değeri `hizmetalanlar`
--
ALTER TABLE `hizmetalanlar`
  MODIFY `HizmetAlanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Tablo için AUTO_INCREMENT değeri `hizmetler`
--
ALTER TABLE `hizmetler`
  MODIFY `HizmetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Tablo için AUTO_INCREMENT değeri `hizmetverenler`
--
ALTER TABLE `hizmetverenler`
  MODIFY `HizmetVerenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `teklifler`
--
ALTER TABLE `teklifler`
  MODIFY `TeklifID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `altkategoriler`
--
ALTER TABLE `altkategoriler`
  ADD CONSTRAINT `altkategoriler_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoriler` (`KategoriID`);

--
-- Tablo kısıtlamaları `geribildirimler`
--
ALTER TABLE `geribildirimler`
  ADD CONSTRAINT `geribildirimler_ibfk_1` FOREIGN KEY (`HizmetID`) REFERENCES `hizmetverenler` (`HizmetVerenID`);

--
-- Tablo kısıtlamaları `hizmetler`
--
ALTER TABLE `hizmetler`
  ADD CONSTRAINT `hizmetler_ibfk_1` FOREIGN KEY (`HizmetVerenID`) REFERENCES `hizmetverenler` (`HizmetVerenID`),
  ADD CONSTRAINT `hizmetler_ibfk_2` FOREIGN KEY (`KategoriID`) REFERENCES `kategoriler` (`KategoriID`),
  ADD CONSTRAINT `hizmetler_ibfk_3` FOREIGN KEY (`AltKategoriID`) REFERENCES `altkategoriler` (`AltKategoriID`);

--
-- Tablo kısıtlamaları `hizmetverenler`
--
ALTER TABLE `hizmetverenler`
  ADD CONSTRAINT `hizmetverenler_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoriler` (`KategoriID`),
  ADD CONSTRAINT `hizmetverenler_ibfk_2` FOREIGN KEY (`AltKategoriID`) REFERENCES `altkategoriler` (`AltKategoriID`);

--
-- Tablo kısıtlamaları `teklifler`
--
ALTER TABLE `teklifler`
  ADD CONSTRAINT `fk_teklif_hizmet` FOREIGN KEY (`HizmetID`) REFERENCES `hizmetler` (`HizmetID`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
