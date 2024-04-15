import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/app_bar_widget.dart';
import 'package:flutter_boilerplate/feature/favorite/widgets/favorite_list.dart';
import 'package:flutter_boilerplate/feature/my_ads/widgets/empty_listed.dart';
import 'package:flutter_boilerplate/feature/my_ads/widgets/types_item.dart';
import 'package:flutter_boilerplate/feature/my_ads/widgets/want_to_sell_more.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:get/get.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {

  List<String> typeList = ["ads", "favorite"];
  int selectedIndex = 0;
  setSelectedIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "my_ads".tr, showBackButton: false,),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [

          const SizedBox(height: Dimensions.paddingSizeSmall,),
          Row( children: [
            Expanded(child: TypesItem(index: 0,selectedIndex: selectedIndex, title: "ads".tr,
            onTap: ()=> setSelectedIndex(0),)),
            Expanded(child: TypesItem(index: 1,selectedIndex: selectedIndex, title: "favorite".tr,
            onTap: ()=> setSelectedIndex(1),))]),
          Container(width: Get.width, height: .5,color: Theme.of(context).primaryColor.withOpacity(.25),),


          if(selectedIndex == 1)...[
            const FavoriteList(),
          ]else...[
            const WantToSellMore(),
            const EmptyListed(),
          ]








        ],),)
      ],),
    );
  }
}
