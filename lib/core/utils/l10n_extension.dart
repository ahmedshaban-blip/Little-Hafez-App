import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';

/// Convenience localization accessor on [BuildContext].
extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
