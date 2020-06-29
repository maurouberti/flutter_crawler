import 'dart:convert';

import 'package:crawler_flutter/data/papel.dart';
import "package:unorm_dart/unorm_dart.dart" as unorm;
import 'package:web_scraper/web_scraper.dart';

class PapelScraper {
  final webScraper = WebScraper('https://www.fundamentus.com.br');

  get(String papel) async {
    var mapPapel = new Map();
    if (await webScraper.loadWebPage('/detalhes.php?papel=' + papel)) {
      List<Map<String, dynamic>> labels = webScraper.getElement('td.label', []);
      List<Map<String, dynamic>> datas = webScraper.getElement('td.data', []);

      mapPapel['created_at'] = (new DateTime.now()).toIso8601String().substring(0, 10);
      mapPapel['c_papel'] = papel;

      labels.asMap().forEach((index, element) {
        RegExp regExpCampo = new RegExp(r'([\u0300-\u036f]|[^0-9a-zA-Z])');
        String campo = 'c_' + unorm.nfkd(element['title']).replaceAllMapped(regExpCampo, (match) => '').toLowerCase();

        RegExp regExpValor = new RegExp(r'[\.%]');
        var valor = datas[index]['title'].replaceAllMapped(regExpValor, (match) => '').trim().replaceAll(',', '.');

        if ((campo != 'c_') && (valor != '') && (valor != '-')) {
          mapPapel[campo] = double.tryParse(valor) != null ? double.tryParse(valor) : valor ;
        }
      });
    }
    return papelFromJson( jsonEncode(mapPapel) );
  }

}