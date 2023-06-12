import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _selectedOption = 'Dharan, Nepal';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          underline: Container(),
          value: _selectedOption,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: <String>[
            'Dharan, Nepal',
            'Kathmandu, Nepal',
            'Gulmi, Nepal',
            'Pokhara, Nepal'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: RichText(
                  text: TextSpan(
                    text: value.split(',')[0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: ', ${value.split(',')[1]}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }
}
