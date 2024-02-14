import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SignUpPage(),
        ]),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360,
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '9:30',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                        letterSpacing: 0.14,
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 17,
                              height: 17,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(width: 17, height: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 0,
                            child: Container(
                              width: 17,
                              height: 17,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                          ),
                          Positioned(
                            left: 38,
                            top: 1,
                            child: Container(
                              width: 8,
                              height: 15,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                child: Stack(children: [
                ,
                ]),
              ),
              SizedBox(
                width: 275,
                height: 124,
                child: Text(
                  'Create your Account',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Container(
                width: 310,
                height: 52,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF999898)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 188,
                height: 52,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xFF999898),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  ,
                  ],
                ),
              ),
              Container(
                width: 310,
                height: 53,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.4000000059604645),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Text(
                'password',
                style: TextStyle(
                  color: Color(0xFF999898),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Container(
                width: 16,
                height: 16,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 1.65,
                      child: Container(
                        width: 16,
                        height: 12.71,
                        child: Stack(children: [
                        ,
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Remember me',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Container(
                width: 15,
                height: 15,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(children: [
                ,
                ]),
              ),
              Container(
                width: 275,
                height: 51,
                decoration: ShapeDecoration(
                  color: Color(0xFF212121),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.14,
                ),
              ),
              Text(
                'or continue with',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Container(
                width: 117,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFA7A7A7),
                    ),
                  ),
                ),
              ),
              Container(
                width: 117,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFA7A7A7),
                    ),
                  ),
                ),
              ),
              Container(
                width: 64,
                height: 58,
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: 11,
                      child: Container(
                        width: 34,
                        height: 34,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF6F6F6),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 5.67,
                              top: 5.67,
                              child: Container(
                                width: 21.96,
                                height: 22.67,
                                child: Stack(children: [
                                ,
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 58,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 64,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFF999898)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 12,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1877F2),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Text(
                'Sign in',
                style: TextStyle(
                  color: Color(0xFFE19C39),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Container(
                width: 360,
                height: 28,
                padding: const EdgeInsets.only(top: 18, bottom: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 2,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1E1E1E),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360,
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '9:30',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                        letterSpacing: 0.14,
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 17,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 17,
                              height: 17,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(width: 17, height: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 0,
                            child: Container(
                              width: 17,
                              height: 17,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                          ),
                          Positioned(
                            left: 38,
                            top: 1,
                            child: Container(
                              width: 8,
                              height: 15,
                              child: Stack(children: [
                              ,
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  ,
                  ],
                ),
              ),
              SizedBox(
                width: 275,
                height: 124,
                child: Text(
                  'Login to your \nAccount',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 36,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Container(
                width: 310,
                height: 52,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF999898)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                width: 188,
                height: 52,
                child: Text(
                  'Mike@ud.com',
                  style: TextStyle(
                    color: Color(0xFF999898),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  ,
                  ],
                ),
              ),
              Container(
                width: 310,
                height: 53,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFFEFE),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.4000000059604645),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Container(
                width: 16,
                height: 16,
                padding: const EdgeInsets.symmetric(vertical: 1.65),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 16,
                      height: 12.71,
                      child: Stack(children: [
                      ,
                      ]),
                    ),
                  ],
                ),
              ),
              Text(
                'Remember me',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Container(
                width: 15,
                height: 15,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  ,
                  ],
                ),
              ),
              Container(
                width: 275,
                height: 51,
                decoration: ShapeDecoration(
                  color: Color(0xFF212121),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: 0.14,
                ),
              ),
              Text(
                'Forgot the password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Text(
                'or continue with',
                style: TextStyle(
                  color: Color(0xFF999898),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Container(
                width: 117,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFA7A7A7),
                    ),
                  ),
                ),
              ),
              Container(
                width: 117,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFA7A7A7),
                    ),
                  ),
                ),
              ),
              Container(
                width: 64,
                height: 58,
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      top: 11,
                      child: Container(
                        width: 34,
                        height: 34,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF6F6F6),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 5.67,
                              top: 5.67,
                              child: Container(
                                width: 21.96,
                                height: 22.67,
                                child: Stack(children: [
                                ,
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 58,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 64,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFF999898)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 12,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 34,
                                height: 34,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1877F2),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Don’t have an account?',
                style: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Text(
                'Sign up',
                style: TextStyle(
                  color: Color(0xFFE19C39),
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                  letterSpacing: 0.13,
                ),
              ),
              Container(
                width: 360,
                height: 28,
                padding: const EdgeInsets.only(top: 18, bottom: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 72,
                      height: 2,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1E1E1E),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: -14,
                top: 666,
                child: Container(
                  width: 386,
                  height: 144,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0x00E7EAEE), Color(0xFFE7EAEE)],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 772,
                child: Container(
                  width: 360,
                  height: 28,
                  padding: const EdgeInsets.only(top: 18, bottom: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 72,
                        height: 2,
                        decoration: ShapeDecoration(
                          color: Color(0xFF1E1E1E),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 3,
                child: Container(
                  width: 360,
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '9:30',
                        style: TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.10,
                          letterSpacing: 0.14,
                        ),
                      ),
                      Container(
                        width: 46,
                        height: 17,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 17,
                                height: 17,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(width: 17, height: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16,
                              top: 0,
                              child: Container(
                                width: 17,
                                height: 17,
                                child: Stack(children: [
                                ,
                                ]),
                              ),
                            ),
                            Positioned(
                              left: 38,
                              top: 1,
                              child: Container(
                                width: 8,
                                height: 15,
                                child: Stack(children: [
                                ,
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 59,
                top: 71,
                child: Text(
                  'App Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.05,
                    letterSpacing: 0.20,
                  ),
                ),
              ),
              Positioned(
                left: 59,
                top: 140,
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
              Positioned(
                left: 123,
                top: 575,
                child: Text(
                  'Privacy policy',
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
              Positioned(
                left: 143,
                top: 698,
                child: SizedBox(
                  width: 73,
                  height: 13,
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.14,
                      letterSpacing: 0.12,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 99,
                top: 607,
                child: Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 130,
                child: Container(
                  width: 39,
                  height: 39,
                  padding: const EdgeInsets.symmetric(horizontal: 3.25, vertical: 11.38),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    ,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 59,
                top: 190,
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
              Positioned(
                left: 59,
                top: 241,
                child: Text(
                  'Language',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 181,
                child: Container(
                  width: 39,
                  height: 39,
                  padding: const EdgeInsets.symmetric(horizontal: 3.25, vertical: 11.38),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    ,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 71,
                child: Container(
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 246,
                top: 241,
                child: SizedBox(
                  width: 58,
                  child: Text(
                    'English',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      height: 0.10,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 739,
                child: Container(
                  width: 360,
                  height: 61,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 33,
                        child: Container(
                          width: 360,
                          height: 28,
                          padding: const EdgeInsets.only(top: 18, bottom: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 72,
                                height: 2,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1E1E1E),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 0,
                        child: Container(
                          width: 340,
                          height: 47,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 158,
                                top: 10,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    ,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 94,
                                top: 10,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    ,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 23,
                                top: 10,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    ,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 279,
                                top: 2,
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFAFBFB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    ,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 227,
                                top: 10,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    left: 2.11,
                                    right: 2,
                                    bottom: 2.07,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    ,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 138,
                top: 637,
                child: Text(
                  'About us',
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 360,
          height: 796,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 1024,
                height: 796,
                child: Stack(
                  children: [
                    Positioned(
                      left: 307,
                      top: 0,
                      child: Container(
                        width: 360,
                        height: 52,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '9:30',
                              style: TextStyle(
                                color: Color(0xFF1E1E1E),
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                                letterSpacing: 0.14,
                              ),
                            ),
                            Container(
                              width: 46,
                              height: 17,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 17,
                                      height: 17,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(width: 17, height: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 0,
                                    child: Container(
                                      width: 17,
                                      height: 17,
                                      child: Stack(children: [
                                      ,
                                      ]),
                                    ),
                                  ),
                                  Positioned(
                                    left: 38,
                                    top: 1,
                                    child: Container(
                                      width: 8,
                                      height: 15,
                                      child: Stack(children: [
                                      ,
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 52,
                      child: Container(
                        width: 1024,
                        height: 744,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/1024x744"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 307,
                      top: 768,
                      child: Container(
                        width: 360,
                        height: 28,
                        padding: const EdgeInsets.only(top: 18, bottom: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 2,
                              decoration: ShapeDecoration(
                                color: Color(0xFF1E1E1E),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 317,
                      top: 735,
                      child: Container(
                        width: 340,
                        height: 47,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 158,
                              top: 10,
                              child: Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  ,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 229,
                              top: 10,
                              child: Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.only(
                                  top: 2,
                                  left: 2.11,
                                  right: 2,
                                  bottom: 2.07,
                                ),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  ,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 23,
                              top: 10,
                              child: Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  ,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 298,
                              top: 10,
                              child: Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  ,
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 81,
                              top: 2,
                              child: Container(
                                width: 44,
                                height: 44,
                                padding: const EdgeInsets.all(10),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAFBFB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        ,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 360,
                height: 800,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                        child: Container(
                          width: 800,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 359,
                      top: 0,
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                        child: Container(
                          width: 800,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 1,
                      child: Container(
                        width: 360,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 800,
                      child: Container(
                        width: 360,