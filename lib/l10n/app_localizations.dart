import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In zh, this message translates to:
  /// **'Study Calm'**
  String get appTitle;

  /// No description provided for @calmTitle.
  ///
  /// In zh, this message translates to:
  /// **'先和自己待一会儿'**
  String get calmTitle;

  /// No description provided for @homeTitle.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get homeTitle;

  /// No description provided for @homeQuickTense.
  ///
  /// In zh, this message translates to:
  /// **'我现在紧张'**
  String get homeQuickTense;

  /// No description provided for @homeQuickLow.
  ///
  /// In zh, this message translates to:
  /// **'我有点低落'**
  String get homeQuickLow;

  /// No description provided for @homeQuickFocus.
  ///
  /// In zh, this message translates to:
  /// **'我需要专注'**
  String get homeQuickFocus;

  /// No description provided for @breathTitle.
  ///
  /// In zh, this message translates to:
  /// **'呼吸'**
  String get breathTitle;

  /// No description provided for @breathPatternSquare.
  ///
  /// In zh, this message translates to:
  /// **'方块呼吸'**
  String get breathPatternSquare;

  /// No description provided for @breathPattern478.
  ///
  /// In zh, this message translates to:
  /// **'4-7-8'**
  String get breathPattern478;

  /// No description provided for @breathDuration1.
  ///
  /// In zh, this message translates to:
  /// **'1 分钟'**
  String get breathDuration1;

  /// No description provided for @breathDuration3.
  ///
  /// In zh, this message translates to:
  /// **'3 分钟'**
  String get breathDuration3;

  /// No description provided for @breathDuration5.
  ///
  /// In zh, this message translates to:
  /// **'5 分钟'**
  String get breathDuration5;

  /// No description provided for @breathStart.
  ///
  /// In zh, this message translates to:
  /// **'开始'**
  String get breathStart;

  /// No description provided for @breathStop.
  ///
  /// In zh, this message translates to:
  /// **'停止'**
  String get breathStop;

  /// No description provided for @breathPhaseInhale.
  ///
  /// In zh, this message translates to:
  /// **'吸气'**
  String get breathPhaseInhale;

  /// No description provided for @breathPhaseHold.
  ///
  /// In zh, this message translates to:
  /// **'停留'**
  String get breathPhaseHold;

  /// No description provided for @breathPhaseExhale.
  ///
  /// In zh, this message translates to:
  /// **'呼气'**
  String get breathPhaseExhale;

  /// No description provided for @breathReady.
  ///
  /// In zh, this message translates to:
  /// **'准备'**
  String get breathReady;

  /// No description provided for @homeQuickCheckin.
  ///
  /// In zh, this message translates to:
  /// **'快速签到'**
  String get homeQuickCheckin;

  /// No description provided for @checkinTitle.
  ///
  /// In zh, this message translates to:
  /// **'快速签到'**
  String get checkinTitle;

  /// No description provided for @checkinIntensity.
  ///
  /// In zh, this message translates to:
  /// **'强度（0-10）'**
  String get checkinIntensity;

  /// No description provided for @checkinMood.
  ///
  /// In zh, this message translates to:
  /// **'主情绪'**
  String get checkinMood;

  /// No description provided for @checkinContext.
  ///
  /// In zh, this message translates to:
  /// **'情景标签'**
  String get checkinContext;

  /// No description provided for @checkinNote.
  ///
  /// In zh, this message translates to:
  /// **'一句话（可选）'**
  String get checkinNote;

  /// No description provided for @checkinNoteHint.
  ///
  /// In zh, this message translates to:
  /// **'写一句话（可选）'**
  String get checkinNoteHint;

  /// No description provided for @checkinSubmit.
  ///
  /// In zh, this message translates to:
  /// **'提交'**
  String get checkinSubmit;

  /// No description provided for @checkinSuggestNext.
  ///
  /// In zh, this message translates to:
  /// **'已记录，接下来做点什么？'**
  String get checkinSuggestNext;

  /// No description provided for @checkinBackHome.
  ///
  /// In zh, this message translates to:
  /// **'返回首页'**
  String get checkinBackHome;

  /// No description provided for @checkinMoodCalm.
  ///
  /// In zh, this message translates to:
  /// **'平静'**
  String get checkinMoodCalm;

  /// No description provided for @checkinMoodTense.
  ///
  /// In zh, this message translates to:
  /// **'紧张'**
  String get checkinMoodTense;

  /// No description provided for @checkinMoodLow.
  ///
  /// In zh, this message translates to:
  /// **'低落'**
  String get checkinMoodLow;

  /// No description provided for @checkinMoodNeutral.
  ///
  /// In zh, this message translates to:
  /// **'一般'**
  String get checkinMoodNeutral;

  /// No description provided for @checkinTagStudy.
  ///
  /// In zh, this message translates to:
  /// **'学习'**
  String get checkinTagStudy;

  /// No description provided for @checkinTagExam.
  ///
  /// In zh, this message translates to:
  /// **'考试'**
  String get checkinTagExam;

  /// No description provided for @checkinTagSleep.
  ///
  /// In zh, this message translates to:
  /// **'睡眠'**
  String get checkinTagSleep;

  /// No description provided for @checkinTagSocial.
  ///
  /// In zh, this message translates to:
  /// **'社交'**
  String get checkinTagSocial;

  /// No description provided for @checkinTagFamily.
  ///
  /// In zh, this message translates to:
  /// **'家庭'**
  String get checkinTagFamily;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
