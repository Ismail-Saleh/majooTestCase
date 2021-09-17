part of 'page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  removeScreen() {
    return _timer = Timer(Duration(seconds: 2), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    removeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextStyles(
                value: "Welcome",
                size: 26,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
