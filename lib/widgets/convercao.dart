import 'package:cotacaomoeda/repositorios/moedaRepositorio.dart';
import 'package:cotacaomoeda/widgets/coinSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Convercao extends StatefulWidget {
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();
  Convercao({required this.valor1, super.key});

  @override
  State<Convercao> createState() => _ConvercaoState();
}

class _ConvercaoState extends State<Convercao> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: widget.valor1,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              filled: true,
              label: Text('Valor 1'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          /*TextFormField(
            controller: widget.valor2,
            decoration: InputDecoration(
              filled: true,
              label: Text('Valor 2'),
              contentPadding: EdgeInsets.all(16.0),
              suffix: FutureBuilder(
                future: MoedaRepositorio.getMoeda(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Container();

                  if (!snapshot.hasData)
                    return Container();

                  return CoinSelector(
                    coins: snapshot.data!,
                    onCoinSelect: (coin) {
                      print(coin);
                      setState(() {
                        widget.valor2.text = (double.parse(widget.valor1.text) * coin.bid).toStringAsFixed(2);
                      });
                    },
                  );
                },
              ),
            ),
          ),*/
          FutureBuilder(
            future: MoedaRepositorio.getMoeda(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());

              if (!snapshot.hasData)
                return CircularProgressIndicator();

              return TextFormField(
                controller: widget.valor2,
                decoration: InputDecoration(
                    filled: true,
                    label: Text('Valor 2'),
                    contentPadding: EdgeInsets.all(16.0),
                    suffix:CoinSelector(
                      coins: snapshot.data!,
                      onCoinSelect: (coin) {
                        print(coin);
                        setState(() {
                          widget.valor2.text = (double.parse(widget.valor1.text) * coin.bid).toStringAsFixed(2);
                        });
                      },
                    ),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
