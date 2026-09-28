import 'package:flutter/material.dart';
import 'package:latihan_kuis/Model/animals_data.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;
  
  const DetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(animal.image),
              const Text(
                "Animal Detail:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text("Height: ${animal.height}"),
              Text("Weight: ${animal.weight}"),
              const Text(
                "Animal Activities:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: animal.activities.map((activity){
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      activity,
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                }).toList()
              )
            ],
          ),
        )
      ),
    );
  }
}