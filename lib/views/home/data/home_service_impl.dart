
import 'package:flutter/services.dart';

import '../home_data_models.dart';
import 'home_service.dart';

class HomeServiceImpl implements IHomeService {
  @override
  Future<CompetitionDataClass> fetchCompetitionData() async {
    String jsonString = await rootBundle.loadString('lib/views/home/mock_data.json');
    return competitionDataClassFromJson(jsonString);
  }
}