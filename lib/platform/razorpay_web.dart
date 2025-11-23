// Web implementation of Razorpay integration using Checkout JS.
// This file is only used on web via conditional exports in
// `razorpay_interface.dart`.
// Analyzer notes:
// - This file intentionally uses web-only libraries and older js interop
//   APIs to interoperate with Razorpay Checkout JS at runtime. They are
//   safe here because this file is only compiled for web via conditional
//   exports.
// - Keep the `EVENT_*` constant names to match the mobile plugin API.
// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use, constant_identifier_names

import 'dart:async';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:js_util' as js_util;

class Razorpay {
  // Event constants matching the mobile plugin API so existing code
  // that references `Razorpay.EVENT_PAYMENT_SUCCESS` etc. works on web.
  static const String EVENT_PAYMENT_SUCCESS = 'payment.success';
  static const String EVENT_PAYMENT_ERROR = 'payment.failed';
  static const String EVENT_EXTERNAL_WALLET = 'external_wallet';

  Razorpay();
  Object? _rzp;
  final Map<String, Function> _handlers = {};
  bool _scriptLoaded = false;

  Future<void> _ensureScript() async {
    if (_scriptLoaded) return;
    final completer = Completer<void>();
    final script = html.ScriptElement()
      ..src = 'https://checkout.razorpay.com/v1/checkout.js'
      ..type = 'text/javascript'
      ..async = true;
    script.onError.listen((_) => completer.completeError(Exception('Failed to load Razorpay script')));
    script.onLoad.listen((_) {
      _scriptLoaded = true;
      completer.complete();
    });
    html.document.head!.append(script);
    return completer.future;
  }

  // Register an event handler. Supported event keys: 'payment.success',
  // 'payment.error' (or 'payment.failed'), 'payment.external_wallet' etc.
  void on(String event, Function handler) {
    _handlers[event] = handler;
  }

  Future<void> open(Map options) async {
    await _ensureScript();
    final jsOptions = js_util.jsify(options);
    final constructor = js_util.getProperty(js_util.globalThis, 'Razorpay');
    _rzp = js_util.callConstructor(constructor, [jsOptions]);
    if (_rzp == null) return;
    final rzp = _rzp!;

    // Attach registered handlers to the JS Razorpay instance.
    _handlers.forEach((event, handler) {
      String jsEvent;
      if (event == 'payment.error' || event == 'payment.failed') {
        jsEvent = 'payment.failed';
      } else if (event == 'payment.success') {
        jsEvent = 'payment.success';
      } else if (event.contains('external')) {
        jsEvent = 'external_wallet';
      } else {
        jsEvent = event;
      }

      try {
        js_util.callMethod(rzp, 'on', [jsEvent, js.allowInterop((jsRes) {
          _invokeHandler(event, jsRes);
        })]);
      } catch (_) {
        // ignore if attaching fails
      }
    });

    try {
      js_util.callMethod(rzp, 'open', []);
    } catch (e) {
      // ignore open errors in web integration
    }
  }

  void _invokeHandler(String event, Object? jsRes) {
    final handler = _handlers[event];
    if (handler == null) return;

    if (event == 'payment.success') {
      final pid = js_util.getProperty(jsRes!, 'razorpay_payment_id');
      handler(PaymentSuccessResponse(paymentId: pid?.toString()));
    } else if (event == 'payment.error' || event == 'payment.failed') {
      final codeVal = js_util.getProperty(jsRes!, 'code');
      final code = codeVal is int ? codeVal : int.tryParse(codeVal?.toString() ?? '') ?? 0;
      final message = js_util.getProperty(jsRes, 'description') ?? js_util.getProperty(jsRes, 'message');
      handler(PaymentFailureResponse(code: code, message: message?.toString()));
    } else if (event.contains('external')) {
      final name = js_util.getProperty(jsRes!, 'wallet') ?? js_util.getProperty(jsRes, 'external_wallet');
      handler(ExternalWalletResponse(walletName: name?.toString()));
    } else {
      handler(jsRes);
    }
  }

  void clear() {
    _handlers.clear();
    _rzp = null;
  }
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
