
import 'package:flutter_boilerplate/feature/home/domain/repo/home_repo.dart';
import 'package:flutter_boilerplate/feature/home/domain/repo/home_repo_interface.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService {
  HomeRepo homeRepo;
  HomeController(this.homeRepo);


  Future<void> addProduct()async {

  }


}

