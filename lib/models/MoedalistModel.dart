import 'package:cotacaomoeda/const/const.dart';

class MoedaListModel{
  String code = '';
  double bid = 0;

  MoedaListModel({required this.code, required this.bid});

  MoedaListModel.fromJson(JsonMap json){
    this.code = json['code'];
    this.bid = double.parse(json['bid']);
  }
}