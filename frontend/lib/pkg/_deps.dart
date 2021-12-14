import 'package:get_it/get_it.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/api/walk.dart';
import 'package:fleet/pkg/clipboard.dart';
import 'package:fleet/pkg/firebase.dart';
import 'package:fleet/pkg/location.dart';
import 'package:fleet/pkg/storage.dart';

GetIt locator = GetIt.instance;

void setupDependencies({required bool useDummies}) {
  if (useDummies) {
    //PKG
    locator.registerLazySingleton<IClipBoard>(() => ClipBoardd());

    //APIS
    locator.registerLazySingleton<IUserAPI>(() => UserAPI());
    locator.registerLazySingleton<IWalkAPI>(() => WalkAPI());

    //
    // REALEST
    locator.registerLazySingleton<IAuthGateway>(() => FirebaseAPIS());
    locator.registerLazySingleton<IStorage>(() => HiveStore());
    locator.registerLazySingleton<ILocation>(() => Loocation());

    return;
  }
  //PKG
  locator.registerLazySingleton<IStorage>(() => HiveStore());
  locator.registerLazySingleton<ILocation>(() => Loocation());
  locator.registerLazySingleton<IClipBoard>(() => ClipBoardd());

  //APIS
  locator.registerLazySingleton<IAuthGateway>(() => FirebaseAPIS());
  // locator.registerLazySingleton<IAuthGateway>(() => DummyAuthGateway());

  locator.registerLazySingleton<IUserAPI>(() => UserAPI());
  locator.registerLazySingleton<IWalkAPI>(() => WalkAPI());
}
