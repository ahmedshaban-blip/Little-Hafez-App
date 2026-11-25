import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'حافظ الصغير'**
  String get appTitle;

  /// No description provided for @childHeaderNameAge.
  ///
  /// In ar, this message translates to:
  /// **'Zayd (7 yrs)'**
  String get childHeaderNameAge;

  /// No description provided for @streakDaysShort.
  ///
  /// In ar, this message translates to:
  /// **'5d'**
  String get streakDaysShort;

  /// No description provided for @starsCount240.
  ///
  /// In ar, this message translates to:
  /// **'240'**
  String get starsCount240;

  /// No description provided for @gateButtonLabel.
  ///
  /// In ar, this message translates to:
  /// **'Gate'**
  String get gateButtonLabel;

  /// No description provided for @navJourney.
  ///
  /// In ar, this message translates to:
  /// **'Journey'**
  String get navJourney;

  /// No description provided for @navRecite.
  ///
  /// In ar, this message translates to:
  /// **'Recite'**
  String get navRecite;

  /// No description provided for @navGames.
  ///
  /// In ar, this message translates to:
  /// **'Games'**
  String get navGames;

  /// No description provided for @navReview.
  ///
  /// In ar, this message translates to:
  /// **'Review'**
  String get navReview;

  /// No description provided for @navParent.
  ///
  /// In ar, this message translates to:
  /// **'Parent'**
  String get navParent;

  /// No description provided for @onboardingTitle.
  ///
  /// In ar, this message translates to:
  /// **'أهلاً بك في حافظ الصغير'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'رحلة إيمانية ممتعة ومحببة لحفظ كتاب الله خطوة بخطوة'**
  String get onboardingSubtitle;

  /// No description provided for @onboardingStep1Title.
  ///
  /// In ar, this message translates to:
  /// **'ملف البطل الصغير'**
  String get onboardingStep1Title;

  /// No description provided for @onboardingStep1Badge.
  ///
  /// In ar, this message translates to:
  /// **'الخطوة ١'**
  String get onboardingStep1Badge;

  /// No description provided for @onboardingChildNameLabel.
  ///
  /// In ar, this message translates to:
  /// **'اسم البطل'**
  String get onboardingChildNameLabel;

  /// No description provided for @onboardingChildNameHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب اسم طفلك هنا...'**
  String get onboardingChildNameHint;

  /// No description provided for @onboardingDefaultChildName.
  ///
  /// In ar, this message translates to:
  /// **'زيد'**
  String get onboardingDefaultChildName;

  /// No description provided for @onboardingAgeLabel.
  ///
  /// In ar, this message translates to:
  /// **'العمر (بالسنوات)'**
  String get onboardingAgeLabel;

  /// No description provided for @onboardingMascotLabel.
  ///
  /// In ar, this message translates to:
  /// **'اختر رفيق التعلّم'**
  String get onboardingMascotLabel;

  /// No description provided for @mascotZayd.
  ///
  /// In ar, this message translates to:
  /// **'زيد'**
  String get mascotZayd;

  /// No description provided for @mascotMariam.
  ///
  /// In ar, this message translates to:
  /// **'مريم'**
  String get mascotMariam;

  /// No description provided for @mascotAdam.
  ///
  /// In ar, this message translates to:
  /// **'آدم'**
  String get mascotAdam;

  /// No description provided for @mascotNoor.
  ///
  /// In ar, this message translates to:
  /// **'نور'**
  String get mascotNoor;

  /// No description provided for @onboardingStep2Title.
  ///
  /// In ar, this message translates to:
  /// **'رمز قفل الوالدين (PIN)'**
  String get onboardingStep2Title;

  /// No description provided for @onboardingStep2Badge.
  ///
  /// In ar, this message translates to:
  /// **'الخطوة ٢'**
  String get onboardingStep2Badge;

  /// No description provided for @onboardingPinSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'٤ أرقام لحماية إعدادات التطبيق وتقارير المتابعة'**
  String get onboardingPinSubtitle;

  /// No description provided for @onboardingStartCta.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ الرحلة المباركة'**
  String get onboardingStartCta;

  /// No description provided for @stepOneNumber.
  ///
  /// In ar, this message translates to:
  /// **'١'**
  String get stepOneNumber;

  /// No description provided for @stepTwoNumber.
  ///
  /// In ar, this message translates to:
  /// **'٢'**
  String get stepTwoNumber;

  /// No description provided for @journeyOfflineReady.
  ///
  /// In ar, this message translates to:
  /// **'Offline Ready • Juz 30 Audio Cached'**
  String get journeyOfflineReady;

  /// No description provided for @journeyLevelHafiz.
  ///
  /// In ar, this message translates to:
  /// **'Level 4 Hafiz'**
  String get journeyLevelHafiz;

  /// No description provided for @journeyCurrentSurahLabel.
  ///
  /// In ar, this message translates to:
  /// **'CURRENT SURAH'**
  String get journeyCurrentSurahLabel;

  /// No description provided for @journeyCurrentSurahTitle.
  ///
  /// In ar, this message translates to:
  /// **'Al-Fatihah • الفاتحة'**
  String get journeyCurrentSurahTitle;

  /// No description provided for @journeyAyahProgress.
  ///
  /// In ar, this message translates to:
  /// **'7/7 Ayahs'**
  String get journeyAyahProgress;

  /// No description provided for @journeyMastered.
  ///
  /// In ar, this message translates to:
  /// **'Mastered!'**
  String get journeyMastered;

  /// No description provided for @journeyPerfectMemorizer.
  ///
  /// In ar, this message translates to:
  /// **'Perfect Memorizer'**
  String get journeyPerfectMemorizer;

  /// No description provided for @journeyNextSurahLabel.
  ///
  /// In ar, this message translates to:
  /// **'Next: Al-Ikhlas (الإخلاص)'**
  String get journeyNextSurahLabel;

  /// No description provided for @journeyStage5Ar.
  ///
  /// In ar, this message translates to:
  /// **'سورة الكوثر'**
  String get journeyStage5Ar;

  /// No description provided for @journeyStage5En.
  ///
  /// In ar, this message translates to:
  /// **'Milestone Oasis'**
  String get journeyStage5En;

  /// No description provided for @journeyStage4Ar.
  ///
  /// In ar, this message translates to:
  /// **'سورة الناس'**
  String get journeyStage4Ar;

  /// No description provided for @journeyStage4En.
  ///
  /// In ar, this message translates to:
  /// **'An-Nas'**
  String get journeyStage4En;

  /// No description provided for @journeyStage3Ar.
  ///
  /// In ar, this message translates to:
  /// **'سورة الفلق'**
  String get journeyStage3Ar;

  /// No description provided for @journeyStage3En.
  ///
  /// In ar, this message translates to:
  /// **'Al-Falaq • Next Up'**
  String get journeyStage3En;

  /// No description provided for @journeyStage3Req.
  ///
  /// In ar, this message translates to:
  /// **'⭐ Need 3★ in Al-Ikhlas'**
  String get journeyStage3Req;

  /// No description provided for @journeyStage2BubbleTitle.
  ///
  /// In ar, this message translates to:
  /// **'Stage 2: Ready! 🚀'**
  String get journeyStage2BubbleTitle;

  /// No description provided for @journeyStage2BubbleBody.
  ///
  /// In ar, this message translates to:
  /// **'Ayahs 1 & 2 are waiting for you, Zayd!'**
  String get journeyStage2BubbleBody;

  /// No description provided for @journeyMascotNoor.
  ///
  /// In ar, this message translates to:
  /// **'Noor'**
  String get journeyMascotNoor;

  /// No description provided for @journeyAyahRangeChip.
  ///
  /// In ar, this message translates to:
  /// **'Ayah 1 - 2'**
  String get journeyAyahRangeChip;

  /// No description provided for @journeyStage2Ar.
  ///
  /// In ar, this message translates to:
  /// **'سورة الإخلاص'**
  String get journeyStage2Ar;

  /// No description provided for @journeyStage2En.
  ///
  /// In ar, this message translates to:
  /// **'Al-Ikhlas'**
  String get journeyStage2En;

  /// No description provided for @journeyPlayNow.
  ///
  /// In ar, this message translates to:
  /// **'PLAY NOW'**
  String get journeyPlayNow;

  /// No description provided for @journeyDailyMission.
  ///
  /// In ar, this message translates to:
  /// **'Daily Mission'**
  String get journeyDailyMission;

  /// No description provided for @journeyMissionBonus.
  ///
  /// In ar, this message translates to:
  /// **'+25 ⭐'**
  String get journeyMissionBonus;

  /// No description provided for @journeyMissionBody.
  ///
  /// In ar, this message translates to:
  /// **'Recite Al-Ikhlas 3 times to earn a Streak Flame!'**
  String get journeyMissionBody;

  /// No description provided for @journeyMissionFlame.
  ///
  /// In ar, this message translates to:
  /// **'+1'**
  String get journeyMissionFlame;

  /// No description provided for @journeyStartLessonCta.
  ///
  /// In ar, this message translates to:
  /// **'Start Today\'s Lesson'**
  String get journeyStartLessonCta;

  /// No description provided for @reciteSurahNameAr.
  ///
  /// In ar, this message translates to:
  /// **'سورة الإخلاص'**
  String get reciteSurahNameAr;

  /// No description provided for @reciteSurahMeta.
  ///
  /// In ar, this message translates to:
  /// **'Al-Ikhlas • Ayah 1 of 4 • Makkiyah'**
  String get reciteSurahMeta;

  /// No description provided for @reciteJuzBadge.
  ///
  /// In ar, this message translates to:
  /// **'Juz 30'**
  String get reciteJuzBadge;

  /// No description provided for @reciteAyahChip.
  ///
  /// In ar, this message translates to:
  /// **'الآية الأولى • سورة الإخلاص'**
  String get reciteAyahChip;

  /// No description provided for @reciteBasmalah.
  ///
  /// In ar, this message translates to:
  /// **'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ'**
  String get reciteBasmalah;

  /// No description provided for @reciteAyahWord1.
  ///
  /// In ar, this message translates to:
  /// **'قُلْ'**
  String get reciteAyahWord1;

  /// No description provided for @reciteAyahWord2.
  ///
  /// In ar, this message translates to:
  /// **'هُوَ'**
  String get reciteAyahWord2;

  /// No description provided for @reciteAyahWord3.
  ///
  /// In ar, this message translates to:
  /// **'اللَّهُ'**
  String get reciteAyahWord3;

  /// No description provided for @reciteAyahWord4.
  ///
  /// In ar, this message translates to:
  /// **'أَحَدٌ'**
  String get reciteAyahWord4;

  /// No description provided for @reciteAyahEndSymbol.
  ///
  /// In ar, this message translates to:
  /// **'۝١'**
  String get reciteAyahEndSymbol;

  /// No description provided for @reciteListenSheikh.
  ///
  /// In ar, this message translates to:
  /// **'استمع للشيخ المنشاوي'**
  String get reciteListenSheikh;

  /// No description provided for @recitePauseSheikh.
  ///
  /// In ar, this message translates to:
  /// **'إيقاف مؤقت'**
  String get recitePauseSheikh;

  /// No description provided for @reciteTapAndRead.
  ///
  /// In ar, this message translates to:
  /// **'اضغط واقرأ بصوتك 🎙️'**
  String get reciteTapAndRead;

  /// No description provided for @reciteListeningNow.
  ///
  /// In ar, this message translates to:
  /// **'جاري الاستماع لتلاوتك...'**
  String get reciteListeningNow;

  /// No description provided for @reciteFeedbackPraise.
  ///
  /// In ar, this message translates to:
  /// **'ما شاء الله! قراءة ممتازة يا بطل 🌟'**
  String get reciteFeedbackPraise;

  /// No description provided for @reciteListenRecording.
  ///
  /// In ar, this message translates to:
  /// **'استمع لتسجيلك'**
  String get reciteListenRecording;

  /// No description provided for @reciteRetry.
  ///
  /// In ar, this message translates to:
  /// **'أعد المحاولة'**
  String get reciteRetry;

  /// No description provided for @gamesTabMemorization.
  ///
  /// In ar, this message translates to:
  /// **'ألعاب الحفظ'**
  String get gamesTabMemorization;

  /// No description provided for @gamesTabBadges.
  ///
  /// In ar, this message translates to:
  /// **'خزانة الأوسمة'**
  String get gamesTabBadges;

  /// No description provided for @gamesSurahTitle.
  ///
  /// In ar, this message translates to:
  /// **'سورة الإخلاص'**
  String get gamesSurahTitle;

  /// No description provided for @gamesSurahSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'ألعاب الحفظ الممتعة'**
  String get gamesSurahSubtitle;

  /// No description provided for @gamesBonusPoints.
  ///
  /// In ar, this message translates to:
  /// **'+10'**
  String get gamesBonusPoints;

  /// No description provided for @gamesModeOrder.
  ///
  /// In ar, this message translates to:
  /// **'رتّب الآيات'**
  String get gamesModeOrder;

  /// No description provided for @gamesModeNext.
  ///
  /// In ar, this message translates to:
  /// **'الآية التالية'**
  String get gamesModeNext;

  /// No description provided for @gamesModeComplete.
  ///
  /// In ar, this message translates to:
  /// **'أكمل الكلمة'**
  String get gamesModeComplete;

  /// No description provided for @gamesPromptBanner.
  ///
  /// In ar, this message translates to:
  /// **'رائع يا بطل! رتّب آيات سورة الإخلاص بالترتيب الصحيح'**
  String get gamesPromptBanner;

  /// No description provided for @gamesVerifyAnswer.
  ///
  /// In ar, this message translates to:
  /// **'تحقق من الإجابة'**
  String get gamesVerifyAnswer;

  /// No description provided for @gamesAyah1.
  ///
  /// In ar, this message translates to:
  /// **'قُلْ هُوَ اللَّهُ أَحَدٌ'**
  String get gamesAyah1;

  /// No description provided for @gamesAyah2.
  ///
  /// In ar, this message translates to:
  /// **'اللَّهُ الصَّمَدُ'**
  String get gamesAyah2;

  /// No description provided for @gamesAyah3.
  ///
  /// In ar, this message translates to:
  /// **'لَمْ يَلِدْ وَلَمْ يُولَدْ'**
  String get gamesAyah3;

  /// No description provided for @gamesAyah4.
  ///
  /// In ar, this message translates to:
  /// **'وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ'**
  String get gamesAyah4;

  /// No description provided for @badgesTotalStarsLabel.
  ///
  /// In ar, this message translates to:
  /// **'مجموع النجوم المكتسبة'**
  String get badgesTotalStarsLabel;

  /// No description provided for @badgesTotalStarsValue.
  ///
  /// In ar, this message translates to:
  /// **'240'**
  String get badgesTotalStarsValue;

  /// No description provided for @badgesLevelValue.
  ///
  /// In ar, this message translates to:
  /// **'المستوى 3'**
  String get badgesLevelValue;

  /// No description provided for @badgesNextMilestone.
  ///
  /// In ar, this message translates to:
  /// **'متبقي 3 نجوم لفتح وسام القارئ الذهبي 🏆'**
  String get badgesNextMilestone;

  /// No description provided for @badgesProgressPercent.
  ///
  /// In ar, this message translates to:
  /// **'85%'**
  String get badgesProgressPercent;

  /// No description provided for @badgesParentGiftTitle.
  ///
  /// In ar, this message translates to:
  /// **'مفاجأة تنتظرك من والديك! 🎁'**
  String get badgesParentGiftTitle;

  /// No description provided for @badgesParentGiftSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'هدية خاصة وبطاقة تشجيعية عند جمع 5 أوسمة كاملة (حصلت على 2 من 5)'**
  String get badgesParentGiftSubtitle;

  /// No description provided for @badgesSectionTitle.
  ///
  /// In ar, this message translates to:
  /// **'أوسمة الإنجاز والتلاوة'**
  String get badgesSectionTitle;

  /// No description provided for @badgesTotalCount.
  ///
  /// In ar, this message translates to:
  /// **'6 أوسمة'**
  String get badgesTotalCount;

  /// No description provided for @badgeCompletedChip.
  ///
  /// In ar, this message translates to:
  /// **'مكتمل'**
  String get badgeCompletedChip;

  /// No description provided for @badgeInProgressPercent.
  ///
  /// In ar, this message translates to:
  /// **'75%'**
  String get badgeInProgressPercent;

  /// No description provided for @badge1Title.
  ///
  /// In ar, this message translates to:
  /// **'وسام حافظ الفاتحة'**
  String get badge1Title;

  /// No description provided for @badge1Subtitle.
  ///
  /// In ar, this message translates to:
  /// **'أتقن سورة الفاتحة'**
  String get badge1Subtitle;

  /// No description provided for @badge2Title.
  ///
  /// In ar, this message translates to:
  /// **'وسام بلبل التلاوة'**
  String get badge2Title;

  /// No description provided for @badge2Subtitle.
  ///
  /// In ar, this message translates to:
  /// **'تلاوة عذبة بصوت نقي'**
  String get badge2Subtitle;

  /// No description provided for @badge3Title.
  ///
  /// In ar, this message translates to:
  /// **'سورة الإخلاص'**
  String get badge3Title;

  /// No description provided for @badge3Subtitle.
  ///
  /// In ar, this message translates to:
  /// **'قيد الإنجاز (3/4 آيات)'**
  String get badge3Subtitle;

  /// No description provided for @badge4Title.
  ///
  /// In ar, this message translates to:
  /// **'بطل الأسبوع'**
  String get badge4Title;

  /// No description provided for @badge4Subtitle.
  ///
  /// In ar, this message translates to:
  /// **'أكمل 5 أيام متتالية'**
  String get badge4Subtitle;

  /// No description provided for @badge5Title.
  ///
  /// In ar, this message translates to:
  /// **'قارئ الفجر'**
  String get badge5Title;

  /// No description provided for @badge5Subtitle.
  ///
  /// In ar, this message translates to:
  /// **'تلاوة صباحية مباركة'**
  String get badge5Subtitle;

  /// No description provided for @badge6Title.
  ///
  /// In ar, this message translates to:
  /// **'تاج الحافظ الصغير'**
  String get badge6Title;

  /// No description provided for @badge6Subtitle.
  ///
  /// In ar, this message translates to:
  /// **'حفظ جزء عم كاملاً'**
  String get badge6Subtitle;

  /// No description provided for @reviewBannerTitle.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة اليوم الذكية'**
  String get reviewBannerTitle;

  /// No description provided for @reviewBannerSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'هيا يا بطل نراجع ونجمع النجوم!'**
  String get reviewBannerSubtitle;

  /// No description provided for @reviewGardenTitle.
  ///
  /// In ar, this message translates to:
  /// **'حديقة الأسبوع'**
  String get reviewGardenTitle;

  /// No description provided for @reviewGardenProgress.
  ///
  /// In ar, this message translates to:
  /// **'5 / 7 أيام'**
  String get reviewGardenProgress;

  /// No description provided for @daySat.
  ///
  /// In ar, this message translates to:
  /// **'سبت'**
  String get daySat;

  /// No description provided for @daySun.
  ///
  /// In ar, this message translates to:
  /// **'أحد'**
  String get daySun;

  /// No description provided for @dayMon.
  ///
  /// In ar, this message translates to:
  /// **'اثنين'**
  String get dayMon;

  /// No description provided for @dayTue.
  ///
  /// In ar, this message translates to:
  /// **'ثلاثاء'**
  String get dayTue;

  /// No description provided for @dayToday.
  ///
  /// In ar, this message translates to:
  /// **'اليوم'**
  String get dayToday;

  /// No description provided for @dayThu.
  ///
  /// In ar, this message translates to:
  /// **'خميس'**
  String get dayThu;

  /// No description provided for @dayFri.
  ///
  /// In ar, this message translates to:
  /// **'جمعة'**
  String get dayFri;

  /// No description provided for @reviewTodayTitle.
  ///
  /// In ar, this message translates to:
  /// **'سُوَر اليوم للمراجعة'**
  String get reviewTodayTitle;

  /// No description provided for @reviewSurahsReady.
  ///
  /// In ar, this message translates to:
  /// **'سورتان جاهزتان'**
  String get reviewSurahsReady;

  /// No description provided for @reviewFatihahTitle.
  ///
  /// In ar, this message translates to:
  /// **'سورة الفاتحة'**
  String get reviewFatihahTitle;

  /// No description provided for @reviewFatihahSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'7 آيات كاملة ⭐'**
  String get reviewFatihahSubtitle;

  /// No description provided for @reviewNasTitle.
  ///
  /// In ar, this message translates to:
  /// **'سورة الناس'**
  String get reviewNasTitle;

  /// No description provided for @reviewNasSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'سهلة وممتعة ⭐'**
  String get reviewNasSubtitle;

  /// No description provided for @reviewStartCta.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ المراجعة'**
  String get reviewStartCta;

  /// No description provided for @reviewMascotTitle.
  ///
  /// In ar, this message translates to:
  /// **'حَافِظ الصغير يقول لك:'**
  String get reviewMascotTitle;

  /// No description provided for @reviewMascotQuote.
  ///
  /// In ar, this message translates to:
  /// **'“أنت بطل رائع! 5 دقائق كل يوم تبني لك قصراً جميلاً في الجنة!” 🏰⭐'**
  String get reviewMascotQuote;

  /// No description provided for @parentTitle.
  ///
  /// In ar, this message translates to:
  /// **'منطقة ولي الأمر'**
  String get parentTitle;

  /// No description provided for @parentPinLock.
  ///
  /// In ar, this message translates to:
  /// **'قفل PIN'**
  String get parentPinLock;

  /// No description provided for @parentChildNameAge.
  ///
  /// In ar, this message translates to:
  /// **'زيد (٧ سنوات)'**
  String get parentChildNameAge;

  /// No description provided for @parentChildPath.
  ///
  /// In ar, this message translates to:
  /// **'مسار جزء عمّ • سورة الناس'**
  String get parentChildPath;

  /// No description provided for @parentStarsArabic.
  ///
  /// In ar, this message translates to:
  /// **'٢٤٠'**
  String get parentStarsArabic;

  /// No description provided for @parentStatSurahsValue.
  ///
  /// In ar, this message translates to:
  /// **'٣ / ١٢'**
  String get parentStatSurahsValue;

  /// No description provided for @parentStatSurahsLabel.
  ///
  /// In ar, this message translates to:
  /// **'السور المحفوظة'**
  String get parentStatSurahsLabel;

  /// No description provided for @parentStatPracticeValue.
  ///
  /// In ar, this message translates to:
  /// **'١٥ د'**
  String get parentStatPracticeValue;

  /// No description provided for @parentStatPracticeLabel.
  ///
  /// In ar, this message translates to:
  /// **'التدريب'**
  String get parentStatPracticeLabel;

  /// No description provided for @parentStatAccuracyValue.
  ///
  /// In ar, this message translates to:
  /// **'٩٤٪'**
  String get parentStatAccuracyValue;

  /// No description provided for @parentStatAccuracyLabel.
  ///
  /// In ar, this message translates to:
  /// **'الدقة'**
  String get parentStatAccuracyLabel;

  /// No description provided for @parentJuzProgressTitle.
  ///
  /// In ar, this message translates to:
  /// **'تقدم الحفظ (جزء عمّ)'**
  String get parentJuzProgressTitle;

  /// No description provided for @parentJuzProgressBadge.
  ///
  /// In ar, this message translates to:
  /// **'٢٥٪ منجز'**
  String get parentJuzProgressBadge;

  /// No description provided for @parentSurah1Number.
  ///
  /// In ar, this message translates to:
  /// **'١'**
  String get parentSurah1Number;

  /// No description provided for @parentSurah1Title.
  ///
  /// In ar, this message translates to:
  /// **'سورة الفاتحة'**
  String get parentSurah1Title;

  /// No description provided for @parentSurah1Status.
  ///
  /// In ar, this message translates to:
  /// **'مكتملة'**
  String get parentSurah1Status;

  /// No description provided for @parentSurah112Number.
  ///
  /// In ar, this message translates to:
  /// **'١١٢'**
  String get parentSurah112Number;

  /// No description provided for @parentSurah112Title.
  ///
  /// In ar, this message translates to:
  /// **'سورة الإخلاص'**
  String get parentSurah112Title;

  /// No description provided for @parentSurah112Status.
  ///
  /// In ar, this message translates to:
  /// **'قيد التعلم ٨٥٪'**
  String get parentSurah112Status;

  /// No description provided for @parentSurah113Number.
  ///
  /// In ar, this message translates to:
  /// **'١١٣'**
  String get parentSurah113Number;

  /// No description provided for @parentSurah113Title.
  ///
  /// In ar, this message translates to:
  /// **'سورة الفلق'**
  String get parentSurah113Title;

  /// No description provided for @parentSurah113Status.
  ///
  /// In ar, this message translates to:
  /// **'التالية'**
  String get parentSurah113Status;

  /// No description provided for @parentControlsTitle.
  ///
  /// In ar, this message translates to:
  /// **'إعدادات الحماية والتعلم'**
  String get parentControlsTitle;

  /// No description provided for @parentScreenTimeTitle.
  ///
  /// In ar, this message translates to:
  /// **'وقت الشاشة'**
  String get parentScreenTimeTitle;

  /// No description provided for @parentScreenTimeSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'إيقاف بعد ٢٠ دقيقة'**
  String get parentScreenTimeSubtitle;

  /// No description provided for @parentSheikhVoiceTitle.
  ///
  /// In ar, this message translates to:
  /// **'صوت الشيخ المعلم'**
  String get parentSheikhVoiceTitle;

  /// No description provided for @parentSheikhVoiceSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'المنشاوي (ترديد أطفال)'**
  String get parentSheikhVoiceSubtitle;

  /// No description provided for @parentSafeBadge.
  ///
  /// In ar, this message translates to:
  /// **'بيئة إسلامية آمنة 100% • خالية تماماً من الإعلانات'**
  String get parentSafeBadge;

  /// No description provided for @parentGateTitle.
  ///
  /// In ar, this message translates to:
  /// **'بوابة التحقق'**
  String get parentGateTitle;

  /// No description provided for @parentGateSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'للدخول، أجب عن المسألة التالية:'**
  String get parentGateSubtitle;

  /// No description provided for @parentGateQuestion.
  ///
  /// In ar, this message translates to:
  /// **'7 × 4 = ?'**
  String get parentGateQuestion;

  /// No description provided for @parentGateCancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get parentGateCancel;

  /// No description provided for @parentGateWrongAnswer.
  ///
  /// In ar, this message translates to:
  /// **'الإجابة غير صحيحة، حاول مرة أخرى'**
  String get parentGateWrongAnswer;

  /// No description provided for @celebrationTopBadge.
  ///
  /// In ar, this message translates to:
  /// **'وسام الإتقان'**
  String get celebrationTopBadge;

  /// No description provided for @celebrationTitle.
  ///
  /// In ar, this message translates to:
  /// **'مُبَارَكٌ يَا بَطَل!'**
  String get celebrationTitle;

  /// No description provided for @celebrationSubtitle.
  ///
  /// In ar, this message translates to:
  /// **'أتممت حفظ سورة الإخلاص كاملة بنجاح وإتقان فائق!'**
  String get celebrationSubtitle;

  /// No description provided for @celebrationCertHeader.
  ///
  /// In ar, this message translates to:
  /// **'شَهَادَةُ إِنجَازِ الحَافِظِ الصَّغِير'**
  String get celebrationCertHeader;

  /// No description provided for @celebrationDistinguishedBadge.
  ///
  /// In ar, this message translates to:
  /// **'حَافِظٌ مُتَمَيِّز'**
  String get celebrationDistinguishedBadge;

  /// No description provided for @celebrationGrantedTo.
  ///
  /// In ar, this message translates to:
  /// **'تُمنَحُ هَذِهِ الشَّهَادَةُ لِلبَطَلِ الرَّائِع'**
  String get celebrationGrantedTo;

  /// No description provided for @celebrationRecipient.
  ///
  /// In ar, this message translates to:
  /// **'زَيْد (٧ سَنَوَات)'**
  String get celebrationRecipient;

  /// No description provided for @celebrationMetricSurahLabel.
  ///
  /// In ar, this message translates to:
  /// **'السُّورَة'**
  String get celebrationMetricSurahLabel;

  /// No description provided for @celebrationMetricSurahValue.
  ///
  /// In ar, this message translates to:
  /// **'الإخلاص'**
  String get celebrationMetricSurahValue;

  /// No description provided for @celebrationMetricSurahSub.
  ///
  /// In ar, this message translates to:
  /// **'٤ آيَات'**
  String get celebrationMetricSurahSub;

  /// No description provided for @celebrationMetricAccuracyLabel.
  ///
  /// In ar, this message translates to:
  /// **'الدِّقَّة'**
  String get celebrationMetricAccuracyLabel;

  /// No description provided for @celebrationMetricAccuracyValue.
  ///
  /// In ar, this message translates to:
  /// **'٩٨٪'**
  String get celebrationMetricAccuracyValue;

  /// No description provided for @celebrationMetricAccuracySub.
  ///
  /// In ar, this message translates to:
  /// **'تَرْتِيلٌ مُمّتَاز'**
  String get celebrationMetricAccuracySub;

  /// No description provided for @celebrationMetricRewardLabel.
  ///
  /// In ar, this message translates to:
  /// **'المُكَافَأَة'**
  String get celebrationMetricRewardLabel;

  /// No description provided for @celebrationMetricRewardValue.
  ///
  /// In ar, this message translates to:
  /// **'+٥٠'**
  String get celebrationMetricRewardValue;

  /// No description provided for @celebrationMetricRewardSub.
  ///
  /// In ar, this message translates to:
  /// **'نَجْمَة زَرْقَاء'**
  String get celebrationMetricRewardSub;

  /// No description provided for @celebrationQuoteAyah.
  ///
  /// In ar, this message translates to:
  /// **'﴿ قُلْ هُوَ اللَّهُ أَحَدٌ ۝ اللَّهُ الصَّمَدُ ﴾'**
  String get celebrationQuoteAyah;

  /// No description provided for @celebrationFooterFamily.
  ///
  /// In ar, this message translates to:
  /// **'مع فخر واعتزاز أسرة حَافِظ الصَّغِير'**
  String get celebrationFooterFamily;

  /// No description provided for @celebrationHijriYear.
  ///
  /// In ar, this message translates to:
  /// **'١٤٤٦ هـ'**
  String get celebrationHijriYear;

  /// No description provided for @celebrationNextSurahCta.
  ///
  /// In ar, this message translates to:
  /// **'السُّورَةُ التَّالِيَة: سُورَةُ الفَلَق'**
  String get celebrationNextSurahCta;

  /// No description provided for @celebrationListenCta.
  ///
  /// In ar, this message translates to:
  /// **'اِسْتَمِعْ لِتِلَاوَتِكَ المُكْتَمِلَة'**
  String get celebrationListenCta;

  /// No description provided for @celebrationShareCta.
  ///
  /// In ar, this message translates to:
  /// **'مُشَارَكَةُ الشَّهَادَةِ مَعَ العَائِلَة'**
  String get celebrationShareCta;

  /// No description provided for @celebrationShareSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم تجهيز الشهادة للمشاركة مع العائلة!'**
  String get celebrationShareSuccess;

  /// No description provided for @errorRetry.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get errorRetry;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
