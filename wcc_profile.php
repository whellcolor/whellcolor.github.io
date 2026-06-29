<?php
$wcc_config = [
    "app_name" => "Whellcolor Cube Crypto (WCC)",
    "url" => "https://whellcolor.github.io/",
    "adsense" => [
        "domain" => "google.com",
        "pub_id" => "pub-7182145371991939",
        "type" => "DIRECT",
        "cert_id" => "f08c47fec0942fa0"
    ],
    "owner" => "Muhammad Nur Firdaus"
];

// Menampilkan baris ads.txt secara langsung
echo $wcc_config['adsense']['domain'] . ", " . 
     $wcc_config['adsense']['pub_id'] . ", " . 
     $wcc_config['adsense']['type'] . ", " . 
     $wcc_config['adsense']['cert_id'];
?>
