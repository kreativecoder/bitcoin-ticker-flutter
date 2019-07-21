import 'networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NGN',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future<dynamic> getCoinData(String currency) async {
    Map<String, String> prices = {};

    for (String crypto in cryptoList) {
      String url = '$bitcoinAverageURL/$crypto$currency';

      NetworkHelper networkHelper = NetworkHelper(url);
      var decodedData = await networkHelper.getData();
      double lastPrice = decodedData['last'];
      prices[crypto] = lastPrice.toStringAsFixed(2);
    }

    return prices;
  }
}
