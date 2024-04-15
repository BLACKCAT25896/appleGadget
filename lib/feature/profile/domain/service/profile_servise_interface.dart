import 'package:bikrify/interface/service_interface.dart';
import 'package:get/get.dart';

abstract class ProfileServiceInterface extends ServiceInterface{
  Future<Response> getBanner();
}