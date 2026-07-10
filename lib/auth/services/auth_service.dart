import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // Sign Up

  Future<void> signUp(String userEmail, String userPassword) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } catch (e) {}
  }

  // Login

  Future<void> login(String userEmail, String userPassword) async {
    await auth.signInWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    );
  }

  // forget Password

  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  // Logout

  Future<void> logOut() async {
    await auth.signOut();
  }
}
