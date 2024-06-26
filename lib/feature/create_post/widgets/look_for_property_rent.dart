import 'package:flutter/material.dart';
import 'package:bikrify/common/model/category_model.dart';
import 'package:bikrify/feature/create_post/widgets/bottom_sheet_item_widget.dart';
import 'package:bikrify/util/dimensions.dart';

class LookForPropertyToRentBottomSheet extends StatelessWidget {
  const LookForPropertyToRentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(constraints : BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9, minHeight: MediaQuery.of(context).size.height * 0.5 ),
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Padding(padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
              child: Center(child: Container(width: 35,height: 4,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
                  color: Theme.of(context).hintColor.withOpacity(.5))))),


          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return BottomSheetItemWidget(category: categories[index],);
            },
          )

        ]),
      ),
    );
  }
}
