import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  _clickLer(){

  }

  _clickSalvar(){

  }

  _clickExcluir(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _clickLer, child: Text('Ler')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: _clickSalvar, child: Text('Salvar')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: _clickExcluir, child: Text('Excluir'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
