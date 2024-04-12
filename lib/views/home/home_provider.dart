
import '../../base/base_provider.dart';
import 'data/home_service.dart';
import 'data/home_service_impl.dart';
import 'home_data_models.dart';

class HomeProvider extends BaseProvider {
  HomeProvider();
  IHomeService homeService = HomeServiceImpl();

  Future<CompetitionDataClass> fetchCompetitionData() => homeService.fetchCompetitionData();
}