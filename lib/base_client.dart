import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:http/http.dart' as http; // HTTP package for making requests

const String clientUrl = 'https://667cf1f03c30891b865e4406.mockapi.io';

class BaseClient {
  var client = http.Client(); // Creating a global HTTP client instance

  // Method to fetch data from the server (Read operation)
  Future<dynamic> get(String api) async {
    var url = Uri.parse(clientUrl + api); // Constructing the full URL

    var headers = {
      'Authorization': '', // Placeholder for authorization token
      'api_key': '', // Placeholder for API key
    };

    try {
      // Sending the GET request with URL and headers
      var response = await client.get(url, headers: headers);

      // Checking if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Return the response body (data fetched from the server)
        return response.body;
      } else {
        // Throw an exception with an error message if request fails
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Catch any exceptions during the HTTP request
      throw Exception('Failed to connect to the server');
    }
  }

  // Method to post new data to the server (Create operation)
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(clientUrl + api); // Constructing the full URL
    var payload = jsonEncode(object); // Encoding object to JSON

    var headers = {
      'Content-Type': 'application/json', // Payload type
      'Authorization': '', // Placeholder for authorization token
      'api_key': '', // Placeholder for API key
    };

    try {
      // Sending the POST request with URL, payload, and headers
      var response = await client.post(url, body: payload, headers: headers);

      // Checking if the response status code is 201 (Created)
      if (response.statusCode == 201) {
        // Return the response body (data created on the server)
        return response.body;
      } else {
        // Throw an exception with an error message if request fails
        throw Exception('Failed to create data');
      }
    } catch (e) {
      // Catch any exceptions during the HTTP request
      throw Exception('Failed to connect to the server');
    }
  }

  // Method to update existing data on the server (Update operation)
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(clientUrl + api); // Constructing the full URL
    var payload = jsonEncode(object); // Encoding object to JSON

    var headers = {
      'Content-Type': 'application/json', // Payload type
      'Authorization': '', // Placeholder for authorization token
      'api_key': '', // Placeholder for API key
    };

    try {
      // Sending the PUT request with URL, payload, and headers
      var response = await client.put(url, body: payload, headers: headers);

      // Checking if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Return the response body (data updated on the server)
        return response.body;
      } else {
        // Throw an exception with an error message if request fails
        throw Exception('Failed to update data');
      }
    } catch (e) {
      // Catch any exceptions during the HTTP request
      throw Exception('Failed to connect to the server');
    }
  }

  // Method to delete data from the server (Delete operation)
  Future<dynamic> delete(String api) async {
    var url = Uri.parse(clientUrl + api); // Constructing the full URL

    var headers = {
      'Authorization': '', // Placeholder for authorization token
      'api_key': '', // Placeholder for API key
    };

    try {
      // Sending the DELETE request with URL and headers
      var response = await client.delete(url, headers: headers);

      // Checking if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Return the response body (confirmation of data deletion)
        return response.body;
      } else {
        // Throw an exception with an error message if request fails
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      // Catch any exceptions during the HTTP request
      throw Exception('Failed to connect to the server');
    }
  }
}
