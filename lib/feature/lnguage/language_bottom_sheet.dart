import 'package:bikrify/common/controller/localization_controller.dart';
import 'package:bikrify/common/widget/custom_button.dart';
import 'package:bikrify/util/app_constants.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:bikrify/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SelectLanguageBottomSheet extends StatefulWidget {
  const SelectLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectLanguageBottomSheet> createState() => _SelectLanguageBottomSheetState();
}

class _SelectLanguageBottomSheetState extends State<SelectLanguageBottomSheet> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: ( localizationProvider,) {
          return SingleChildScrollView(
            child: Container(padding: const EdgeInsets.only(bottom: 40, top: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,

                  borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.paddingSizeDefault))
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(width: 40,height: 5,decoration: BoxDecoration(
                    color: Theme.of(context).hintColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20)
                ),),
                const SizedBox(height: 40,),

                Text("select_language".tr, style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),),

                Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeLarge),
                  child: Text('choose_your_language_to_proceed'.tr),),

                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppConstants.languages.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,Dimensions.paddingSizeDefault, Dimensions.paddingSizeSmall),
                          child: Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                              color: selectedIndex == index? Theme.of(context).primaryColor.withOpacity(.1): Theme.of(context).cardColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeSmall),
                              child: Row(children: [
                                SizedBox(width: 25, child: Image.asset(AppConstants.languages[index].imageUrl)),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                  child: Text(AppConstants.languages[index].languageName),
                                )

                              ],),
                            ),),
                        ),
                      );

                    }),

                Padding(
                  padding: const EdgeInsets.fromLTRB( Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall,0),
                  child: CustomButton(buttonText: 'select'.tr, onPressed: (){
                    localizationProvider.setLanguage(Locale(
                      AppConstants.languages[selectedIndex].languageCode,
                      AppConstants.languages[selectedIndex].countryCode,
                    ));

                    Navigator.pop(context);
                  },),
                )

              ],),
            ),
          );
        }
    );
  }
}
