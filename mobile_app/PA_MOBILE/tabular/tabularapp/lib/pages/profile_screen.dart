import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Profile Info",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            _buildListTile(
              context,
              title: "Nama: ${userController.userName}",
              icon: Icons.edit,
              onTap: () => _editName(context, userController),
            ),
            _buildListTile(
              context,
              title: "Umur: ${userController.umur}",
              icon: Icons.edit,
              onTap: () => _editAge(context, userController),
            ),
            _buildListTile(
              context,
              title: "Berat Badan: ${userController.berat} kg",
              icon: Icons.edit,
              onTap: () => _editWeight(context, userController),
            ),
            _buildListTile(
              context,
              title: "Gender: ${userController.gender}",
              icon: Icons.edit,
              onTap: () => _editGender(context, userController),
            ),
            _buildListTile(
              context,
              title: "Tinggi Badan: ${userController.tinggiBadan} cm",
              icon: Icons.edit,
              onTap: () => _editHeight(context, userController),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Halaman Profile", style: TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon),
      onTap: onTap,
    );
  }

  void _editName(BuildContext context, UserController userController) {
    TextEditingController nameController =
        TextEditingController(text: userController.userName);
    _showEditDialog(
      context: context,
      title: "Edit Nama",
      controller: nameController,
      onSave: () {
        String name = nameController.text.trim();
        if (name.isNotEmpty) {
          userController.setUserName(name);
        }
      },
    );
  }

  void _editAge(BuildContext context, UserController userController) {
    TextEditingController ageController =
        TextEditingController(text: userController.umur.toString());
    _showEditDialog(
      context: context,
      title: "Edit Umur",
      controller: ageController,
      inputType: TextInputType.number,
      onSave: () {
        int? age = int.tryParse(ageController.text.trim());
        if (age != null && age > 0) {
          userController.setUmur(age);
        }
      },
    );
  }

  void _editWeight(BuildContext context, UserController userController) {
    TextEditingController weightController =
        TextEditingController(text: userController.berat.toString());
    _showEditDialog(
      context: context,
      title: "Edit Berat Badan",
      controller: weightController,
      inputType: TextInputType.number,
      onSave: () {
        double? weight = double.tryParse(weightController.text.trim());
        if (weight != null && weight > 0) {
          userController.setBerat(weight);
        }
      },
    );
  }

  void _editGender(BuildContext context, UserController userController) {
    List<String> genders = ["Laki-laki", "Perempuan"];
    String selectedGender = userController.gender;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pilih Gender"),
          content: DropdownButton<String>(
            value: selectedGender.isNotEmpty ? selectedGender : null,
            isExpanded: true,
            items: genders
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                selectedGender = value;
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("BATAL"),
            ),
            TextButton(
              onPressed: () {
                userController.setGender(selectedGender);
                Navigator.pop(context);
              },
              child: const Text("SIMPAN"),
            ),
          ],
        );
      },
    );
  }

  void _editHeight(BuildContext context, UserController userController) {
    TextEditingController heightController =
        TextEditingController(text: userController.tinggiBadan.toString());
    _showEditDialog(
      context: context,
      title: "Edit Tinggi Badan",
      controller: heightController,
      inputType: TextInputType.number,
      onSave: () {
        double? height = double.tryParse(heightController.text.trim());
        if (height != null && height > 0) {
          userController.setTinggiBadan(height);
        }
      },
    );
  }

  void _showEditDialog({
    required BuildContext context,
    required String title,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    required VoidCallback onSave,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            keyboardType: inputType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Masukkan nilai baru",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("BATAL"),
            ),
            TextButton(
              onPressed: () {
                onSave();
                Navigator.pop(context);
              },
              child: const Text("SIMPAN"),
            ),
          ],
        );
      },
    );
  }
}
