import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:project_akademi/screens/profile_view.dart';

import '../admob.dart';
import '../constant.dart';
import '../notedefteri.dart';
import 'eisenhower_view.dart';
import 'method_desc_page.dart';
import 'timer_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String routeName = 'home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late BannerAd myBanner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.buildInterstitialAd();
    myBanner = Admob.buildBanner();
    myBanner.load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: FractionalOffset.bottomCenter,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kBackgroundColor,
        title: const Text('Focus on Time'),
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildWriteNote(context, () => (){
                    Admob.interstitialAd.show();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Note()),
                    );
                  }, "assets/images/1.png", "Notlar"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildWriteNote(context, () => (){
                    Admob.interstitialAd.show();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MetotTanitimi()),
                    );
                  }, "assets/images/6.png", "Zaman Yönetimi Metodlarının Kullanımı"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildWriteNote(context, () => (){
                    Admob.interstitialAd.show();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerPage()),
                    );
                  }, "assets/images/2.png", "Pomodoro Sayacı"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildWriteNote(context, () => (){
                    Admob.interstitialAd.show();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EisenhowerView()),
                    );
                  }, "assets/images/3.png", "Eisenhower Matrisi"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildWriteNote(context, () => (){}, "assets/images/5.png", "Time Blocking \nMetodu"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildWriteNote(context, () => (){}, "assets/images/4.png", "Kanban Metodu"),
                ),
                const SizedBox(
                  height: 30,
                ),
                adContainer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

GestureDetector buildWriteNote(BuildContext context, Function OnTap, String path, String cardName) {
  return GestureDetector(
    onTap: OnTap(),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: kBackgroundColor,
      child: Row(
        children: [
          Expanded(child: Image.asset(path)),
          const RotatedBox(
            quarterTurns: 2,
            child: Divider(
              thickness: 3,
              height: 20,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Text(
            cardName,
            style: kTextStyle,
            textAlign: TextAlign.center,
          )),
        ],
      ),
    ),
  );
}
