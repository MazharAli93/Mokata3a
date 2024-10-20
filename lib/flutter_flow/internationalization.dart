import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'd2xg7x6j': {
      'en': 'Scan Product Barcode To Check if It is In Baycott List',
      'ar': 'قم بمسح الباركود للتأكد من وجود المنتج في قائمة المقاطعة',
    },
    'jy91vnmg': {
      'en': 'Scan Barcode',
      'ar': 'قم بمسح الباركود',
    },
    'fy9tzqgj': {
      'en': 'Cancel',
      'ar': 'إلغاء',
    },
    'vbca1gii': {
      'en': 'Search By Name',
      'ar': 'البحث عن طريق الإسم',
    },
    '6bj9t6jm': {
      'en': 'Check Companies',
      'ar': 'تحقق من الشركات',
    },
    'auxvanje': {
      'en': 'Add Product or Company',
      'ar': 'أضف منتجًا أو شركة إلى القائمة',
    },
    'borw7grf': {
      'en': 'Profile',
      'ar': 'ملفي',
    },
    '1j36xtdv': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'ozblc5lr': {
      'en': 'Support Us',
      'ar': 'ادعمنا',
    },
    'eq4bzv13': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'pgjt21k7': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // ProductList
  {
    'v0e1htof': {
      'en': 'Search By Name',
      'ar': 'اسم المنتج',
    },
    '3c86p21j': {
      'en': 'Press on Product to Check Alternatives',
      'ar': 'انقر على المنتج للتحقق من البدائل',
    },
    'tfot7ohb': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // CompanyList
  {
    '9wbyrwkf': {
      'en': 'Search By Company Name',
      'ar': 'اسم الشركة',
    },
    'vn78to84': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // AddProduct
  {
    'qmh6ld0d': {
      'en': 'Product Name',
      'ar': 'اسم المنتج',
    },
    'tmcvygeo': {
      'en': 'Company Name',
      'ar': 'اسم الشركة المصنعة',
    },
    'kisgpzar': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    't4x4c2sj': {
      'en': 'Category',
      'ar': 'فئة الشركة',
    },
    'tz7nm269': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'tao7a1ad': {
      'en': 'Additional Information',
      'ar': 'معلومات إضافية حول المنتج',
    },
    '27k96rqr': {
      'en': 'Add Product Image',
      'ar': 'إضافة صورة المنتج',
    },
    '5l09ttz3': {
      'en': 'Add Product Barcode',
      'ar': 'إضافة الباركود للمنتج',
    },
    'y81hejdr': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'sqskx2x0': {
      'en': 'Save Product',
      'ar': 'حفظ معلومات المنتج',
    },
    'y1ol3a3m': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'jvztsb8q': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'umftcbv2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'lrflh5p3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hwqnby6f': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6xgmdk72': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7yukmaue': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Splash
  {
    'w4rsca8a': {
      'en': 'Together We Stand For The Children of Palestine',
      'ar': 'معًا نقف من أجل أطفال فلسطين',
    },
    'nhdo9qx4': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // AddCompany
  {
    'qlt0npzk': {
      'en': 'Company Name',
      'ar': 'اسم الشركة',
    },
    'u3lkb7mj': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'arcj1c8q': {
      'en': 'Category',
      'ar': 'فئة الشركة',
    },
    'thav08td': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'degonqfv': {
      'en': 'Additional Information',
      'ar': 'معلومات إضافية',
    },
    'fqy7v88e': {
      'en': 'Add Company Logo',
      'ar': 'إضافة شعار الشركة',
    },
    '3ywe9453': {
      'en': 'Save ',
      'ar': 'حفظ معلومات المنتج',
    },
    'a7x2xscn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'guq0bhs4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8h3zemjt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gd22ig78': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1c6i4qbi': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ewuz1r8j': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'jyopfhnm': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Auth2
  {
    't4a4t6fy': {
      'en': 'Ar',
      'ar': 'Ar',
    },
    'vnjtzlh5': {
      'en': 'Eng',
      'ar': 'Eng',
    },
    'e3e47m4c': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '37e87o6y': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'rkpcz3w7': {
      'en': 'Start By Filling Information Below',
      'ar': 'لنبدأ بملء النموذج أدناه.',
    },
    '5cbnbjoc': {
      'en': 'Email Address',
      'ar': 'بريد الإلكتروني',
    },
    'di83itwc': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'qfvtwlw6': {
      'en': 'Confirm Password',
      'ar': 'بالتأكيد كلمة المرور',
    },
    'upqej7tm': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'w1j45wc4': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '7zed8y0j': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    'jwfpywy2': {
      'en': 'Fill The Information Below To Login Into Your Account',
      'ar': 'قم بملء المعلومات أدناه لتسهيل الوصول إلى حسابك.',
    },
    '8galz2o8': {
      'en': 'Email Address',
      'ar': 'بريد الإلكتروني',
    },
    'qp54wz0g': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'uy23isx4': {
      'en': '',
      'ar': '',
    },
    '7t2891ba': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '7r8h0sw8': {
      'en': 'Forgot Password!! Reset Here !!!',
      'ar': 'هل نسيت كلمة السر! انقر هنا!!',
    },
    'xika6ogd': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Contactus
  {
    '6yciw5zx': {
      'en': 'Full Name',
      'ar': 'الاسم كاملا',
    },
    'ztfy65su': {
      'en': 'Subject',
      'ar': 'موضوع الرسالة',
    },
    'rq33vjes': {
      'en': 'Message',
      'ar': 'الرسالة',
    },
    '364ptbix': {
      'en': 'Send Message',
      'ar': 'أرسل رسالة',
    },
    'swvuc9ao': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gzorqx2x': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'mx6g7gy2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'md0p92mg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't5ay20k1': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'q7h3qm6z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'no0dxw1l': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Profile
  {
    '1rntjl0g': {
      'en': 'Welcome',
      'ar': 'مرحباً',
    },
    'r8n2cojp': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'pvfgj1ue': {
      'en': 'Delete Profile',
      'ar': 'حذف الحساب',
    },
    'k6qn1i8d': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // FrogotPassword
  {
    'j1wcld61': {
      'en': 'Forgot Your Password? Enter Your Email Address to Reset Password',
      'ar': 'هل نسيت كلمة السر! أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور',
    },
    'ch7aejxb': {
      'en': ' Email Address',
      'ar': 'البريد الإلكتروني',
    },
    'i6evsoe3': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'tjmvtcfw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'c4ahzmtv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '4lt399ea': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'kfbuesek': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vokssmab': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hxsvll2a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hu5zwzyk': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // NoBoycott
  {
    '8cpgb8bq': {
      'en': 'Product is Not In Our List',
      'ar': 'المنتج ليس في قائمتنا',
    },
    'pth3qiwj': {
      'en':
          'If you have any other information about this product, please  add it to the list',
      'ar':
          'إذا كان لديك أي معلومات أخرى حول هذا المنتج، فيرجى إضافته إلى القائمة',
    },
  },
  // Boycott
  {
    'fdrt4w49': {
      'en': 'Mokata3a',
      'ar': 'Mokata3a',
    },
  },
  // AddProductSelection
  {
    'i67a6s1r': {
      'en': 'Add Product',
      'ar': 'أضف منتج',
    },
    '5bok5ubj': {
      'en': 'Add Company',
      'ar': 'أضف شركة',
    },
  },
  // Alternatives
  {
    'f2svn9we': {
      'en': 'Product Name:',
      'ar': 'اسم المنتج:',
    },
    'qgjehhuk': {
      'en': 'Alternative Products',
      'ar': 'المنتجات البديلة:',
    },
  },
  // Disclaimer
  {
    'ei4096ae': {
      'en': 'Disclaimer',
      'ar': 'تنصل',
    },
    '6byimzno': {
      'en':
          'This Application is intended to provide information about products and companies potentially Supporting the Israeli Government. The information is submitted anonymously and may not be verified. We do not endorse or condemn any specific companies or products. If a company believes the information is incorrect, we will remove it upon request.',
      'ar':
          'يهدف هذا التطبيق إلى توفير معلومات حول المنتجات والشركات التي يحتمل أن تدعم الحكومة الإسرائيلية. يتم تقديم المعلومات بشكل مجهول ولا يمكن التحقق منها. نحن لا نؤيد أو ندين أي شركات أو منتجات محددة. إذا اعتقدت الشركة أن المعلومات غير صحيحة، فسنقوم بإزالتها عند الطلب.',
    },
  },
  // Miscellaneous
  {
    '4kufc850': {
      'en': '',
      'ar': '',
    },
    'ckszozje': {
      'en': '',
      'ar': '',
    },
    'nupmussl': {
      'en': '',
      'ar': '',
    },
    'txk5v60c': {
      'en': '',
      'ar': '',
    },
    'bbgf7t4l': {
      'en': '',
      'ar': '',
    },
    'yblzgxy8': {
      'en': '',
      'ar': '',
    },
    'inge9whk': {
      'en': '',
      'ar': '',
    },
    'tmpv7lu9': {
      'en': '',
      'ar': '',
    },
    'v846iw51': {
      'en': '',
      'ar': '',
    },
    'syav9kdt': {
      'en': '',
      'ar': '',
    },
    'ed3fahns': {
      'en': '',
      'ar': '',
    },
    '2468beo8': {
      'en': '',
      'ar': '',
    },
    'mvzs7y0a': {
      'en': '',
      'ar': '',
    },
    't1ji796x': {
      'en': '',
      'ar': '',
    },
    '0evv9t0d': {
      'en': '',
      'ar': '',
    },
    'ymq04mfw': {
      'en': '',
      'ar': '',
    },
    'c71wxjsa': {
      'en': '',
      'ar': '',
    },
    'inrixnmn': {
      'en': '',
      'ar': '',
    },
    '69aj27g5': {
      'en': '',
      'ar': '',
    },
    'thnxd8ns': {
      'en': '',
      'ar': '',
    },
    'o00qisk5': {
      'en': '',
      'ar': '',
    },
    '6nm04f8s': {
      'en': '',
      'ar': '',
    },
    'o3q1yjhp': {
      'en': '',
      'ar': '',
    },
    'i4ixflzi': {
      'en': '',
      'ar': '',
    },
    'cp7v5mzh': {
      'en': '',
      'ar': '',
    },
    '3azm3tv5': {
      'en': '',
      'ar': '',
    },
    'wvie33f6': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
