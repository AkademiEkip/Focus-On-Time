import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob {
  static late InterstitialAd interstitialAd;
  static late RewardedAd rewardedAd;
  static late RewardedInterstitialAd rewardedInterstitialAd;

  static String get testAppID => "ca-app-pub-3940256099942544/6300978111";

  static admobInitialize() {
    MobileAds.instance.initialize();
  }

  static BannerAd buildBanner() {
    return BannerAd(
      adUnitId: testAppID,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

  static buildInterstitialAd() {
    return InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
            print('reklam yüklendi');
            //_interstitialAd.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
    //return _interstitialAd;
  }
}
