<?php
$result = "";
$error = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $url = $_POST['url'] ?? '';
    $alias = $_POST['alias'] ?? '';
    $passcode = $_POST['passcode'] ?? '';

    $apiToken = "845ad6039e4754d9ab8f5d84933424c6e36795bc";

    $postData = [
        "url" => $url
    ];

    if (!empty($alias)) {
        $postData["Alias"] = $alias;
    }

    if (!empty($passcode)) {
        $postData["Passcode"] = $passcode;
    }

    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, "https://safelinku.com/api/v1/links");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);

    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Authorization: Bearer " . $apiToken,
        "Content-Type: application/json"
    ]);

    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));

    $response = curl_exec($ch);

    if(curl_errno($ch)){
        $error = curl_error($ch);
    } else {
        $data = json_decode($response, true);

        if(isset($data['shortenedUrl'])){
            $result = $data['shortenedUrl'];
        } else {
            $error = $response;
        }
    }

    curl_close($ch);
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Safelink Generator</title>

<style>
body{
    font-family: Arial, sans-serif;
    background:#0f172a;
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
    margin:0;
}

.container{
    width:400px;
    background:#1e293b;
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 20px rgba(0,0,0,0.4);
}

h2{
    text-align:center;
    margin-bottom:20px;
}

input{
    width:100%;
    padding:12px;
    margin-bottom:15px;
    border:none;
    border-radius:8px;
    background:#334155;
    color:white;
    font-size:15px;
}

button{
    width:100%;
    padding:12px;
    background:#3b82f6;
    border:none;
    border-radius:8px;
    color:white;
    font-size:16px;
    cursor:pointer;
}

button:hover{
    background:#2563eb;
}

.result{
    margin-top:20px;
    background:#0f172a;
    padding:15px;
    border-radius:10px;
    word-break:break-all;
}

.copy-btn{
    margin-top:10px;
    background:#10b981;
}

.error{
    background:#dc2626;
    padding:10px;
    border-radius:8px;
    margin-top:15px;
}
</style>

</head>
<body>

<div class="container">

<h2>Safelink Generator</h2>

<form method="POST">

<input type="url" name="url" placeholder="Masukkan URL..." required>

<input type="text" name="alias" placeholder="Custom Alias (optional)">

<input type="text" name="passcode" placeholder="Passcode (optional)">

<button type="submit">Generate Link</button>

</form>

<?php if($result): ?>

<div class="result">

<b>Safelink:</b><br><br>

<input type="text" value="<?php echo $result; ?>" id="copyText" readonly>

<button class="copy-btn" onclick="copyLink()">Copy Link</button>

</div>

<?php endif; ?>

<?php if($error): ?>

<div class="error">
<?php echo $error; ?>
</div>

<?php endif; ?>

</div>

<script>
function copyLink() {
    var copyText = document.getElementById("copyText");
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    navigator.clipboard.writeText(copyText.value);

    alert("Link berhasil dicopy!");
}
</script>

</body>
</html>