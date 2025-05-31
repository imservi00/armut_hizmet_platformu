<?php
// veritabanı bağlantısı
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

// alt kategori id kontrolü
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Geçersiz alt kategori.");
}

$altkategori_id = (int) $_GET['id'];
$altkat_sorgu = $baglanti->prepare("SELECT * FROM altkategoriler WHERE AltKategoriID = ?");
$altkat_sorgu->bind_param("i", $altkategori_id);
$altkat_sorgu->execute();
$altkat_sonuc = $altkat_sorgu->get_result();

if ($altkat_sonuc->num_rows === 0) {
    die("Alt kategori bulunamadı.");
}

$altkategori = $altkat_sonuc->fetch_assoc();

// Bu alt kategoriye ait hizmet verenleri al
$hizmetverenler = $baglanti->prepare("SELECT * FROM hizmetverenler WHERE AltKategoriID = ?");
$hizmetverenler->bind_param("i", $altkategori_id);
$hizmetverenler->execute();
$hizmetveren_sonuc = $hizmetverenler->get_result();
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($altkategori['AltKategoriAdi']); ?> | ananas</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<?php include 'navbar.php'; ?>

<!-- Başlık -->
<section class="bg-yellow-400 text-white py-12 text-center">
    <h1 class="text-4xl font-bold mb-4"><?php echo htmlspecialchars($altkategori['AltKategoriAdi']); ?></h1>
</section>

<!-- Detay İçerik -->
<section class="max-w-6xl mx-auto px-4 py-10">
    <div class="bg-white rounded-xl shadow-xl overflow-hidden">
        <?php if (!empty($altkategori['ResimYolu'])): ?>
            <img src="<?php echo $altkategori['ResimYolu']; ?>" alt="<?php echo $altkategori['AltKategoriAdi']; ?>" class="w-full h-72 object-cover">
        <?php endif; ?>
        <div class="p-8">
            <h2 class="text-2xl font-bold text-yellow-600 mb-6 border-b pb-2"><?php echo htmlspecialchars($altkategori['AltKategoriAdi']); ?> Hizmeti Verenler</h2>

            <?php if ($hizmetveren_sonuc->num_rows > 0): ?>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <?php while ($hv = $hizmetveren_sonuc->fetch_assoc()): ?>
                        <div class="border border-yellow-200 rounded-lg p-6 shadow-sm hover:shadow-lg transition bg-white">
                            <div class="flex items-center justify-between mb-3">
                                <h3 class="text-xl font-semibold text-gray-800">
                                    <?php echo htmlspecialchars($hv['Ad'] . ' ' . $hv['Soyad']); ?>
                                </h3>
                                <span class="text-xs px-2 py-1 rounded-full bg-yellow-100 text-yellow-600">
                                    <?php echo $hv['SahisMiSirketMi'] === 'sirket' ? 'Şirket' : 'Şahıs'; ?>
                                </span>
                            </div>
                            <p class="text-sm text-gray-600 mb-1">📍 <strong><?php echo htmlspecialchars($hv['Konum']); ?></strong></p>
                            <p class="text-sm text-gray-600 mb-1">📞 <?php echo htmlspecialchars($hv['Telefon']); ?></p>
                            <p class="text-sm text-gray-600 mb-3">✉️ <?php echo htmlspecialchars($hv['Email']); ?></p>
                            <p class="text-gray-700 text-sm mb-4 italic">"<?php echo nl2br(htmlspecialchars($hv['TanitimYazisi'])); ?>"</p>
                            <a href="teklif_al.php?id=<?php echo $hv['HizmetVerenID']; ?>" class="inline-block bg-yellow-500 text-white px-5 py-2 rounded-full font-medium shadow hover:bg-yellow-600 transition">Teklif Ver</a>
                        </div>
                    <?php endwhile; ?>
                </div>
            <?php else: ?>
                <p class="text-gray-600 text-center">Bu alt kategoriye ait kayıtlı bir hizmet veren bulunmamaktadır.</p>
            <?php endif; ?>
        </div>
    </div>
</section>

</body>
</html>