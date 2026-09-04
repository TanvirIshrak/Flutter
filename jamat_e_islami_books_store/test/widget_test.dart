// Smoke test for the BDApps login landing screen.
import 'package:flutter_test/flutter_test.dart';

import 'package:jamat_e_islami_books_store/main.dart';

void main() {
  testWidgets('App boots into login screen when no session is persisted',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false));
    await tester.pumpAndSettle();

    // The login screen shows the "Continue" CTA on first frame.
    expect(find.text('Continue'), findsWidgets);
  });
}
