import 'package:crawler_flutter/data/database.dart';
import 'package:crawler_flutter/data/papel.dart';
import 'package:flutter/material.dart';

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
                  title: Text(item.cPapel),
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
        child: Icon(Icons.add),
        onPressed: () async {
          var exist = await DBProvider.db.find('VVAR3');
          if (exist == Null) {
            Papel vvar3 = await DBProvider.db.vvar3();
            await DBProvider.db.insert(vvar3);
          } else {
            await DBProvider.db.delete(exist.cPapel);
          }
          setState(() {});
        }
      )
    );
  }
}
