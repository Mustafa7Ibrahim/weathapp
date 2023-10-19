import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weathapp/core/utils/dio/dio_helper.dart';

/// GetIt is a simple service locator for Dart and Flutter projects. [GetIt]
final gi = GetIt.instance;

/// init GetIt
Future<void> initGetIt() async {
  // init isar
  // final isar = await Isar.open(
  //   [
  //     AuthModelSchema,
  //   ],
  //   directory: await getApplicationDocumentsDirectory().then(
  //     (value) => value.path,
  //   ),
  // );

  gi
      // helpers

      // blocs

      // data ( local + remote) repositories Objects
      .registerLazySingleton<Dio>(() => DioHelper(Dio()).init());
  // ..registerLazySingleton<Isar>(() => isar);
}
