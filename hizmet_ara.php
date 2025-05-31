<?php
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");
if ($baglanti->connect_error) {
    die("Veritabanı bağlantı hatası: " . $baglanti->connect_error);
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hizmet Ara | ananas</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const input = document.getElementById("aramaInput");
      const container = document.getElementById("sonuclar");

      function fetchAltKategoriler(aranan) {
        fetch("arama_api.php?q=" + encodeURIComponent(aranan))
          .then(response => response.text())
          .then(html => {
            container.innerHTML = html;
          });
      }

      input.addEventListener("input", function () {
        fetchAltKategoriler(input.value.trim());
      });

      fetchAltKategoriler(""); // Sayfa ilk yüklendiğinde tüm alt kategorileri getir
    });
  </script>
</head>
<body class="bg-gray-50 text-gray-800">

<?php include 'navbar.php'; ?>

<!-- Hero / Arama -->
<section class="bg-yellow-400 text-white py-12 text-center">
  <h1 class="text-4xl font-bold mb-4">Hizmet Ara</h1>
  <p class="mb-6">Size uygun alt kategorideki hizmetleri inceleyin</p>
  <div class="flex justify-center mt-6">
    <input 
      type="text" 
      id="aramaInput"
      placeholder="Örn: Boya badana, temizlik..." 
      class="w-1/2 px-4 py-2 rounded text-gray-800 focus:outline-none" 
    >
  </div>
</section>

<!-- Sonuçlar -->
<section class="max-w-7xl mx-auto px-4 py-10">
  <div id="sonuclar" class="grid grid-cols-2 md:grid-cols-4 gap-6">
    <!-- Sonuçlar buraya yüklenecek -->
  </div>
</section>

</body>
</html>
