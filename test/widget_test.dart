import 'package:flutter/cupertino.dart';
import 'package:flutter_learn/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Calculator View Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Container), findsWidgets);

    expect(find.byIcon(CupertinoIcons.add), findsWidgets);
  });
}
