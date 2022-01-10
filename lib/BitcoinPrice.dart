import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinPrice extends StatefulWidget {
  const BitcoinPrice({Key? key}) : super(key: key);

  @override
  _BitcoinPriceState createState() => _BitcoinPriceState();
}

class _BitcoinPriceState extends State<BitcoinPrice> {

  String valor = "";

  void bitPrice() async {
    var url = Uri.parse('https://blockchain.info/ticker');
    var response = await http.get(url);
    var price = jsonDecode(response.body) as Map<String, dynamic>;

    setState(() {
      valor = price["USD"]["last"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "imagens/bitcoin.png",
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: Text(
                "\$ ${valor}",
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange
              ),
              onPressed: bitPrice,
              child: const Text(
                "Atualizar",
              ),
            )
          ],
        ),
      ),
    );
  }
}
