import 'package:flutter/material.dart';

class Convertir extends StatefulWidget {
  const Convertir({super.key});

  @override
  State<Convertir> createState() => _ConvertirState();
}

class _ConvertirState extends State<Convertir> {
  List<List<double>> factor = [
    [1, 4000, 5000],
    [0.00025, 1, 1.25],
    [0.0002, 0.8, 1]
  ];

  bool pesoI = false;
  bool dolarI = false;
  bool euroI = false;

  bool pesoR = false;
  bool dolarR = false;
  bool euroR = false;

  TextEditingController origen = TextEditingController(text: '0.0');
  TextEditingController resultado = TextEditingController(text: '0.0');

  int indI = 0;
  int indR = 0;

  void cambiarestadoI(String moneda) {
    if (moneda == 'COL') {
      pesoI = pesoI ? false : true;
      if (pesoI == true) {
        dolarI = false;
        euroI = false;
        indI = 0;
      }
    } else if (moneda == 'USD') {
      dolarI == dolarI ? false : true;
      if (dolarI = true) {
        pesoI = false;
        euroI = false;
        indI = 1;
      }
    } else if (moneda == 'EUR') {
      euroI == euroI ? false : true;
      if (euroI = true) {
        pesoI = false;
        dolarI = false;
        indI = 2;
      }
    }
    conversion();

    print(pesoI);
    setState(() {});
  }

  void cambiarestadoR(String moneda) {
    if (moneda == 'COL') {
      pesoR = pesoR ? false : true;
      if (pesoR == true) {
        dolarR = false;
        euroR = false;
        indR = 0;
      }
    } else if (moneda == 'USD') {
      dolarR == dolarR ? false : true;
      if (dolarR = true) {
        pesoR = false;
        euroR = false;
        indR = 1;
      }
    } else if (moneda == 'EUR') {
      euroR == euroR ? false : true;
      if (euroR = true) {
        pesoR = false;
        dolarR = false;
        indR = 2;
      }
    }
    conversion();

    print(pesoR);
    setState(() {});
  }

  void valores(String p) {
    if (origen.text == "0.0") origen.clear();
    origen.text = origen.text + p;
    conversion();
  }

  void conversion() {
    double valorO = double.parse(origen.text);
    print(factor[indR][indI]);
    resultado.text = (valorO * factor[indR][indI]).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Grupo 2 - NRC 2290'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => cambiarestadoI('COL'),
                  child: Monedas(
                    moneda: pesoI,
                    texto: 'COL',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoI('USD'),
                  child: Monedas(
                    moneda: dolarI,
                    texto: 'USD',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoI('EUR'),
                  child: Monedas(
                    moneda: euroI,
                    texto: 'EUR',
                  ),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: origen,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => cambiarestadoR('COL'),
                  child: Monedas(
                    moneda: pesoR,
                    texto: 'COL',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoR('USD'),
                  child: Monedas(
                    moneda: dolarR,
                    texto: 'USD',
                  ),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoR('EUR'),
                  child: Monedas(
                    moneda: euroR,
                    texto: 'EUR',
                  ),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: resultado,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      origen.text = '0.0';
                      resultado.text = '0.0';
                    },
                    child: const Botones(valor: 'C')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => valores('7'),
                    child: const Botones(valor: '7')),
                GestureDetector(
                    onTap: () => valores('8'),
                    child: const Botones(valor: '8')),
                GestureDetector(
                    onTap: () => valores('9'),
                    child: const Botones(valor: '9')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => valores('4'),
                    child: const Botones(valor: '4')),
                GestureDetector(
                    onTap: () => valores('5'),
                    child: const Botones(valor: '5')),
                GestureDetector(
                    onTap: () => valores('6'),
                    child: const Botones(valor: '6')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => valores('1'),
                    child: const Botones(valor: '1')),
                GestureDetector(
                    onTap: () => valores('2'),
                    child: const Botones(valor: '2')),
                GestureDetector(
                    onTap: () => valores('3'),
                    child: const Botones(valor: '3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Botones1(valor: ''),
                GestureDetector(
                    onTap: () => valores('0'),
                    child: const Botones(valor: '0')),
                GestureDetector(
                    onTap: () => valores('.'),
                    child: const Botones(valor: '.')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Monedas extends StatelessWidget {
  const Monedas({Key? key, required this.moneda, required this.texto})
      : super(key: key);

  final bool moneda;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: CircleAvatar(
        backgroundColor: moneda == true
            ? Color.fromARGB(255, 117, 166, 206)
            : Color.fromARGB(255, 160, 157, 150),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final String valor;
  const Botones({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 100,
        height: 65,
        color: Color.fromARGB(255, 44, 129, 199),
        child: Center(
          child: Text(
            valor,
            style: const TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Botones1 extends StatelessWidget {
  final String valor;
  const Botones1({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            valor,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
