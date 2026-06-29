wcc_config = {
    "app_info": {
        "name": "Whellcolor Cube Crypto (WCC)",
        "url": "https://whellcolor.github.io/"
    },
    "adsense": {
        "domain": "google.com",
        "publisher_id": "pub-7182145371991939",
        "relationship": "DIRECT",
        "cert_id": "f08c47fec0942fa0",
        "formatted_line": "google.com, pub-7182145371991939, DIRECT, f08c47fec0942fa0"
    },
    "owner": {
        "name": "Muhammad Nur Firdaus",
        "phone": "+62895322292084",
        "payment_profile_id": "6655-4811-6219"
    }
}

if __name__ == "__main__":
    print(f"Project: {wcc_config['app_info']['name']}")
    print(f"Ads.txt Setup: {wcc_config['adsense']['formatted_line']}")
