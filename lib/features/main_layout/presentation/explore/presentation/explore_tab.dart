import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_cubit.dart';
import 'package:movies/features/main_layout/presentation/explore/cubit/explore_state.dart';
import 'package:movies/features/main_layout/presentation/explore/presentation/widgets/explore_tab_controller.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          if (state is SuccessExploreState) {
            return ExploreTabController(state: state);
          } else if (state is ErrorState) {
            return Center(child: Text(state.failure.message));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
