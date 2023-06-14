import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: ', ${value.split(',')[1]}',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
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
