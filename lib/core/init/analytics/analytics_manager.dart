import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';

class AnalytcisManager {
  static final AnalytcisManager _instance = AnalytcisManager._init();
  static AnalytcisManager get instance => _instance;
  AnalytcisManager._init() {
    init();
  }

  static final _analytics = FirebaseAnalytics.instance;

  final List<NavigatorObserver> observer =
      ApplicationConstants.TEST_MODE ? [] : [FirebaseAnalyticsObserver(analytics: _analytics)];

  // Firebase e her zaman veri göndermek istemeyebiliriz.
  // Örneğin inapppurchase yapacağımızda ApplicationConstants.TEST_MODE false olursa
  // gerçekten ödeme yapılmış gibi ücret bilgisi yansır.
  // Bu istenmeyen bir durumdur, gerçek verileri manipüle eder..
  Future<void> init() async {
    await _analytics.setAnalyticsCollectionEnabled(ApplicationConstants.TEST_MODE ? false : true);
  }

  Future<void> customEvent(String name) async {
    //her şey yapılabilir
    await _analytics.logEvent(name: name);
  }

  //USER ANALYTICS
  //kayıt sırasında user ıd yi almak için
  Future setUserAnalytics({String? userID, String? name, String? value}) async {
    await _analytics.setUserId(id: userID);

//kullanıcılara rol vermek için kullanılabilir (ADMİN-KULLANICI-PREMIUMS VS VS)
//bunu yapacaksak öncelikle
//firebase consola git
//custom definision tıkla
//sap üstte create custom dimensions bas
//user property ye bu parametrdeki name ile aynı ismi ver
//scope den user ı seç
//dimension name ya raporda gözükecek olan başlığı yaz
//descriptiona ufak bi açıklamasını yaz
    if (name != null && value != null) {
      await _analytics.setUserProperty(name: name, value: value);
    }
  }

  Future<void> userLogin(String signUpMethod) async {
    await _analytics.logLogin(loginMethod: signUpMethod);
  }

  Future<void> userSignUp(String signUpMethod) async {
    await _analytics.logSignUp(signUpMethod: signUpMethod);
  }
}
