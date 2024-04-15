import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/app_bar_widget.dart';
import 'package:flutter_boilerplate/common/widget/custom_button.dart';
import 'package:flutter_boilerplate/common/widget/custom_snackbar.dart';
import 'package:flutter_boilerplate/common/widget/custom_textfield.dart';
import 'package:flutter_boilerplate/common/widget/have_or_not_widgets.dart';
import 'package:flutter_boilerplate/feature/login/login_controller.dart';
import 'package:flutter_boilerplate/helper/route_helper.dart';
import 'package:flutter_boilerplate/util/app_constants.dart';
import 'package:flutter_boilerplate/util/custom_style.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  GlobalKey<FormState>? _formKeyLogin;

  @override
  void initState() {
    super.initState();

    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController!.text = (Get.find<AuthController>().getUserNumber());
    _passwordController!.text = (Get.find<AuthController>().getUserPassword());
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
  }


  void loginUser() async {
    if (_formKeyLogin!.currentState!.validate()) {
      _formKeyLogin!.currentState!.save();
      String email = _emailController!.text.trim();
      String password = _passwordController!.text.trim();
      Get.find<AuthController>().saveUserNumberAndPassword(email, password);



      if(email.isEmpty){
        showCustomSnackBar("User name required");
      }else if (password.isEmpty){
        showCustomSnackBar("Password Required");
      }else{
        await Get.find<AuthController>().login(email, password);
      }

    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(children: [
        Expanded(child: Center(
          child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomText.textF24W700PrimaryColor('hello welcome jason'),
              const SizedBox(height: 5),
              CustomText.textF14W400TextColor("welcome_message".tr),
              const SizedBox(height: 30),
              CustomText.textF16W600TextColor("email".tr),
              const SizedBox(height: 10),
              const CustomTextField(
                hintText: "enter_email",prefixIcon: Images.email,),
              const SizedBox(height: 20),
              CustomText.textF16W600TextColor(("password".tr)),
              const SizedBox(height: 10),
               CustomTextField(hintText: ("enter_password".tr),
                prefixIcon: Images.password,isPassword: true),
              const SizedBox(height: 20),
              Row(children: [
                SizedBox(width: 20, height: 20,
                    child: Checkbox(side: const BorderSide(color: Colors.pink),
                      value: true,
                      onChanged: (bool? value) {

                      },
                    )),
                const SizedBox(width: 10),
                 Expanded(flex: 2, child:  Text.rich(TextSpan(text: ("remember_password".tr))))
              ],
              )
            ],
            ),
          ),
        ),
        ),
        const SizedBox(height: 20),
        Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.03, vertical: screenHeight(context) * 0.03),
          child: Column(children: [
            CustomButton(buttonText: ("sign_in".tr), onPressed: () => Get.toNamed(RouteHelper.getDashboardRoute())),
            const SizedBox(height: 20),
            HaveOrNotWidget(text: ("don't_have_account".tr),
                btnText: ("sign_up".tr),
                onTap: () {

                })
          ],
          ),
        )
      ]),
    );


  }

}