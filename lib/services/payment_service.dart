import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save payment details
  Future<void> savePaymentDetails(
      String userId, String provider, String cardNumber) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'paymentDetails': {
          'provider': provider,
          'cardNumber': cardNumber,
        },
      });
    } catch (e) {
      throw Exception('Failed to save payment details: $e');
    }
  }
}
