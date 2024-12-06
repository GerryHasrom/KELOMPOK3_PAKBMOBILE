import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tabularapp/pages/feedback.dart';
import 'package:tabularapp/pages/splash_screen.dart';
import 'controller/user_controller.dart';
import 'controller/workout_controller.dart';
import 'controller/train_controller.dart';
import 'controller/gemini_controller.dart';
import 'pages/home_page.dart';
import 'pages/workout_planner_page.dart';
import 'pages/train_page.dart';
import 'pages/activity_log_page.dart';
import 'pages/gemini_predict.dart';
import 'pages/about_us.dart';
import 'pages/settings_page.dart';
import 'pages/signin.dart';
import 'controller/feedback_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GymApp());
}

class GymApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TrainController>(create: (_) => TrainController()), 
        ChangeNotifierProvider<WorkoutController>(create: (_) => WorkoutController()), 
        ChangeNotifierProvider(create: (_) => UserController()), // UserController
        ChangeNotifierProvider<GeminiController>(create: (_) => GeminiController()),
        ChangeNotifierProvider<FeedbackController>(create: (_) => FeedbackController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gym App',
        theme: ThemeData(
          primaryColor: Colors.blue[900],
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
          ),
        ),
        home: StartupScreen(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail') ?? '';
    setState(() {
      _userEmail = email;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 4) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scaffoldKey.currentState?.openEndDrawer();
      });
    }
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
      (route) => false,
    );
  }

  final List<Widget> _pages = [
    HomePage(),
    WorkoutPlannerPage(),
    TrainPage(),
    ActivityLogPage(),
    Container(),
  ];

  void _editProfile(BuildContext context, UserController userController) {
  showDialog(
    context: context,
    builder: (context) {
     
      String name = userController.userName;
      int age = userController.umur;
      double weight = userController.berat;
      String gender = userController.gender;
      double height = userController.tinggiBadan;

      final _formKey = GlobalKey<FormState>();

      return AlertDialog(
        title: Text('Edit Profile'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
               
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  initialValue: name,
                  onChanged: (value) => name = value,
                  validator: (value) => value == null || value.isEmpty ? 'Name is required' : null,
                ),
                
                TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  initialValue: age.toString(),
                  onChanged: (value) => age = int.tryParse(value) ?? age,
                  validator: (value) => int.tryParse(value ?? '') == null ? 'Age is invalid' : null,
                ),
                
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                
                userController.updateUserProfile(
                  name: name,
                  age: age,
                  weight: weight, 
                  userGender: gender, 
                  height: height, 
                );
                Navigator.of(context).pop(); 
              }
            },
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        automaticallyImplyLeading: false, 
        iconTheme: IconThemeData(
          color: Colors.white, 
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logogym.png',
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'MUSCLE AI',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Spacer(),
          ],
        ),
      ),



      body: _selectedIndex != 4 ? _pages[_selectedIndex] : _pages[0],
      endDrawer: Drawer(
        child: Consumer<UserController>(
          builder: (context, userController, child) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(userController.userName.isEmpty
                      ? "User Name"
                      : userController.userName),
                  accountEmail: Text(
                      _userEmail.isEmpty ? "user@example.com" : _userEmail),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      userController.userName.isEmpty
                          ? "U"
                          : userController.userName[0],
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.blue[900]),
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit Profile'),
                  onTap: () => _editProfile(context, userController),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.auto_awesome),
                  title: Text('Predict Gemini'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GeminiPredictPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Feedback'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () => _logout(context),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: List.generate(4, (index) {
          bool isSelected = _selectedIndex == index;
          return BottomNavigationBarItem(
            label: index == 0
                ? 'Home'
                : index == 1
                    ? 'Workout'
                    : index == 2
                        ? 'Train'
                        : 'Gympedia',
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isSelected ? 60 : 50,
              width: isSelected ? 60 : 50,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                index == 0
                    ? Icons.home
                    : index == 1
                        ? Icons.fitness_center
                        : index == 2
                            ? Icons.favorite
                            : Icons.list,
                color: isSelected ? Colors.blue[900] : Colors.white.withOpacity(0.7),
                size: isSelected ? 30 : 25,
              ),
            ),
          );
        }),
      ),
    );
  }
}
