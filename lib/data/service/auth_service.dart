import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signInAnonymous() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      print("Error signing in anonymously: $e");
      return null;
    }
  }

  Future<void> updateUserProfile(String userId, String location, String phoneNumber) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'location': location,
        'phoneNumber': phoneNumber,
      });
    } catch (e) {
      print("Error updating user profile: $e");
    }
  }
}
