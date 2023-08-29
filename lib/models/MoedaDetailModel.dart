import 'package:cotacaomoeda/const/const.dart';

class MoedaDetailModel{
  String code = '';
  double bid = 0;

  MoedaDetailModel({required this.code, required this.bid});

  MoedaDetailModel.fromJson(JsonMap json){
    this.code = json['code'];
    this.bid = json['bid'];
  }
}