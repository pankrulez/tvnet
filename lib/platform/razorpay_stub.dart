// Web-friendly stub for Razorpay plugin. No-op implementations to allow
// compiling for web. Runtime payment flows will not function with this stub.

class Razorpay {
  Razorpay();

  // Event names compatible with razorpay_flutter plugin
  // ignore: constant_identifier_names
  static const String EVENT_PAYMENT_SUCCESS = 'payment.success';
  // ignore: constant_identifier_names
  static const String EVENT_PAYMENT_ERROR = 'payment.error';
  // ignore: constant_identifier_names
  static const String EVENT_EXTERNAL_WALLET = 'payment.external_wallet';

  // Register an event handler. The real plugin provides typed callbacks,
  // but here we accept a dynamic handler and ignore it.
  void on(String event, Function handler) {
    // no-op on web
  }

  // Open the payment UI - no-op on web
  void open(Map<String, dynamic> options) {
    // no-op
  }

  // Clear handlers - no-op
  void clear() {}
}

class PaymentSuccessResponse {
  final String? paymentId;
  PaymentSuccessResponse({this.paymentId});
}

class PaymentFailureResponse {
  final int code;
  final String? message;
  PaymentFailureResponse({required this.code, this.message});
}

class ExternalWalletResponse {
  final String? walletName;
  ExternalWalletResponse({this.walletName});
}
