import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //Sign in
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
       // Merge to avoid overwriting existing data
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to sign in: $e.code - ${e.message}');
    }
  }

  //Sign up
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Save user data to Firestore
      _firestore.collection('Users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to register: $e.code - ${e.message}');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
