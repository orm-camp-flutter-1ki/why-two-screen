// 조립부분 지저분
import 'package:get_it/get_it.dart';
import 'package:why_two_screen/image_search/data/data_source/image_api.dart';
import 'package:why_two_screen/image_search/ui/second_view_model.dart';

import '../data/data_source/image_api_impl.dart';
import '../data/repository/image_repository_impl.dart';
import '../domain/repository/image_repository.dart';
import '../ui/image_view_model.dart';


final getIt = GetIt.instance;

void setup() {
  final api = ImageApiImpl();
  final imageRepository = ImageRepositoryImpl(api);
  final imageRepositoryMock = ImageRepositoryImpl(api);

  getIt.registerSingleton<ImageApi>(api);
  getIt.registerSingleton<ImageRepository>(imageRepository);
  getIt.registerFactory<ImageViewModel>(() => ImageViewModel(getIt()));
  getIt.registerFactory<SecondViewModel>(() => SecondViewModel(getIt()));
}