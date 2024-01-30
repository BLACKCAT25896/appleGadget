
import 'package:flutter_boilerplate/common/model/language_model.dart';
import 'package:flutter_boilerplate/util/images.dart';

class AppConstants {
  static const String appName = 'Apple Gadget';
  static const String baseUrl = 'https://peanut.ifxdb.com';
  static const String loginUri = '/api/ClientCabinetBasic/IsAccountCredentialsCorrect';
  static const String logout = '/api/user/logout';
  static const String profileInfo = '/api/ClientCabinetBasic/GetAccountInformation';
  static const String getOpenTrad = '/api/ClientCabinetBasic/GetOpenTrades';
  static const String fcmTokenUpdate = '/api/driver/info';







  // Shared Key
  static const String theme = 'theme';
  static const String token = 'token';
  static const String deviceToken = 'deviceToken';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cartList = 'cart_list';
  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String searchAddress = 'search_address';
  static const String localization = 'X-Localization';
  static const String topic = 'notify';
  static const String zoneId = 'zoneId';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.unitedKingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: Images.saudi, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];

  static const int limitOfPickedIdentityImageNumber = 2;
  static const double limitOfPickedImageSizeInMB = 2;
  static const double completionArea = 500;


}
