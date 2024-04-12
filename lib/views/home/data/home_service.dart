
import '../home_data_models.dart';

abstract class IHomeService {
  Future<CompetitionDataClass> fetchCompetitionData();
}