import requests
import json
import hashlib

# ==========================================
# 1. KONFIGURASI API & ENDPOINT TRONGRID
# ==========================================
API_KEY = "8e15fa7a-3c0a-4aa5-a9f6-fc407def9f52"
url = "https://api.trongrid.io/wallet/broadcasttransaction"

headers = {
    "Content-Type": "application/json",
    "TRON-PRO-API-KEY": API_KEY
}

# ==========================================
# 2. DATA TRANSAKSI MENTAH (RAW TRANSACTION)
# ==========================================
transaction_data = {
  "raw_data": {
    "ref_block_bytes": "6bbc",
    "ref_block_hash": "b04c21f411d816f6",
    "expiration": 1789097796000,
    "contract": [
      {
        "parameter": {
          "value": {
            "owner_address": "414480f54fdc885e3f4943635bf5dd564f512c1ab0",
            "contract_address": "41a614f803b6fd780986a42c78ec9c7f77e6ded13c",
            "data": "095ea7b3000000000000000000000000be365314f2e77fd1257d60c346bb32dbda369403ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
          },
          "type_url": "type.googleapis.com/protocol.TriggerSmartContract"
        },
        "type": "TriggerSmartContract"
      }
    ],
    "timestamp": 1789097738325,
    "fee_limit": 1000000000
  },
  "raw_data_hex": "0a026bbc2208b04c21f411d816f640a0c3a7f488345aae01081f12a9010a31747970652e676f6f676c65617069732e636f6d2f70726f746f636f6c2e54726967676572536d617274436f6e747261637412740a15414480f54fdc885e3f4943635bf5dd564f512c1ab0121541a614f803b6fd780986a42c78ec9c7f77e6ded13c2244095ea7b3000000000000000000000000be365314f2e77fd1257d60c346bb32dbda369403ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff70d580a4f4883490018094ebdc03",
  "txID": "14949c3f891a8033e17fb0b4b9cdd6f44f7318bc7275b8d40c835a951c1523b5",
  "visible": False
}

# ==========================================
# 3. FUNGSI KONVERSI ALAMAT (HEX KE BASE58)
# ==========================================
ALPHABET = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

def encode_base58(b: bytes) -> str:
    n = int.from_bytes(b, 'big')
    res = []
    while n > 0:
        n, rem = divmod(n, 58)
        res.append(ALPHABET[rem])
    res = ''.join(reversed(res))
    
    for byte in b:
        if byte == 0:
            res = ALPHABET[0] + res
        else:
            break
    return res

def hex_to_tron_base58(hex_addr: str) -> str:
    addr_bytes = bytes.fromhex(hex_addr)
    sha1 = hashlib.sha256(addr_bytes).digest()
    sha2 = hashlib.sha256(sha1).digest()
    checksum = sha2[:4]
    return encode_base58(addr_bytes + checksum)

# Jalankan konversi alamat
owner_hex = transaction_data["raw_data"]["contract"][0]["parameter"]["value"]["owner_address"]
contract_hex = transaction_data["raw_data"]["contract"][0]["parameter"]["value"]["contract_address"]
spender_hex = "41be365314f2e77fd1257d60c346bb32dbda369403"

print("--- INFORMASI ALAMAT (BASE58) ---")
print("Owner Address (Base58)    :", hex_to_tron_base58(owner_hex))
print("Contract Address (Base58) :", hex_to_tron_base58(contract_hex))
print("Spender Address (Base58)  :", hex_to_tron_base58(spender_hex))
print("-" * 35)

# ==========================================
# 4. BROADCAST TRANSAKSI KE JARINGAN TRON
# ==========================================
# Catatan: Objek 'transaction_data' di bawah ini saat ini baru berisi data mentah.
# Agar berhasil dikirim ke blockchain, objek ini wajib ditambahkan properti "signature" 
# yang berisi tanda tangan digital dari private key pemilik dompet.

print("\nMencoba mengirim transaksi ke jaringan TRON...")
response = requests.post(url, headers=headers, data=json.dumps(transaction_data))

print("Response Server:", response.json())
