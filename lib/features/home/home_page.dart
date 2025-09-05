import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_calm/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.homeTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.appTitle),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/checkin/quick'),
              child: Text(l10n.homeQuickCheckin),
            ),
          ],
        ),
      ),
    );
  }
}

