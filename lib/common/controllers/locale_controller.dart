import 'package:get/get.dart';

class LocaleController extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Home': 'Home',
          'Search': 'Search',
          'Community': 'Community',
          'Download': 'Download',
        },
        'hi_IN': {
          'Home': 'होम',
          'Search': 'सर्च',
          'Community': 'कम्युनिटी',
          'Download': 'डाउनलोड',
        },
      };
}
