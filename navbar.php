<?php
if (session_status() === PHP_SESSION_NONE) session_start();

// Kullanıcı adını gösterebilmek için veritabanına bağlan:
$adsoyad = '';
if (isset($_SESSION['giris']) && $_SESSION['giris'] === true && isset($_SESSION['email'], $_SESSION['rol'])) {
    $baglanti = new mysqli("localhost", "root", "", "armutdata");
    $baglanti->set_charset("utf8");
    if (!$baglanti->connect_error) {
        $email = $_SESSION['email'];
        $rol = $_SESSION['rol'];
        if ($rol === 'hizmetalan') {
            $sorgu = $baglanti->prepare("SELECT Ad, Soyad FROM hizmetalanlar WHERE Email = ?");
        } else {
            $sorgu = $baglanti->prepare("SELECT Ad, Soyad FROM hizmetverenler WHERE Email = ?");
        }
        $sorgu->bind_param("s", $email);
        $sorgu->execute();
        $sonuc = $sorgu->get_result();
        if ($sonuc->num_rows > 0) {
            $kullanici_bilgi = $sonuc->fetch_assoc(); // ❗️burada artık $veri değil
            $adsoyad = $kullanici_bilgi['Ad'] . ' ' . $kullanici_bilgi['Soyad'];
        }
        $sorgu->close();
        $baglanti->close();
    }
}
?>

<nav class="bg-white shadow-md sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-4 py-3 flex items-center justify-between">
    <div class="flex items-center space-x-2">
      <img src="armut_resimler/ananas.jpeg" alt="ananas" class="h-8 w-8 object-contain">
      <a href="index.php" class="text-2xl font-bold text-yellow-500">ananas</a>
    </div>
    <div class="space-x-6 flex items-center">
      <a href="hizmet_ara.php" class="text-gray-700 hover:text-yellow-600">Hizmet Ara</a>

      <?php if (isset($_SESSION['giris']) && $_SESSION['giris'] === true): ?>
        <?php if (!empty($adsoyad)): ?>
          <span class="text-gray-600 font-semibold"><?php echo htmlspecialchars($adsoyad); ?></span>
        <?php endif; ?>

        <?php if ($_SESSION['rol'] === 'hizmetveren' || $_SESSION['rol'] === 'hizmetalan'): ?>
          <a href="panel.php" class="text-gray-700 hover:text-yellow-600">Panel</a>
        <?php endif; ?>

        <a href="cikis.php" class="text-gray-700 hover:text-yellow-600">Çıkış Yap</a>
      <?php else: ?>
        <a href="giris.php" class="text-gray-700 hover:text-yellow-600">Giriş Yap</a>
        <a href="kayit.php" class="bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">Kayıt Ol</a>
      <?php endif; ?>
    </div>
  </div>
</nav>
