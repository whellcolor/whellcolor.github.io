const TronWeb = require('tronweb');

// Ganti dengan private key wallet pengirim
const privateKey = 'PRIVATE_KEY_ANDA';

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: privateKey
});

async function sendTRX() {
  try {
    const toAddress = 'TBh1vo5wazVxz5FCqmkVZSDAG2RgXJRPbo';

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
