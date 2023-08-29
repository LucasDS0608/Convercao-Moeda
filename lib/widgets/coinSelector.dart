import "package:cotacaomoeda/models/MoedalistModel.dart";
import "package:flutter/material.dart";

typedef OnCoinSelect = void Function(MoedaListModel coin);

class CoinSelector extends StatelessWidget {
  final OnCoinSelect onCoinSelect;
  final List<MoedaListModel> coins;

  const CoinSelector({ required this.coins, required this.onCoinSelect, Key? key});

  Widget _buildCoinTile(MoedaListModel coin) {
    return ListTile(
      title: Text(coin.code),
      onTap: () {
        onCoinSelect(coin);
        //Navigator.of(context).pop();
      },
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escolha a moeda'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: this.coins.map((e) {
              return _buildCoinTile(e);
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      _showDialog(context);
    }, child: Text("Escolher moeda"));
  }
}

