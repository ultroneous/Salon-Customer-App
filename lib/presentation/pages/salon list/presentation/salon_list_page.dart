import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/firbase_constants/firebase_db_const.dart';
import '../../../../common/widgets/btn_icon_widget.dart';
import '../bloc/salon_list_bloc.dart';
import '../widgets/custom_filter_button.dart';
import '../widgets/custom_salon_checkbox.dart';
import '../widgets/salon_list_wiget.dart';
import 'filters_page.dart';

typedef StringValue = String Function(String);

class SalonListPage extends StatefulWidget {
  const SalonListPage({Key? key}) : super(key: key);

  @override
  State<SalonListPage> createState() => _SalonListPageState();
}

class _SalonListPageState extends State<SalonListPage> {
  late SalonListBloc _salonListBlog;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List salonList = [];
  final TextEditingController searchtextController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
    _salonListBlog = BlocProvider.of<SalonListBloc>(context);
    _salonListBlog.add(GetSalonListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, top: 10.0, bottom: 10.0, right: 2),
            child: BtnIconWidget(
              icon: SvgPicture.asset(
                AppIcons.backIcon,
                height: 14,
                width: 16,
                color: AppColors.loginDesc,
              ),
              onTap: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 10.0, bottom: 10.0, right: 16),
              child: BtnIconWidget(
                icon: SvgPicture.asset(
                  AppIcons.sort,
                  height: 12,
                  width: 21,
                  color: AppColors.loginDesc,
                ),
                onTap: () {
                  sortingBottomSheet();
                },
              ),
            ),
          ],
          title: Text("Salon List",
              style: TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          bottom: AppBar(
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: TextFormField(
              style: TextStyle(color: AppColors.textBlack),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: searchtextController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              textInputAction: TextInputAction.done,
              cursorColor: AppColors.textBlack,
              onFieldSubmitted: (val) {
                setState(() {
                  searchText = val;
                });
              },
              onChanged: (val) {
                setState(() {
                  searchText = val;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: SvgPicture.asset(AppIcons.search,
                        color: AppColors.loginDesc),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(AppIcons.filter,
                        color: AppColors.loginDesc),
                    onPressed: () {
                      filterBottomSheet(context);
                    },
                  ),
                  filled: true,
                  fillColor: AppColors.borderColor,
                  hintStyle:
                      TextStyle(fontSize: 16.0, color: AppColors.loginDesc),
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: "Find a salon",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  errorStyle: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.borderColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: AppColors.borderColor)),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  )),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _firebaseFirestore
                .collection(FirebaseCollection.salon)
                .snapshots(),
            builder: (context, snapshots) {
              salonList = snapshots.data!.docs.toList();
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.textBlack,
                      ),
                    )
                  : salonListingBody(salonList);
            }));
  }

  salonListingBody(salonList) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        SalonListWidget(salonList: salonList, searchText: searchText),
      ],
    ));
  }

  filterBottomSheet(BuildContext context) {
    var dWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.textWhite,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 17.0, right: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Filters",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textBlack),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: AppColors.loginDesc,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const FiltersPage()
                  ],
                ),
              ),
              Container(
                width: dWidth,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomFilterBtn(
                      title: "Clear all",
                      bgColor: AppColors.borderColor,
                      textColor: AppColors.loginDesc,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomFilterBtn(
                      title: "Apply Now",
                      bgColor: AppColors.textBlack,
                      textColor: AppColors.textWhite,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  sortingBottomSheet() {
    List isSelected = [false, false, false];
    List sortOptions = [
      "Price - Low to High",
      "Price - High to Low",
      "Rating - High to Low"
    ];
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: AppColors.textWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sort By",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Column(
                        children: List.generate(isSelected.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () {
                            state(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          child: Row(
                            children: [
                              CustomSalonCheckBox(
                                  onChanged: () {
                                    state(() {
                                      isSelected[index] = !isSelected[index];
                                    });
                                  },
                                  value: isSelected[index]),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                sortOptions[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.loginDesc),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
                  ],
                ),
              ),
            );
          });
        });
  }
}
