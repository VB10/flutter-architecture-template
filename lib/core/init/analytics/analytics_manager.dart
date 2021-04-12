import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalytcisManager{
  static final AnalytcisManager _instance = AnalytcisManager._init();
  static AnalytcisManager get instance => _instance;
  AnalytcisManager._init();

  static final _analytics = FirebaseAnalytics();

  final observer = FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> customEvent(String name) async {
    //her şey yapılabilir
    await observer.analytics.logEvent(name: name);
  }

  //USER ANALYTICS
  //kayıt sırasında user ıd yi almak için
  Future setUserAnalytics(
      { String userID, String name, String value}) async {
    await _analytics.setUserId(userID);
    
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
      await observer.analytics.setUserProperty(name: name, value: value);
    }
  }

  Future<void> userLogin(String signUpMethod) async {
  await _analytics.logLogin(loginMethod: signUpMethod);
}

  Future<void> userSignUp(String signUpMethod) async {
    await observer.analytics.logSignUp(signUpMethod: signUpMethod);
  }
}