const express = require('express');
const TronWeb = require('tronweb');
const rateLimit = require('express-rate-limit');
const bodyParser = require('body-parser');
const cors = require('cors');


app.use(cors());
app.use(bodyParser.json());
app.use(express.static('public'));



const app = express();

const tronWeb = new TronWeb({
  fullHost: 'https://api.trongrid.io',
  privateKey: 'af0ed7849cdcc9bbfb5a9ec929ba101fe9fc1d40d519814b88f2f9fc431249a2'
});

app.use(express.json());

app.post('/claim', async (req, res) => {

  try {

    const userAddress = req.body.address;

    // user dapat 1 TRX
    await tronWeb.trx.sendTransaction(
      userAddress,
      1_000_000
    );

    // fee developer 0.1 TRX
    await tronWeb.trx.sendTransaction(
      'TVFQySiziK5kSMom1nFCvxTK2rJHsMgpJf',
      100_000
    );

    res.json({
      success: true
    });

  } catch (e) {

    res.status(500).json({
      error: e.message
    });

  }

});

app.listen(3000);
