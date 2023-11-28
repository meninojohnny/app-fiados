import 'package:flutter/material.dart';

class EventForm extends StatelessWidget {
  final Function(String, String) onSubmitted;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  EventForm({super.key, required this.onSubmitted});

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
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Titulo do Evento:'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: dateController,
            decoration: const InputDecoration(
              hintText: 'Data do Evento:'
            ),
          ),
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => onSubmitted(
                titleController.text, 
                dateController.text,
              ), 
              child: const Text('Adicionar Evento'),
            ),
          ),
        ],
      ),
    );
  }
}