import 'package:conditional_parent_widget/conditional_parent_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConditionalParent', () {
    const String kChild = "c";
    const String kParent = "p";
    const String kParentElse = "pe";

    Widget buildWithValues({required bool cond, required bool withBuildElse}) => Directionality(
          textDirection: TextDirection.ltr,
          child: ConditionalParentWidget(
            condition: cond,
            parentBuilder: (child) => Row(children: [const Text(kParent), child]),
            parentBuilderElse: !withBuildElse ? null : (child) => Row(children: [const Text(kParentElse), child]),
            child: const Text(kChild),
          ),
        );

    testWidgets('condition false => dont wrap with parentBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(buildWithValues(cond: false, withBuildElse: false));
      expect(find.text(kChild), findsOneWidget);
      expect(find.text(kParent), findsNothing);
      expect(find.text(kParentElse), findsNothing);
    });

    testWidgets('condition true => wrap with parentBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(buildWithValues(cond: true, withBuildElse: false));
      expect(find.text(kChild), findsOneWidget);
      expect(find.text(kParent), findsOneWidget);
      expect(find.text(kParentElse), findsNothing);
    });

    testWidgets('condition false + parentBuilderElse => wrap with parentBuilderElse', (WidgetTester tester) async {
      await tester.pumpWidget(buildWithValues(cond: false, withBuildElse: true));
      expect(find.text(kChild), findsOneWidget);
      expect(find.text(kParent), findsNothing);
      expect(find.text(kParentElse), findsOneWidget);
    });

    testWidgets('condition true + parentBuilderElse => wrap with parentBuilder', (WidgetTester tester) async {
      await tester.pumpWidget(buildWithValues(cond: true, withBuildElse: true));
      expect(find.text(kChild), findsOneWidget);
      expect(find.text(kParent), findsOneWidget);
      expect(find.text(kParentElse), findsNothing);
    });
  });
}
