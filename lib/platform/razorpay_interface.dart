// Conditional export: use real plugin on IO platforms, web implementation on web,
// and a lightweight stub as the default fallback.
export 'razorpay_stub.dart'
    if (dart.library.io) 'razorpay_mobile.dart'
    if (dart.library.html) 'razorpay_web.dart';
