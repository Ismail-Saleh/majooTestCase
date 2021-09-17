part of '../page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextStyles(
                value: "Login Screen",
                size: 18,
                weight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                  onPressed: () {
                    
                  },
                  style: flatButtonStyle,
                  child: TextStyles(
                    value: "Login With Google",
                  )),
            )
          ],
        ),
      ),
    );
  }
}
