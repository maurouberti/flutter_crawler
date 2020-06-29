import 'dart:convert';

import 'package:crawler_flutter/data/database.dart';
import 'package:crawler_flutter/data/papel.dart';
import 'package:crawler_flutter/scraper/papel_scraper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crawler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DBProvider.db.all(),
        builder: (BuildContext context, AsyncSnapshot<List<Papel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Papel item = snapshot.data[index];
                return ListTile(
                  leading: Text(item.cPvp.toString()),
                  title: Text(item.cPapel),
                  subtitle: Text(item.cEmpresa),
                  trailing: Text(item.cCotacao.toString()),
                );
              }
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () async {

          var carteira = await rootBundle.loadString('assets/data/carteira.json');
          var papelScraper = new PapelScraper();
          for (var item in jsonDecode(carteira)) {
            String cPapel = item['papel'];
            String createdAt = (new DateTime.now()).toIso8601String().substring(0, 10);
            print(cPapel);
            var cache = await DBProvider.db.findCreatedAt(cPapel, createdAt);
            if (cache == Null) {
              Papel papel = await papelScraper.get(cPapel);
              var exist = await DBProvider.db.find(cPapel);
              if (exist != Null) {
                await DBProvider.db.update(papel);
              } else {
                await DBProvider.db.insert(papel);
              }
              setState(() {});
            }
          }

        }
      )
    );
  }
}
