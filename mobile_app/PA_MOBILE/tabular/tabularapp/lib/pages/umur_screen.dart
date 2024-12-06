import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '../controller/user_controller.dart'; 
import 'gender_screen.dart';

class UmurScreen extends StatelessWidget {
  final TextEditingController umurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);

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
              'assets/images/gyman7.jpg',
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
                "Masukkan Umur Anda",
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

             
              DottedLineIndicator(totalSteps: 7, currentStep: 2),
              Spacer(),

              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: umurController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Umur",
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 18),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.0,
                      ),
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
                    final umurText = umurController.text.trim();
                    final umur = int.tryParse(umurText);

                    if (umurText.isEmpty || umur == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Umur harus diisi dengan angka"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (umur <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Umur harus lebih dari 0"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (umur < 13) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Umur minimal adalah 13 tahun"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (umur > 120) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Umur maksimal adalah 120 tahun"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      
                      userController.setUmur(umur);

                      
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              GenderScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
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

  const DottedLineIndicator({
    required this.totalSteps,
    required this.currentStep,
  });

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