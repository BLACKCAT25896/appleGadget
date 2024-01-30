import 'package:flutter_boilerplate/common/widget/custom_snackbar.dart';
import 'package:flutter_boilerplate/data/api_checker.dart';
import 'package:flutter_boilerplate/feature/home/model/profine_model.dart';
import 'package:flutter_boilerplate/feature/home/view/home_screen_view.dart';
import 'package:flutter_boilerplate/feature/login/login_repository.dart';
import 'package:flutter_boilerplate/feature/login/login_screen.dart';
import 'package:get/get.dart';


class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool _isActiveRememberMe = false;
  bool otpVerifying = false;
  bool get isLoading => _isLoading;
  bool get isActiveRememberMe => _isActiveRememberMe;


  Future<void> login( String username, String password) async {
    _isLoading = true;
    update();
    Response? response = await authRepo.login(phone: username, password: password);
    if(response!.statusCode == 200){
      _isLoading = false;
      setUserToken(response.body['token']);
      Get.offAll(()=> const HomeScreenView());
      // await Get.find<ProfileController>().getProfileInfo();
    }else{
      _isLoading = false;
      ApiChecker.checkApi(response);
    }

    update();

  }

  ProfileModel? profileModel;
  Future<void> getProfileInfo() async {
    _isLoading = true;
    update();
    Response? response = await authRepo.getProfileInfo(phone: getUserNumber(), token: getUserToken());
    if(response!.statusCode == 200){
      _isLoading = false;
      profileModel = ProfileModel.fromJson(response.body);
    }else{
      _isLoading = false;
      ApiChecker.checkApi(response);
    }

    update();

  }

  Future<void> getOpenTrades() async {
    _isLoading = true;
    update();
    Response? response = await authRepo.getOpenTrades(phone: getUserNumber(), token: getUserToken());
    if(response!.statusCode == 200){

    }else{
      _isLoading = false;
      ApiChecker.checkApi(response);
    }

    update();

  }

  Future<void> logOut() async {
    Response? response = await authRepo.logOut();
    if(response!.statusCode == 200){
      Get.back();
      showCustomSnackBar('successfully_logout'.tr, isError: false);
      clearSharedData();
    }else{
      ApiChecker.checkApi(response);
    }
    update();

  }


  Future<void> updateToken() async {
    await authRepo.updateToken();
  }



  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

  void setRememberMe() {
    _isActiveRememberMe = true;
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future <bool> clearSharedData() async {
    Get.offAll(()=> const LoginScreen());
    return authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  String getUserNumber() {
    return authRepo.getUserNumber();
  }

  String getUserPassword() {
    return authRepo.getUserPassword();
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  Future <void> setUserToken(String token) async{
    authRepo.saveUserToken(token);
  }

}