import '../models/politician_search_model.dart';

abstract class PoliticiansRepositoryInterface {
  Future<List<PoliticianSearchModel>> searchPoliticians(String search);
}