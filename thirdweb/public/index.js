require('dotenv').config();

   // Sekarang Anda bisa memanggil data di atas menggunakan process.env
   const port = process.env.PORT || 3001;
   const secretKey = process.env.THIRDWEB_SECRET_KEY;
   const rpcUrl = process.env.BUILDBEAR_RPC_URL;

   console.log(`Server running on port ${port}`);
   console.log(`Connected to RPC: ${rpcUrl}`);
