import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:c_s_c305_capstone/flutter_flow/flutter_flow_drop_down.dart';
import 'package:c_s_c305_capstone/flutter_flow/flutter_flow_icon_button.dart';
import 'package:c_s_c305_capstone/flutter_flow/flutter_flow_widgets.dart';
import 'package:c_s_c305_capstone/flutter_flow/flutter_flow_theme.dart';
import 'package:c_s_c305_capstone/index.dart';
import 'package:c_s_c305_capstone/main.dart';
import 'package:c_s_c305_capstone/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:c_s_c305_capstone/backend/firebase/firebase_config.dart';
import 'package:c_s_c305_capstone/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Backend Management', () {
    testWidgets('US3-Test1-Firebase-SDK-Connection',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test_user_001@example.com', password: 'TestPass123!');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(find.text('test_user_001@example.com'), findsOneWidget);
    });

    testWidgets('US3-Test2-View-Users-Collection', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test_user_001@example.com', password: 'TestPass123!');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 2000));
      expect(find.text('test_user_001@example.com'), findsOneWidget);
      expect(find.text('Test User'), findsOneWidget);
    });

    testWidgets('US3-Test3-View-Recipes-Collection',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'test_user_001@example.com', password: 'TestPass123!');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.text('Search'));
      await tester.enterText(find.text('Search'), 'Italian');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 2000));
      expect(find.text('Pasta Carbonara'), findsOneWidget);
      expect(find.text('Italian'), findsOneWidget);
      expect(find.text('Spaghetti'), findsOneWidget);
    });
  });

  testWidgets('US2-Login-AutomatedTest', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(find.text('you@example.com'), 'sophia@example.com');
    await tester.enterText(find.text('••••••••'), 'Password123');
    await tester.tap(find.text('Log In'));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Start Cooking'), findsOneWidget);
  });

  testWidgets('US5-ProfileSetup', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('usernameField_3sn4')));
    await tester.enterText(
        find.byKey(const ValueKey('usernameField_3sn4')), 'myName');
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.tap(find.byKey(const ValueKey('Button_qoed')));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.tap(find.byKey(const ValueKey('Button_yfvy')));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    await tester.tap(find.byKey(const ValueKey('Button_puqh')));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    expect(find.byKey(const ValueKey('Text_znvv')), findsWidgets);
  });

  testWidgets('US1PasswordMismatch', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('SignUpemail_kaqw')), 'hello@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('SignUpConfirmemail_uqdt')), 'hello@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('SignUpPassword_h7ic')), 'password123');
    await tester.enterText(
        find.byKey(const ValueKey('SignUpConfirmPassword_mrlq')), 'passwrod12');
    await tester.tap(find.byKey(const ValueKey('Button_e9qg')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Errror: Passwords dont match'), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
