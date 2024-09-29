import 'package:flutter/material.dart';
import 'chat_page.dart'; // Import the ChatPage

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List to store posts
  List<Map<String, String>> _posts = [];
  List<Map<String, String>> _filteredPosts = []; // List to store filtered posts
  final TextEditingController _searchController = TextEditingController(); // Search bar controller

  @override
  void initState() {
    super.initState();
    // Add an existing post for demo purposes
    _posts.add({
      'name': 'John Doe',
      'destination': 'UTEP',
      'meetingTime': '10:00 AM',
      'bridge': 'Americas',
      'spaceAvailable': '3 seats',
      'carInfo': 'Tesla Model 3, Blue',
    });
        _posts.add({
      'name': 'Jane Doe',
      'destination': 'Del Valle High School',
      'meetingTime': '6:00 AM',
      'bridge': 'Paso del Norte',
      'spaceAvailable': '4 seats',
      'carInfo': 'Volkswagen, White',
    });

            _posts.add({
      'name': 'Joe',
      'destination': 'EPCC Valle Verde',
      'meetingTime': '6:00 AM',
      'bridge': 'Ysleta-Zaragoza',
      'spaceAvailable': '1 seat',
      'carInfo': 'Honda Civic, Black',
    });
            _posts.add({
      'name': 'Jen Doe',
      'destination': 'UTEP',
      'meetingTime': '7:00 AM',
      'bridge': 'Bridge of the Americas',
      'spaceAvailable': '2 seats',
      'carInfo': 'Kia soul, Green',
    });

    // Initialize the filtered list
    _filteredPosts = List.from(_posts);
  }

  // Function to add a new post
  void _addPost(Map<String, String> newPost) {
    setState(() {
      _posts.insert(0, newPost); // Insert new post at the top
      _filteredPosts = List.from(_posts); // Update filtered posts
    });
  }

  // Function to handle chat opening
  void _openChat(String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(name: name),
      ),
    );
  }

  // Function to show modal bottom sheet to create a new post
  void _showCreatePostSheet(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _destinationController = TextEditingController();
    final TextEditingController _meetingTimeController = TextEditingController();
    final TextEditingController _bridgeController = TextEditingController();
    final TextEditingController _spaceAvailableController = TextEditingController();
    final TextEditingController _carInfoController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _destinationController,
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _meetingTimeController,
                  decoration: InputDecoration(
                    labelText: 'Meeting Time',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _bridgeController,
                  decoration: InputDecoration(
                    labelText: 'Bridge (Port of Entry)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _spaceAvailableController,
                  decoration: InputDecoration(
                    labelText: 'Space Available in Car',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _carInfoController,
                  decoration: InputDecoration(
                    labelText: 'Car Info',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Create the new post and add it to the feed
                    if (_nameController.text.isNotEmpty &&
                        _destinationController.text.isNotEmpty &&
                        _meetingTimeController.text.isNotEmpty &&
                        _bridgeController.text.isNotEmpty &&
                        _spaceAvailableController.text.isNotEmpty &&
                        _carInfoController.text.isNotEmpty) {
                      _addPost({
                        'name': _nameController.text,
                        'destination': _destinationController.text,
                        'meetingTime': _meetingTimeController.text,
                        'bridge': _bridgeController.text,
                        'spaceAvailable': _spaceAvailableController.text,
                        'carInfo': _carInfoController.text,
                      });
                      Navigator.pop(context); // Close the modal
                    }
                  },
                  child: Text('Create Post'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to filter posts based on destination search query
  void _filterPosts(String query) {
    List<Map<String, String>> filtered = _posts
        .where((post) => post['destination']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredPosts = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EduRide'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Destination',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterPosts, // Filter posts as the user types
            ),
          ),
          Expanded(
            child: _filteredPosts.isEmpty
                ? Center(child: Text('No posts found!'))
                : ListView.builder(
                    itemCount: _filteredPosts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${_filteredPosts[index]['name']}'),
                              Text('Destination: ${_filteredPosts[index]['destination']}'),
                              Text('Meeting Time: ${_filteredPosts[index]['meetingTime']}'),
                              Text('Bridge: ${_filteredPosts[index]['bridge']}'),
                              Text('Space Available: ${_filteredPosts[index]['spaceAvailable']}'),
                              Text('Car Info: ${_filteredPosts[index]['carInfo']}'),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => _openChat(_filteredPosts[index]['name'] ?? ''),
                                child: Text('Request Ride'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreatePostSheet(context), // Show the modal to create a new post
        icon: Icon(Icons.add),
        label: Text('Create Post'),
      ),
    );
  }
}
