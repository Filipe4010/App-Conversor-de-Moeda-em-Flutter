import 'package:flutter/material.dart';
import '../models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final CurrencyModel selectedOption;
  final void Function(CurrencyModel?)? onChanged;

  const CurrencyBox({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedOption,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedOption,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items
                  .map((e) => DropdownMenuItem<CurrencyModel>(
                      value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
