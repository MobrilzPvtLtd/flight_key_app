import 'package:get/get.dart';

class PaymentInfoController extends GetxController {
  /// PRODUCT
  final price = 24.99.obs;

  /// FORM FIELDS
  final cardHolderName = ''.obs;
  final cardNumber = ''.obs;
  final cvv = ''.obs;
  final address = ''.obs;
  final city = ''.obs;
  final state = ''.obs;
  final zipCode = ''.obs;
  final phone = ''.obs;

  /// DROPDOWNS
  final cardType = ''.obs;
  final month = ''.obs;
  final year = ''.obs;
  final country = ''.obs;

  /// OPTIONS
  final saveCard = true.obs;

  /// ACTION
  void payNow() {
    // TODO: integrate payment gateway
    print('Processing payment of \$${price.value}');
  }
}
