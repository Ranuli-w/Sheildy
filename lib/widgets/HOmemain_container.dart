import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/colors.dart';

class FeedContainer extends StatelessWidget {

  final snap;
  const FeedContainer({ Key? key,required this.snap,}):super(key:key);

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
                      backgroundImage: const NetworkImage(
                        'https://i.stack.imgur.com/l60Hf.png',
                        
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
                              snap['username'],
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
              snap['postUrl'],
              // 'https://images.unsplash.com/photo-1707343843598-39755549ac9a?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_down),
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
                         '${snap['likes'].length}likes',
                        //'likes',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    SizedBox(width: 10), // Add space between likes and dislikes
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                      child: Text(
                        '${snap['dislikes'].length}dislikes',
                        //'13dislikes',
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
                        //snap:['username'],
                        
                        'username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),TextSpan(
                        text: snap['description'],
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
                  DateFormat .yMMMd().format(snap['datePublished'].toDate()),
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




 