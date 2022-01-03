import '../models/politician_search_model.dart';
import '../models/detailed_politician/detailed_politician_model.dart';

abstract class PoliticiansRepositoryInterface {
  Future<List<PoliticianSearchModel>> searchPoliticians(String search);
  Future<DetailedPoliticianModel> getDetailedPolitician(int politicianId);
}