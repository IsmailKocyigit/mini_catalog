import 'package:mini_catalog/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:mini_catalog/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LocalStorageService lsService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 6),

                Text(
                  "Please login to your account",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 40),

                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "İsim alanı boş geçilemez.";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    labelText: "Surname",
                    prefixIcon: Icon(Icons.person_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Soyisim alanı boş geçilemez.";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      lsService.saveData(nameController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),

                SizedBox(height: 30),

                Center(
                  child: Text("2026", style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
