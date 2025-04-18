import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, String>> conversations = [
    {
      "image": "assets/images/profile.png",
      "name": "Alice Johnson",
      "subtext": "Hey, are we meeting today?"
    },
    {
      "image": "assets/images/profile.png",
      "name": "Bob Smith",
      "subtext": "Sent you the files just now."
    },
    {
      "image": "assets/images/profile.png",
      "name": "Clara White",
      "subtext": "Got it. Thanks!"
    },
    {
      "image": "assets/images/profile.png",
      "name": "Daniel Green",
      "subtext": "Check out this link!"
    },
    {
      "image": "assets/images/profile.png",
      "name": "Eva Blue",
      "subtext": "Let’s catch up soon."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, right: 0, left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Conversations',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w800,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: conversations.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  final chat = conversations[index];
                  return ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage(chat['image']!),
                    ),
                    title: Text(
                      chat['name']!,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      chat['subtext']!,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    onTap: () {
                      // Handle chat tap
                    },
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
