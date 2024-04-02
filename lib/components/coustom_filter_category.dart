// import 'package:flutter/material.dart';

// class CustomDropdownButton extends StatefulWidget {
//   final String initialValue;
//   final Function(String) onChanged;

//   const CustomDropdownButton({
//     Key? key,
//     required this.initialValue,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
// }

// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   late String _selectedCategory;

//   @override
//   void initState() {
//     super.initState();
//     _selectedCategory = widget.initialValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: _selectedCategory,
//       onChanged: (String? newValue) {
//         if (newValue != null) {
//           setState(() {
//             _selectedCategory = newValue;
//           });
//           widget.onChanged(newValue);
//         }
//       },
//       items: <String>[
//         'Todas las Categorías',
//         'Agua Potable, Alcantarillado Sanitario, Alcantarillado Pluvial',
//         'Recolección de Desechos y Saneamiento Ambiental',
//         'Movilidad Urbana: Bacheo de Calles, Frecuencias, Obstrucciones de aceras, etc.',
//         'Obstrucción de vías por construcciones, ornato, permisos de construcción',
//       ].map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }




import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String initialValue;
  final Function(String) onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCategory,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedCategory = newValue;
              });
              widget.onChanged(newValue);
            }
          },
          items: <String>[
            'Todas las Categorías',
            'Agua Potable, Alcantarillado Sanitario, Alcantarillado Pluvial',
            'Recolección de Desechos y Saneamiento Ambiental',
            'Movilidad Urbana: Bacheo de Calles, Frecuencias, Obstrucciones de aceras, etc.',
            'Obstrucción de vías por construcciones, ornato, permisos de construcción',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black87),
              ),
            );
          }).toList(),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}
