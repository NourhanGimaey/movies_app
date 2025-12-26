import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_cubit.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/explore_tab_controller.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state is ErrorState) {
          return Center(child: Text(state.failure.message));
        } else if (state is SuccessSearchState) {
          return SafeArea(
            child: Scaffold(
              body: ExploreTabController(state: state),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}