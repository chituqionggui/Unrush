// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Study Calm';

  @override
  String get calmTitle => 'Take a calm moment';

  @override
  String get homeTitle => 'Home';

  @override
  String get homeQuickTense => 'I feel tense now';

  @override
  String get homeQuickLow => 'I feel low';

  @override
  String get homeQuickFocus => 'I need to focus';

  @override
  String get breathTitle => 'Breath';

  @override
  String get breathPatternSquare => 'Square';

  @override
  String get breathPattern478 => '4-7-8';

  @override
  String get breathDuration1 => '1 min';

  @override
  String get breathDuration3 => '3 min';

  @override
  String get breathDuration5 => '5 min';

  @override
  String get breathStart => 'Start';

  @override
  String get breathStop => 'Stop';

  @override
  String get breathPhaseInhale => 'Inhale';

  @override
  String get breathPhaseHold => 'Hold';

  @override
  String get breathPhaseExhale => 'Exhale';

  @override
  String get breathReady => 'Ready';
}
