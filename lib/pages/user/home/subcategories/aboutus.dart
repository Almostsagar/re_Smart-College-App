import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant.dart';

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/images/back_arrow.svg',
              width: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Stack(
                children: <Widget>[
                  Text(
                    'About US',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: 'Cardo',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Column(children: const [
                          SizedBox(
                            height: 80,
                          ),
                          CircleAvatar(
                            radius: 65.0,
                            backgroundImage: NetworkImage(
                                'https://media-exp1.licdn.com/dms/image/C5603AQFiU9cIl1ZfSA/profile-displayphoto-shrink_200_200/0/1634197921575?e=1640217600&v=beta&t=TlIa6YxsR0jCYzfLnioLim4OAiSMISzFui9j-ppOJqA'),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Sagar Kumar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '19CSE003',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          )
                        ]),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        child: Column(children: const [
                          SizedBox(
                            height: 80,
                            width: 80,
                          ),
                          CircleAvatar(
                            radius: 65.0,
                            backgroundImage:
                                AssetImage('assets/images/amitji.jpeg'),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Amit Kashyap',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '19CSE008',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      child: Column(children: const [
                        SizedBox(
                          height: 300,
                          width: 80,
                        ),
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage:
                              AssetImage('assets/images/gauravji.jpeg'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 80,
                        ),
                        Text('Gaurav Kumar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '19CSE010',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                        ),
                        Text(
                          'Motivation',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: 'Cardo',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "As we know “Time is money” and in a student's life the most valuable"
                          "thing is time. Students do not have to face any difficulty if the staff"
                          " members can track all the problems related to their students. So that "
                          "they can solve students' problems on time and without wasting time. "
                          "So we have included all the solutions in a single app.",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
