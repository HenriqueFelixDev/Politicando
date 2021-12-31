import '../models/politician_search_model.dart';
import '../repositories/politicians_repository_interface.dart';

class PoliticiansController {
  final PoliticiansRepositoryInterface _politiciansRepository;
  PoliticiansController(PoliticiansRepositoryInterface politiciansRepository)
    : _politiciansRepository = politiciansRepository;

  Future<List<PoliticianSearchModel>> searchPoliticians(String search) {
    return _politiciansRepository.searchPoliticians(search);
  }
}