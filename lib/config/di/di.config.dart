// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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

import '../../features/auth/api/client/auth_api_client.dart' as _i213;
import '../../features/auth/api/data_source/remote/auth_remote_data_source_impl.dart'
    as _i321;
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/register_use_case.dart' as _i463;
import '../../features/auth/presentation/view_model/auth_view_model.dart'
    as _i1025;
import '../dio/dio_module.dart' as _i977;
import '../services/secure_storage_service.dart' as _i451;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    gh.singleton<_i361.BaseOptions>(() => gitItModule.provideBaseOptions);
    gh.singleton<_i528.PrettyDioLogger>(
      () => gitItModule.providePrettyDioLogger,
    );
    gh.singleton<_i361.Dio>(() => gitItModule.provideDio);
    gh.singleton<_i213.AuthApiClient>(() => gitItModule.provideApiServices);
    gh.lazySingleton<_i451.SecureStorageService>(
      () => _i451.SecureStorageService(),
    );
    gh.lazySingleton<_i548.AuthRemoteDataSource>(
      () => _i321.AuthRemoteDataSourceImpl(gh<_i213.AuthApiClient>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i984.AuthRepoImpl(
        gh<_i548.AuthRemoteDataSource>(),
        gh<_i451.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i973.LoginUseCase>(
      () => _i973.LoginUseCase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i463.RegisterUseCase>(
      () => _i463.RegisterUseCase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i1025.AuthViewModel>(
      () => _i1025.AuthViewModel(
        gh<_i973.LoginUseCase>(),
        gh<_i463.RegisterUseCase>(),
      ),
    );
    return this;
  }
}

class _$GitItModule extends _i977.GitItModule {}
