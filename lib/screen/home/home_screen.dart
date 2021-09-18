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
              Provider.of<AppModel>(context).getAuth();
              if (value.isSignIn) {
                return Center(
                  child: Container(child: spinDancing),
                );
              } else if (snapshot.hasData) {
                return HomeWidget(
                  user: snapshot,
                );
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
  HomeWidget({
    Key? key,
    required this.user,
  }) : super(key: key);
  AsyncSnapshot<User?> user;
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    Provider.of<HomeProvider>(context, listen: false).getData();
  }

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    user: widget.user,
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 5, right: 5),
              child: Column(
                children: [Icon(Icons.settings)],
              ),
            ),
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          int a;
          return Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(Icons.add),
                            ),
                            TextStyles(value: "Tambah")
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Material(
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        onTap: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .filterBy();
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: value.isFilter
                              ? Icon(Icons.list_sharp)
                              : Icon(Icons.grid_view_outlined),
                        ),
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: value.countGrid,
                        childAspectRatio: value.widthRasio / value.heighRasio,
                        crossAxisSpacing: 15),
                    itemCount: value.listPeople.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      var result = value.listPeople.results[index];
                      return Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.08))
                                ]),
                            child: Column(
                              crossAxisAlignment: value.isFilter == false
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 8,
                                      top: value.isFilter == false ? 0 : 25),
                                  child: TextStyles(
                                    value: result.name,
                                    size: 16,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 27,
                            right: 10,
                            child: Icon(Icons.favorite_border),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
