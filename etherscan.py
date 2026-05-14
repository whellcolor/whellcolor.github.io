import requests

url = "https://api.etherscan.io/v2/api?apikey=8WRIDBMW18HXAB44ATGX7IPYGSHXVXDVC3&chainid=1&module=account&action=balance&address=0xd8519A8b8825Aa0DcC73aAD572f447FAE102fe88&tag=0x10d4f"

response = requests.get(url)

print(response.text)
