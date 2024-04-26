// import 'package:flutter/material.dart';

// enum ActionCategory { todo, atendida, enProceso, enRevision }

// class FilterModal extends StatefulWidget {
//   final Function(Map<String, dynamic>) onFilter;

//   const FilterModal({Key? key, required this.onFilter}) : super(key: key);

//   @override
//   _FilterModalState createState() => _FilterModalState();
// }

// class _FilterModalState extends State<FilterModal> {
//   String? selectedCategory;
//   Set<ActionCategory> selectedStates = {};

//   final categories = <String>[
//     'Todas las Categorías',
//     'Agua Potable, Alcantarillado Sanitario, Alcantarillado Pluvial',
//     'Recolección de Desechos y Saneamiento Ambiental',
//     'Movilidad Urbana: Bacheo de Calles, Frecuencias, Obstrucciones de aceras, etc.',
//     'Obstrucción de vías por construcciones, ornato, permisos de construcción',
//   ];

//   String _getActionCategoryText(ActionCategory? category) {
//     switch (category) {
//       case ActionCategory.todo:
//         return 'Todo';
//       case ActionCategory.atendida:
//         return 'Atendida';
//       case ActionCategory.enProceso:
//         return 'En Proceso';
//       case ActionCategory.enRevision:
//         return 'En Revisión';
//       default:
//         return 'No seleccionado';
//     }
//   }

//   void _handleStateSelection(ActionCategory state, bool selected) {
//     if (selected) {
//       // Si se selecciona 'Todo', deseleccionar todos los demás y seleccionar solo 'Todo'
//       if (state == ActionCategory.todo) {
//         selectedStates.clear();
//         selectedStates.add(ActionCategory.todo);
//       } else {
//         // Si se selecciona cualquier otra opción, se agrega y se verifica si están todas seleccionadas excepto 'Todo'
//         selectedStates.remove(ActionCategory.todo); // Asegurarse de que 'Todo' no esté seleccionado
//         selectedStates.add(state);

//         if (selectedStates.containsAll(ActionCategory.values.where((v) => v != ActionCategory.todo))) {
//           selectedStates.clear();
//           selectedStates.add(ActionCategory.todo);
//         }
//       }
//     } else {
//       // Manejo de deselección
//       selectedStates.remove(state);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text('Categorías', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Wrap(
//               spacing: 8.0,
//               children: categories.map((category) {
//                 return ChoiceChip(
//                   label: Text(category),
//                   selected: selectedCategory == category,
//                   onSelected: (bool selected) {
//                     setState(() {
//                       if (selected) {
//                         selectedCategory = category;
//                       } else {
//                         selectedCategory = null; // Permite deseleccionar el chip
//                       }
//                     });
//                   },
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             Text('Estado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Wrap(
//               spacing: 8.0,
//               children: ActionCategory.values.map((state) {
//                 return ChoiceChip(
//                   label: Text(_getActionCategoryText(state)),
//                   selected: selectedStates.contains(state),
//                   onSelected: (bool selected) {
//                     setState(() {
//                       _handleStateSelection(state, selected);
//                     });
//                   },
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 child: Text('Aplicar Filtro'),
//                 onPressed: () {
//                   List<String> selectedStatesText = selectedStates.map((state) => _getActionCategoryText(state)).toList();
//                   widget.onFilter({
//                     'selectedCategory': selectedCategory ?? 'No seleccionado',
//                     'selectedStates': selectedStatesText,
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

enum ActionCategory { todo, atendida, enProceso, enRevision }

class FilterModal extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilter;

  const FilterModal({Key? key, required this.onFilter}) : super(key: key);

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  Set<String> selectedCategories = {};
  Set<ActionCategory> selectedStates = {};

  final categories = <String>[
    'Todas las Categorías',
    'Agua Potable, Alcantarillado Sanitario, Alcantarillado Pluvial',
    'Recolección de Desechos y Saneamiento Ambiental',
    'Movilidad Urbana: Bacheo de Calles, Frecuencias, Obstrucciones de aceras, etc.',
    'Obstrucción de vías por construcciones, ornato, permisos de construcción',
  ];

  String _getActionCategoryText(ActionCategory? category) {
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
        return 'No seleccionado';
    }
  }




  void _handleStateSelection(ActionCategory state, bool selected) {
    setState(() {
      if (selected) {
        if (state == ActionCategory.todo) {
          selectedStates.clear();
          selectedStates.add(ActionCategory.todo);
        } else {
          selectedStates.remove(ActionCategory.todo);
          selectedStates.add(state);
          if (selectedStates.containsAll(
              ActionCategory.values.where((v) => v != ActionCategory.todo))) {
            selectedStates.clear();
            selectedStates.add(ActionCategory.todo);
          }
        }
      } else {
        selectedStates.remove(state);
      }
    });
  }

  void _handleCategorySelection(String category, bool selected) {
    setState(() {
      if (selected) {
        if (category == categories.first) {
          selectedCategories.clear();
          selectedCategories.add(categories.first);
        } else {
          selectedCategories.remove(categories.first);
          selectedCategories.add(category);
          if (selectedCategories.length == categories.length - 1) {
            selectedCategories.clear();
            selectedCategories.add(categories.first);
          }
        }
      } else {
        selectedCategories.remove(category);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Categorías',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: categories.map((category) {
                return ChoiceChip(
                  label: Text(category),
                  selected: selectedCategories.contains(category),
                  onSelected: (bool selected) {
                    _handleCategorySelection(category, selected);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Estado',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: ActionCategory.values.map((state) {
                return ChoiceChip(
                  label: Text(_getActionCategoryText(state)),
                  selected: selectedStates.contains(state),
                  onSelected: (bool selected) {
                    _handleStateSelection(state, selected);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Center(
            //   child: ElevatedButton(
            //     child: Text('Aplicar Filtro'),
            //     onPressed: () {
            //       List<String> selectedStatesText = selectedStates.map((state) => _getActionCategoryText(state)).toList();
            //       widget.onFilter({
            //         'selectedCategories': selectedCategories.toList(),
            //         'selectedStates': selectedStatesText,
            //       });
            //     },
            //   ),
            // ),

            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.filter_list), // Ícono de filtro
                label: Text('Aplicar Filtro'),
                onPressed: () {
                  List<String> selectedStatesText = selectedStates
                      .map((state) => _getActionCategoryText(state))
                      .toList();
                  widget.onFilter({
                    'selectedCategories': selectedCategories.toList(),
                    'selectedStates': selectedStatesText,
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
