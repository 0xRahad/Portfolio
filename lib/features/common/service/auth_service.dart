import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.value = _auth.currentUser;
    _auth.authStateChanges().listen((User? user) {
      firebaseUser.value = user;
    });
  }

  bool get isLoggedIn => firebaseUser.value != null;

  void signOut() async {
    await _auth.signOut();
  }
}
