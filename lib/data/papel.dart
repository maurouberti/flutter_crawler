import 'dart:convert';

Papel papelFromJson(String str) {
  final jsonData = json.decode(str);
  return Papel.fromMap(jsonData);
}

String papelToJson(Papel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Papel {
  String createdAt;
  String cPapel;
  num cCotacao;
  String cTipo;
  String cDataultcot;
  String cEmpresa;
  num cMin52sem;
  String cSetor;
  num cMax52sem;
  String cSubsetor;
  num cVolmed2m;
  num cValordemercado;
  String cUltbalancoprocessado;
  num cValordafirma;
  num cNroacoes;
  num cDia;
  num cPl;
  num cLpa;
  num cMes;
  num cPvp;
  num cVpa;
  num c30dias;
  num cPebit;
  num cMargbruta;
  num c12meses;
  num cPsr;
  num cMargebit;
  num c2020;
  num cPativos;
  num cMargliquida;
  num c2019;
  num cPcapgiro;
  num cEbitativo;
  num c2018;
  num cPativcircliq;
  num cRoic;
  num c2017;
  num cDivyield;
  num cRoe;
  num c2016;
  num cEvebitda;
  num cLiquidezcorr;
  num c2015;
  num cEvebit;
  num cDivbrpatrim;
  num cCresrec5a;
  num cGiroativos;
  num cAtivo;
  num cDivbruta;
  num cDisponibilidades;
  num cDivliquida;
  num cAtivocirculante;
  num cPatrimliq;
  num cReceitaliquida;
  num cEbit;
  num cLucroliquido;

  Papel({
    this.createdAt,
    this.cPapel,
    this.cCotacao,
    this.cTipo,
    this.cDataultcot,
    this.cEmpresa,
    this.cMin52sem,
    this.cSetor,
    this.cMax52sem,
    this.cSubsetor,
    this.cVolmed2m,
    this.cValordemercado,
    this.cUltbalancoprocessado,
    this.cValordafirma,
    this.cNroacoes,
    this.cDia,
    this.cPl,
    this.cLpa,
    this.cMes,
    this.cPvp,
    this.cVpa,
    this.c30dias,
    this.cPebit,
    this.cMargbruta,
    this.c12meses,
    this.cPsr,
    this.cMargebit,
    this.c2020,
    this.cPativos,
    this.cMargliquida,
    this.c2019,
    this.cPcapgiro,
    this.cEbitativo,
    this.c2018,
    this.cPativcircliq,
    this.cRoic,
    this.c2017,
    this.cDivyield,
    this.cRoe,
    this.c2016,
    this.cEvebitda,
    this.cLiquidezcorr,
    this.c2015,
    this.cEvebit,
    this.cDivbrpatrim,
    this.cCresrec5a,
    this.cGiroativos,
    this.cAtivo,
    this.cDivbruta,
    this.cDisponibilidades,
    this.cDivliquida,
    this.cAtivocirculante,
    this.cPatrimliq,
    this.cReceitaliquida,
    this.cEbit,
    this.cLucroliquido
  });

factory Papel.fromMap(Map<String, dynamic> json) => new Papel(
        createdAt: json["created_at"], 
        cPapel: json["c_papel"], 
        cCotacao: json["c_cotacao"], 
        cTipo: json["c_tipo"], 
        cDataultcot: json["c_dataultcot"], 
        cEmpresa: json["c_empresa"], 
        cMin52sem: json["c_min52sem"], 
        cSetor: json["c_setor"], 
        cMax52sem: json["c_max52sem"], 
        cSubsetor: json["c_subsetor"], 
        cVolmed2m: json["c_volmed2m"], 
        cValordemercado: json["c_valordemercado"], 
        cUltbalancoprocessado: json["c_ultbalancoprocessado"],
        cValordafirma: json["c_valordafirma"], 
        cNroacoes: json["c_nroacoes"], 
        cDia: json["c_dia"], 
        cPl: json["c_pl"], 
        cLpa: json["c_lpa"], 
        cMes: json["c_mes"], 
        cPvp: json["c_pvp"], 
        cVpa: json["c_vpa"], 
        c30dias: json["c_30dias"], 
        cPebit: json["c_pebit"], 
        cMargbruta: json["c_margbruta"], 
        c12meses: json["c_12meses"], 
        cPsr: json["c_psr"], 
        cMargebit: json["c_margebit"], 
        c2020: json["c_2020"], 
        cPativos: json["c_pativos"], 
        cMargliquida: json["c_margliquida"], 
        c2019: json["c_2019"], 
        cPcapgiro: json["c_pcapgiro"], 
        cEbitativo: json["c_ebitativo"], 
        c2018: json["c_2018"], 
        cPativcircliq: json["c_pativcircliq"], 
        cRoic: json["c_roic"], 
        c2017: json["c_2017"], 
        cDivyield: json["c_divyield"], 
        cRoe: json["c_roe"], 
        c2016: json["c_2016"], 
        cEvebitda: json["c_evebitda"], 
        cLiquidezcorr: json["c_liquidezcorr"], 
        c2015: json["c_2015"], 
        cEvebit: json["c_evebit"], 
        cDivbrpatrim: json["c_divbrpatrim"], 
        cCresrec5a: json["c_cresrec5a"], 
        cGiroativos: json["c_giroativos"], 
        cAtivo: json["c_ativo"], 
        cDivbruta: json["c_divbruta"], 
        cDisponibilidades: json["c_disponibilidades"], 
        cDivliquida: json["c_divliquida"], 
        cAtivocirculante: json["c_ativocirculante"], 
        cPatrimliq: json["c_patrimliq"], 
        cReceitaliquida: json["c_receitaliquida"], 
        cEbit: json["c_ebit"], 
        cLucroliquido: json["c_lucroliquido"]
      );

  Map<String, dynamic> toMap() => {
        "created_at": createdAt, 
        "c_papel": cPapel, 
        "c_cotacao": cCotacao, 
        "c_tipo": cTipo, 
        "c_dataultcot": cDataultcot, 
        "c_empresa": cEmpresa, 
        "c_min52sem": cMin52sem, 
        "c_setor": cSetor, 
        "c_max52sem": cMax52sem, 
        "c_subsetor": cSubsetor, 
        "c_volmed2m": cVolmed2m, 
        "c_valordemercado": cValordemercado, 
        "c_ultbalancoprocessado": cUltbalancoprocessado, 
        "c_valordafirma": cValordafirma, 
        "c_nroacoes": cNroacoes, 
        "c_dia": cDia, 
        "c_pl": cPl, 
        "c_lpa": cLpa, 
        "c_mes": cMes, 
        "c_pvp": cPvp, 
        "c_vpa": cVpa, 
        "c_30dias": c30dias, 
        "c_pebit": cPebit, 
        "c_margbruta": cMargbruta, 
        "c_12meses": c12meses, 
        "c_psr": cPsr, 
        "c_margebit": cMargebit, 
        "c_2020": c2020, 
        "c_pativos": cPativos, 
        "c_margliquida": cMargliquida, 
        "c_2019": c2019, 
        "c_pcapgiro": cPcapgiro, 
        "c_ebitativo": cEbitativo, 
        "c_2018": c2018, 
        "c_pativcircliq": cPativcircliq, 
        "c_roic": cRoic, 
        "c_2017": c2017, 
        "c_divyield": cDivyield, 
        "c_roe": cRoe, 
        "c_2016": c2016, 
        "c_evebitda": cEvebitda, 
        "c_liquidezcorr": cLiquidezcorr, 
        "c_2015": c2015, 
        "c_evebit": cEvebit, 
        "c_divbrpatrim": cDivbrpatrim, 
        "c_cresrec5a": cCresrec5a, 
        "c_giroativos": cGiroativos, 
        "c_ativo": cAtivo, 
        "c_divbruta": cDivbruta, 
        "c_disponibilidades": cDisponibilidades, 
        "c_divliquida": cDivliquida, 
        "c_ativocirculante": cAtivocirculante, 
        "c_patrimliq": cPatrimliq, 
        "c_receitaliquida": cReceitaliquida, 
        "c_ebit": cEbit, 
        "c_lucroliquido": cLucroliquido
      };
}