import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VaccineService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getHealthRecords(String petId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('pets')
        .doc(petId)
        .collection('healthRecords')
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => {...doc.data() as Map<String, dynamic>, 'id': doc.id})
        .toList();
  }

  Future<void> addHealthRecord(
      String petId, Map<String, dynamic> newRecord) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('pets')
        .doc(petId)
        .collection('healthRecords')
        .add(newRecord);
  }

  Future<void> updateHealthRecord(
      String petId, String recordId, Map<String, dynamic> updatedRecord) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('pets')
        .doc(petId)
        .collection('healthRecords')
        .doc(recordId)
        .update(updatedRecord);
  }
}
