import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http/app_button.dart';
import 'package:flutter_http/base_client.dart';
import 'package:flutter_http/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BaseClient baseClient = BaseClient();
  List<dynamic> user = [];
  TextEditingController nameController =
      TextEditingController(); // Define nameController
  TextEditingController idController =
      TextEditingController(); // Define idcontroller

  Future<void> fetchData() async {
    try {
      // Using BaseClient to perform GET request to fetch users
      var response = await BaseClient().get('/users').catchError((er) {});
      setState(() {
        user = jsonDecode(response);
      });
      if (response == null) return; // Exit if response is null
      debugPrint("Sucess"); // Print success message
      // Deserialize JSON response to list of users
      var users = userFromJson(response);
      debugPrint(users.length.toString()); // Print number of users fetched
    } catch (e) {
      debugPrint('Failed to fetch users: $e'); // Print error message on failure
    }
  }

  Future<void> postData() async {
    try {
      // Creating a new user object to add
      var user = User( name: nameController.text);
      // Using BaseClient to perform POST request to add user
      var response =
          await BaseClient().post('/users', user).catchError((er) {});
      if (response == null) return; // Exit if response is null
      debugPrint("Sucess"); // Print success message
    } catch (e) {
      debugPrint('Failed to add user: $e'); // Print error message on failure
    }
  }

  Future<void> putData() async {
    try {
      var id = int.tryParse(idController.text); // ID of the user to update
      var user = User(id: id, name: nameController.text); // Updated user object
      // Using BaseClient to perform PUT request to update user
      var response =
          await BaseClient().put('/users/$id', user).catchError((er) {});
      if (response == null) return; // Exit if response is null
      debugPrint("Sucess"); // Print success message
    } catch (e) {
      debugPrint('Failed to edit user: $e'); // Print error message on failure
    }
  }

  Future<void> deleteData() async {
    try {
      var id = int.parse(idController.text); // ID of the user to delete
      // Using BaseClient to perform DELETE request to delete user
      var response =
          await BaseClient().delete('/users/$id').catchError((er) {});
      if (response == null) return; // Exit if response is null
      debugPrint("Sucess"); // Print success message
    } catch (e) {
      debugPrint('Failed to delete user: $e'); // Print error message on failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 400,
                  child: Expanded(
                      child: ListView.builder(
                          itemCount: user.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              height: 50,
                              decoration:
                                   BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                                  
                              width: double.infinity,
                              child: Center(
                                  child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    user[index]['id'] + ". ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    user[index]['name'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              )),
                            );
                          })),
                ),
                AppButton(
                    operation: 'ID          ', // Operation type: GET
                    operationColor: const Color.fromARGB(
                        255, 12, 12, 12), // Button color: light green
                    // description: 'Fetch users', // Button text: Fetch users
                    idController: idController,
                    onPressed: () {
                      fetchData();
                    }),
                AppButton(
                    operation: 'GET', // Operation type: GET
                    operationColor:
                        Colors.lightGreen, // Button color: light green
                    description: 'Fetch users', // Button text: Fetch users
                    onPressed: () {
                      fetchData();
                    }),
                AppButton(
                  operation: 'POST', // Operation type: POST
                  operationColor: Colors.lightBlue, // Button color: light blue
                  // description: 'Add user', // Button text: Add user
                  nameController: nameController,
                  onPressed: () {
                    postData();
                  },
                ),
                AppButton(
                  operation: 'PUT   ', // Operation type: PUT
                  operationColor: Colors.orangeAccent, // Button color: orange
                  // description: 'Edit user', // Button text: Edit user
                  nameController: nameController,
                  // idController: idController,
                  onPressed: () {
                    putData();
                  },
                ),
                AppButton(
                  operation: 'DELETE', // Operation type: DELETE
                  operationColor: Colors.red, // Button color: red
                  // description: 'Delete user', // Button text: Delete user
                  idController: idController,
                  onPressed: () async {
                    deleteData();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
