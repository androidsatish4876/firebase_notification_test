import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio();
  var showoption=true;
  TextEditingController serverkeyCtr=TextEditingController();
  TextEditingController deviceTokenkeyCtr=TextEditingController();
  TextEditingController titleCtr=TextEditingController();
  TextEditingController bodyCtr=TextEditingController();
  TextEditingController clickUrlCtr=TextEditingController();
  TextEditingController iconUrlCtr=TextEditingController();
  TextEditingController dataCtr=TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body:
            SingleChildScrollView(
              child: Expanded(
                child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


              if(MediaQuery.of(context).size.width >= 800)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                 Card(
                   elevation: 10,
                   shadowColor: Colors.cyan,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(50),
                       bottomRight: Radius.circular(50)
                     )
                   ),
                   child:
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         SizedBox(
                           height: 50,
                         ),
                         Image(image: AssetImage("assets/undraw_notifications.png"),height: 250,  width: MediaQuery.of(context).size.width/2.5,),
                         SizedBox(
                           height: 30,
                         ),
                         Text("Test Your Firebase Push",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)
                         ,SizedBox(
                           height: 10,
                         )
                         ,Text("Notifications with Easy!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)
                         ,SizedBox(
                           height: 30,
                         ),
                         RichText(
                           text: TextSpan(
                             text: 'Developed By',
                             style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16), /*defining default style is optional */
                             children: <TextSpan>[
                               TextSpan(
                                   text: ' Rhythm Tech Lab',
                                   style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16)),
                             ],
                           ),
                         ),
                       ],
                     ),
                   )

                   ,)

                ],
              ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Row(
                              children: [
                                Image(image: AssetImage("assets/firebase_icon.png"),height: 50,),
                                Column(
                                  children: [
                                    Text("Firebase Notification Test",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),



                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Server Key *",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width/2.3,
                                  child: TextField(
                                    controller: serverkeyCtr,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                      hintText: "Server Key",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Text("FCM Registration Token (Device Token) *",style: TextStyle(color: Colors.black,fontSize: 14),)
                                ,
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width/2.3,
                                  child: TextField(
                                    controller: deviceTokenkeyCtr,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                      hintText: "FCM Registration Token (Device Token)",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Title *",style: TextStyle(color: Colors.black,fontSize: 14),),
                                Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width/2.3,
                                  child: TextField(
                                    controller: titleCtr,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                      hintText: "Notification Title",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Body *",style: TextStyle(color: Colors.black,fontSize: 14),),

                                Container(
                                  width: MediaQuery.of(context).size.width/2.3,
                                  child: TextField(
                                    controller: bodyCtr,
                                    maxLines: 3,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                                      hintText: "Notification Body",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: TextButton(onPressed: (){
                                    if(showoption)
                                    {
                                      showoption=false;
                                    }else
                                    {
                                      showoption=true;
                                    }
                                    setState(() {
                                    });
                                  }, child: Text(showoption?"Hide Option":"Show Option",style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w600),)),
                                )
                                ,
                                SizedBox(
                                  height: 5.0,
                                ),
                                Visibility(
                                  visible: showoption,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("Click Action URL - (optional)",style: TextStyle(color: Colors.black,fontSize: 14),),

                                      Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: TextField(
                                          controller: clickUrlCtr,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                            hintText: "URL to redirect",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Icon URL - (optional)",style: TextStyle(color: Colors.black,fontSize: 14),),
                                      Container(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: TextField(
                                          controller: iconUrlCtr,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                            hintText: "Icon URL",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Data - (optional)",style: TextStyle(color: Colors.black,fontSize: 14),),

                                      Container(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: TextField(
                                          controller: dataCtr,
                                          maxLines: 3,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                                            hintText: "Must be JSON Object like {'key':'value'}",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  surfaceTintColor: Theme.of(context).primaryColor,
                                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20)
                                ),

                                onPressed: (){
                                  print("clcik");
                                  sendNotification();
                            }, child: Text("Push Notification",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),))

                          ],
                        ),
                      ],
                    )
                ),
              ),
            ),

      );
  }

  Future<void> sendNotification()async{
    String serverkey= serverkeyCtr.text.trim();
    String devicetoken= deviceTokenkeyCtr.text.trim();
    String title= titleCtr.text.trim();
    String body= bodyCtr.text.trim();
    String clickurl=clickUrlCtr.text.trim();
    String iconurl= iconUrlCtr.text.trim();
    String datamessage= dataCtr.text.trim();
    
    
    try{
        dio..options.headers={
        'Authorization':'key=${serverkey}'
              //'Content-Type': 'application/json; charset=UTF-8',

              //'Authorization': 'Bearer $token',
              //  AppConstants.LANG_KEY : countryCode == 'US'? 'en':countryCode.toLowerCase(),
            };

        var data={

        "to" :devicetoken,
        "notification" : {
          'title' : title,
        'body'  : body,
          'image': iconurl,
         'click_action':clickurl
        },

        };




      final response=await dio.post("https://fcm.googleapis.com/fcm/send",data: jsonEncode(data));
      if(response.statusCode==200)
        {
          print(response.data);
          
          final data=jsonDecode(response.data);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Successfully Send'),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'ACTION',
                  onPressed: () { },
                ),
              ));
        }
      
    }catch(e)
    {
      print("exception ${e}");
    }
  }
}
