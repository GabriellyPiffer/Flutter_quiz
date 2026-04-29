import 'package:flutter/material.dart';
import 'splash.dart';

class ResultadoPage extends StatelessWidget {
  final String nome;
  final int pontos;
  final int total;

  const ResultadoPage({
    super.key,
    required this.nome,
    required this.pontos,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    int erros = total - pontos;
    double percentual = (pontos / total) * 100;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 93, 202, 146),
              const Color.fromARGB(255, 23, 126, 73),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_events, size: 90, color: Colors.white),
              SizedBox(height: 20),
              Text(
                "Resultado Final",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "$nome, você acertou $pontos de $total",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Erros: $erros",
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Percentual de acertos: ${percentual.toStringAsFixed(1)}%",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 93, 202, 146),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SplashPage()),
                  );
                },
                child: Text(
                  "Recomeçar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
