<?php
session_start();

// Giriş kontrolü
if (!isset($_SESSION['giris']) || $_SESSION['giris'] !== true || $_SESSION['rol'] !== 'hizmetalan') {
    header("Location: giris.php");
    exit();
}

// Veritabanı bağlantısı
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

// GET ile gelen hizmetveren ID kontrolü
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Geçersiz hizmet veren.");
}
$hizmetveren_id = (int) $_GET['id'];

// Hizmetveren bilgisi
$sorgu = $baglanti->prepare("SELECT * FROM hizmetverenler WHERE HizmetVerenID = ?");
$sorgu->bind_param("i", $hizmetveren_id);
$sorgu->execute();
$sonuc = $sorgu->get_result();
if ($sonuc->num_rows === 0) {
    die("Hizmet veren bulunamadı.");
}
$veri = $sonuc->fetch_assoc();

// Giriş yapan hizmet alan bilgisi
$email = $_SESSION['email'];
$hizmetalan = $baglanti->query("SELECT * FROM hizmetalanlar WHERE Email = '$email'")->fetch_assoc();
$hizmetalan_id = $hizmetalan['HizmetAlanID'];

$basarili = false;
$hata = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $teklif_tutari = $_POST['teklif_tutari'];
    $aciklama = trim($_POST['aciklama']);

    if (!is_numeric($teklif_tutari)) {
        $hata = "Geçerli bir teklif tutarı giriniz.";
    } else {
        $bos_hizmet_id = null; // NULL vererek FK ihlali engellenir

        $ekle = $baglanti->prepare("
            INSERT INTO teklifler (HizmetID, HizmetVerenID, HizmetAlanID, TeklifTutari, Aciklama, TeklifTarihi, Durum)
            VALUES (?, ?, ?, ?, ?, NOW(), 'beklemede')
        ");
        $ekle->bind_param("iiids", $bos_hizmet_id, $hizmetveren_id, $hizmetalan_id, $teklif_tutari, $aciklama);

        if ($ekle->execute()) {
            $basarili = true;
        } else {
            $hata = "Teklif kaydedilemedi. Hata: " . $baglanti->error;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teklif Ver | ananas</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<?php include 'navbar.php'; ?>

<!-- Başlık -->
<section class="text-center py-10 bg-yellow-100">
    <h1 class="text-3xl font-bold text-yellow-600">Teklif Ver</h1>
    <p class="text-gray-700 mt-2">Hizmet Veren: <strong><?php echo htmlspecialchars($veri['Ad'] . ' ' . $veri['Soyad']); ?></strong></p>
</section>

<!-- Form -->
<section class="max-w-xl mx-auto bg-white p-8 mt-10 shadow-md rounded-lg">
    <?php if ($basarili): ?>
        <div class="text-green-600 text-lg font-semibold mb-4">Teklif talebiniz başarıyla gönderildi!</div>
    <?php else: ?>
        <?php if (!empty($hata)): ?>
            <div class="text-red-600 text-sm mb-4"><?php echo $hata; ?></div>
        <?php endif; ?>

        <form action="" method="post" class="space-y-6">
            <div>
                <label for="teklif_tutari" class="block mb-1 font-medium text-gray-700">Teklif Tutarı (₺)</label>
                <input type="number" id="teklif_tutari" name="teklif_tutari" step="0.01" class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-yellow-400" required>
            </div>

            <div>
                <label for="aciklama" class="block mb-1 font-medium text-gray-700">Açıklama</label>
                <textarea id="aciklama" name="aciklama" rows="4" class="w-full border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-yellow-400" required></textarea>
            </div>

            <button type="submit" class="w-full bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-2 rounded">Teklif Ver</button>
        </form>
    <?php endif; ?>
</section>

</body>
</html>
