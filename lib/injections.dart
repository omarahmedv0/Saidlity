import 'package:get_it/get_it.dart';
import 'package:saidlity/data/data_source/remote_data_source.dart';
import 'package:saidlity/data/repos/home/home_repo.dart';
import 'package:saidlity/data/repos/home/home_repo_impl.dart';

GetIt servLocator = GetIt.instance;
Future<void> setupLocator() async {
  servLocator.registerLazySingleton(
    () => RemoteDataSourceIMPL(),
  );
  servLocator.registerLazySingleton(
    () => HomeRepoIMPL(remoteDataSource: servLocator.get()),
  );
}
