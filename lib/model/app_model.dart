part of 'model.dart';

class AppModel with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool? _isSignIn;
  LoginAuth? auth;

  AppModel() {
    _isSignIn = false;
  }

  bool get isSignIn => _isSignIn!;

  set isSignIn(bool isSignIn) {
    _isSignIn = isSignIn;
    notifyListeners();
  }

  Future<void> saveToShared(User user) async {}

  Future<void> getLogin() async {
    isSignIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      isSignIn = false;
      notifyListeners();
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(credential);
      final LocalStorage storage = LocalStorage("starwars");
      final ready = await storage.ready;
      final result = LoginAuth(
          credential, user.displayName, user.photoUrl, user.email, user.id);
      if (ready) {
        await storage.setItem("auth", result);
      }
      isSignIn = false;
    }
  }

  Future<void> getAuth() async {
    final LocalStorage storage = LocalStorage("starwars");
    try {
      final ready = await storage.ready;

      if (ready) {
        LoginAuth json = storage.getItem("auth");
        print(json.toJson());
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> logout() async {
    final LocalStorage storage = LocalStorage("starwars");
    final ready = await storage.ready;
    if (ready) {
      await storage.deleteItem("auth");
      await storage.deleteItem("ip");
      auth = null;
      notifyListeners();
    }
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

class LoginAuth {
  OAuthCredential? accessToken;
  String? id;
  String? nama;
  String? foto;
  String? email;

  LoginAuth(this.accessToken, this.nama, this.foto, this.email, this.id);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'foto': foto,
        'email': email,
      };
}
