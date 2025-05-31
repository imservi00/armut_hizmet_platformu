<?php
session_start();
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

// Giriş kontrolü
if (!isset($_SESSION['giris']) || $_SESSION['rol'] !== 'hizmetveren') {
    header("Location: giris.php");
    exit();
}

// Parametre kontrolü
if (!isset($_GET['id']) || !isset($_GET['durum'])) {
    die("Geçersiz istek.");
}

$teklif_id = (int) $_GET['id'];
$durum = $_GET['durum'];

// Sadece izin verilen değerleri kabul et
$gecerli_durumlar = ['kabul edildi', 'reddedildi'];
if (!in_array($durum, $gecerli_durumlar)) {
    die("Geçersiz durum.");
}

// Teklifi güncelle
$sorgu = $baglanti->prepare("UPDATE teklifler SET Durum = ? WHERE TeklifID = ?");
$sorgu->bind_param("si", $durum, $teklif_id);
$sorgu->execute();

// Panel'e geri dön
header("Location: panel.php");
exit();
