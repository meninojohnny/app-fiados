import 'package:flutter/material.dart';

class PersonForm extends StatelessWidget {
  final Function(String, String) onSubmitted;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  PersonForm({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Align(
            child: Text(
              'Adicionar novo evento', 
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Nome:'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: valueController,
            decoration: const InputDecoration(
              hintText: 'Valor:'
            ),
          ),
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => onSubmitted(
                nameController.text, 
                valueController.text,
              ), 
              child: const Text('Adicionar Pessoa'),
            ),
          ),
        ],
      ),
    );;
  }
}