// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/remote_data_sources/remote_data_source.dart'
    as _i862;
import '../../features/auth/data/data_sources/remote_data_sources/remote_data_source_impl.dart'
    as _i193;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/register_use_case.dart' as _i1010;
import '../network/retrofit_api_client.dart' as _i758;

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
    gh.lazySingleton<_i862.RemoteDataSource>(
        () => _i193.RemoteDataSourceImpl(gh<_i758.RetrofitApiClient>()));
    gh.lazySingleton<_i723.AuthRepo>(
        () => _i662.AuthRepoImpl(gh<_i862.RemoteDataSource>()));
    gh.factory<_i1010.RegisterUseCase>(
        () => _i1010.RegisterUseCase(gh<_i723.AuthRepo>()));
    gh.factory<_i1038.LoginUseCase>(
        () => _i1038.LoginUseCase(gh<_i723.AuthRepo>()));
    return this;
  }
}
