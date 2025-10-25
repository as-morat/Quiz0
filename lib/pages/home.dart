import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizo/data/quize_data.dart';
import 'package:quizo/style/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz0 App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28), textAlign: TextAlign.center,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go("/onboarding"),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.network(
              "https://c0.wallpaperflare.com/preview/534/41/125/school-books-young-adult-education.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(50),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: category.keys.length,
                itemBuilder: (context, index) {
                  String categoryName = category.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Align(
                      alignment: Alignment.center,
                      child: buildButton(
                        categoryName,
                        size.width * 0.7,
                        60,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
