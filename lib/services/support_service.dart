import 'package:cloud_firestore/cloud_firestore.dart';

class SupportService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Submit a support query
  Future<void> submitQuery(String userId, String query) async {
    try {
      await _firestore.collection('support').add({
        'userId': userId,
        'query': query,
        'submittedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to submit support query: $e');
    }
  }
}
