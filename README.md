`stable but not actively maintained`

# conditional_parent_widget
 Conditionally wrap a subtree with a parent widget without breaking the code tree.

 * `condition`: the condition depending on which the subtree `child` is wrapped with the parent.
 * `child`: The subtree that should always be build.
 * `parentBuilder`: builds the parent with the subtree `child` iff `condition` is true.
 * `parentBuilderElse`: optional builder to wrap `child` iff `condition` is false. (returns just `child` when this is null)

 ___________
 Usage:
 ```dart
 return ConditionalParentWidget(
   condition: shouldIncludeParent,
   parentBuilder: (Widget child) => SomeParentWidget(child: child),
   child: Widget1(
     child: Widget2(
       child: Widget3(),
     ),
   ),
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

