import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/core/widgets/app_text_form_field.dart';
import 'package:movies/features/main_layout/presentation/search/cubit/search_cubit.dart';
import 'package:movies/features/main_layout/presentation/search/cubit/search_state.dart';
import 'package:movies/features/main_layout/presentation/search/presentation/widgets/search_movies_grid.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 24,
            children: [
              AppTextFormField(
                customKeyboardType: TextInputType.text,
                customTextInputAction: TextInputAction.search,
                customPrefixIcon: SvgPicture.asset(
                  AppIcons.icSearchTab,
                  fit: BoxFit.scaleDown,
                ),
                customLabel: "Search",
                onChanged: (searchValue) {
                  context.read<SearchCubit>().searchMovies(
                    queryTerm: searchValue,
                  );
                },
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is ErrorState) {
                    return Expanded(
                      child: Center(child: Text(state.failure.message)),
                    );
                  } else if (state is SuccessSearchState) {
                    return SearchMoviesGrid(data: state.moviesListModel.data);
                  }
                  return Expanded(
                    child: Center(child: Image.asset(AppImages.emptyPageImage)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
