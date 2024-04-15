import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/app_bar_widget.dart';
import 'package:flutter_boilerplate/feature/create_post/models/adTypeModel.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/ad_type_card.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/category_bottom_sheet.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/look_for_property_rent.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/look_for_something_to_buy.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/post_job_overas.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/post_job_usa_bottom_sheet.dart';
import 'package:flutter_boilerplate/feature/create_post/widgets/property_rent_bottom_sheet.dart';
import 'package:flutter_boilerplate/util/images.dart';
import 'package:get/get.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "post_add".tr, regularAppbar: true, showBackButton: false,),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
            AdTypeCard(onTap: ()=> showModalBottomSheet(context: context,
                isScrollControlled: true, backgroundColor: Colors.transparent,
                builder: (c) => const CategoryBottomSheet()),
                onPress: ()=> showModalBottomSheet(context: context,
                isScrollControlled: true, backgroundColor: Colors.transparent,
                builder: (c) => const PropertyRentBottomSheet()),

              adTypeModel: AdTypeModel(mainTitle: "sell_something", title: "sell_item", subTitle: "property_rent", icon: Images.sale)),
          AdTypeCard(
              onTap: ()=> showModalBottomSheet(context: context,
                  isScrollControlled: true, backgroundColor: Colors.transparent,
                  builder: (c) => const PostJobUsaBottomSheet()),
              onPress: ()=> showModalBottomSheet(context: context,
                  isScrollControlled: true, backgroundColor: Colors.transparent,
                  builder: (c) => const PostJobOverAsBottomSheet()),
              adTypeModel: AdTypeModel(mainTitle: "post_job", title: "post_a_job", subTitle: "post_job_over", icon: Images.jobs)),
          AdTypeCard(onTap: ()=> showModalBottomSheet(context: context,
              isScrollControlled: true, backgroundColor: Colors.transparent,
              builder: (c) => const LookForPropertyToRentBottomSheet()),
              onPress: ()=> showModalBottomSheet(context: context,
                  isScrollControlled: true, backgroundColor: Colors.transparent,
                  builder: (c) => const LookForSomethingToBuyBottomSheet()),
              adTypeModel: AdTypeModel(mainTitle: "look_something", title: "looking_rent", subTitle: "look_buy", icon: Images.service)),
        ],),)
      ],)

    );
  }
}

