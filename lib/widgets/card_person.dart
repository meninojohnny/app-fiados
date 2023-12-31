import 'package:app_fiado/model/person_model.dart';
import 'package:flutter/material.dart';

class CardPerson extends StatelessWidget {
  final Function onRemove;
  final PersonModel person;

  const CardPerson({
    super.key,
    required this.onRemove, 
    required this.person,
  });

  @override
  Widget build(BuildContext context) {

    String name = person.name;
    String value = person.value;
    double id = person.id;

    return Card(
      color: const Color.fromRGBO(234, 224, 213, 1),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
            Text('R\$ $value', style: TextStyle(color: const Color.fromARGB(255, 13, 103, 16)),),
            IconButton(
              onPressed: () {onRemove(id);}, 
              icon: const Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}