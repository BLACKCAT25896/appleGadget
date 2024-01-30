import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/home/model/trade_model.dart';
import 'package:flutter_boilerplate/feature/login/login_controller.dart';
import 'package:flutter_boilerplate/util/dimensions.dart';
import 'package:flutter_boilerplate/util/styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  void initState() {
    Get.find<AuthController>().getProfileInfo();
    Get.find<AuthController>().getOpenTrades();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh:() async{
        Get.find<AuthController>().getProfileInfo();
        Get.find<AuthController>().getOpenTrades();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return SingleChildScrollView(
              child: Column(children: [

                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Row(children: [
                    const Spacer(),
                    InkWell(onTap: ()=> Get.find<AuthController>().clearSharedData(),
                      child: Container(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                          child: Text("LogOut", style: textRegular.copyWith(color: Theme.of(context).cardColor),)),
                    )
                  ],),
                ),
                SizedBox(height: 240,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(authController.profileModel?.name??"",
                        style: textRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Theme.of(context).cardColor),),
                      Text(authController.profileModel?.phone??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).cardColor),),
                      Text(authController.profileModel?.address??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).cardColor),),
                      Text(authController.profileModel?.city??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).cardColor),),
                      Text(authController.profileModel?.country??'', style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).cardColor),),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(children: [
                            Expanded(
                              child: Container(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.5), blurRadius: 1, spreadRadius: 1, offset: const Offset(1,1))]
                                ),
                                child: Center(child: Text("Balance : ${authController.profileModel?.balance??0}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),)),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                                decoration: BoxDecoration(
                                    color: authController.profit>0? Colors.green : Theme.of(context).colorScheme.error,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.5), blurRadius: 1, spreadRadius: 1, offset: const Offset(1,1))]
                                ),
                                child: Center(child: Text("Profit : ${authController.profit}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.white),)),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),),


                Container(width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                      color: Theme.of(context).cardColor),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const SizedBox(height:30),
                       Row(children: [
                        Expanded(child: StatisticsCard(count: authController.profileModel?.totalTradesCount??0, title: 'Total Trade Count',)),
                        Expanded(child: StatisticsCard(count: authController.profileModel?.totalTradesCount??0, title: 'Total Trade Volume',)),

                      ],),

                      const SizedBox(height:30),
                       Row(children: [
                        Expanded(child: StatisticsCard(count: authController.profileModel?.equity?.toInt()??0, title: 'Equity',)),
                        Expanded(child: StatisticsCard(count: authController.profileModel?.freeMargin?.toInt()??0, title: 'Free Margin',)),

                      ],),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeSmall, Dimensions.paddingSizeLarge, Dimensions.paddingSizeDefault,Dimensions.paddingSizeDefault),
                        child: Text('Open Trades', style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),),
                      ListView.builder(
                          itemCount: authController.tradeList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return SizedBox(width: 270,child: RewardCard(tradeModel: authController.tradeList[index],));

                          }),

                      const SizedBox(height: Dimensions.paddingSizeDefault,),
                      Container(padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.5), blurRadius: 1, spreadRadius: 1, offset: const Offset(1,1))]
                      ),
                        child: InkWell(onTap: ()=> Get.find<AuthController>().clearSharedData(),
                          child: Row(
                            children: [
                              const Icon(Icons.delete, color: Colors.red,),

                              const SizedBox(width: Dimensions.paddingSizeDefault,),
                              Text("LogOut", style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault),),
                            ],
                          ),
                        ),
                      ),

                    ],),
                  ),)


              ],),
            );
          }
        ),
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final int count;
  final String title;
  const StatisticsCard({Key? key, required this.count, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.5), blurRadius: 1, spreadRadius: 1, offset: const Offset(1,1))]
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(NumberFormat.compact().format(count),
                style: textMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge),textAlign: TextAlign.center),
            const SizedBox(height:30),
            Text(title, style: textRegular.copyWith(),textAlign: TextAlign.center)

          ],),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final TradeModel tradeModel;
  const RewardCard({Key? key, required this.tradeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor,
          boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(.25), blurRadius: 1, spreadRadius: 1, offset: const Offset(0,0))]),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [

          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
            children: [
              Text('Open Price : ${tradeModel.openPrice}',
                  style: textRegular.copyWith( fontSize: Dimensions.fontSizeLarge),textAlign: TextAlign.start),

              Text('Profit : ${tradeModel.profit}',
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),textAlign: TextAlign.start),


              Text('Volume : ${tradeModel.volume}',
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),textAlign: TextAlign.start),

              Text('Current Price : ${tradeModel.currentPrice}',
                  style: textRegular.copyWith(fontSize: Dimensions.fontSizeLarge),textAlign: TextAlign.start),


            ],
          ))

        ],),
      ),
    );
  }
}