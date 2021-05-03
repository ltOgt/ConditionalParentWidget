import 'package:conditional_parent_widget/conditional_parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ConditionalParentWidget wraps child with conditionalBuilder iff condition is true',
      (WidgetTester tester) async {
    const Size childSize = Size(100, 100);
    const Size parentSize = Size(50, 50);
    final GlobalKey childKey = GlobalKey();
    final GlobalKey parentKey = GlobalKey();

    Widget buildWithCondition(bool condition) {
      return MaterialApp(
        home: Material(
          child: Center(
            child: ConditionalParentWidget(
              condition: condition,
              child: Container(
                key: childKey,
                constraints: BoxConstraints.tight(childSize),
              ),
              parentBuilder: (child) => Container(
                key: parentKey,
                constraints: BoxConstraints.tight(parentSize),
                child: child,
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(
      buildWithCondition(true),
    );

    Finder childFinder = find.byKey(childKey);
    expect(childFinder, findsOneWidget);
    expect(tester.getSize(childFinder), equals(parentSize));

    Finder parentFinder = find.byKey(parentKey);
    expect(parentFinder, findsOneWidget);
    expect(tester.getSize(parentFinder), equals(parentSize));

    await tester.pumpWidget(
      buildWithCondition(false),
    );

    childFinder = find.byKey(childKey);
    expect(childFinder, findsOneWidget);
    expect(tester.getSize(childFinder), equals(childSize));

    parentFinder = find.byKey(parentKey);
    expect(parentFinder, findsNothing);
  });
}
