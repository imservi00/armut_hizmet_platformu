<?php
session_start();
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}

if (!isset($_SESSION['giris']) || $_SESSION['giris'] !== true) {
    header("Location: giris.php");
    exit();
}

$email = $_SESSION['email'];
$rol = $_SESSION['rol'];
$kullanici = null;
$teklifler = [];

if ($rol === 'hizmetalan') {
    $kullanici = $baglanti->query("SELECT * FROM hizmetalanlar WHERE Email = '$email'")->fetch_assoc();
    $hizmetalan_id = $kullanici['HizmetAlanID'];

    $teklifler = $baglanti->query("
        SELECT t.*, hv.Ad AS HVAd, hv.Soyad AS HVSoyad
        FROM teklifler t
        INNER JOIN hizmetverenler hv ON t.HizmetVerenID = hv.HizmetVerenID
        WHERE t.HizmetAlanID = $hizmetalan_id
        ORDER BY t.TeklifTarihi DESC
    ");
} else {
    $kullanici = $baglanti->query("SELECT * FROM hizmetverenler WHERE Email = '$email'")->fetch_assoc();
    $hizmetveren_id = $kullanici['HizmetVerenID'];
    $teklifler = $baglanti->query("SELECT * FROM teklifler WHERE HizmetVerenID = $hizmetveren_id ORDER BY TeklifTarihi DESC");
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Panel | ananas</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<?php include 'navbar.php'; ?>

<section class="max-w-5xl mx-auto py-10 px-4">
  <h1 class="text-3xl font-bold text-yellow-600 mb-4">Kullanıcı Paneli</h1>

  <div class="bg-white rounded shadow p-6 mb-8">
    <h2 class="text-xl font-semibold mb-2">Bilgileriniz</h2>
    <p><strong>Ad Soyad:</strong> <?php echo htmlspecialchars($kullanici['Ad'] . ' ' . $kullanici['Soyad']); ?></p>
    <p><strong>Email:</strong> <?php echo htmlspecialchars($kullanici['Email']); ?></p>
    <p><strong>Rol:</strong> <?php echo $rol === 'hizmetalan' ? 'Hizmet Alan' : 'Hizmet Veren'; ?></p>
  </div>

  <?php if ($teklifler && $teklifler->num_rows > 0): ?>
    <div class="bg-white rounded shadow p-6">
      <h2 class="text-xl font-semibold mb-4">
        <?php echo $rol === 'hizmetalan' ? 'Verdiğiniz Teklifler' : 'Gelen Teklifler'; ?>
      </h2>
      <ul class="divide-y">
        <?php while ($t = $teklifler->fetch_assoc()): ?>
          <li class="py-4">
            <div class="flex justify-between items-center">
              <div>
                <p class="font-semibold text-gray-800">
                  ₺<?php echo htmlspecialchars($t['TeklifTutari']); ?> 
                  <span class="text-sm text-gray-500 ml-2"><?php echo htmlspecialchars($t['TeklifTarihi']); ?></span>
                </p>
                <?php if ($rol === 'hizmetalan'): ?>
                  <p class="text-sm text-gray-600 mt-1">Hizmet Veren: 
                    <strong><?php echo htmlspecialchars($t['HVAd'] . ' ' . $t['HVSoyad']); ?></strong>
                  </p>
                <?php endif; ?>
                <?php if (!empty($t['Aciklama'])): ?>
                  <p class="text-sm italic text-gray-600 mt-1"><?php echo htmlspecialchars($t['Aciklama']); ?></p>
                <?php endif; ?>
              </div>
              <div>
                <?php if ($rol === 'hizmetveren' && $t['Durum'] === 'beklemede'): ?>
                  <a href="teklif_durum_guncelle.php?id=<?php echo $t['TeklifID']; ?>&durum=kabul edildi" class="text-green-600 hover:underline mr-4">Kabul Et</a>
                  <a href="teklif_durum_guncelle.php?id=<?php echo $t['TeklifID']; ?>&durum=reddedildi" class="text-red-600 hover:underline">Reddet</a>
                <?php else: ?>
                  <?php if ($t['Durum'] === 'kabul edildi'): ?>
                    <span class="text-green-600 font-semibold">✔ Kabul Edildi</span>
                  <?php elseif ($t['Durum'] === 'reddedildi'): ?>
                    <span class="text-red-600 font-semibold">✖ Reddedildi</span>
                  <?php else: ?>
                    <span class="text-gray-500 font-semibold">⏳ Beklemede</span>
                  <?php endif; ?>
                <?php endif; ?>
              </div>
            </div>
          </li>
        <?php endwhile; ?>
      </ul>
    </div>
  <?php else: ?>
    <div class="bg-white rounded shadow p-6">
      <p class="text-gray-600">
        <?php echo $rol === 'hizmetalan' ? 'Henüz teklif vermediniz.' : 'Henüz teklif almadınız.'; ?>
      </p>
    </div>
  <?php endif; ?>
</section>

</body>
</html>
