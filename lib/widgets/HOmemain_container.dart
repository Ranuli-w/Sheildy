// e:/flutterapps/SHEILDY2.0/Sheildy/lib/widgets/HOmemain_container.dart
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shieldy/model/post.dart';
import 'package:shieldy/resources/firestore_methods.dart';
import 'package:shieldy/widgets/CommentSection.dart';
import '../utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shieldy/widgets/share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:share_plus/share_plus.dart';

class FeedContainer extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final snap;
  const FeedContainer({
    super.key,
    required this.snap,
  });

  @override
  State<FeedContainer> createState() => _FeedContainerState();
}

class _FeedContainerState extends State<FeedContainer> {
  bool isLiked = false;
  bool isDisliked = false;
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Container(
                color: mobileBackgroundColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 18,
                      ).copyWith(right: 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                              widget.snap['profImage'],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 7,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.snap['username'],

                                    //'Username',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8), // Add space here
                  ],
                ),
              );
            }),

        //Add the image here
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          width: double.infinity,
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(20), // Set the desired border radius
            child: Image.network(
              widget.snap['postUrl'],

              //       // 'https://images.unsplash.com/photo-1707343843598-39755549ac9a?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Row(
          children: [
            IconButton(
              onPressed: () async {
                final uid = FirebaseAuth.instance.currentUser!.uid;
                setState(() {
                  isLiked = !isLiked;
                  isDisliked = false; // Reset dislike state when liking
                });
                await _firestoreMethods.updateLikesAndDislikes(
                  widget.snap['postId'],
                  isLiked,
                  isDisliked,
                );
              },
              icon: isLiked
                  ? Icon(Icons.arrow_upward,
                      color: Colors
                          .green) // Change color to green when isLiked is true
                  : Icon(Icons.arrow_upward_outlined),
            ),
            SizedBox(
                width:
                    0), // Add horizontal space between like button and like count
            DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
              child: Text(
                '${widget.snap['likes'].length}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            IconButton(
              onPressed: () async {
                final uid = FirebaseAuth.instance.currentUser!.uid;
                setState(() {
                  isDisliked = !isDisliked;
                  isLiked = false; // Reset like state when disliking
                });
                await _firestoreMethods.updateLikesAndDislikes(
                  widget.snap['postId'],
                  isLiked,
                  isDisliked,
                );
              },
              icon: isDisliked
                  ? Icon(Icons.arrow_downward,
                      color: Colors
                          .red) // Change color to red when isDisliked is true
                  : Icon(Icons.arrow_downward_outlined),
            ),
            SizedBox(
                width:
                    0), // Add horizontal space between dislike button and dislike count
            DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w700),
              child: Text(
                '${widget.snap['dislikes'].length}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CommentSection(
                    postId: widget.snap['postId'].toString(),
                    //username: widget.snap['username'].toString(),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined),
            ),

//          IconButton(
//   onPressed: () => _sharePost(widget.snap['postUrl']),
//   icon: const Icon(Icons.share_outlined),
// ),
            IconButton(
              onPressed: _openMapWithLocation,
              icon: const Icon(Icons.location_on_outlined),
            ),
          ],
        ),

        // Row(
        //   children: [
        //     IconButton(
        //       onPressed: () async {
        //         final uid = FirebaseAuth.instance.currentUser!.uid;
        //         setState(() {
        //           isLiked = !isLiked;
        //         });
        //         await _firestoreMethods.updateLikes(
        //           widget.snap['postId'],
        //           isLiked,
        //         );

        //       },
        //       icon: isLiked
        //           ? const Icon(Icons.arrow_upward,color: Colors.red)
        //           : const Icon(Icons.arrow_upward_outlined),
        //     ),
        //     IconButton(
        //       onPressed: () async {
        //         final uid = FirebaseAuth.instance.currentUser!.uid;
        //         setState(() {
        //           isDisliked = !isDisliked;
        //           isLiked = false; // Reset like state when disliking
        //         });
        //         await _firestoreMethods.updateLikesAndDislikes(
        //           widget.snap['postId'],
        //           isLiked,
        //           isDisliked,
        //         );
        //       },
        //       icon: isDisliked
        //           ? const Icon(Icons.arrow_downward,
        //               color: Colors
        //                   .red) // Change color to red when isDisliked is true
        //           : Icon(Icons.arrow_downward_outlined),
        //     ),

        //     IconButton(
        //       icon: const Icon(Icons.chat_bubble_outline),
        //       onPressed: () => Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => CommentSection(
        //             postId: widget.snap['postId'].toString(),
        //             //username: widget.snap['username'].toString(),
        //           ),
        //         ),
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.share_outlined),
        //     ),
        //     IconButton(
        //       onPressed: _openMapWithLocation,
        //       icon: const Icon(Icons.location_on_outlined),
        //     ),
        //   ],
        // ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0.01,
            horizontal: 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     SizedBox(width: 2),
              //     DefaultTextStyle(
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodyMedium!
              //           .copyWith(fontWeight: FontWeight.w700),
              //       child: Text(
              //         '${widget.snap['likes'].length}',
              //         style: Theme.of(context).textTheme.bodyText2,
              //       ),
              //     ),
              //     const SizedBox(width: 40), // Add horizontal space here
              //     DefaultTextStyle(
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodyMedium!
              //           .copyWith(fontWeight: FontWeight.w700),
              //       child: Text(
              //         '${widget.snap['dislikes'].length}',
              //         style: Theme.of(context).textTheme.bodyText2,
              //       ),
              //     ),
              //   ],

              //   ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: primaryColor),
                    children: [
                      TextSpan(
                        text: widget.snap['username'],

                        //'username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '  ${widget.snap['description']}',
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Text('5 comments',
                      style:
                          const TextStyle(fontSize: 15, color: secondaryColor)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
                    //'09/02/2024',

                    //'09/02/2024',

                    style:
                        const TextStyle(fontSize: 15, color: secondaryColor)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _openMapWithLocation() async {
    final location = widget.snap['location'];
    if (location != null) {
      final query = Uri.encodeComponent(
          '${location.split(',')[0]},${location.split(',')[1]}');
      final url = 'https://www.google.com/maps/search/?api=1&query=$query';
      await canLaunchUrl(Uri.parse(url))
          ? await launchUrl(Uri.parse(url))
          : throw 'Could not launch $url';
    }
  }


//     Future<void> _sharePost(String postUrl) async {
//   final shareOptions = [
//     'Copy Link',
//     'Share on Instagram',
//     'Share on WhatsApp',
//     'Share on Telegram',
//     'Share via Email',
//   ];
//   final selected = await showDialog<int>(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('Share'),
//         content: Column(
//           children: shareOptions
//               .asMap()
//               .entries
//               .map(
//                 (entry) => ListTile(
//                   title: Text(entry.value),
//                   onTap: () => Navigator.pop(context, entry.key),
//                 ),
//               )
//               .toList(),
//         ),
//       );
//     },
//   );

  // if (selected != null) {
  //   switch (selected) {
  //     case 0:
  //       await Clipboard.setData(ClipboardData(text: postUrl));
  //       break;
  //     case 1:
  //       await Share.share(postUrl, subject: 'Check out this post!');
  //       break;
  //     case 2:
  //       await Share.share(postUrl, subject: 'Check out this post!');
  //       break;
  //     case 3:
  //       await Share.share(postUrl, subject: 'Check out this post!');
  //       break;
  //     case 4:
  //       await Share.share(postUrl, subject: 'Check out this post!');
  //       break;
  //   }
  // }
// }


Future<void> sendEmailForHighLikes(Post post) async {
  final likes = post.likes.length;
  if (likes > 5) {
    final emailBody = '''
Description: ${post.description}
Location: ${post.location}
Post URL: ${post.postUrl}
''';

    final emailSubject = 'TO INFORM  A THREAT';
    final smtpServer = 'smtp.example.com';
    final smtpPort = 587;
    final smtpUsername = 'tOPsECRETS';
    final smtpPassword = 'tOPsECRETS123';
    final recipientEmail = '	rnd@rda.gov.lk';

    final message = '''
From: 	topsecrets.gpt@gmail.com
To: $recipientEmail
Subject: $emailSubject

$emailBody
''';

    final socket = await Socket.connect(smtpServer, smtpPort);
    socket.listen((data) {
      print(String.fromCharCodes(data));
    });

    socket.write('HELO\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('AUTH LOGIN\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('${base64.encode(utf8.encode(smtpUsername))}\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('${base64.encode(utf8.encode(smtpPassword))}\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('MAIL FROM:<sender@example.com>\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('RCPT TO:<$recipientEmail>\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('DATA\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write(message);
    socket.write('\n.\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.write('QUIT\n');
    await Future.delayed(const Duration(seconds: 1));
    socket.destroy();
  }
}



}