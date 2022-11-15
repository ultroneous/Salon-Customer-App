import 'package:flutter/material.dart';
import 'package:salon_customer_app/common/utils/app_colors.dart';
import 'package:salon_customer_app/presentation/pages/mybooking/bloc/my_booking_bloc.dart';
import 'package:salon_customer_app/presentation/pages/mybooking/widget/past_info.dart';
import 'package:salon_customer_app/presentation/pages/mybooking/widget/upcoming_info.dart';
import '../../widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  late MyBookingBloc _myBookingBloc;

  @override
  void initState() {
    super.initState();
    _myBookingBloc = BlocProvider.of<MyBookingBloc>(context);
    _myBookingBloc.add(BookingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyBookingBloc, MyBookingState>(
        builder: (context, state) {
          if (state is MyBookingLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.textBlack,
              ),
            );
          } else if (state is MyBookingSuccessState) {
            return _myBooking(state.booking);
          } else if (state is MyBookingErrorState) {
            return Center(
              child: Text(
                state.exception.toString(),
              ),
            );
          } else {
            return const Center(
              child: Text("Some Error Occurred"),
            );
          }
        },
      ),
    );
  }

  Widget _myBooking(List? bookingList) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(
              text: 'My Booking',
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Upcoming',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            UpComingInfo(
              upcomingBookingList: bookingList![0],
              upComingDays: bookingList[2],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Past',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            PastInfo(
              pastBookingList: bookingList[1],
              pastDays: bookingList[3],
            ),
          ],
        ),
      ),
    );
  }
}
