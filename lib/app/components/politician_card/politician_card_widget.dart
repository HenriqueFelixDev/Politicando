import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/models/politician_search_model.dart';

class PoliticianCardWidget extends StatelessWidget {
  final PoliticianSearchModel politicianSearch;
  final VoidCallback onPressed;

  const PoliticianCardWidget({
    Key? key,
    required this.politicianSearch,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: CachedNetworkImage(
        imageUrl: politicianSearch.photo,
        width: 60.0,
        height: 60.0
      ),
      title: Text(politicianSearch.name),
      subtitle: Text(politicianSearch.politicalParty),
      trailing: Text(politicianSearch.uf),
    );
  }
}