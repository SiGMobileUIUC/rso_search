import 'package:flutter/material.dart';
import 'login.dart';
class registerpage extends StatelessWidget {
  const registerpage({super.key});
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 30),
        color: Colors.lightBlue[200],
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [ 
            SizedBox(height: 100,),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [ 
                  Text("Register", style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(height: 100,)

                ]
              )
            ),
            Expanded( 
              child: Container( 
                decoration: BoxDecoration( 
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding( 
                  
                  padding: EdgeInsets.all(20),
                  child: Column( 
                    children: <Widget>[ 
                      SizedBox(height: 60,),
                      Container( 
                        decoration: BoxDecoration( 
                          
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ 
                            BoxShadow( 
                              color: Color(0xF479CBDA),
                              blurRadius: 20,
                              offset:Offset(0, 10)
                            )
                          ]
                        ),
                        child: Column( 
                          children: <Widget> [ 
                            Container( 
                              height: 60,
                              decoration: BoxDecoration( 
                              
                                border: Border(bottom: BorderSide(color: Colors.blueGrey))
                              ),
                              child: TextField( 
                                
                                decoration: InputDecoration( 
                                  
                                  hintText: "  Email or Phone number",
                                  hintStyle: TextStyle( color: Colors.grey, height: 2.0),
                                  border: InputBorder.none,
                                ),
                              )
                            ),
                            Container( 
                              height:  60,
                              decoration: BoxDecoration( 
                                //border: Border(bottom: BorderSide(color: Colors.blueGrey))
                              ),
                              child: TextField( 
                                decoration: InputDecoration( 
                                  hintText: "  Password",
                                  hintStyle: TextStyle( color: Colors.grey, height: 2),
                                  border: InputBorder.none,
                                ),
                              )
                            ),
                            
                          ]
                          
                        ),
                        
                      ),
                      SizedBox(height: 30,),
                      GestureDetector( 
                        onTap: () {
                          Navigator.push( 
                            context, 
                            MaterialPageRoute(builder: (context) => loginpage()),
                            );
                        },
                        child: Center( 
                          child: Text("Already Registered? Login now", style: TextStyle(color: Colors.grey, fontSize: 12), ),
                        )
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        //onTap: ( 
                          
                        //),
                            child: Container( 
                              height: 50,
                              decoration: BoxDecoration( 
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.lightBlue[200],
                              ),
                              
                              child: Center( 
                                child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 16), ),
                              )
                            )
                      )
                    ]
                  )
                  
                )
              )
            )
          ],
        ),
    ),
    );
  }
}
