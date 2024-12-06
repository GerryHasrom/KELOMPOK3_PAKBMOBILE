import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,  
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(  
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),  
          child: Column(
            children: [
              const Text(
                'Meet the Developers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: screenHeight * 0.03), 

              
              GridView.builder(
                shrinkWrap: true, 
                physics: NeverScrollableScrollPhysics(), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth > 600 ? 2 : 1, 
                  crossAxisSpacing: screenWidth * 0.04, 
                  mainAxisSpacing: screenHeight * 0.02, 
                  childAspectRatio: 0.75, 
                ),
                itemCount: developerProfiles.length, 
                itemBuilder: (context, index) {
                  return ProfileCard(
                    name: developerProfiles[index]['name'],
                    position: developerProfiles[index]['position'],
                    position2: developerProfiles[index]['position2'],
                    imagePath: developerProfiles[index]['imagePath'],
                    description: developerProfiles[index]['description'],
                    cardColor: developerProfiles[index]['cardColor'],
                    screenWidth: screenWidth, 
                    screenHeight: screenHeight, 
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.03), 

              
              AdditionalInfoCard(
                title: "Our Mission",
                content:
                    "Kami berkomitmen untuk memberikan solusi terbaik dalam dunia kebugaran dengan aplikasi yang modern, user-friendly, dan inovatif.",
                backgroundColor: Colors.teal[50],
              ),
              SizedBox(height: screenHeight * 0.01), 
              AdditionalInfoCard(
                title: "Our Vision",
                content:
                    "Menciptakan platform digital terbaik untuk meningkatkan kualitas hidup pengguna melalui olahraga dan kesehatan.",
                backgroundColor: Colors.teal[100],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String position2;
  final String imagePath;
  final String description;
  final Color cardColor;
  final double screenWidth;
  final double screenHeight;

  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.position2,
    required this.imagePath,
    required this.description,
    required this.cardColor,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),  
        child: Column(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.15, 
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: screenHeight * 0.02), 
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800],
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, 
            ),
            SizedBox(height: screenHeight * 0.01), 
            Text(
              position,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, 
            ),
            Text(
              position2,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, 
            ),
            SizedBox(height: screenHeight * 0.02), 
            
            Flexible(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[800],
                    ),
                maxLines: 3, 
                overflow: TextOverflow.ellipsis, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdditionalInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final Color? backgroundColor;

  const AdditionalInfoCard({
    super.key,
    required this.title,
    required this.content,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800],
                  ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[800],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> developerProfiles = [
  {
    'name': 'Gerry Hasrom',
    'position': 'Lead Developer',
    'position2': '2209106094',
    'imagePath': 'assets/images/gerry.jpg',
    'description': 'Gerry adalah seorang mahasiswa Teknik Informatika di Universitas Mulawarman dengan spesialisasi dalam pengembangan aplikasi berbasis Flutter.',
    'cardColor': Colors.tealAccent,
  },
  {
    'name': 'Muhammad Rizky Putra Pratama',
    'position': 'Backend Developer',
    'position2': '2209106102',
    'imagePath': 'assets/images/rizky.jpg',
    'description': 'Rizky adalah memiliki keahlian dalam membangun sistem backend yang efisien dan mendukung performa aplikasi.',
    'cardColor': Colors.cyanAccent,
  },
  {
    'name': 'Alif Naufal Fachrian',
    'position': 'UI/UX Designer',
    'position2': '2209106108',
    'imagePath': 'assets/images/alif.jpg',
    'description': 'Alif adalah seorang desainer dengan keahlian dalam menciptakan antarmuka pengguna yang modern dan menarik.',
    'cardColor': Colors.greenAccent,
  },
  {
    'name': 'Zaky Syuhada',
    'position': 'Frontend Developer',
    'position2': '2209106073',
    'imagePath': 'assets/images/zaky.jpg',
    'description': 'Zaky ahli dalam mengimplementasikan desain UI menjadi aplikasi Flutter yang interaktif dan responsif.',
    'cardColor': Colors.lightBlueAccent,
  },
];