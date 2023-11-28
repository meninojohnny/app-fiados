import 'package:app_fiado/model/person_model.dart';
import 'package:app_fiado/pages/event_page.dart';
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
    double value = person.value;
    double id = person.id;

    return Card(
      color: const Color.fromARGB(255, 99, 183, 170),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold),),
            Text(value.toString()),
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