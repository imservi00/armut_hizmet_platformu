<?php
// Veritabanı bağlantısı
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

// Kategori ID kontrolü
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Geçersiz kategori.");
}

$kategori_id = (int) $_GET['id'];

// Kategori bilgisi çek
$kategori_sorgu = $baglanti->prepare("SELECT * FROM kategoriler WHERE KategoriID = ?");
$kategori_sorgu->bind_param("i", $kategori_id);
$kategori_sorgu->execute();
$kategori_sonuc = $kategori_sorgu->get_result();

if ($kategori_sonuc->num_rows === 0) {
    die("Kategori bulunamadı.");
}

$kategori = $kategori_sonuc->fetch_assoc();

// Altkategorileri getir
$altkategoriler = $baglanti->query("SELECT * FROM altkategoriler WHERE KategoriID = $kategori_id");
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title><?php echo htmlspecialchars($kategori['KategoriAdi']); ?> | ananas</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<!-- Navbar -->
<?php include 'navbar.php'; ?>

<!-- Sayfa Başlığı -->
<section class="bg-yellow-400 text-white py-12 text-center">
    <h1 class="text-4xl font-bold mb-4"><?php echo htmlspecialchars($kategori['KategoriAdi']); ?> Kategorisindeki Hizmetler</h1>
</section>

<!-- Alt Kategoriler -->
<section class="max-w-7xl mx-auto px-4 py-10">
    <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <?php while($alt = $altkategoriler->fetch_assoc()): ?>
            <a href="altkategori.php?id=<?php echo $alt['AltKategoriID']; ?>" class="bg-white rounded-lg shadow hover:shadow-lg transition overflow-hidden block">
                <?php if (!empty($alt['ResimYolu'])): ?>
                    <img src="<?php echo $alt['ResimYolu']; ?>" alt="<?php echo $alt['AltKategoriAdi']; ?>" class="w-full h-40 object-cover">
                <?php endif; ?>
                <div class="p-4 text-center">
                    <h3 class="text-lg font-semibold text-yellow-600"><?php echo htmlspecialchars($alt['AltKategoriAdi']); ?></h3>
                    <span class="text-sm text-gray-500 hover:text-yellow-600">Hizmeti İncele</span>
                </div>
            </a>
        <?php endwhile; ?>
    </div>
</section>

</body>
</html>