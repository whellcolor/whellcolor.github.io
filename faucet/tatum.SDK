import { TatumSDK, Network, BinanceSmartChain } from '@tatumio/tatum'

const tatum = await TatumSDK.init<BinanceSmartChain>({network: Network.BINANCE_SMART_CHAIN})

const data = await tatum.notification.subscribe.addressEvent({
  url: 'https://your-webhook-url.com',
  address: '0x5E8Bade6E0BCe65807dB6327cB1D9EEb7C6A6A5B'
})

