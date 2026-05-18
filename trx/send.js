const TronWeb = require('tronweb');

// Ganti dengan private key wallet pengirim
const privateKey = 'af0ed7849cdcc9bbfb5a9ec929ba101fe9fc1d40d519814b88f2f9fc431249a2';

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: privateKey
});

async function sendTRX() {
  try {
    const toAddress = 'TVFQySiziK5kSMom1nFCvxTK2rJHsMgpJf';

    // 100 TRX = 100_000_000 SUN
    const amount = 100000000;

    const tx = await tronWeb.trx.sendTransaction(
      toAddress,
      amount
    );

    console.log('Transaksi berhasil:', tx);
  } catch (error) {
    console.error('Error:', error);
  }
}

sendTRX();
