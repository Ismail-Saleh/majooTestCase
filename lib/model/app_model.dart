part of 'model.dart';

class AppModel with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool? _isSignIn;

  AppModel() {
    _isSignIn = false;
  }

  bool get isSignIn => _isSignIn!;

  set isSignIn(bool isSignIn) {
    _isSignIn = isSignIn;
    notifyListeners();
  }

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
      isSignIn = false;
    }
  }

  Future<void> logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
