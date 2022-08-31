import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:states_widgets_routes/models/languages/language.dart';

class AddLanguage extends StatelessWidget {
  AddLanguage({Key? key}) : super(key: key);

  final Text title = const Text("Nova Linguagem");

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Nome da Linguagem",
                  labelText: "Nome da Linguagem"
                ),
                controller: _nameController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Insira o nome da Linguagem";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Descrição da Linguagem",
                  labelText: "Descrição da Linguagem"
                ),
                controller: _descriptionController,
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Insira a Descrição da Linguagem";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  child: const Text("Gravar"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      Language language = Language(
                        _nameController.text,
                        _descriptionController.text
                      );

                      Navigator.pop(context, language);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}