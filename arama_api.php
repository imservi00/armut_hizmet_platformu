<?php
$baglanti = new mysqli("localhost", "root", "", "armutdata");
$baglanti->set_charset("utf8");

$q = isset($_GET['q']) ? trim($_GET['q']) : '';

if ($q !== '') {
    $stmt = $baglanti->prepare("SELECT * FROM altkategoriler WHERE AltKategoriAdi LIKE CONCAT('%', ?, '%') ORDER BY AltKategoriAdi ASC");
    $stmt->bind_param("s", $q);
    $stmt->execute();
    $sonuc = $stmt->get_result();
} else {
    $sonuc = $baglanti->query("SELECT * FROM altkategoriler ORDER BY AltKategoriAdi ASC");
}

if ($sonuc->num_rows > 0) {
    while($alt = $sonuc->fetch_assoc()) {
        echo '<a href="altkategori.php?id=' . $alt['AltKategoriID'] . '" class="block bg-white rounded-lg shadow hover:shadow-lg transition overflow-hidden">';
        if (!empty($alt['ResimYolu'])) {
            echo '<img src="' . htmlspecialchars($alt['ResimYolu']) . '" alt="' . htmlspecialchars($alt['AltKategoriAdi']) . '" class="w-full h-40 object-cover">';
        }
        echo '<div class="p-4 text-center">';
        echo '<h3 class="text-lg font-semibold text-yellow-600">' . htmlspecialchars($alt['AltKategoriAdi']) . '</h3>';
        echo '</div></a>';
    }
} else {
    echo '<p class="text-center text-gray-500 col-span-4">Sonuç bulunamadı.</p>';
}
?>
