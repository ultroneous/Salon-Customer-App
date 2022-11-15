import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_customer_app/presentation/pages/category/bloc/category_bloc.dart';
import '../../../common/utils/app_colors.dart';
import '../../widget/appbar.dart';
import 'category_grid.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
late CategoryBloc _categoryBloc;

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(GetCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.textBlack,
              ),
            );
          } else if (state is CategorySuccessState) {
            return _mainCategory(state.categories);
          } else {
            return const Center(
              child: Text("Some Error Occurred"),
            );
          }
        },
      ),
    );
  }

  Widget _mainCategory(List? Categories) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Column(
            children:[
              const AppBarWidget(
                text: 'Category',
              ),
              const SizedBox(
                height: 40,
              ),
              CategoryGrid(categories: Categories!,)
            ],
          ),
        ),
      ),
    );
  }
}
