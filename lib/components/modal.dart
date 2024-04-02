////////////////////////////////////////////////////////////Funcional ///////////////////////////////////////////////
import 'package:flutter/material.dart';

enum ActionCategory { todo, atendida, enProceso, enRevision }

class FilterModal extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilter;

  const FilterModal({Key? key, required this.onFilter}) : super(key: key);

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  String selectedCategory = 'Todas las Categorías';
  ActionCategory selectedState = ActionCategory.todo;
  
  // Categorías disponibles para el filtro
  final categories = <String>[
    'Todas las Categorías',
    'Agua Potable, Alcantarillado Sanitario, Alcantarillado Pluvial',
    'Recolección de Desechos y Saneamiento Ambiental',
    'Movilidad Urbana: Bacheo de Calles, Frecuencias, Obstrucciones de aceras, etc.',
    'Obstrucción de vías por construcciones, ornato, permisos de construcción',
  ];

  String _getActionCategoryText(ActionCategory category) {
    switch (category) {
      case ActionCategory.todo:
        return 'Todo';
      case ActionCategory.atendida:
        return 'Atendida';
      case ActionCategory.enProceso:
        return 'En Proceso';
      case ActionCategory.enRevision:
        return 'En Revisión';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DropdownButton<String>(
            isExpanded: true,
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Wrap(
            children: ActionCategory.values.map((state) {
              return ChoiceChip(
                label: Text(_getActionCategoryText(state)),
                selected: selectedState == state,
                onSelected: (bool selected) {
                  setState(() {
                    selectedState = state;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Aplicar Filtro'),
            onPressed: () {
              widget.onFilter({
                'selectedCategory': selectedCategory,
                'selectedState': _getActionCategoryText(selectedState),
              });
            },
          ),
        ],
      ),
    );
  }
}
