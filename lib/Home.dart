import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cep"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("images/location.png")
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  maxLengthEnforced: true,
                  decoration: InputDecoration(
                      labelText: "Digite seu cep, 8 numeros"),
                  controller: _controller,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: RaisedButton(
                  child: Text("Aperte aqui"),
                  onPressed: () async {
                    String cepp = _controller.text;
                    String url = "https://viacep.com.br/ws/$cepp/json/";
                    http.Response response;
                    response = await http.get(url);
                    Map<String, dynamic> retorno = json.decode(response.body);
                    print(retorno);

                    setState(() {
                      _text = " CEP: ${retorno["cep"]}\n LOGRADOURO: ${retorno["logradouro"]}\n LOCALIDADE: ${retorno["localidade"]}\n BAIRRO: ${retorno["bairro"]}";
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(_text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
