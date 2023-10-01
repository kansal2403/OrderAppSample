import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Helpers/Constants/Theme.dart';
import 'Providers/ThemeSettingsProvider.dart';
import 'Screens/Home/HomeScreen.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(
      BuildContext context,
      ) {
    ref.read(themeNotifierProvider.notifier).currentTheme();
    var theme = ref.watch(themeNotifierProvider);
    ThemeData selectedTheme = theme == Brightness.dark ? Dark : Light;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: selectedTheme,
      darkTheme: selectedTheme,
      navigatorKey: globalNavigatorKey,
      themeMode: ThemeMode.system,
      initialRoute: "/",
      routes: <String, WidgetBuilder> {
        '/': (_) => const HomeScreen(),
      },
    );
  }
}
