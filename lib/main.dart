import 'package:demo/question_var.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main(){
  runApp(Myapps());
}
class Myapps extends StatelessWidget{
  const Myapps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }

}
class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> iconlist=[];
  Questionvalue questionvalue=Questionvalue();
  //int currentans=0;
  void cheekmyans(bool clickans){
    bool actualans=questionvalue.getAns();
    setState(() {
      if(questionvalue.isFinished()==true){
        Alert(
          context: context,
          title: "Finished!",
          desc: 'You reached the end of the question',
        ).show();
        questionvalue.reset();
        iconlist=[];
      }else{
        if(clickans==actualans){
          iconlist.add(
              Icon(Icons.check,color: Colors.green,));

        }else{
          iconlist.add(
              Icon(Icons.close,color: Colors.red,));
        }
        questionvalue.nextquestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Quize"),backgroundColor: Colors.purple,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(questionvalue.getQuestiontitle()
                  ,style: TextStyle(fontSize: 20,color: Colors.red),),
              ),
            ),
            Expanded(flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.purple,
                  shadowColor: Colors.red,
                  elevation: 11,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(11),
                        image: DecorationImage(image: AssetImage(
                            questionvalue.getImage()
                        ),fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: (){
                      cheekmyans(true);
                    }, child: Text("True",style: TextStyle(fontSize: 20),)),
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: (){
                      cheekmyans(false);
                    }, child: Text("False",textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,color: Colors.white,),)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:iconlist ,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}