
   import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

//worker details popup
Future workerPopup(BuildContext ctx,DocumentSnapshot document) async
  {

    print('working');
    return showDialog(
      context: ctx,
          builder: (ctx1) {
      return 
          AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(25))),
            content: Container(
              height:MediaQuery.of(ctx).size.height,
               width: 400,

               padding: EdgeInsets.all(11.0),
            color: Colors.white,
              child: ListView(
                children: [
                 //

                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(900),       //
                          child: (document['profileimg']=='')?
                          Image.asset(
                              fit: BoxFit.cover, 'assets/images/default.png'):
                              FadeInImage
                              
                            (
                              
                              image: NetworkImage(
                             
                                  document['profileimg'],
                                    scale:500,
                                ),
                                placeholder: const AssetImage( 'assets/images/imageloading.gif'),
                                 fit: BoxFit.cover,
                            )
                          
                              ),
                    ),
                  SizedBox(height: 10,),
            Text(document['username'],
                style: GoogleFonts.amaranth(
                    letterSpacing: 2,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    )),

                  ],
                 ),
            SizedBox(
              height: 20,
            ),

            card(
                title: 'E-mail',
                // content: 'josephjibi33@gmail.com',
                content: document['email'],
                cardicon: Icon(Icons.mail)),
            card(
                title: 'Phone No.',
                // content: '9496035739',
                content: document['phoneNo'],
                cardicon: Icon(Icons.phone)),
            card(
                title: 'Total no. complaints assigned',
                // content: '5445',
                content: document['totalcomplaintcount'].toString(),
                cardicon: Icon(Icons.numbers)),
            card(
                title: 'Done Work',
                // content: '5445',
                content: document['donecount'].toString(),
                cardicon: Icon(FontAwesomeIcons.hashtag)),
           card(
                title: 'Pending Work',
                // content: '5445',
                content: document['pendingcount'].toString(),
                cardicon: Icon(FontAwesomeIcons.hashtag)),

                 //
                SizedBox(height: 20,),

                    SizedBox(height: 20,),
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop();
                    }, child: Text('Close'))

              ]),
            ),
          );
          }
    );
  }

  Card card({String? title, String? content, Icon? cardicon}) {
    return Card(
      color: Color.fromARGB(255, 244, 245, 245),
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title!,
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 126, 124, 124))),
            SizedBox(height: 5.0),
            Row(children: [
              cardicon!,
              SizedBox(width: 10.0),
              Text(content!, style: GoogleFonts.poppins()),
            ]),
          ])),
    );
  }