import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapist_buddy/screens/no_internet.dart';
import 'package:therapist_buddy/variables.dart';
import 'auth/firebase_user_provider.dart';

import 'package:therapist_buddy/screens/login_page.dart';
import 'screens/home_page.dart';
import 'screens/treatments_page.dart';
import 'screens/add_treatment_page.dart';
import 'screens/chats_page.dart';
import 'screens/others_page.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("##### Handling a background message: ${message.data}");
}

final Map<String, WidgetBuilder> map = {
  '/login': (BuildContext context) => LoginPageWidget(),
  '/noInternet': (BuildContext context) => NoInterner(),
  '/navBarPage': (BuildContext context) => NavBarPage(),
};

String initialRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var result = await Connectivity().checkConnectivity();
  print('result checkInternet ==> $result');
  if (result == ConnectivityResult.none) {
    // No Internet
    initialRoute = '/noInternet';
    runApp(MyApp());
  } else {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String phone = preferences.getString('phone');
    print('#### phone =====>>>> $phone');
    if (phone == null) {
      initialRoute = '/login';
      runApp(MyApp());
    } else {
      initialRoute = '/navBarPage';
      runApp(MyApp());
    }
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<TherapistBuddyFirebaseUser> userStream;
  TherapistBuddyFirebaseUser initialUser;

  Widget myWidget = LoginPageWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TherapistBuddy',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: map,
      initialRoute: initialRoute,
    );
  }
}

//aaa

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'Home_page';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home_page': HomePageWidget(),
      'Treatments_page': TreatmentsPageWidget(),
      'AddTreatment_page': AddTreatmentPageWidget(),
      'Chats_page': ChatsPageWidget(),
      'Others_page': OthersPageWidget(),
    };
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: bottomNavigationBarHeight,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color(0xFF9E9E9E),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.home_sharp,
                color: Color(0xFF0080FF),
                size: 24,
              ),
              label: '????????????????????????',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_services_outlined,
                color: Color(0xFF9E9E9E),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.medical_services,
                color: Color(0xFF0080FF),
                size: 24,
              ),
              label: '????????????????????????',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_rounded,
                color: Color(0xFF9E9E9E),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.add_circle_rounded,
                color: Color(0xFF0080FF),
                size: 24,
              ),
              label: '???????????????',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
                color: Color(0xFF9E9E9E),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.chat,
                color: Color(0xFF0080FF),
                size: 24,
              ),
              label: '?????????',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dehaze_rounded,
                color: Color(0xFF9E9E9E),
                size: 24,
              ),
              activeIcon: Icon(
                Icons.dehaze_rounded,
                color: Color(0xFF0080FF),
                size: 24,
              ),
              label: '???????????????',
            )
          ],
          backgroundColor: Colors.white,
          currentIndex: tabs.keys.toList().indexOf(_currentPage),
          selectedLabelStyle: TextStyle(fontFamily: 'Kanit'),
          selectedItemColor: Color(0xFF0080FF),
          unselectedLabelStyle: TextStyle(fontFamily: 'Kanit'),
          unselectedItemColor: Color(0xFF7A7A7A),
          onTap: (i) => setState(() => _currentPage = tabs.keys.toList()[i]),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
