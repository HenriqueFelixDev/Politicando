import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:politicando/app/core/controllers/politicians_controller.dart';
import 'package:politicando/app/core/models/politician_search_model.dart';
import 'package:politicando/app/core/repositories/politicians_repository_interface.dart';
import './politicians_search_test.mocks.dart';

@GenerateMocks([PoliticiansRepositoryInterface])
void main() {
  late PoliticiansRepositoryInterface politiciansRepository;
  late PoliticiansController politiciansController;

  setUp(() {
    politiciansRepository = MockPoliticiansRepositoryInterface();
    politiciansController = PoliticiansController(politiciansRepository);
  });

  test('Ao consultar os políticos pelo nome, retorna uma lista de políticos', () async {
    // Arrange
    const search = 'Henrique';

    when(politiciansController.searchPoliticians(search))
      .thenAnswer((_) => Future.value([
        PoliticianSearchModel(id: 1, name: 'Henrique Félix', email: 'henriquefelix@mail.com', politicalParty: 'PHF', uf: 'MG', photo: 'photo1.jpg'),
        PoliticianSearchModel(id: 1, name: 'Pedro Henrique', email: 'pedrohenrique@mail.com', politicalParty: 'PPH', uf: 'RJ', photo: 'photo2.jpg'),
        PoliticianSearchModel(id: 1, name: 'Carlos Henrique', email: 'carloshenrique@mail.com', politicalParty: 'PCH', uf: 'SP', photo: 'photo3.jpg')
      ]));

    // Act
    final response = await politiciansController.searchPoliticians(search);

    // Assert
    expect(response.length, 3);
  });
}