import 'package:flutter/material.dart';
import 'endscreen.dart';

class TinggiBadanScreen extends StatelessWidget {
  final TextEditingController tinggiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/gyman6.jpg', 
              fit: BoxFit.cover,
            ),
          ),

          
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              
              Text(
                "Masukkan Tinggi Badan Anda (cm)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              
              DottedLineIndicator(totalSteps: 7, currentStep: 5),
              Spacer(), 

              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: tinggiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Tinggi Badan",
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 18),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 60),

              
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
          final tinggiText = tinggiController.text.trim();
          final tinggi = double.tryParse(tinggiText);

          if (tinggiText.isEmpty || tinggi == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Masukkan tinggi badan yang valid sebelum melanjutkan."),
                backgroundColor: Colors.red,
              ),
            );
          } else if (tinggi < 55) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Tinggi badan minimal adalah 55 cm."),
                backgroundColor: Colors.red,
              ),
            );
          } else if (tinggi > 251) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Tinggi badan maksimal adalah 251 cm."),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    EndScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );  
          }
        },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 36.0,
                    ),
                    elevation: 5,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "NEXT",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40), 
            ],
          ),
        ],
      ),
    );
  }
}

class DottedLineIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const DottedLineIndicator(
      {required this.totalSteps, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];
    for (int i = 1; i <= totalSteps; i++) {
      dots.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: i == currentStep ? 12 : 10,
          height: i == currentStep ? 12 : 10,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i <= currentStep
                ? Colors.blueAccent
                : Colors.white.withOpacity(0.5),
            boxShadow: i == currentStep
                ? [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
  }
}