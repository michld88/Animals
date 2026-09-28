import 'package:flutter/material.dart';
import 'package:latihan_kuis/Pages/login.dart';
import '../Model/animals_data.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Animal List'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage()
                ),
                (route) => false
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),

      // Isi halaman
      body: GridView.builder(
        padding: const EdgeInsets.all(10),

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),

        itemCount: animals.length,

        itemBuilder: (context, index) {
          Animal animal = animals[index];

          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(animal: animal),
                  ),
                );
              },

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto hewan
                  Expanded(
                    child: Image.network(
                      animal.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Informasi hewan
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          animal.type,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 6),

                        // Activities
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: animal.activities.map((activity) {
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
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}