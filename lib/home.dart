import 'package:flutter/material.dart';
import 'type.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String difficulty = "Easy";
  int bestWpm = 0;
  double accuracy = 0;

  void check() async{
    final result=await Navigator.push(context,MaterialPageRoute(builder: (context)=>Type(difficulty: difficulty),
    ),
    );
     if(result !=null){
      setState(() {
        
      
      int newwpm=result["wpm"];
      double newaccuracy=result["accuracy"];
      if(bestWpm<newwpm){
      bestWpm=newwpm;
      }
      accuracy=newaccuracy;
      });
     }
  }
  @override
  Widget build(BuildContext context) {
    return dark(context);
  }

  Scaffold dark(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 17, 237, 241),
      title: const Text("FLASH CHECK",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Card(
             color: const Color.fromARGB(255, 195, 228, 104),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child:Center(
                
              child: Text("BEST WPM: $bestWpm",style: TextStyle(color: Colors.black87),
              ),
              
              ),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            color: const Color.fromARGB(255, 232, 170, 161),
            child:Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text("ACCURACY: ${accuracy.toStringAsFixed(1)}%"),
            ),
            ),
          ),

          const SizedBox(height: 30),

          const Text("CHOOSE YOUR DIFFICULTY LEVEL",textAlign: TextAlign.center,),

          const SizedBox(height: 10),

          Center(
            child: DropdownButton<String>(
              dropdownColor: Colors.tealAccent,
              value: difficulty,
              items: ["Easy", "Medium", "Hard"]
                  .map(
                    (level) => DropdownMenuItem(
                      value: level,
                      child: Text(level),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  difficulty = value!;
                });
              },
            ),
          ),

          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 222, 29, 45),foregroundColor: Colors.deepOrange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Type(difficulty: difficulty),
                ),
              );
            },
            child: const Text("Dare To Fight",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 59, 2, 36)),),
          ),

          const SizedBox(height: 20),

          OutlinedButton(
             style: OutlinedButton.styleFrom(foregroundColor: const Color.fromARGB(255, 221, 122, 222)),
            onPressed: () {},
            child: const Text("Check History",style: TextStyle(color: Color.fromARGB(255, 198, 35, 35)),),
          ),
        ],
      ),
    ),
  );
  }
  
}