import 'dart:convert';

import 'package:cotacaomoeda/const/const.dart';
import 'package:cotacaomoeda/models/MoedaDetailModel.dart';
import 'package:cotacaomoeda/models/MoedalistModel.dart';
import 'package:http/http.dart' as http;

class MoedaRepositorio{
  static Future<List<MoedaListModel>> getMoeda() async {
    Uri uri = Uri.https('economia.awesomeapi.com.br', '/last/USD-BRL,EUR-BRL,BTC-BRL');

    final http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);

    List<MoedaListModel> moedaListModel = [];

    /*
    (respostaObj['USDBRL'] as Map<String, dynamic>).forEach((key, element) {
      moedaListModel.add(MoedaListModel.fromJson(element as Map<String, dynamic>));
    });*/

    moedaListModel.add(MoedaListModel.fromJson(respostaObj['USDBRL']));
    moedaListModel.add(MoedaListModel.fromJson(respostaObj['EURBRL']));
    moedaListModel.add(MoedaListModel.fromJson(respostaObj['BTCBRL']));

    return moedaListModel;
  }
  static Future<MoedaDetailModel> getMoedaData(String moeda) async{
    Uri uri = Uri.https('economia.awesomeapi.com.br', '/last/${moeda}-BRL');
    http.Response resposta = await http.get(uri);

    return MoedaDetailModel.fromJson(jsonDecode(resposta.body));
  }
}
