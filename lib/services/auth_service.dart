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
    } on FirebaseAuthException catch (e) {
      print("Sign Up Error: ${e.message}");
      rethrow;
    } catch (e) {
      print("Unexpected Error: $e");
      rethrow;
    }
  }

  // Login
  Future<void> login(String userEmail, String userPassword) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } on FirebaseAuthException catch (e) {
      print("Login Error: ${e.message}");
      rethrow;
    } catch (e) {
      print("Unexpected Error: $e");
      rethrow;
    }
  }

  // Forget Password
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print("Reset Password Error: ${e.message}");
      rethrow;
    } catch (e) {
      print("Unexpected Error: $e");
      rethrow;
    }
  }

  // Logout
  Future<void> logOut() async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      print("Logout Error: ${e.message}");
      rethrow;
    } catch (e) {
      print("Unexpected Error: $e");
      rethrow;
    }
  }
}