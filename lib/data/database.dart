import 'dart:io';

import 'package:crawler_flutter/data/papel.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;
  Future<Database> get database async {
    if (_database != null)
    return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "fundamentus.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE papeis ("
          "created_at TEXT,"
          "c_papel TEXT NOT NULL PRIMARY KEY,"
          "c_cotacao REAL,"
          "c_tipo TEXT,"
          "c_dataultcot TEXT,"
          "c_empresa TEXT,"
          "c_min52sem REAL,"
          "c_setor TEXT,"
          "c_max52sem REAL,"
          "c_subsetor TEXT,"
          "c_volmed2m REAL,"
          "c_valordemercado REAL,"
          "c_ultbalancoprocessado TEXT,"
          "c_valordafirma REAL,"
          "c_nroacoes REAL,"
          "c_dia REAL,"
          "c_pl REAL,"
          "c_lpa REAL,"
          "c_mes REAL,"
          "c_pvp REAL,"
          "c_vpa REAL,"
          "c_30dias REAL,"
          "c_pebit REAL,"
          "c_margbruta REAL,"
          "c_12meses REAL,"
          "c_psr REAL,"
          "c_margebit REAL,"
          "c_2020 REAL,"
          "c_pativos REAL,"
          "c_margliquida REAL,"
          "c_2019 REAL,"
          "c_pcapgiro REAL,"
          "c_ebitativo REAL,"
          "c_2018 REAL,"
          "c_pativcircliq REAL,"
          "c_roic REAL,"
          "c_2017 REAL,"
          "c_divyield REAL,"
          "c_roe REAL,"
          "c_2016 REAL,"
          "c_evebitda REAL,"
          "c_liquidezcorr REAL,"
          "c_2015 REAL,"
          "c_evebit REAL,"
          "c_divbrpatrim REAL,"
          "c_cresrec5a REAL,"
          "c_giroativos REAL,"
          "c_ativo REAL,"
          "c_divbruta REAL,"
          "c_disponibilidades REAL,"
          "c_divliquida REAL,"
          "c_ativocirculante REAL,"
          "c_patrimliq REAL,"
          "c_receitaliquida REAL,"
          "c_ebit REAL,"
          "c_lucroliquido real"
          ")");
    });
  }

  Future<Papel> vvar3() async {
    String jsonString = await rootBundle.loadString('assets/data/vvar3.json');
    Papel papel = papelFromJson(jsonString);
    return papel;
  }

  find(String papel) async {
    final db = await database;
    var res = await  db.query("papeis", where: "c_papel = ?", whereArgs: [papel]);
    return res.isNotEmpty ? Papel.fromMap(res.first) : Null;
  }

  Future<List<Papel>> all() async {
    final db = await database;
    var res = await db.query("papeis");
    List<Papel> list = res.isNotEmpty ? res.map((c) => Papel.fromMap(c)).toList() : [];
    return list;
  }

  insert(Papel data) async {
    final db = await database;
    var res = await db.insert("papeis", data.toMap());
    return res;
  }

  update(Papel data) async {
    final db = await database;
    var res = await db.update("papeis", data.toMap(), where: "c_papel = ?", whereArgs: [data.cPapel]);
    return res;
  }

  delete(String papel) async {
    final db = await database;
    db.delete("papeis", where: "c_papel = ?", whereArgs: [papel]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("delete from papeis");
  }
}
