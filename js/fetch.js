async function getABI() {

  const url =
   "https://api.etherscan.io/api" +
   "?module=contract" +
   "&action=getabi" +
   "&address=0x85e23b94e7F5E9cC1fF78BCe78cfb15B81f0DF00" +
   "&apikey=8WRIDBMW18HXAB44ATGX7IPYGSHXVXDVC3";

  const response = await fetch(url);
  const data = await response.json();

  console.log(JSON.parse(data.result));
}

getABI();
