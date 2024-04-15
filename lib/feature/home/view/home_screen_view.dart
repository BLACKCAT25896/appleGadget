import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/common/widget/custom_sliver_delegate.dart';
import 'package:flutter_boilerplate/feature/home/model/announcement.dart';
import 'package:flutter_boilerplate/feature/home/widget/announcement.dart';
import 'package:flutter_boilerplate/feature/home/widget/cart_widget_home_page.dart';
import 'package:flutter_boilerplate/feature/home/widget/category_view.dart';
import 'package:flutter_boilerplate/feature/home/widget/recent_product.dart';
import 'package:flutter_boilerplate/feature/home/widget/recommendation_list_view.dart';
import 'package:flutter_boilerplate/feature/home/widget/search_widget_home_page.dart';
import 'package:flutter_boilerplate/util/images.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final ScrollController _scrollController = ScrollController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverAppBar(
          floating: true,
          elevation: 0,
          pinned: true,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Image.asset(Images.logo,color: Theme.of(context).cardColor, height: 35), actions: const [
          CartWidgetHomePage(),
        ],
        ),

        SliverToBoxAdapter(child: AnnouncementScreen(announcement: announcement),),

        SliverPersistentHeader(pinned: true,
            delegate: SliverDelegate(child: InkWell(onTap: () {},
                child: const SearchWidgetHomePage()))),

        const SliverToBoxAdapter(
          child: Column(children: [
            CategoryView(isHomePage: true),
            RecommendationList(),
            RecentList(),
          ],),

        )
      ],
      ),
    );
  }
}


