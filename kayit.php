<?php
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

$basarili = false;
$hata = '';

// kategorileri çek
$kategori_sonuc = $baglanti->query("SELECT * FROM kategoriler");
$altkategori_sonuc = $baglanti->query("SELECT * FROM altkategoriler");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $rol = $_POST['rol'];
    $ad = trim($_POST['ad']);
    $soyad = trim($_POST['soyad']);
    $konum = trim($_POST['konum']);
    $telefon = trim($_POST['telefon']);
    $email = trim($_POST['email']);
    $sifre = trim($_POST['sifre']);

    if ($rol === 'hizmetalan') {
        $ekle = $baglanti->prepare("INSERT INTO hizmetalanlar (Ad, Soyad, Konum, Telefon, Email, Sifre) VALUES (?, ?, ?, ?, ?, ?)");
        $ekle->bind_param("ssssss", $ad, $soyad, $konum, $telefon, $email, $sifre);
    } else {
        $sahis_mi = $_POST['sahis_sirket'];
        $kategori_id = (int) $_POST['kategori_id'];
        $altkategori_id = (int) $_POST['altkategori_id'];
        $tanitim = trim($_POST['tanitim']);
        $ekle = $baglanti->prepare("INSERT INTO hizmetverenler (SahisMiSirketMi, Ad, Soyad, Konum, Telefon, Email, Sifre, KategoriID, AltKategoriID, TanitimYazisi) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $ekle->bind_param("ssssssssss", $sahis_mi, $ad, $soyad, $konum, $telefon, $email, $sifre, $kategori_id, $altkategori_id, $tanitim);
    }

    if ($ekle->execute()) {
        header("Location: giris.php");
        exit();
    } else {
        $hata = "Kayıt işlemi başarısız.";
    }
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Kayıt Ol | ananas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    function toggleFields() {
      const rol = document.getElementById('rol').value;
      document.getElementById('hizmetveren-ekstra').style.display = rol === 'hizmetveren' ? 'block' : 'none';
    }
  </script>
</head>
<body class="bg-gray-50 text-gray-800">

<?php include 'navbar.php'; ?>

<section class="flex items-center justify-center py-16">
  <div class="w-full max-w-2xl bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold text-yellow-500 text-center mb-6">Kayıt Ol</h2>

    <?php if (!empty($hata)): ?>
      <div class="bg-red-100 text-red-700 px-4 py-2 rounded mb-4 text-center"><?php echo $hata; ?></div>
    <?php endif; ?>

    <form method="POST" class="space-y-4" oninput="toggleFields()">
      <div>
        <label class="block mb-1">Rol</label>
        <select name="rol" id="rol" class="w-full border px-4 py-2 rounded" onchange="toggleFields()">
          <option value="hizmetalan">Hizmet Alan</option>
          <option value="hizmetveren">Hizmet Veren</option>
        </select>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <label class="block mb-1">Ad</label>
          <input type="text" name="ad" required class="w-full border px-4 py-2 rounded">
        </div>
        <div>
          <label class="block mb-1">Soyad</label>
          <input type="text" name="soyad" required class="w-full border px-4 py-2 rounded">
        </div>
      </div>
      <div>
        <label class="block mb-1">Konum</label>
        <input type="text" name="konum" required class="w-full border px-4 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1">Telefon</label>
        <input type="text" name="telefon" required class="w-full border px-4 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1">Email</label>
        <input type="email" name="email" required class="w-full border px-4 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1">Şifre</label>
        <input type="text" name="sifre" required class="w-full border px-4 py-2 rounded">
      </div>

      <!-- Hizmet Veren Alanları -->
      <div id="hizmetveren-ekstra" style="display: none;">
        <div>
          <label class="block mb-1">Şahıs mı Şirket mi?</label>
          <select name="sahis_sirket" class="w-full border px-4 py-2 rounded">
            <option value="sahis">Şahıs</option>
            <option value="sirket">Şirket</option>
          </select>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="block mb-1">Kategori</label>
            <select name="kategori_id" class="w-full border px-4 py-2 rounded">
              <?php while($kat = $kategori_sonuc->fetch_assoc()): ?>
                <option value="<?php echo $kat['KategoriID']; ?>"><?php echo $kat['KategoriAdi']; ?></option>
              <?php endwhile; ?>
            </select>
          </div>
          <div>
            <label class="block mb-1">Alt Kategori</label>
            <select name="altkategori_id" class="w-full border px-4 py-2 rounded">
              <?php while($alt = $altkategori_sonuc->fetch_assoc()): ?>
                <option value="<?php echo $alt['AltKategoriID']; ?>"><?php echo $alt['AltKategoriAdi']; ?></option>
              <?php endwhile; ?>
            </select>
          </div>
        </div>
        <div>
          <label class="block mb-1">Tanıtım Yazısı</label>
          <textarea name="tanitim" rows="3" class="w-full border px-4 py-2 rounded"></textarea>
        </div>
      </div>

      <button type="submit" class="w-full bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-2 rounded">Kayıt Ol</button>
    </form>
  </div>
</section>

</body>
</html>
