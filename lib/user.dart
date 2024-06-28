import 'dart:convert';

// Function to parse a JSON string into a list of User objects
List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// Function to convert a list of User objects into a JSON string
String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// User class representing a user object
class User {
  DateTime? createdAt; // Date and time when the user was created
  String? name; // Name of the user
  String? avatar; // URL to the user's avatar image
  int? id; // Unique identifier for the user

  // Constructor for the User class
  User({
    this.createdAt,
    this.name,
    this.avatar,
    this.id,
  });

  // Factory method to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) => User(
        // Deserialize JSON fields into object properties
        createdAt: DateTime.parse(
            json["createdAt"]), // Parsing createdAt from JSON to DateTime
        name: json["name"], // Assigning name from JSON
        avatar: json["avatar"], // Assigning avatar URL from JSON
        id: json["id"], // Assigning id from JSON
      );

  // Method to convert a User object into a JSON map
  Map<String, dynamic> toJson() => {
        "name": name, // Serialize name to JSON
        // The following lines are commented out because they are optional fields
        // "createdAt": createdAt.toIso8601String(), // Serialize createdAt to ISO 8601 string format
        // "avatar": avatar, // Serialize avatar URL
        "id": id, // Serialize id
      };
}
