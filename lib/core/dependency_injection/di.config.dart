// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_sources/remote_data_sources/auth_remote_data_source.dart'
    as _i173;
import '../../features/auth/data/data_sources/remote_data_sources/auth_remote_data_source_impl.dart'
    as _i90;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/main_layout/data/data_sources/remote_data_sources/movies_remote_data_source.dart'
    as _i809;
import '../../features/main_layout/data/data_sources/remote_data_sources/movies_remote_data_source_impl.dart'
    as _i140;
import '../../features/main_layout/data/repositories/movies_repository_impl.dart'
    as _i365;
import '../../features/main_layout/domain/repositories/movies_repository.dart'
    as _i243;
import '../../features/main_layout/domain/use_cases/movies_details_use_case.dart'
    as _i118;
import '../../features/main_layout/domain/use_cases/movies_list_use_case.dart'
    as _i1058;
import '../../features/main_layout/domain/use_cases/movies_suggestions_use_case.dart'
    as _i852;
import '../../features/main_layout/domain/use_cases/search_movies_use_case.dart'
    as _i798;
import '../../features/main_layout/presentation/home/cubit/home_cubit.dart'
    as _i250;
import '../../features/main_layout/presentation/movie_details/cubit/movie_details_cubit.dart'
    as _i87;
import '../../features/main_layout/presentation/search/cubit/search_cubit.dart'
    as _i616;
import '../network/auth_retrofit/auth_retrofit_api_client.dart' as _i170;
import '../network/dio_module.dart' as _i614;
import '../network/movies_retrofit/movies_retrofit_api_client.dart' as _i134;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i528.PrettyDioLogger>(() => networkModule.prettyDioLogger());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.singleton<_i134.MoviesRetrofitApiClient>(
        () => _i134.MoviesRetrofitApiClient(gh<_i361.Dio>()));
    gh.singleton<_i170.AuthRetrofitApiClient>(
        () => _i170.AuthRetrofitApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i173.AuthRemoteDataSource>(
        () => _i90.RemoteDataSourceImpl(gh<_i170.AuthRetrofitApiClient>()));
    gh.lazySingleton<_i787.AuthRepository>(
        () => _i153.AuthRepositoryImpl(gh<_i173.AuthRemoteDataSource>()));
    gh.lazySingleton<_i809.MoviesRemoteDataSource>(() =>
        _i140.MoviesRemoteDataSourceImpl(gh<_i134.MoviesRetrofitApiClient>()));
    gh.lazySingleton<_i243.MoviesRepository>(
        () => _i365.MoviesRepositoryImpl(gh<_i809.MoviesRemoteDataSource>()));
    gh.factory<_i1010.RegisterUseCase>(
        () => _i1010.RegisterUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i1038.LoginUseCase>(
        () => _i1038.LoginUseCase(gh<_i787.AuthRepository>()));
    gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(
          gh<_i1010.RegisterUseCase>(),
          gh<_i1038.LoginUseCase>(),
        ));
    gh.factory<_i118.MoviesDetailsUseCase>(
        () => _i118.MoviesDetailsUseCase(gh<_i243.MoviesRepository>()));
    gh.factory<_i798.SearchMoviesUseCase>(
        () => _i798.SearchMoviesUseCase(gh<_i243.MoviesRepository>()));
    gh.factory<_i1058.MoviesListUseCase>(
        () => _i1058.MoviesListUseCase(gh<_i243.MoviesRepository>()));
    gh.factory<_i852.MoviesSuggestionsUseCase>(
        () => _i852.MoviesSuggestionsUseCase(gh<_i243.MoviesRepository>()));
    gh.factory<_i250.HomeCubit>(
        () => _i250.HomeCubit(gh<_i1058.MoviesListUseCase>()));
    gh.factory<_i616.SearchCubit>(
        () => _i616.SearchCubit(gh<_i798.SearchMoviesUseCase>()));
    gh.factory<_i87.MovieDetailsCubit>(
        () => _i87.MovieDetailsCubit(gh<_i118.MoviesDetailsUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i614.NetworkModule {}
