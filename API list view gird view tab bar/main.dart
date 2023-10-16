import 'package:flutter/material.dart';
import 'package:projet/model/post_model.dart';
import 'package:projet/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
      ),
      body: FutureBuilder(
          future: getPost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Product> product = snapshot.data;
              return ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: Image.network(
                          product[index].thumbnail,
                          width: 100,
                        ),
                        title: Text(product[index].title),
                        subtitle: Row(
                          children: [
                            Expanded(child: Text(product[index].description)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(product[index].price.toString()),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
