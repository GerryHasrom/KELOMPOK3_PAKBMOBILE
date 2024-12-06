import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import '../controller/gemini_controller.dart';
import '../controller/workout_controller.dart';

class GeminiPredictPage extends StatefulWidget {
  const GeminiPredictPage({super.key});

  @override
  _GeminiPredictPageState createState() => _GeminiPredictPageState();
}

class _GeminiPredictPageState extends State<GeminiPredictPage> {
  final TextEditingController _promptController = TextEditingController();
  List<Map<String, dynamic>> selectedExercises = [];
  List<String> animatedTexts = [
    'Silahkan pilih latihannya, kami akan jelaskan langkah-langkah melakukannya',
    'Kami melakukan yang terbaik dan memberi rekomendasi terbaik',
    'Kami dari GYM Commercial dengan Bung Tama siap menuju dunia modern'
  ];

  int currentTextIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gemini Workout Steps',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, 
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Consumer<GeminiController>(
          builder: (context, geminiController, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                Text(
                  'GYMINI',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),

                
                Text(
                  'Workout Steps and Recommendations',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 20),

                
                SizedBox(
                  height: 80, 
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,  
                    totalRepeatCount: 1,
                    pause: Duration(seconds: 1),
                    onFinished: () {
                      setState(() {
                        
                        currentTextIndex = (currentTextIndex + 1) % animatedTexts.length;
                      });
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        animatedTexts[currentTextIndex],
                        textStyle: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),

               
                Expanded(
                  child: Consumer<WorkoutController>(
                    builder: (context, workoutController, child) {
                      return ListView.builder(
                        itemCount: workoutController.workoutList.length,
                        itemBuilder: (context, index) {
                          var exercise = workoutController.workoutList[index];
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.fitness_center,
                                color: Colors.black,
                              ),
                              title: Text(
                                exercise['exercise_name'],
                                style: TextStyle(fontSize: 18),
                              ),
                              onTap: () {
                                setState(() {
                                  if (!selectedExercises.contains(exercise)) {
                                    selectedExercises.add(exercise);
                                  }
                                });
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),

            
                geminiController.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          itemCount: geminiController.generatedSteps.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  geminiController.generatedSteps[index],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

               
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: _promptController,
                    decoration: InputDecoration(
                      labelText: 'Masukkan Prompt untuk Chat',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                         
                          print('Icon Panah Ditekan');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          geminiController.generateSteps(selectedExercises);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0), 
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Jelaskan Langkah-langkah',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, 
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          print('Tambah latihan baru');
                        },
                        backgroundColor: Colors.black, 
                        foregroundColor: Colors.white, 
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}