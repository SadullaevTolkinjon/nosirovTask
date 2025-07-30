// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../data/api/api.dart' as _i834;
import '../data/api/auth_api.dart' as _i17;
import '../data/api/main_api.dart' as _i483;
import '../data/preference/local_preference.dart' as _i1041;
import '../data/preference/token_preference.dart' as _i913;
import '../domain/repository/auth/auth_impl.dart' as _i382;
import '../domain/repository/auth/auth_repo.dart' as _i971;
import '../domain/repository/main_repository.dart' as _i593;
import '../domain/service/main_service.dart' as _i1046;
import '../presentation/initial/bloc/initial_bloc.dart' as _i743;
import '../presentation/location/bloc/location_bloc.dart' as _i190;
import '../presentation/main/bloc/main_bloc.dart' as _i894;
import '../presentation/splash/bloc/splash_bloc.dart' as _i1044;
import 'data_module.dart' as _i444;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => dataModule.prefs,
      preResolve: true,
    );
    gh.factory<_i743.InitialBloc>(() => _i743.InitialBloc());
    gh.factory<_i894.MainBloc>(() => _i894.MainBloc());
    gh.factory<_i190.LocationBloc>(() => _i190.LocationBloc());
    gh.factory<_i1041.LocalPreference>(
        () => _i1041.LocalPreference(gh<_i460.SharedPreferences>()));
    gh.factory<_i913.TokenPreference>(
        () => _i913.TokenPreference(gh<_i460.SharedPreferences>()));
    gh.factory<_i834.Api>(() => _i834.Api(
          gh<_i913.TokenPreference>(),
          gh<_i1041.LocalPreference>(),
        ));
    gh.factory<_i17.AuthApi>(() => _i17.AuthApi(gh<_i834.Api>()));
    gh.factory<_i483.MainApi>(() => _i483.MainApi(gh<_i834.Api>()));
    gh.factory<_i593.MainRepository>(
        () => _i593.MainRepository(gh<_i483.MainApi>()));
    gh.factory<_i1046.MainService>(
        () => _i1046.MainService(gh<_i483.MainApi>()));
    gh.lazySingleton<_i971.AuthRepository>(() => _i382.AuthRepositoryImpl(
          gh<_i460.SharedPreferences>(),
          gh<_i913.TokenPreference>(),
          gh<_i593.MainRepository>(),
        ));
    gh.factory<_i1044.SplashBloc>(
        () => _i1044.SplashBloc(gh<_i971.AuthRepository>()));
    return this;
  }
}

class _$DataModule extends _i444.DataModule {}
