// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'resultado.dart';

class QuizPage extends StatefulWidget {
  final String nome;
  const QuizPage({super.key, required this.nome});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List perguntas = [
    {
      "pergunta": "A evolução biológica pode ser definida como:",
      "respostas": [
        "A mudança das espécies ao longo do tempo.",
        "O crescimento dos indivíduos durante a vida.",
        "A adaptação imediata do corpo às necessidades diárias.",
        "A transformação intencional dos organismos.",
      ],
      "correta": 0,
      "imagem": "assets/mokup/pergunta1.webp",
    },
    {
      "pergunta":
          "Segundo a teoria da seleção natural, sobrevivem principalmente os indivíduos que:",
      "respostas": [
        "São mais fortes fisicamente.",
        "São maiores que os outros.",
        "Possuem características mais favoráveis ao ambiente.",
        "Se reproduzem menos.",
      ],
      "correta": 2,
      "imagem": "assets/mokup/pergunta2.jpg",
    },
    {
      "pergunta": "Genótipo é:",
      "respostas": [
        "A aparência externa do indivíduo.",
        "O conjunto de genes de um indivíduo.",
        "O ambiente em que o indivíduo vive.",
        "A característica visível herdada.",
      ],
      "correta": 1,
      "imagem": "assets/mokup/pergunta3.jpg",
    },
    {
      "pergunta": "Fenótipo corresponde:",
      "respostas": [
        "Ao conjunto de cromossomos.",
        "À informação genética invisível.",
        "Às características observáveis de um indivíduo.",
        "Apenas às características dominantes.",
      ],
      "correta": 2,
      "imagem": "assets/mokup/pergunta4.jpg",
    },
    {
      "pergunta": "A Primeira Lei de Mendel afirma que:",
      "respostas": [
        "Os genes se misturam permanentemente.",
        "Cada característica é determinada por dois fatores que se separam na formação dos gametas.",
        "Apenas os genes dominantes são herdados.",
        "As características adquiridas são transmitidas.",
      ],
      "correta": 1,
      "imagem": "assets/mokup/pergunta5.webp",
    },
    {
      "pergunta": "Mutação genética é:",
      "respostas": [
        "Uma mudança permanente no material genético.",
        "A mistura de dois organismos diferentes.",
        "A divisão celular comum.",
        "A adaptação voluntária do organismo.",
      ],
      "correta": 0,
      "imagem": "assets/mokup/pergunta6.webp",
    },
    {
      "pergunta": "A variabilidade genética é importante porque:",
      "respostas": [
        "Impede a evolução.",
        "Garante que todos sejam iguais.",
        "Permite maior chance de adaptação às mudanças ambientais.",
        "Elimina mutações.",
      ],
      "correta": 2,
      "imagem": "assets/mokup/pergunta7.webp",
    },
    {
      "pergunta": "Deriva genética ocorre principalmente:",
      "respostas": [
        "Em populações muito grandes.",
        "Em populações pequenas, de forma aleatória.",
        "Apenas por causa de mutações.",
        "Somente por seleção natural.",
      ],
      "correta": 1,
      "imagem": "assets/mokup/pergunta8.gif",
    },
    {
      "pergunta": "O isolamento geográfico pode levar a:",
      "respostas": [
        "Extinção imediata das espécies.",
        "Mistura genética entre populações.",
        "Diminuição da variabilidade genética obrigatoriamente.",
        "Formação de novas espécies.",
      ],
      "correta": 3,
      "imagem": "assets/mokup/pergunta9.gif",
    },
    {
      "pergunta": "Evolução convergente ocorre quando:",
      "respostas": [
        "Espécies diferentes desenvolvem características semelhantes devido a ambientes parecidos.",
        "Uma espécie dá origem a várias diferentes.",
        "Não há mudança nas espécies.",
        "Ocorre cruzamento entre espécies distintas.",
      ],
      "correta": 0,
      "imagem": "assets/mokup/pergunta10.webp",
    },
  ];

  int index = 0;
  int pontos = 0;
  int? selecionada;

  void responder() {
    if (selecionada == null) return;

    bool acertou = selecionada == perguntas[index]['correta'];
    if (acertou) pontos++;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(acertou ? "Parabéns!!!" : "Ops!!!!"),
        content: Text(acertou ? "Você acertou!!" : "Você errou!!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (index < perguntas.length - 1) {
                setState(() {
                  index++;
                  selecionada = null;
                });
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultadoPage(
                      nome: widget.nome,
                      pontos: pontos,
                      total: perguntas.length,
                    ),
                  ),
                );
              }
            },
            child: Text(
              "Continuar",
              style: TextStyle(
                color: Color.fromARGB(255, 23, 126, 73),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pergunta = perguntas[index];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Pergunta ${index + 1}"),
        backgroundColor: const Color.fromARGB(255, 93, 202, 146),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Exibe a imagem da pergunta
            if (pergunta['imagem'] != null)
              Image.asset(pergunta['imagem'], height: 150),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Text(pergunta['pergunta'], style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(
                pergunta['respostas'].length,
                (i) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: RadioListTile<int>(
                    title: Text(pergunta['respostas'][i]),
                    value: i,
                    groupValue: selecionada,
                    onChanged: (int? value) {
                      setState(() {
                        selecionada = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 130, 231, 159),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: responder,
              child: Text("Responder"),
            ),
          ],
        ),
      ),
    );
  }
}
