// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:share_plus/share_plus.dart';




// class Share_Button extends StatelessWidget {
//   const Share_Button({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// Future<void> _sharePost() async {
//   final postUrl = widget.snap['postUrl'];
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

//   if (selected != null) {
//     switch (selected) {
//       case 0:
//         await Clipboard.setData(ClipboardData(text: postUrl));
//         break;
//       case 1:
//         await Share.share(postUrl, subject: 'Check out this post!');
//         break;
//       case 2:
//         await Share.share(postUrl, subject: 'Check out this post!');
//         break;
//       case 3:
//         await Share.share(postUrl, subject: 'Check out this post!');
//         break;
//       case 4:
//         await Share.share(postUrl, subject: 'Check out this post!');
//         break;
//     }
//   }
  
// }







// }
