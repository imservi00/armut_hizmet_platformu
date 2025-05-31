<?php
session_start();
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

$hata = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $sifre = trim($_POST['sifre']);
    $rol = $_POST['rol'];

    if ($rol === 'hizmetalan') {
        $sorgu = $baglanti->prepare("SELECT * FROM hizmetalanlar WHERE Email = ? AND Sifre = ?");
    } else {
        $sorgu = $baglanti->prepare("SELECT * FROM hizmetverenler WHERE Email = ? AND Sifre = ?");
    }
    $sorgu->bind_param("ss", $email, $sifre);
    $sorgu->execute();
    $sonuc = $sorgu->get_result();

    if ($sonuc->num_rows === 1) {
        $_SESSION['giris'] = true;
        $_SESSION['email'] = $email;
        $_SESSION['rol'] = $rol;
        header("Location: index.php");
        exit();
    } else {
        $hata = "Giriş başarısız. Email veya şifre hatalı.";
    }
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giriş Yap | ananas</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<?php include 'navbar.php'; ?>

<section class="flex items-center justify-center py-16">
  <div class="w-full max-w-md bg-white p-8 rounded shadow">
    <h2 class="text-2xl font-bold text-yellow-500 text-center mb-6">Giriş Yap</h2>

    <?php if (!empty($hata)): ?>
      <div class="bg-red-100 text-red-700 px-4 py-2 rounded mb-4"><?php echo $hata; ?></div>
    <?php endif; ?>

    <form method="POST" class="space-y-4">
      <div>
        <label class="block mb-1">Email</label>
        <input type="email" name="email" required class="w-full border px-4 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1">Şifre</label>
        <input type="password" name="sifre" required class="w-full border px-4 py-2 rounded">
      </div>
      <div>
        <label class="block mb-1">Rol</label>
        <select name="rol" class="w-full border px-4 py-2 rounded">
          <option value="hizmetalan">Hizmet Alan</option>
          <option value="hizmetveren">Hizmet Veren</option>
        </select>
      </div>
      <button type="submit" class="w-full bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600">Giriş Yap</button>
    </form>

    <p class="text-sm text-center mt-4 text-gray-600">
      Hesabınız yok mu?
      <a href="kayit.php" class="text-yellow-600 hover:underline">Kayıt Ol</a>
    </p>
  </div>
</section>

</body>
</html>
