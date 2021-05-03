# conditional_parent_widget
 Conditionally wrap a subtree with a parent widget without breaking the code tree.

 * `condition`: the condition depending on which the subtree `child` is wrapped with the parent.
 * `child`: The subtree that should always be build.
 * `parentBuilder`: builds the parent with the subtree `child` iff `condition` is true.

 ___________
 Usage:
 ```dart
 return ConditionalParentWidget(
   condition: shouldIncludeParent,
   child: Widget1(
     child: Widget2(
       child: Widget3(),
     ),
   ),
   parentBuilder: (Widget child) => SomeParentWidget(child: child),
);
 ```

 ___________
 Instead of:
 ```dart
 Widget child = Widget1(
   child: Widget2(
     child: Widget3(),
   ),
 );
///
 return shouldIncludeParent ? SomeParentWidget(child: child) : child;
 ```

## Import
```yaml
dependencies:
  flutter:
    sdk: flutter

  conditional_parent_widget:
    git:
      url: git@github.com:ltOgt/ConditionalParentWidget.git
      ref: master
```
