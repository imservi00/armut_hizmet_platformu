<?php
// veritabanı bağlantısı
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

// kategorileri al
$kategoriler = $baglanti->query("SELECT * FROM kategoriler");
// rastgele 8 alt kategori getir
$altkategoriler = $baglanti->query("SELECT * FROM altkategoriler ORDER BY RAND() LIMIT 8");
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ananas | Hizmet Platformu</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<!-- Navbar -->
<?php include 'navbar.php'; ?>

<!-- Hero Section -->
<section class="bg-yellow-400 text-white py-12 text-center">
    <h1 class="text-4xl font-bold mb-4">İhtiyacın Olan Hizmeti Hemen Bul</h1>
    <p class="mb-6">En güvenilir hizmet verenlerle hemen iletişime geç!</p>
    <input 
        type="text" 
        placeholder="Örn: Boya badana, temizlik..." 
        class="w-1/2 px-4 py-2 rounded text-gray-800 cursor-pointer"
        onclick="window.location.href='hizmet_ara.php';"
        readonly
        onfocus="this.blur();" <!-- Klavye çıkmasın diye -->
    >
</section>


<!-- Kategoriler Bölümü -->
<section class="max-w-7xl mx-auto px-4 py-12">
    <h2 class="text-2xl font-bold mb-6 text-center">Popüler Kategoriler</h2>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <?php while($kat = $kategoriler->fetch_assoc()): ?>
            <a href="kategori.php?id=<?php echo $kat['KategoriID']; ?>" class="block bg-white rounded-lg shadow hover:shadow-lg transition">
                <img src="<?php echo $kat['ResimYolu']; ?>" alt="<?php echo $kat['KategoriAdi']; ?>" class="w-full h-40 object-cover rounded-t-lg">
                <div class="p-4 text-center font-semibold"> <?php echo $kat['KategoriAdi']; ?> </div>
            </a>
        <?php endwhile; ?>
    </div>
</section>

<!-- Popüler Hizmetler (Alt Kategoriler) -->
<section class="max-w-7xl mx-auto px-4 pb-12">
    <h2 class="text-2xl font-bold mb-6 text-center">Popüler Hizmetler</h2>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
        <?php while($alt = $altkategoriler->fetch_assoc()): ?>
            <div class="bg-white rounded-lg shadow hover:shadow-lg transition text-center p-4">
                <div class="text-yellow-600 font-semibold text-lg mb-2"><?php echo $alt['AltKategoriAdi']; ?></div>
                <a href="#" class="text-sm text-gray-500 hover:text-yellow-600">Hizmeti İncele</a>
            </div>
        <?php endwhile; ?>
    </div>
</section>

<!-- Neden Biz? -->
<section class="bg-white py-12 border-t">
    <div class="max-w-5xl mx-auto px-4 text-center">
        <h2 class="text-2xl font-bold mb-6">Neden ananas?</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
                <div class="text-yellow-500 text-4xl mb-2">🔒</div>
                <h3 class="font-semibold">Güvenli Hizmet</h3>
                <p class="text-sm text-gray-500">Tüm hizmet verenler sistemde onaylıdır.</p>
            </div>
            <div>
                <div class="text-yellow-500 text-4xl mb-2">💬</div>
                <h3 class="font-semibold">Ücretsiz Teklif Al</h3>
                <p class="text-sm text-gray-500">Teklif almak için ödeme yapmazsın.</p>
            </div>
            <div>
                <div class="text-yellow-500 text-4xl mb-2">⚡</div>
                <h3 class="font-semibold">Hızlı Yanıt</h3>
                <p class="text-sm text-gray-500">Dakikalar içinde dönüş alırsın.</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-white border-t py-6 text-center text-sm text-gray-500">
    &copy; <?php echo date('Y'); ?> ananas. Tüm hakları saklıdır.
</footer>

</body>
</html>