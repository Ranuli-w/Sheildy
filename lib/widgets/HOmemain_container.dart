import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shieldy/resources/firestore_methods.dart';
import '../utils/colors.dart';


class FeedContainer extends StatefulWidget {

  final snap;
  const FeedContainer({ Key? key,required this.snap,}):super(key:key);

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
        Container(
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
                      backgroundImage:  NetworkImage(
                        widget.snap['profImage'],
                        
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 7,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.snap['username'],
                              
                              //'Username',
                              style: TextStyle(
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
        ),

        // Add the image here
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          width: double.infinity,
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(20), // Set the desired border radius
            child: Image.network(
              widget.snap['postUrl'],



              
              // 'https://images.unsplash.com/photo-1707343843598-39755549ac9a?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                });
                await _firestoreMethods.updateLikes(
                  widget.snap['postId'],
                  isLiked,
                );


              },
              icon: isLiked
                  ? const Icon(Icons.arrow_upward,color: Colors.red)
                  : const Icon(Icons.arrow_upward_outlined),
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

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 0.01,
            horizontal: 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    SizedBox(width: 2),
  DefaultTextStyle(
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
    child: Text(
      '${widget.snap['likes'].length}',
      style: Theme.of(context).textTheme.bodyText2,
    ),
  ),
  SizedBox(width: 40), // Add horizontal space here
  DefaultTextStyle(
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
    child: Text(
      '${widget.snap['dislikes'].length}',
      style: Theme.of(context).textTheme.bodyText2,
    ),
  ),
],

                ),

              
              
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: primaryColor),
                    children:  [
                      TextSpan(
                        
                        text: 
                        widget.snap['username'],
                        
                        //'username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),TextSpan(
                        text: ' ${widget.snap['description']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                  child: Text('5 comments',style:const TextStyle(fontSize: 15,color: secondaryColor)),),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  DateFormat .yMMMd().format(widget.snap['datePublished'].toDate()),
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
}
/*import 'package:flutter/material.dart';
import '../utils/colors.dart';

class FeedContainer extends StatefulWidget {

  final snap;
  const FeedContainer({ Key? key,required this.snap,}):super(key:key);

  @override
  _FeedContainerState createState() => _FeedContainerState();
}

class _FeedContainerState extends State<FeedContainer> {
  bool thumbsUpSelected = false;
  bool thumbsDownSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                      backgroundImage:  NetworkImage(
                        //snap['photoUrl'],
                        'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
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
                              //snap['username'],
                              'Username',
                              style: TextStyle(
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
        ),

        // Add the image here
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          width: double.infinity,
          child: ClipRRect(
            //borderRadius: BorderRadius.circular(20), // Set the desired border radius
            child: Image.network(snap['image_url'],
              // 'https://images.unsplash.com/photo-1707343843598-39755549ac9a?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  // Toggle thumbs-up icon
                  thumbsUpSelected = !thumbsUpSelected;
                  thumbsDownSelected = false; // Ensure only one is selected
                });
              },
              icon: Icon(
                thumbsUpSelected ? Icons.thumb_up : Icons.thumb_up_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  // Toggle thumbs-down icon
                  thumbsDownSelected = !thumbsDownSelected;
                  thumbsUpSelected = false; // Ensure only one is selected
                });
              },
              icon: Icon(
                thumbsDownSelected ? Icons.thumb_down : Icons.thumb_down_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.comment),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 18,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                    child: Text(
                      '13likes',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(width: 10), // Add space between likes and dislikes
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                    child: Text(
                      '13dislikes',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: primaryColor),
                    children: const [
                      TextSpan(
                        text: 'username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'username hey this is the description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
                  child: Text('5 comments',style:const TextStyle(fontSize: 15,color: secondaryColor)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text('09/02/2024',style:const TextStyle(fontSize: 15,color: secondaryColor)),
              )
            ],
          ),
        ),
      ],
    );
  }
}*/