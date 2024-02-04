import 'package:get_it/get_it.dart';
import 'package:why_two_screen/data/data_source/pixabay_api.dart';
import 'package:why_two_screen/data/repository/photo_api_repository_impl.dart';
import 'package:why_two_screen/domain/repository/photo_api_repository.dart';
import 'package:why_two_screen/domain/use_case/get_photos_use_case.dart';
import 'package:why_two_screen/presentation/view_model/final_screen_viewmodel.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<PhotoApiRepository>(
      PhotoApiRepositoryImpl(PixabayApi()));
  getIt.registerFactory<FinalScreenViewModel>(() => FinalScreenViewModel(
      GetPhotosUseCase(PhotoApiRepositoryImpl(PixabayApi()))));
}
