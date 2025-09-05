import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'features/practice/calm_start.dart';
import 'features/home/home_page.dart';
import 'features/practice/breath_page.dart';
import 'features/practice/toolkit_placeholder.dart';
import 'features/mood/quick_checkin.dart';
import 'features/practice/toolkit_placeholder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(routes: [
      GoRoute(path: '/', builder: (ctx, st) => const CalmStartPage()),
      GoRoute(path: '/home', builder: (ctx, st) => const HomePage()),
      GoRoute(path: '/checkin/quick', builder: (ctx, st) => const QuickCheckinPage()),
      GoRoute(
        path: '/toolkit/:type',
        builder: (ctx, st) {
          final type = st.pathParameters['type'] ?? 'unknown';
          switch (type) {
            case 'breath':
            case 'tense':
            case 'low':
            case 'focus':
              return const BreathPage();
            default:
              return ToolkitPlaceholder(type: type);
          }
        },
      ),
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.appTitle,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('zh'), Locale('en')],
      locale: const Locale('zh'),
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
    );
  }
}

