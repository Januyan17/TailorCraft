// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/API/api.dart';
import 'package:tailorcraft/Screens/BottomNavigation/BottomNavigation.dart';

class CommentListScreen extends StatefulWidget {
  @override
  _CommentListScreenState createState() => _CommentListScreenState();
}

class _CommentListScreenState extends State<CommentListScreen> {
  TextEditingController feedback = TextEditingController();
  int _selectedRating = 0;
  var isLoading = false;
  var _isLoading = false;
  List apiBody = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();
    // var userId = localStorage.getInt('id');
    setState(() {
      _isLoading = true;
    });
    try {
      var res = await CallApi().getData('api/feedback');
      apiBody = await json.decode(res.body);
      print(apiBody);
    } catch (error) {}
    setState(() {
      _isLoading = false;
    });
  }

  void AddData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var data = {
        "feedback": feedback.text,
        "rating": _selectedRating.toInt(),
        // "color": color,
      };

      print(" sending dataaaa");
      print(data);
      print(" sending dataaaa");
      var res = await CallApi().postData(data, 'api/feedback');
      var body = json.decode(res.body);
      print(body);
      setState(() {
        isLoading = false;
      });
      Get.snackbar("Success", "Successfully added");
      Get.to(BottomNavigationScreen());

      print(body);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "262 Reviews",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                    border: Border(),
                  ),
                  height: screenHeight * 0.12,
                  width: screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "4.5/5",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Row(
                              children: List.generate(
                                5, // Rating value
                                (_) => Icon(
                                  Icons.star,
                                  color: Colors.amber, // Star color
                                  size: 24, // Star size
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 10,
                              width: 100, // Set a height for the container
                              child: LinearProgressIndicator(
                                value: 0.8, // 70% progress
                                backgroundColor: Colors.grey,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.amber),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            // More linear progress indicators...
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Comment input section
                SizedBox(height: 20),
                Text(
                  "Leave a Comment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: feedback,
                  decoration: InputDecoration(
                    hintText: 'Write your comment here...',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 3,
                  maxLines: null,
                  onChanged: (value) {
                    // You can handle the comment text change here
                  },
                ),
                SizedBox(height: 20),
                // Star rating section
                Text(
                  "Rate this Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),

                Row(
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      icon: Icon(
                        index < _selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 30,
                      ),
                      onPressed: () {
                        // Handle rating selection
                        setState(() {
                          _selectedRating = index + 1;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        value: 5,
                      ))
                    : Center(
                        child: ElevatedButton(
                          onPressed: () {
                            AddData();
                          },
                          child: Text('comment'),
                        ),
                      ),
                SizedBox(height: 10),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  child: ListView.builder(
                    itemCount: apiBody.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'sman nsd n smna ns an asn msn asn snj'),
                                        radius: 20.0,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.03,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "User",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          Text(
                                            'Date: ${"23/23"}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Row(
                                            children: List.generate(
                                              int.parse(
                                                  apiBody[index]['rating']),
                                              (index) => Icon(Icons.star,
                                                  color: Colors.amber),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Row(
                                  //   children: List.generate(
                                  //     2,
                                  //     (index) =>
                                  //         Icon(Icons.star, color: Colors.amber),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(apiBody[index]["feedback"].toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
