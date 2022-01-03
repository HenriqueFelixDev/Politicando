import 'package:flutter/material.dart';
import 'package:politicando/app/core/theme/app_text_styles.dart';

class InfoDataItemWidget extends StatelessWidget {
  final String label;
  final String data;
  
  const InfoDataItemWidget({
    Key? key,
    required this.label,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.subtitle),
        Text(data),
      ]
    );
  }
}