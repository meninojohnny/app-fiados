import 'package:flutter/material.dart';

class PersonForm extends StatefulWidget {
  final Function(String, String) onSubmitted;

  const PersonForm({super.key, required this.onSubmitted});

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  bool buttonHabilit = false;

  void onChanged(value) {
    String name = nameController.text;
    String value = valueController.text;
    if (name == '' || value == '') {
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
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Nome:'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            onChanged: onChanged,
            controller: valueController,
            decoration: const InputDecoration(
              hintText: 'Valor:'
            ),
          ),
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonHabilit ? const Color.fromRGBO(94, 80, 63, 1) : Colors.grey
              ),
              onPressed: () => widget.onSubmitted(
                nameController.text, 
                valueController.text,
              ), 
              child: const Text(
                'Adicionar Pessoa',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}