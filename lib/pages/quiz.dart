import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizo/style/style.dart';
import '../data/quize_data.dart';

class Quiz extends StatefulWidget {
  final String categoryName;
  const Quiz({super.key, required this.categoryName});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late List<Map<String, Object>> questions;
  int currentIndex = 0;
  String? selectedOption;
  int score = 0;

  @override
  void initState() {
    super.initState();
    questions = List<Map<String, Object>>.from(category[widget.categoryName]!);
  }

  void nextQuestion() {
    if (selectedOption == questions[currentIndex]['answer']) score++;
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
      });
    }
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        selectedOption = null;
      });
    }
  }

  void finishQuiz() {
    if (selectedOption == questions[currentIndex]['answer']) score++;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        title: Center(
          child: Text(
            "Quiz Completed!",
            style: myText(36, weight: FontWeight.bold).copyWith(color: Colors.deepOrange),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Your Score:", style: myText(26, weight: FontWeight.w600).copyWith(color: Colors.orange),
            ),
            const SizedBox(height: 10),
            Text(
              "$score",
              style: myText(32, weight: FontWeight.bold).copyWith(color: score == questions.length ? Colors.green.shade900: (score >= questions.length - 2 ? Colors.teal : (score >= questions.length - 4 ? Colors.lime : Colors.red))),
            ),
            const SizedBox(height: 10),
            Text(
              "Out of ${questions.length}",
              style: myText(22, weight: FontWeight.w700).copyWith(color: Colors.green.shade400),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              onPressed: () => context.go('/home'),
              child: Text("Go Home", style: myText(16, weight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];
    final options = List<String>.from(question['options'] as List);
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.categoryName} Quiz", style: myText(28, weight: FontWeight.bold), textAlign: TextAlign.center,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${currentIndex + 1}/${questions.length}",
                      style: myText(18, weight: FontWeight.w800),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      question['question'] as String,
                      style: myText(22, weight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ...options.map(
                          (option) => RadioListTile<String>(
                        title: Text(option, style: myText(16, weight: FontWeight.w500)),
                        value: option,
                        groupValue: selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: isLandscape ? 0 : 360, top: isLandscape ? 20 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myButtonStyle("Previous", currentIndex > 0 ? prevQuestion : null),
                  if (currentIndex < questions.length - 1)
                    myButtonStyle("Next", selectedOption != null ? nextQuestion : null)
                  else
                    myButtonStyle("Finish", selectedOption != null ? finishQuiz : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
