import 'package:flutter/material.dart';

import '../components/info_data_item/info_data_item_widget.dart';
import '../../../core/models/detailed_politician/detailed_politician_model.dart';
import '../../../core/extensions/datetime_extensions.dart';

class CandidacyInfoSubPage extends StatelessWidget {
  final DetailedPoliticianModel detailedPolitician;

  const CandidacyInfoSubPage({
    Key? key,
    required this.detailedPolitician
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(height: 16.0);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        InfoDataItemWidget(
          label: 'Nome Eleitoral',
          data: detailedPolitician.candidacyInfo.electoralName
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Partido',
          data: detailedPolitician.candidacyInfo.politicalParty
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Condição Eleitoral',
          data: detailedPolitician.candidacyInfo.electoralCondition
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Data',
          data: detailedPolitician.candidacyInfo.date.format()
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Situação',
          data: detailedPolitician.candidacyInfo.status
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Gabinete',
          data: 'Prédio ${detailedPolitician.candidacyInfo.parliamentaryOffice.building} - '
          'Sala ${detailedPolitician.candidacyInfo.parliamentaryOffice.room} - '
          'Andar ${detailedPolitician.candidacyInfo.parliamentaryOffice.floor}'
        ),
        
        const SizedBox(height: 16.0),
        
        InfoDataItemWidget(
          label: 'E-mail',
          data: detailedPolitician.candidacyInfo.email
        ),
      ]
    );
  }
}