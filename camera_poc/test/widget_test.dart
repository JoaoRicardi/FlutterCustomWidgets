import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera_poc/main.dart';

void main() {

  testWidgets('camera should appear', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Joao'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));

    expect(find.byType(InkWell), findsOneWidget);

    await tester.tap(find.byType(InkWell));


  });
}
