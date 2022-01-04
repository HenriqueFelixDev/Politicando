import 'package:dio/dio.dart';

import './politicians_repository_interface.dart';
import '../errors/connection_exception.dart';
import '../models/detailed_politician/candidacy_info_model.dart';
import '../models/detailed_politician/detailed_politician_model.dart';
import '../models/detailed_politician/parliamentary_office_model.dart';
import '../models/politician_search_model.dart';

class PoliticiansRepositoryDio implements PoliticiansRepositoryInterface {
  Dio getClient() {
    final dio = Dio(
      BaseOptions(
        headers: {
          'accept': 'application/json'
        },
        baseUrl: 'https://dadosabertos.camara.leg.br/api/v2',
      )
    );

    return dio;
  }
  
  @override
  Future<List<PoliticianSearchModel>> searchPoliticians(String search) async {  
    try {
      final response = await getClient().get('/deputados?nome=$search&ordem=ASC&ordenarPor=nome&idLegislatura=56');
      final politiciansMap = response.data['dados'] as List;
      return politiciansMap.map((politicianMap) => 
        PoliticianSearchModel(
          id: politicianMap['id'],
          name: politicianMap['nome'],
          email: politicianMap['email'] ?? '',
          photo: politicianMap['urlFoto'],
          politicalParty: politicianMap['siglaPartido'],
          uf: politicianMap['siglaUf'],
        )
      ).toList();
    } on DioError catch (e) {
      throw ConnectionException(
        'Erro na comunicação com o servidor: '
        'Verifique sua comunicação com a internet'
      );
    }
  }

  @override
  Future<DetailedPoliticianModel> getDetailedPolitician(int politicianId) async {
    try {
      final response = await getClient().get('/deputados/$politicianId');
      final politicianMap = response.data['dados'];
      
      return DetailedPoliticianModel(
        id: politicianMap['id'],
        civilName: politicianMap['nomeCivil'],
        birthday: DateTime.parse(politicianMap['dataNascimento']),
        photo: politicianMap['ultimoStatus']['urlFoto'],
        socialMedia: [],
        scholarity: politicianMap['escolaridade'],
        birthdayCity: politicianMap['municipioNascimento'],
        birthdayState: politicianMap['ufNascimento'],
        candidacyInfo: CandidacyInfoModel(
          electoralName: politicianMap['ultimoStatus']['nomeEleitoral'],
          politicalParty: politicianMap['ultimoStatus']['siglaPartido'],
          electoralCondition: politicianMap['ultimoStatus']['condicaoEleitoral'],
          uf: politicianMap['ultimoStatus']['siglaUf'],
          date: DateTime.parse(politicianMap['ultimoStatus']['data']),
          status: politicianMap['ultimoStatus']['situacao'],
          email: politicianMap['ultimoStatus']['email'],
          parliamentaryOffice: ParliamentaryOfficeModel(
            name: politicianMap['ultimoStatus']['gabinete']['nome'].toString(),
            room: politicianMap['ultimoStatus']['gabinete']['sala'].toString(),
            floor: politicianMap['ultimoStatus']['gabinete']['andar'].toString(),
            building: politicianMap['ultimoStatus']['gabinete']['predio'].toString(),
            phone: politicianMap['ultimoStatus']['gabinete']['telefone'].toString(),
            email: politicianMap['ultimoStatus']['gabinete']['email'].toString()
          )
        )
      );
    } on DioError catch(e) {
      throw ConnectionException(
        'Erro na comunicação com o servidor: '
        'Verifique sua comunicação com a internet'
      );
    }
  }

}