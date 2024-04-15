import 'package:bikrify/common/model/language_model.dart';
import 'package:bikrify/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages() {
    return AppConstants.languages;
  }
}
