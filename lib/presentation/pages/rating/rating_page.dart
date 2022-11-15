import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';
import 'package:salon_customer_app/common/utils/app_icons.dart';
import 'package:salon_customer_app/data/remote/models/rating_model.dart';
import 'package:salon_customer_app/presentation/pages/rating/bloc/rating_bloc.dart';
import '../../widget/app_button.dart';
import '../../widget/custom_text_field.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;

  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RatingBloc, RatingState>(
        listener: (context, state) {
          if (state is RatingLoadingState) {
            Center(
              child: CircularProgressIndicator(
                color: AppColors.textBlack,
              ),
            );
          } else if (state is RatingSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text("Thanks! For Rating", textAlign: TextAlign.center),
              ),
            );
            Navigator.pop(context);
          } else if (state is RatingErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exception.message.toString(),
                    textAlign: TextAlign.center),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your opinion matters to us!',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RatingBar.builder(
                    unratedColor: AppColors.starColor,
                    itemPadding: EdgeInsets.only(left: 8, right: 8),
                    minRating: 0,
                    itemBuilder: (context, index) {
                      return SvgPicture.asset(
                        AppIcons.star,
                        color: Colors.amber,
                      );
                    },
                    onRatingUpdate: (rating) {
                      setState(() {
                        this.rating = rating;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomFormField(
                    controller: reviewController,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    maxLines: 6,
                    hint: "Leave a message, if you want",
                    validator: (String value) {},
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AppBtnWidget(
                    title: "Submit",
                    onTap: () {
                      _ratingBtn(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _ratingBtn(BuildContext context) {
    BlocProvider.of<RatingBloc>(context).add(
      RatingSuccessEvent(
        ratingModel: RatingModel(
            ratingStar: rating.toString(),
            ratingComment: reviewController.text),
      ),
    );
  }
}
