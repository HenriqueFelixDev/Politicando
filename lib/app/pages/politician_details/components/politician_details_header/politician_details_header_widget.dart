import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/detailed_politician/detailed_politician_model.dart';
import '../../../../core/theme/app_text_styles.dart';

class PoliticianDetailsHeaderWidget extends StatelessWidget {
  final DetailedPoliticianModel detailedPolitician;

  const PoliticianDetailsHeaderWidget({
    Key? key,
    required this.detailedPolitician
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: detailedPolitician.photo,
            width: 150.0,
            height: 150.0,
            fit: BoxFit.cover
          ),

          const SizedBox(width: 16.0),
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(detailedPolitician.civilName, style: AppTextStyles.title),
                      Text('${detailedPolitician.age} anos', style: AppTextStyles.subtitle),
                      Text('${detailedPolitician.candidacyInfo.politicalParty} - ${detailedPolitician.candidacyInfo.uf}')
                    ],
                  ),
                ]
              )
            )
          )
        ]
      )
    );
  }
}