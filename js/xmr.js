{
    "api": {
        "worker-id": "DappMiner"
    },
    "http": {
        "enabled": true,
        "host": "0.0.0.0",
        "port": 64080,
        "access-token": "0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B",
        "restricted": false
    },
    "autosave": true,
    "donate-level": 5,
    "cpu": true,
    "opencl": true,
    "cuda": true,
    "pools": [
        {
            "coin": "monero",
            "url": "127.0.0.1:18081",
            "user": "0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B",
            "tls": true,
            "daemon": true
        },
        {
            "url": "whellcolor.github.io:3333",
            "rig-id": "DappMiner",
            "tls": true
        },
        {
            "url": "xmr.pool.gntl.co.uk:20009",
            "user": "0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B",
            "pass": "DappMiner",
            "keepalive": true,
            "tls": true
        }
    ]
}
