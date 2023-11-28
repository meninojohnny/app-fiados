import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  final Function(String, String) onSubmitted;
  const EventForm({super.key, required this.onSubmitted});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool buttonHabilit = false;

  void onChanged(value) {
    String title = titleController.text;
    String date = dateController.text;
    if (title == '' || date == '') {
      buttonHabilit = false;
    } else {
      buttonHabilit = true;
    }
    setState(() {});
  }

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
            onChanged: onChanged,
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Titulo do Evento:'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            onChanged: onChanged,
            controller: dateController,
            decoration: const InputDecoration(
              hintText: 'Data do Evento:'
            ),
          ),
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonHabilit ? Colors.blue : null
              ),
              onPressed: () => widget.onSubmitted(
                titleController.text, 
                dateController.text,
              ), 
              child: const Text(
                'Adicionar Evento',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}