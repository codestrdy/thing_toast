A package for showing fancy gradient toast in Flutter applications.

## Features

Show 4 Type of Toast : Success, Info, Warning and Error.

## Getting started

Add to your dependencies:

```yaml
dependencies:
  thing_toast: ^0.1.0
```

Then import:

```dart
import 'package:thing_toast/thing_toast.dart';
```

## Usage

To Show Success Toast:

```dart
ThingToast(context).success(
  title: 'This is Toast',
  subtitle: 'This is the description',
);
```
To Show Info Toast:

```dart
ThingToast(context).info(
  title: 'This is Toast',
  subtitle: 'This is the description',
);
```
To Show Warning Toast:

```dart
ThingToast(context).warning(
  title: 'This is Toast',
  subtitle: 'This is the description',
);
```
To Show Error Toast:

```dart
ThingToast(context).error(
  title: 'This is Toast',
  subtitle: 'This is the description',
);
```

## Additional information

Report any bugs if any via github.
