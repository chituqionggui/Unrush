// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Study Calm';

  @override
  String get calmTitle => '先和自己待一会儿';

  @override
  String get homeTitle => '首页';

  @override
  String get homeQuickTense => '我现在紧张';

  @override
  String get homeQuickLow => '我有点低落';

  @override
  String get homeQuickFocus => '我需要专注';

  @override
  String get breathTitle => '呼吸';

  @override
  String get breathPatternSquare => '方块呼吸';

  @override
  String get breathPattern478 => '4-7-8';

  @override
  String get breathDuration1 => '1 分钟';

  @override
  String get breathDuration3 => '3 分钟';

  @override
  String get breathDuration5 => '5 分钟';

  @override
  String get breathStart => '开始';

  @override
  String get breathStop => '停止';

  @override
  String get breathPhaseInhale => '吸气';

  @override
  String get breathPhaseHold => '停留';

  @override
  String get breathPhaseExhale => '呼气';

  @override
  String get breathReady => '准备';
}
