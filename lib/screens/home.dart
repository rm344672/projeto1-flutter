import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:states_widgets_routes/models/languages/language.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> languages = [];

  List<String> choices = ["Android Nativo", "IOS Nativo", "Flutter", "React Native", "PWA", "Ionic"];
  Widget title = const Text("Minhas linguagens");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _goToAddLanguage
          )
        ]
      ),
      body: Column(children: [
        Wrap(
          spacing: 10,
          children: buildChoices()
        ),
        Expanded(child: ListView(children: 
          buildItemsList()
          ))
      ]),
    );
  }

  void _goToAddLanguage(){
    Future future = Navigator.pushNamed(context, "/add");
    future.then((Language) => setState((){
      languages.add(Language);
    }));
  }

  List<Widget> buildItemsList(){
    return languages
    .where((l) => l.select)
    .map((l) => Card(
      child: ListTile(
        leading: Icon(l.icon),
        title: Text(l.title),
        subtitle: Text(l.subTitle),
      ),
    )).toList();
  }

  List<Widget> buildChoices(){
    return languages.map((l) => ChoiceChip(
      label: Text(l.title),
      selected: l.select,
      onSelected: (value) => setState(() {
        l.select = value;
      })
    )).toList();
  }
}