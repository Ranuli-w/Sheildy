import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class FeedContainer extends StatelessWidget {
  const FeedContainer({Key? key});

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
            child: Image.network(
              'https://images.unsplash.com/photo-1707343843598-39755549ac9a?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                      ),TextSpan(
                        text: 'username hey this is the driscriptiuonj',
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
                  child: Text('09/02/2024',style:const TextStyle(fontSize: 15,color: secondaryColor)),)
            ],
          ),
        ),
      ],
    );
  }
}



 