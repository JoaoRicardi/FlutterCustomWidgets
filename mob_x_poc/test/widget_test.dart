import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mob_x_poc/src/app.dart';
import 'package:mob_x_poc/src/pages/todo_list_page.dart';

void main() {

  testWidgets('adding value to counter', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // testa a primeira pagina do app( home page)

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    expect(find.byType(FlatButton), findsOneWidget);

    await tester.tap(find.byType(FlatButton));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

  });

  testWidgets('add itens to todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoList());

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'teste');
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    expect(find.text('teste'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);

  });

}
