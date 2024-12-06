import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../controller/train_controller.dart';
import '../controller/workout_controller.dart';

class TrainPage extends StatefulWidget {
  const TrainPage({super.key});

  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  final TextEditingController _calorieController = TextEditingController();
  final TextEditingController _workoutTypeController = TextEditingController();
  String _displayText = '';
  final String _textToType = 'Go TO GYM! Start Your Exercises Here!';
  int _currentCharIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypingEffect();
  }

  void _startTypingEffect() {
    Timer.periodic(newMethod(), (timer) {
      setState(() {
        _displayText += _textToType[_currentCharIndex];
        _currentCharIndex++;
        if (_currentCharIndex == _textToType.length) {
          _currentCharIndex = 0;
          _displayText = '';
        }
      });
    });
  }

  Duration newMethod() => Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    _displayText,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[800],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              
              Column(
                children: [
                  
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple[400]!, Colors.deepPurple[900]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.fitness_center, size: 50, color: Colors.white),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Track your progress with detailed metrics!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Row(
                    children: [
                      Expanded(
                        child: _buildSmallCard(
                          icon: Icons.local_drink,
                          label: 'Hydration',
                          value: '2L/day',
                          waterIntakeInfo: 'Hidrasi sangat penting untuk mendukung kinerja tubuh, terutama sebelum dan sesudah berolahraga. Minum air yang cukup membantu menjaga keseimbangan elektrolit, mempercepat pemulihan otot, serta meningkatkan stamina. Pastikan untuk mengonsumsi cukup air setiap hari, terutama saat melakukan aktivitas fisik yang intens.',
                          workoutTimeInfo: 'Pagi hari adalah waktu terbaik untuk berolahraga karena tubuh memiliki energi lebih setelah tidur malam. Selain itu, berolahraga di pagi hari dapat meningkatkan metabolisme, meningkatkan mood, dan memulai hari dengan lebih produktif. Olahraga pagi juga dapat membantu Anda menjaga konsistensi dalam rutinitas kebugaran.',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: _buildSmallCard(
                          icon: Icons.access_time,
                          label: 'Best Time',
                          value: 'Morning',
                          waterIntakeInfo: 'Hidrasi sangat penting untuk mendukung kinerja tubuh, terutama sebelum dan sesudah berolahraga. Minum air yang cukup membantu menjaga keseimbangan elektrolit, mempercepat pemulihan otot, serta meningkatkan stamina. Pastikan untuk mengonsumsi cukup air setiap hari, terutama saat melakukan aktivitas fisik yang intens.',
                          workoutTimeInfo: 'Pagi hari adalah waktu terbaik untuk berolahraga karena tubuh memiliki energi lebih setelah tidur malam. Selain itu, berolahraga di pagi hari dapat meningkatkan metabolisme, meningkatkan mood, dan memulai hari dengan lebih produktif. Olahraga pagi juga dapat membantu Anda menjaga konsistensi dalam rutinitas kebugaran.',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Input Calories Burned:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              TextField(
                controller: _calorieController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter calories burned',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),

              
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Input Workout Type (0 - 3):',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              TextField(
                controller: _workoutTypeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter workout type (0-3)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),

             
              ElevatedButton(
                onPressed: _generateWorkout, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], 
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), 
                  ),
                ),
                child: Text(
                  'Generate Workout Plan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
              ),
              SizedBox(height: 20),

            
              Consumer<TrainController>(
                builder: (context, trainController, child) {
                  if (trainController.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (trainController.workoutPlan == null) {
                    return Center(child: Text('No workout plan generated.'));
                  }

                  
                  List<Map<String, dynamic>> existingExercises =
                      Provider.of<WorkoutController>(context).workoutList;
                  var filteredExercises = trainController.workoutPlan!['workout_details'].where((exercise) {
                    return !existingExercises.any((existing) => existing['exercise_name'] == exercise['exercise_name']);
                  }).toList();

                  return Column(
                    children: filteredExercises.map<Widget>((exercise) {
                      return _buildWorkoutCard(exercise, trainController);
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildWorkoutCard(var exercise, TrainController trainController) {
  String exerciseName = exercise['exercise_name'];
  String exerciseImage = trainController.exerciseImages[exerciseName] ?? 'assets/images/default.png';

  return GestureDetector(
    onTap: () {},
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 0), 
          width: 2, 
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                exerciseImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 12),
            Text(exerciseName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildDetailRow('Max BPM', exercise['Max_BPM'].toString()),
            _buildDetailRow('Avg BPM', exercise['Avg_BPM'].toString()),
            _buildDetailRow('Resting BPM', exercise['Resting_BPM'].toString()),
            _buildDetailRow('Session Duration', '${exercise['Session_Duration']} min'),
            _buildDetailRow('Calories Burned', exercise['Calories_Burned'].toString()),
            _buildDetailRow('Fat Percentage', '${exercise['Fat_Percentage']}%'),
            _buildDetailRow('Water Intake', '${exercise['Water_Intake']} L'),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final workoutController = Provider.of<WorkoutController>(context, listen: false);
                  workoutController.addToWorkout(exercise);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], 
                  padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 50.0), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), 
                  ),
                ),
                child: Text(
                  'Add to Workout', 
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _buildSmallCard({
  required IconData icon,
  required String label,
  required String value,
  required String waterIntakeInfo,
  required String workoutTimeInfo,
}) {
  return GestureDetector(
    onTap: () {
      
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Informasi'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Asupan Air Harian: $waterIntakeInfo'),
                SizedBox(height: 8),
                Text('Waktu yang Tepat untuk Olahraga: $workoutTimeInfo'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[900], 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, 
                  ),
                  foregroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), 
                ),
                child: Text('Tutup'),
              ),
            ],
          );
        },
      );
    },
    child: MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blue[900]!, 
            width: 2, 
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blue[900]), 
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900], 
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600], 
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _onHover(bool isHovering) {
}

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Future<void> _generateWorkout() async {
    final calorie = int.tryParse(_calorieController.text);
    final workoutType = int.tryParse(_workoutTypeController.text);

    if (calorie == null || workoutType == null || calorie <= 0 || workoutType < 0 || workoutType > 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Input tidak valid! Harap masukkan kalori dan jenis latihan yang benar.'))
      );
      return;
    }

    final trainController = Provider.of<TrainController>(context, listen: false);
    try {
      await trainController.generateWorkoutPlan(calorie, workoutType);  
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate workout: $e')),
      );
    }
  }
}