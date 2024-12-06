import 'package:flutter/material.dart';

class ActivityLogPage extends StatefulWidget {
  @override
  _ActivityLogPageState createState() => _ActivityLogPageState();
}

class _ActivityLogPageState extends State<ActivityLogPage> {
  final List<Map<String, String>> gymMovesets = [
    {
      "name": "Dumbbell Curl",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x10",
      "force": "Pull",
      "grips": "Neutral",
      "mechanic": "Isolation",
      "targetMuscle": "Biceps",
      "description": "Focus on controlled movements to engage the biceps fully."
    },
    {
      "name": "Bench Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Triceps",
      "description": "A key chest exercise that also activates triceps."
    },
    {
      "name": "Squat",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x12",
      "force": "Push",
      "grips": "None",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes",
      "description": "Engages lower body muscles with an emphasis on form."
    },
    {
      "name": "Deadlift",
      "difficulty": "Advanced",
      "measure": "Weight/Reps",
      "sets": "3x5",
      "force": "Pull",
      "grips": "Mixed",
      "mechanic": "Compound",
      "targetMuscle": "Back, Hamstrings",
      "description":
          "Strengthens the back and lower body; requires proper form."
    },
    {
      "name": "Overhead Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Shoulders, Triceps",
      "description":
          "Targets the shoulders; maintain core stability throughout."
    },
    {
      "name": "Lat Pulldown",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Pull",
      "grips": "Wide",
      "mechanic": "Isolation",
      "targetMuscle": "Lats, Biceps",
      "description": "Pull towards chest to activate lats and biceps."
    },
    {
      "name": "Leg Press",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x12",
      "force": "Push",
      "grips": "None",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes",
      "description": "Alternative to squats, focusing on lower body."
    },
    {
      "name": "Seated Row",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Pull",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Back, Biceps",
      "description": "Use controlled movements to target the back."
    },
    {
      "name": "Tricep Extension",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x15",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Isolation",
      "targetMuscle": "Triceps",
      "description": "Isolates triceps; avoid moving the shoulders."
    },
    {
      "name": "Leg Curl",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x12",
      "force": "Pull",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Hamstrings",
      "description": "Focus on hamstrings by pulling weight towards glutes."
    },
    {
      "name": "Dumbell Goblet Reverse Squat",
      "difficulty": "novice",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes",
      "description": "Engages lower body muscles with an emphasis on form."
    },
    {
      "name": "Barbell Curl",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Pull",
      "grips": "Supine",
      "mechanic": "Isolation",
      "targetMuscle": "Biceps",
      "description": "Focus on squeezing the biceps at the top of the movement."
    },
    {
      "name": "Leg Extension",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Push",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Quadriceps",
      "description": "Isolate the quadriceps by extending the legs fully."
    },
    {
      "name": "Incline Dumbbell Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Shoulders, Triceps",
      "description": "Focus on upper chest activation."
    },
    {
      "name": "Cable Tricep Pushdown",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x15",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Isolation",
      "targetMuscle": "Triceps",
      "description": "Keep elbows stationary while pushing the cable down."
    },
    {
      "name": "Bulgarian Split Squat",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "3x10",
      "force": "Push",
      "grips": "None",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes",
      "description": "Unilateral squat to target one leg at a time."
    },
    {
      "name": "Barbell Row",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Pull",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Back, Biceps",
      "description": "Focus on retracting the scapula as you pull the barbell."
    },
    {
      "name": "Dumbbell Lateral Raise",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Isolation",
      "targetMuscle": "Shoulders",
      "description": "Raise the dumbbells to shoulder height, avoid swinging."
    },
    {
      "name": "Chest Fly (Machine or Dumbbell)",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Isolation",
      "targetMuscle": "Chest",
      "description": "Focus on squeezing the chest at the top of the movement."
    },
    {
      "name": "Cable Chest Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Shoulders, Triceps",
      "description": "Use cables for constant tension on the chest."
    },
    {
      "name": "Calf Raises (Standing or Seated)",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x15",
      "force": "Push",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Calves",
      "description":
          "Focus on the full range of motion for maximum calf engagement."
    },
    {
      "name": "Dumbbell Shrugs",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x12",
      "force": "Pull",
      "grips": "Neutral",
      "mechanic": "Isolation",
      "targetMuscle": "Traps",
      "description": "Shrug your shoulders up without bending your elbows."
    },
    {
      "name": "Hip Thrust",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Push",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Glutes",
      "description":
          "Focus on pushing through the heels to fully engage the glutes."
    },
    {
      "name": "Seated Leg Curl",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x12",
      "force": "Pull",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Hamstrings",
      "description": "Focus on pulling the weight towards your glutes."
    },
    {
      "name": "T-Bar Row",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Pull",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Back, Biceps",
      "description": "Keep your back flat and pull the bar towards your torso."
    },
    {
      "name": "Dumbbell Chest Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Shoulders, Triceps",
      "description":
          "Control the dumbbells and press with full range of motion."
    },
    {
      "name": "Skull Crushers",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Isolation",
      "targetMuscle": "Triceps",
      "description": "Lower the weight to your forehead and extend fully."
    },
    {
      "name": "Arnold Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Push",
      "grips": "Neutral to Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Shoulders",
      "description": "Rotate the dumbbells as you press them overhead."
    },
    {
      "name": "Push-Ups",
      "difficulty": "Novice",
      "measure": "Reps",
      "sets": "3x15",
      "force": "Push",
      "grips": "None",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Triceps",
      "description": "Keep a straight line from head to heels."
    },
    {
      "name": "Dumbbell Lunges",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "3x10",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes",
      "description":
          "Step forward and lower into a lunge, then return to standing."
    },
    {
      "name": "Dumbbell Fly",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Isolation",
      "targetMuscle": "Chest",
      "description":
          "Focus on a slow, controlled movement to maximize chest activation."
    },
    {
      "name": "Romanian Deadlift",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Pull",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Hamstrings, Glutes, Lower Back",
      "description":
          "Focus on hinging at the hips while keeping the bar close to your body."
    },
    {
      "name": "Push Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x6",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Shoulders, Triceps",
      "description":
          "A dynamic press that uses leg drive to help with the overhead press."
    },
    {
      "name": "Chest Dip",
      "difficulty": "Intermediate",
      "measure": "Reps",
      "sets": "3x10",
      "force": "Push",
      "grips": "Parallel",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Triceps",
      "description":
          "Lower your body with controlled movements to activate chest and triceps."
    },
    {
      "name": "Barbell Deadlift",
      "difficulty": "Advanced",
      "measure": "Weight/Reps",
      "sets": "4x5",
      "force": "Pull",
      "grips": "Mixed",
      "mechanic": "Compound",
      "targetMuscle": "Back, Hamstrings, Glutes",
      "description": "A foundational lift that targets the posterior chain."
    },
    {
      "name": "Dumbbell Chest Fly",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "3x10",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Isolation",
      "targetMuscle": "Chest",
      "description":
          "Focus on controlling the movement to activate chest muscles effectively."
    },
    {
      "name": "Face Pull",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x12",
      "force": "Pull",
      "grips": "Rope",
      "mechanic": "Isolation",
      "targetMuscle": "Rear Delts, Upper Back",
      "description":
          "Pull the rope towards your face to activate rear delts and upper back."
    },
    {
      "name": "Farmer's Walk",
      "difficulty": "Intermediate",
      "measure": "Distance/Reps",
      "sets": "3x40m",
      "force": "Pull",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Grip, Shoulders, Core",
      "description":
          "Walk with heavy dumbbells or kettlebells to strengthen grip and core."
    },
    {
      "name": "Goblet Squat",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Push",
      "grips": "Neutral",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes",
      "description":
          "Hold a dumbbell or kettlebell in front and squat to engage the lower body."
    },
    {
      "name": "Kettlebell Swing",
      "difficulty": "Intermediate",
      "measure": "Reps",
      "sets": "4x12",
      "force": "Pull",
      "grips": "Kettlebell",
      "mechanic": "Compound",
      "targetMuscle": "Glutes, Hamstrings, Lower Back",
      "description":
          "Swing the kettlebell from the hips to engage the posterior chain."
    },
    {
      "name": "Overhead Squat",
      "difficulty": "Advanced",
      "measure": "Weight/Reps",
      "sets": "3x5",
      "force": "Push",
      "grips": "Overhead",
      "mechanic": "Compound",
      "targetMuscle": "Shoulders, Quadriceps, Core",
      "description":
          "An advanced movement that combines squatting and overhead pressing."
    },
    {
      "name": "Russian Twist",
      "difficulty": "Novice",
      "measure": "Reps",
      "sets": "3x20",
      "force": "Rotational",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Core",
      "description":
          "Engage your obliques by rotating your torso while holding a weight."
    },
    {
      "name": "Barbell Hip Thrust",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Push",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Glutes",
      "description": "Thrust your hips upward to fully engage the glutes."
    },
    {
      "name": "Cable Row",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "4x10",
      "force": "Pull",
      "grips": "Wide",
      "mechanic": "Compound",
      "targetMuscle": "Back, Biceps",
      "description": "Pull the cable towards you to work the back muscles."
    },
    {
      "name": "Cable Bicep Curl",
      "difficulty": "Novice",
      "measure": "Weight/Reps",
      "sets": "3x12",
      "force": "Pull",
      "grips": "Underhand",
      "mechanic": "Isolation",
      "targetMuscle": "Biceps",
      "description":
          "Focus on contracting the biceps while keeping your elbows stationary."
    },
    {
      "name": "Decline Bench Press",
      "difficulty": "Intermediate",
      "measure": "Weight/Reps",
      "sets": "4x8",
      "force": "Push",
      "grips": "Overhand",
      "mechanic": "Compound",
      "targetMuscle": "Chest, Triceps",
      "description":
          "A variation of the bench press that targets the lower chest."
    },
    {
      "name": "Clamshells",
      "difficulty": "Novice",
      "measure": "Reps",
      "sets": "3x15",
      "force": "Push",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Glutes",
      "description":
          "Lie on your side and open your legs to activate the glutes."
    },
    {
      "name": "Jump Squat",
      "difficulty": "Intermediate",
      "measure": "Reps",
      "sets": "4x15",
      "force": "Push",
      "grips": "None",
      "mechanic": "Compound",
      "targetMuscle": "Quadriceps, Glutes, Calves",
      "description": "Perform a squat, then explode upward into a jump."
    },
    {
      "name": "Plank",
      "difficulty": "Novice",
      "measure": "Time",
      "sets": "3x30s",
      "force": "Isometric",
      "grips": "None",
      "mechanic": "Isolation",
      "targetMuscle": "Core",
      "description": "Hold a plank position to engage the entire core."
    },
    {
        "name": "Front Squat",
        "difficulty": "Intermediate",
        "measure": "Weight/Reps",
        "sets": "4x10",
        "force": "Push",
        "grips": "None",
        "mechanic": "Compound",
        "targetMuscle": "Quadriceps, Glutes",
        "description": "Squat with the barbell positioned in front to emphasize the quadriceps."
    },
    {
        "name": "Jump Squats",
        "difficulty": "Intermediate",
        "measure": "Reps",
        "sets": "3x15",
        "force": "Push",
        "grips": "None",
        "mechanic": "Plyometric",
        "targetMuscle": "Quadriceps, Glutes",
        "description": "Explosive jump movements to enhance lower body power."
    },
    {
        "name": "Shrimp Squat",
        "difficulty": "Advanced",
        "measure": "Reps",
        "sets": "3x10",
        "force": "Push",
        "grips": "None",
        "mechanic": "Compound",
        "targetMuscle": "Quadriceps, Glutes",
        "description": "Single-leg squat variation that focuses on balance and quad strength."
    },
    {
        "name": "Farmer's Walk",
        "difficulty": "Intermediate",
        "measure": "Distance/Reps",
        "sets": "3x40m",
        "force": "Pull",
        "grips": "Neutral",
        "mechanic": "Compound",
        "targetMuscle": "Forearms, Shoulders, Core",
        "description": "Walk with heavy weights to challenge grip strength and overall stability."
    },
    {
        "name": "Face Pulls",
        "difficulty": "Novice",
        "measure": "Weight/Reps",
        "sets": "3x15",
        "force": "Pull",
        "grips": "Rope",
        "mechanic": "Isolation",
        "targetMuscle": "Shoulders, Upper Back",
        "description": "Pull the rope towards the face to engage the rear delts and upper back."
    },
    {
        "name": "Overhead Squat",
        "difficulty": "Advanced",
        "measure": "Weight/Reps",
        "sets": "3x8",
        "force": "Push",
        "grips": "Overhead",
        "mechanic": "Compound",
        "targetMuscle": "Shoulders, Quadriceps",
        "description": "A complex squat variation that incorporates overhead stability."
    },
    {
        "name": "Dragon Flags",
        "difficulty": "Advanced",
        "measure": "Reps",
        "sets": "3x5",
        "force": "Core",
        "grips": "None",
        "mechanic": "Isolation",
        "targetMuscle": "Core",
        "description": "An advanced core exercise that requires great core strength and control."
    },
    {
        "name": "Box Jumps",
        "difficulty": "Intermediate",
        "measure": "Reps",
        "sets": "3x10",
        "force": "Push",
        "grips": "None",
        "mechanic": "Plyometric",
        "targetMuscle": "Legs, Glutes",
        "description": "Explosive jump to a box to build lower body power."
    },
    {
        "name": "Kettlebell Swing",
        "difficulty": "Intermediate",
        "measure": "Weight/Reps",
        "sets": "4x15",
        "force": "Push",
        "grips": "Neutral",
        "mechanic": "Compound",
        "targetMuscle": "Hips, Glutes, Core",
        "description": "Swing the kettlebell to target the hips, glutes, and core."
    },
    {
        "name": "T-Bar Row",
        "difficulty": "Intermediate",
        "measure": "Weight/Reps",
        "sets": "4x8",
        "force": "Pull",
        "grips": "Overhand",
        "mechanic": "Compound",
        "targetMuscle": "Back, Biceps",
        "description": "Row the T-bar to work the upper and middle back muscles."
    },
    {
        "name": "Decline Bench Press",
        "difficulty": "Intermediate",
        "measure": "Weight/Reps",
        "sets": "4x8",
        "force": "Push",
        "grips": "Overhand",
        "mechanic": "Compound",
        "targetMuscle": "Chest, Triceps",
        "description": "Perform bench press at a decline angle to focus more on the lower chest."
    },
    {
        "name": "Pull-Up",
        "difficulty": "Intermediate",
        "measure": "Reps",
        "sets": "3x8",
        "force": "Pull",
        "grips": "Overhand",
        "mechanic": "Compound",
        "targetMuscle": "Back, Biceps",
        "description": "Pull your body up to a bar to work the back and biceps."
    }
  ];

  String searchQuery = "";
  List<Map<String, String>> filteredMovesets = [];

  @override
  void initState() {
    super.initState();
    filteredMovesets = gymMovesets; // Tampilkan semua data awalnya
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredMovesets = gymMovesets
          .where((move) => move.values.any((value) =>
              value.toLowerCase().contains(searchQuery))) // Filter data
          .toList();
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Gympedia', 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          color: Colors.black,  // Menambahkan warna hitam pada teks
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white, // Memberikan warna putih pada header
      iconTheme: IconThemeData(color: Colors.transparent), // Menghapus ikon back
      elevation: 0, // Menghapus bayangan pada AppBar
      flexibleSpace: null, // Menghapus gradient di AppBar
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Cari Latihan....",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: updateSearchQuery,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredMovesets.length,
            itemBuilder: (context, index) {
              final move = filteredMovesets[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue[200]!, Colors.blue[600]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.fitness_center,
                                  color: Colors.blue[900]),
                              const SizedBox(width: 8),
                              Text(
                                move["name"] ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Divider(color: Colors.grey[300], thickness: 1),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Difficulty: ${move["difficulty"]}",
                                        style: TextStyle(fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text("Measure: ${move["measure"]}",
                                        style: TextStyle(fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text("Series / Sets: ${move["sets"]}",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Force: ${move["force"]}",
                                        style: TextStyle(fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text("Grips: ${move["grips"]}",
                                        style: TextStyle(fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text("Mechanic: ${move["mechanic"]}",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Target Muscle: ${move["targetMuscle"]}",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            move["description"] ?? "",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 8),
                          Divider(color: Colors.grey[300], thickness: 1),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
}