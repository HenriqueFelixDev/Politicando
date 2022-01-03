import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String> onSearch;
  final FocusNode? focusNode;
  
  final TextEditingController controller;

  SearchTextFieldWidget({
    Key? key,
    required this.onSearch,
    required this.controller,
    this.focusNode
  }) : super(key: key);

  void _onSearchPressed() {
    onSearch(controller.text);
    focusNode?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.search,
      onEditingComplete: _onSearchPressed,
      decoration: InputDecoration(
        hintText: 'Pesquisar Políticos',
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: _onSearchPressed
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0))
      ),
    );
  }
}