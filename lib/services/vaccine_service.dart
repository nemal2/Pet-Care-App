import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new health record
  Future<void> addHealthRecord(
      String userId, String petId, Map<String, dynamic> record) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('pets')
          .doc(petId)
          .collection('healthRecords')
          .add(record);
    } catch (e) {
      throw Exception('Failed to add health record: $e');
    }
  }

  // Fetch health records for a pet
  Stream<QuerySnapshot> getHealthRecords(String userId, String petId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('pets')
        .doc(petId)
        .collection('healthRecords')
        .snapshots();
  }
}
