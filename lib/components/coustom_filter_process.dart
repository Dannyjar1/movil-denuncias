// import 'package:flutter/material.dart';

// enum ActionCategory { todo, atendida, enProceso, enRevision }

// class ActionButton extends StatelessWidget {
//   final ActionCategory category;
//   final Function(ActionCategory) onPressed;

//   const ActionButton({
//     Key? key,
//     required this.category,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color buttonColor;
//     String buttonText;

//     switch (category) {
//       case ActionCategory.todo:
//         buttonColor = Color(0xFF23A338);
//         buttonText = 'Todo';
//         break;
//       case ActionCategory.atendida:
//         buttonColor = Color(0xFF23A338);
//         buttonText = 'Atendida';
//         break;
//       case ActionCategory.enProceso:
//         buttonColor = Color(0xFF23A338);
//         buttonText = 'En Proceso';
//         break;
//       case ActionCategory.enRevision:
//         buttonColor = Color(0xFF23A338);
//         buttonText = 'En Revisión';
//         break;
//     }

//     return DropdownButton<ActionCategory>(
//       value: category,
//       onChanged: (ActionCategory? newValue) {
//         if (newValue != null) {
//           onPressed(newValue);
//         }
//       },
//       items: ActionCategory.values.map((ActionCategory value) {
//         return DropdownMenuItem<ActionCategory>(
//           value: value,
//           child: Text(
//             value == ActionCategory.todo ? 'Todo' : value.toString().split('.').last,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }








// import 'package:flutter/material.dart';

// enum ActionCategory { todo, atendida, enProceso, enRevision }

// class ActionButton extends StatefulWidget {
//   final ActionCategory category;
//   final Function(ActionCategory) onPressed;

//   const ActionButton({
//     Key? key,
//     required this.category,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   _ActionButtonState createState() => _ActionButtonState();
// }

// class _ActionButtonState extends State<ActionButton> {
//   late ActionCategory _selectedCategory;

//   @override
//   void initState() {
//     super.initState();
//     _selectedCategory = widget.category;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<ActionCategory>(
//       value: _selectedCategory,
//       onChanged: (ActionCategory? newValue) {
//         if (newValue != null) {
//           setState(() {
//             _selectedCategory = newValue;
//           });
//           widget.onPressed(newValue);
//         }
//       },
//       items: ActionCategory.values.map((ActionCategory value) {
//         return DropdownMenuItem<ActionCategory>(
//           value: value,
//           child: Text(
//             _getActionCategoryText(value),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   String _getActionCategoryText(ActionCategory category) {
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
//         return '';
//     }
//   }
// }


import 'package:flutter/material.dart';

enum ActionCategory { todo, atendida, enProceso, enRevision }

class ActionButton extends StatefulWidget {
  final ActionCategory category;
  final Function(ActionCategory) onPressed;

  const ActionButton({
    Key? key,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  late ActionCategory _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.category;
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
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ActionCategory>(
          value: _selectedCategory,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down_circle, color: Colors.blueAccent),
          onChanged: (ActionCategory? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedCategory = newValue;
              });
              widget.onPressed(newValue);
            }
          },
          items: ActionCategory.values.map((ActionCategory value) {
            return DropdownMenuItem<ActionCategory>(
              value: value,
              child: Text(
                _getActionCategoryText(value),
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            );
          }).toList(),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }

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
}
