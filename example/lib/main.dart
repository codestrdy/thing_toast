import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thing_toast/thing_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: 'Thing Toast App',
        theme: CupertinoThemeData(primaryColor: Colors.indigo),
        home: const HomePage(),
      );
    }

    return MaterialApp(
      title: 'Thing Toast App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox.expand(
            child: Column(
              spacing: 12,
              children: [
                FilledButton(
                  onPressed: () {
                    ThingToast(context).success(
                      title: 'This is Success Toast',
                      subtitle: 'This is the description',
                    );
                  },
                  child: Text('Show Success Toast'),
                ),
                FilledButton(
                  onPressed: () {
                    ThingToast(context).info(
                      title: 'This is Information Toast',
                      subtitle: 'This is the description',
                    );
                  },
                  child: Text('Show Info Toast'),
                ),
                FilledButton(
                  onPressed: () {
                    ThingToast(context).warning(
                      title: 'This is Warning Toast',
                      subtitle: 'This is the description',
                    );
                  },
                  child: Text('Show Warning Toast'),
                ),
                FilledButton(
                  onPressed: () {
                    ThingToast(context).error(
                      title: 'This is Error Toast',
                      subtitle: 'This is the description',
                    );
                  },
                  child: Text('Show Error Toast'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
