import 'package:flutter/material.dart';

import '../components/info_data_item/info_data_item_widget.dart';
import '../../../core/models/detailed_politician/detailed_politician_model.dart';
import '../../../core/extensions/datetime_extensions.dart';

class PersonalInfoSubPage extends StatelessWidget {
  final DetailedPoliticianModel detailedPolitician;
  
  const PersonalInfoSubPage({
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
          label: 'Nome Civil',
          data: detailedPolitician.civilName
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Idade',
          data: '${detailedPolitician.age} anos (${detailedPolitician.birthday.format()})'
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Escolaridade',
          data: detailedPolitician.scholarity
        ),
        
        divider,
        
        InfoDataItemWidget(
          label: 'Local de Nascimento',
          data: '${detailedPolitician.birthdayCity} - ${detailedPolitician.birthdayState}'
        )
      ]
    );
  }
}