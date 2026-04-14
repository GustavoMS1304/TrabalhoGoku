import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const CalculadoraPage(),
    );
  }
}

// Widget do Display
class Display extends StatelessWidget {
  final String expressao;
  final String resultado;

  const Display({super.key, required this.expressao, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(expressao, style: const TextStyle(color: Colors.grey, fontSize: 22)),
          const SizedBox(height: 8),
          Text(resultado, style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Widget do Botão
class BotaoCalculadora extends StatelessWidget {
  final String texto;
  final Color cor;
  final Color textoCor;
  final VoidCallback onPressed;

  const BotaoCalculadora({
    super.key,
    required this.texto,
    required this.onPressed,
    this.cor = Colors.grey,
    this.textoCor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cor,
            foregroundColor: textoCor,
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: onPressed,
          child: Text(texto, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

// Página principal
class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _expressao = '';
  String _resultado = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operacao = '';
  bool _novaOperacao = false;

  void _inserirNumero(String numero) {
    setState(() {
      if (_novaOperacao) {
        _expressao = numero;
        _novaOperacao = false;
      } else {
        _expressao += numero;
      }
      _resultado = _expressao;
    });
  }

  void _inserirOperacao(String op) {
    setState(() {
      _num1 = double.tryParse(_expressao) ?? 0;
      _operacao = op;
      _expressao += ' $op ';
      _novaOperacao = false;
    });
  }

  void _calcular() {
    setState(() {
      String partes = _expressao.split(' ').last;
      _num2 = double.tryParse(partes) ?? 0;

      double res = 0;
      switch (_operacao) {
        case '+': res = _num1 + _num2; break;
        case '-': res = _num1 - _num2; break;
        case 'x': res = _num1 * _num2; break;
        case '/': res = _num2 != 0 ? _num1 / _num2 : 0; break;
      }

      _resultado = res % 1 == 0 ? res.toInt().toString() : res.toStringAsFixed(2);
      _expressao = '$_expressao = $_resultado';
      _novaOperacao = true;
    });
  }

  void _limpar() {
    setState(() {
      _expressao = '';
      _resultado = '0';
      _num1 = 0;
      _num2 = 0;
      _operacao = '';
      _novaOperacao = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Display(expressao: _expressao, resultado: _resultado),
            const Spacer(),
            // Botões
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(children: [
                    BotaoCalculadora(texto: 'C', cor: Colors.redAccent, onPressed: _limpar),
                    BotaoCalculadora(texto: '+/-', cor: Colors.blueGrey, onPressed: () {}),
                    BotaoCalculadora(texto: '%', cor: Colors.blueGrey, onPressed: () => _inserirOperacao('%')),
                    BotaoCalculadora(texto: '/', cor: Colors.orange, onPressed: () => _inserirOperacao('/')),
                  ]),
                  Row(children: [
                    BotaoCalculadora(texto: '7', onPressed: () => _inserirNumero('7')),
                    BotaoCalculadora(texto: '8', onPressed: () => _inserirNumero('8')),
                    BotaoCalculadora(texto: '9', onPressed: () => _inserirNumero('9')),
                    BotaoCalculadora(texto: 'x', cor: Colors.orange, onPressed: () => _inserirOperacao('x')),
                  ]),
                  Row(children: [
                    BotaoCalculadora(texto: '4', onPressed: () => _inserirNumero('4')),
                    BotaoCalculadora(texto: '5', onPressed: () => _inserirNumero('5')),
                    BotaoCalculadora(texto: '6', onPressed: () => _inserirNumero('6')),
                    BotaoCalculadora(texto: '-', cor: Colors.orange, onPressed: () => _inserirOperacao('-')),
                  ]),
                  Row(children: [
                    BotaoCalculadora(texto: '1', onPressed: () => _inserirNumero('1')),
                    BotaoCalculadora(texto: '2', onPressed: () => _inserirNumero('2')),
                    BotaoCalculadora(texto: '3', onPressed: () => _inserirNumero('3')),
                    BotaoCalculadora(texto: '+', cor: Colors.orange, onPressed: () => _inserirOperacao('+')),
                  ]),
                  Row(children: [
                    BotaoCalculadora(texto: '0', onPressed: () => _inserirNumero('0')),
                    BotaoCalculadora(texto: '.', onPressed: () => _inserirNumero('.')),
                    BotaoCalculadora(texto: '⌫', cor: Colors.blueGrey, onPressed: () {
                      setState(() {
                        if (_expressao.isNotEmpty) {
                          _expressao = _expressao.substring(0, _expressao.length - 1);
                          _resultado = _expressao.isEmpty ? '0' : _expressao;
                        }
                      });
                    }),
                    BotaoCalculadora(texto: '=', cor: Colors.green, onPressed: _calcular),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}