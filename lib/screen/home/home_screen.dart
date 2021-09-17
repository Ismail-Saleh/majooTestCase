part of '../page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppModel>(
        builder: (context, value, child) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (value.isSignIn) {
                return Center(
                  child: Container(child: spinDancing),
                );
              } else if (snapshot.hasData) {
                return HomeWidget();
              }
              return LoginScreen();
            },
          );
        },
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(top: 15, right: 10),
            child: Column(
              children: [Icon(Icons.favorite)],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 15),
            child: Column(
              children: [Icon(Icons.settings)],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text("Home"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: TextButton(
              onPressed: () {
                Provider.of<AppModel>(context, listen: false).logout();
              },
              style: flatButtonStyle,
              child: TextStyles(
                value: "Logout With Google",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
