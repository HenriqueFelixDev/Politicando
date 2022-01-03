import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:politicando/app/core/controllers/politicians_controller.dart';
import 'package:politicando/app/core/models/detailed_politician/candidacy_info_model.dart';
import 'package:politicando/app/core/models/detailed_politician/detailed_politician_model.dart';
import 'package:politicando/app/core/models/detailed_politician/parliamentary_office_model.dart';
import 'package:politicando/app/core/repositories/politicians_repository_interface.dart';

import '../politicians_search/politicians_search_test.mocks.dart';

void main() {
  late PoliticiansController politiciansController;
  late PoliticiansRepositoryInterface politiciansRepository;

  setUp(() {
    politiciansRepository = MockPoliticiansRepositoryInterface();
    politiciansController = PoliticiansController(politiciansRepository);
  });

  test('Ao tentar obter os dados detalhados de um político, retorna corretamento', () async {
    // Arrange
    const politicianId = 1;

    when(politiciansRepository.getDetailedPolitician(politicianId))
      .thenAnswer((_) {
        var model = DetailedPoliticianModel(
          id: 1,
          civilName: 'Henrique Felix',
          birthday: DateTime.now(),
          photo: '',
          socialMedia: ['https://www.facebook.com/test', 'https://www.instagram.com/test'],
          scholarity: 'Ensino Superior Completo',
          birthdayCity: 'Rio Espera',
          birthdayState: 'MG',
          candidacyInfo: CandidacyInfoModel(
            electoralName: '',
            politicalParty: 'PHF',
            electoralCondition: '',
            uf: 'MG',
            date: DateTime.now(),
            status: 'Exercício',
            email: 'henrique@mail.com',
            parliamentaryOffice: ParliamentaryOfficeModel(
              name: '441',
              room: '441',
              floor: '6',
              building: '3',
              phone: '1234-5678',
              email: 'henrique@mail.com'
            )
          )
        );

        return Future.value(model);
      });

    expect(() async => await politiciansController.getDetailedPolitician(politicianId), returnsNormally);

  });
}