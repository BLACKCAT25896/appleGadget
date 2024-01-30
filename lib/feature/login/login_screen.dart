import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/custom_button.dart';
import 'package:flutter_boilerplate/common/widget/custom_snackbar.dart';
import 'package:flutter_boilerplate/common/widget/custom_textfield.dart';
import 'package:flutter_boilerplate/feature/login/login_controller.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:flutter_boilerplate/util/styles.dart';
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

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

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
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Form(
          key: _formKeyLogin,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset(Images.logo),
            ),
             Text("Login", style: textMedium.copyWith(fontSize: 30),),
            const SizedBox(height: 30),
            CustomTextField(

                hintText: "Enter User Name",
                labelText: "User Name",
                focusNode: _emailNode,
                nextFocus: _passNode,
                isRequiredFill: true,
                prefixIcon: Images.person,
                inputType: TextInputType.emailAddress,
                controller: _emailController,
                showLabelText: true,
                required: true,),
            const SizedBox(height: Dimensions.paddingSizeDefault,),


            CustomTextField(
                showLabelText: true,
                required: true,
                labelText: "Password",
                hintText: "Enter your password",
                inputAction: TextInputAction.done,
                isPassword: true,
                prefixIcon: Images.lock,
                focusNode: _passNode,
                controller: _passwordController,
                ),

            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
            Container(margin: const EdgeInsets.only(bottom: 20, top: 30),
              child: Get.find<AuthController>().isLoading ?
              Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor,),),) :
              Hero(tag: "onTap",
                  child: CustomButton(onPressed: loginUser, buttonText: "Login")),),
            const SizedBox(width: Dimensions.paddingSizeDefault),


          ],
          ),
        ),
      ),
    );


  }

}