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

  @override
  String get homeQuickCheckin => '快速签到';

  @override
  String get checkinTitle => '快速签到';

  @override
  String get checkinIntensity => '强度（0-10）';

  @override
  String get checkinMood => '主情绪';

  @override
  String get checkinContext => '情景标签';

  @override
  String get checkinNote => '一句话（可选）';

  @override
  String get checkinNoteHint => '写一句话（可选）';

  @override
  String get checkinSubmit => '提交';

  @override
  String get checkinSuggestNext => '已记录，接下来做点什么？';

  @override
  String get checkinBackHome => '返回首页';

  @override
  String get checkinMoodCalm => '平静';

  @override
  String get checkinMoodTense => '紧张';

  @override
  String get checkinMoodLow => '低落';

  @override
  String get checkinMoodNeutral => '一般';

  @override
  String get checkinTagStudy => '学习';

  @override
  String get checkinTagExam => '考试';

  @override
  String get checkinTagSleep => '睡眠';

  @override
  String get checkinTagSocial => '社交';

  @override
  String get checkinTagFamily => '家庭';
}
