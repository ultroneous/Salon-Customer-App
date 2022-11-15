import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';
import 'package:salon_customer_app/presentation/pages/drawer/drawer_menu.dart';
import 'package:salon_customer_app/presentation/pages/home/cubit/home_cubit.dart';
import 'package:salon_customer_app/presentation/pages/home/widget/banner_widget.dart';
import 'package:salon_customer_app/presentation/pages/home/widget/category_widget.dart';
import 'package:salon_customer_app/presentation/pages/home/widget/featured_widget.dart';
import 'package:salon_customer_app/presentation/pages/home/widget/mostPopular_widget.dart';
import 'package:salon_customer_app/presentation/pages/home/widget/register_widget.dart';
import '../../../common/utils/app_colors.dart';
import 'widget/newlyLaunched_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerMenu(),
        appBar: AppBar(
          iconTheme: IconThemeData(size: 25, color: AppColors.loginDesc),
          elevation: 0.1,
          toolbarHeight: 109,
          backgroundColor: Colors.white,
          title: SvgPicture.asset(
            AppIcons.logo,
          ),
          titleSpacing: 0.2,
          leadingWidth: 60,
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 21, bottom: 10),
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: SvgPicture.asset(AppIcons.notification),
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(5),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(21, 8, 21, 8),
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.borderColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.search),
                          const SizedBox(width: 12),
                          Text(
                            "Find a salon, specialists",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.loginDesc),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          color: AppColors.textBlack,
          onRefresh: () async {
            initState();
          },
          child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          }, child:
                  BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.black));
            } else if (state is HomeSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    bannerWidget(state.data![0]),
                    categoryWidget(state.data![1]),
                    featuredWidget(state.data![2]),
                    newlyLaunchedWidget(state.data![2]),
                    registerWidget(),
                    mostpopukerWidget(state.data![3]),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Something went wrong",
                ),
              );
            }
          })),
        ));
  }
}
