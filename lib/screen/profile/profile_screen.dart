part of '../page.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.user}) : super(key: key);
  AsyncSnapshot<User?> user;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 190,
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Center(
                          child: TextStyles(
                            value: widget.user.data!.displayName![0],
                            color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ),
                      TextStyles(
                        value: widget.user.data!.displayName,
                        color: Colors.white,
                        size: 19,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 15,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<AppModel>(context, listen: false)
                          .logout()
                          .then((value) {
                        Navigator.pop(context);
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                        TextStyles(
                          value: "Logout",
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
