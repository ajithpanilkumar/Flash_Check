import 'dart:async';
import 'package:flutter/material.dart';

class Type extends StatefulWidget {
  final String difficulty;

  const Type({super.key, required this.difficulty});

  @override
  State<Type> createState() => TypeState();
}

class TypeState extends State<Type> {
  late String typeContent;
  String userInput = "";

  int timeRemaining=60;
  Timer? timer;

  int wpm = 0;
  double accuracy = 0;

  void finish(){
  Navigator.pop(context,{
    "wpm":wpm,"accuracy":accuracy,});
  }
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setParagraph();
    startTimer();
  }

  void setParagraph() {
    if (widget.difficulty == "Easy") {
      timeRemaining=60;
      typeContent =
          "Kerala is famous for its traditional culture and festivals.";
    } else if (widget.difficulty == "Medium") {
      timeRemaining=40;
      typeContent =
          "Rajadhani Institute of Engineering and Technology is a well structured eco friendly campus.";
    } else {
      timeRemaining=20;
      typeContent =
          "Virat Kohli is widely regarded as one of the greatest cricketers of all time.";
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (timeRemaining == 0) {
        t.cancel();
        calculateResult();
      } else {
        setState(() {
          timeRemaining--;
        });
      }
    });
  }

  void calculateResult() {
    List<String> original = typeContent.split(" ");
    List<String> typed = userInput.split(" ");

    int correct = 0;

    for (int i = 0; i < typed.length && i < original.length; i++) {
      if (typed[i] == original[i]) {
        correct++;
      }
    }

    wpm = correct;

    if (typed.isNotEmpty) {
      accuracy = (correct / typed.length) * 100;
    } else {
      accuracy = 0;
    }
   
    showResultDialog();
  }

  void showResultDialog() {
    showDialog(
      animationStyle:AnimationStyle(
        curve: Curves.easeIn,
        reverseCurve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
      ) ,
      context: context,
      barrierDismissible: false,
      // ignore: avoid_types_as_parameter_names
      builder: (_) => AlertDialog(
        title: const Text("Challenge Completed",style: TextStyle(color: Color.fromARGB(115, 235, 3, 200)),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("WPM: $wpm",style: TextStyle(color:Colors.red ),),
            Text("Accuracy: ${accuracy.toStringAsFixed(2)}%",style: TextStyle(color: Colors.red),),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Back to Home",style: TextStyle(color: Colors.black),),
          )
          
          
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.cyanAccent ,
        title: const Text("FLASH CHECK",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time Remaining: $timeRemaining s",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 201, 137, 142),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              typeContent,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              style: TextStyle(color: const Color.fromARGB(255, 7, 37, 234),backgroundColor: const Color.fromARGB(255, 235, 231, 231)),
              controller: controller,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type here...",
                
              ),
              onChanged: (value) {
                userInput = value;
              },
            ),
            const SizedBox(height: 20),
            Text("WPM: $wpm"),
            Text("Accuracy: ${accuracy.toStringAsFixed(2)}%"),
          ],
        ),
      ),
    );
  }
}