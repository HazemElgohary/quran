// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'ar.dart';
import 'en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': arKeys,
        'en': enKeys,
      };
}
