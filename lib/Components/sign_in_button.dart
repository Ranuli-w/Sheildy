import 'package:flutter/material.dart';

class Sign_in_button extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;

  const Sign_in_button({
    super.key,
    required this.onTap,
    required this.text,
    });

  @override
  _Sign_in_buttonState createState() => _Sign_in_buttonState();
}

class _Sign_in_buttonState extends State<Sign_in_button> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _isPressed ? Colors.grey[800] : Colors.black,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
