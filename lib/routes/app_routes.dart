import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_customer_app/presentation/pages/auth/signup/bloc/signup_bloc.dart';
import 'package:salon_customer_app/presentation/pages/auth/signup/presentation/signup_page.dart';
import 'package:salon_customer_app/presentation/pages/salon%20list/bloc/salon_list_bloc.dart';
import '../presentation/pages/auth/login/bloc/login_bloc.dart';
import '../presentation/pages/auth/login/login_page.dart';
import 'package:salon_customer_app/presentation/pages/category/bloc/category_bloc.dart';
import '../presentation/pages/mybooking/bloc/my_booking_bloc.dart';
import '../presentation/pages/mybooking/mybooking_screen.dart';
import 'package:salon_customer_app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:salon_customer_app/presentation/pages/rating/rating_page.dart';
import '../presentation/pages/home/cubit/home_cubit.dart';
import '../presentation/pages/rating/bloc/rating_bloc.dart';

class AppRoutes {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: const LoginPage(),
        ));
      case '/dashboard':
        return _materialRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeCubit(),
              ),
              BlocProvider<CategoryBloc>(
                create: (context) => CategoryBloc(),
              ),
              BlocProvider<SalonListBloc>(
                create: (context) => SalonListBloc(),
              )
            ],
            child: const DashboardPage(),
          ),
        );
      case '/mybooking':
        return _materialRoute(
          BlocProvider<MyBookingBloc>(
            create: (context) => MyBookingBloc(),
            child: const MyBooking(),
          ),
        );
      case '/rating':
        return _materialRoute(
          BlocProvider<RatingBloc>(
              create: (context) => RatingBloc(), child: const RatingPage()),
        );
      case '/signup':
        return _materialRoute(BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
          child: SignupPage(),
        ));

      default:
        return _materialRoute(Container());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
