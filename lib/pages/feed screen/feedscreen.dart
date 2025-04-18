import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {
      "name": "junaid ali",
      "time": "2:27 AM - Oct 20, 2023",
      "text": "Hi",
      "image": null,
      "likes": 0,
      "comments": 0,
    },
    {
      "name": "Jamie Lannister",
      "time": "4:26 PM - Jul 12, 2023",
      "text":
          "could make a corny joke about how excited I am to eat this... but I’ll spare you this time!",
      "image": "assets/images/feed.png",
      "likes": 1,
      "comments": 0,
    },
    {
      "name": "Audrey Myers",
      "time": "3:12 PM - Jul 12, 2023",
      "text":
          "I CANNOT wait to shop until I DROP after eating these yummy peas!!",
      "image": "assets/images/feed.png",
      "likes": 1,
      "comments": 0,
    },
    {
      "name": "Jamie Lannister",
      "time": "4:26 PM - Jul 12, 2023",
      "text":
          "could make a corny joke about how excited I am to eat this... but I’ll spare you this time!",
      "image": "assets/images/feed.png",
      "likes": 1,
      "comments": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with logo and search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Image.asset("assets/images/profile.png", height: 40),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: GoogleFonts.montserrat(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: "Share your healthy options.",
                          hintStyle: GoogleFonts.montserrat(fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Feed List
            Expanded(
              child: ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (_, __) =>
                    Divider(thickness: 1, color: Colors.grey[300]),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User info row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/images/profile.png"),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post['name'],
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    post['time'],
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13, color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: Colors.grey),
                          ],
                        ),

                        SizedBox(height: 8),

                        // Post text
                        if (post['text'] != null)
                          Text(
                            post['text'],
                            style: GoogleFonts.montserrat(fontSize: 15),
                          ),

                        SizedBox(height: 8),

                        // Post image
                        if (post['image'] != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(post['image']),
                          ),

                        SizedBox(height: 8),

                        // Like & Comment
                        Row(
                          children: [
                            Icon(Icons.favorite_border, size: 20),
                            SizedBox(width: 4),
                            Text('${post['likes']}',
                                style: GoogleFonts.montserrat(fontSize: 14)),
                            SizedBox(width: 16),
                            Icon(Icons.comment_outlined, size: 20),
                            SizedBox(width: 4),
                            Text('${post['comments']}',
                                style: GoogleFonts.montserrat(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
