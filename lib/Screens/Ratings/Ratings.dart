// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tailorcraft/Classes/Comments.dart';

import '../../GetXControllers/CommentsController.dart';

class CommentListScreen extends StatelessWidget {
  final CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "262 Reviews",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                        border: Border(),
                      ),
                      height: screenHeight * 0.15,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.amber),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Container(
                                  height: 10,
                                  width: 100, // Set a height for the container
                                  child: LinearProgressIndicator(
                                    value: 0.6, // 70% progress
                                    backgroundColor: Colors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.amber),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Container(
                                  height: 10,
                                  width: 100, // Set a height for the container
                                  child: LinearProgressIndicator(
                                    value: 0.4, // 70% progress
                                    backgroundColor: Colors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.amber),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Container(
                                  height: 10,
                                  width: 100, // Set a height for the container
                                  child: LinearProgressIndicator(
                                    value: 0.3, // 70% progress
                                    backgroundColor: Colors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.amber),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Container(
                                  height: 10,
                                  width: 100, // Set a height for the container
                                  child: LinearProgressIndicator(
                                    value: 0.1, // 70% progress
                                    backgroundColor: Colors.grey,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.amber),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.6,
                      child: ListView.builder(
                        itemCount: commentController.comments.length,
                        itemBuilder: (context, index) {
                          Comment comment = commentController.comments[index];
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
                                            backgroundImage:
                                                NetworkImage(comment.image),
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
                                                comment.customerName,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                'Date: ${comment.commentDate}',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: List.generate(
                                          comment.rating,
                                          (index) => Icon(Icons.star,
                                              color: Colors.amber),
                                        ),
                                      ),
                                    ],
                                  ),

                                  //!!!!
                                  SizedBox(height: screenHeight * 0.02),

                                  Text(comment.comment),
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
            )),
      ),
    );
  }
}
