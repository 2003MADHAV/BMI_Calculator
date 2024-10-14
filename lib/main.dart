import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your BMI',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Welocme to BMI APP'),



    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtConroller=TextEditingController();
  var ftConroller=TextEditingController();
  var inConrolller=TextEditingController();
  var result="";
  var bgColor=Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text('Wlcome To BMI Calculator')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(
                  fontSize: 34,fontWeight:FontWeight.w600,

                ),),

                SizedBox(height: 21,),
                 TextField(
                   controller: wtConroller,
                   decoration: InputDecoration(
                     label: Text('Enter Your Weight (In Kgs) '),
                     prefixIcon: Icon(Icons.line_weight)

                   ),
                  keyboardType: TextInputType.number,
                 ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftConroller,
                  decoration: InputDecoration(
                      label: Text('Enter Your Height(In feet) '),
                      prefixIcon: Icon(Icons.height)

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                SizedBox(height: 11,),
                TextField(
                  controller: inConrolller,
                  decoration: InputDecoration(
                    label: Text('Enter your Height (In inch)  '),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),

                ElevatedButton(onPressed: (){
                  var wt=wtConroller.text.toString();
                  var ft=ftConroller.text.toString();
                  var inch=inConrolller.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //bmi calculation

                    var iWt=int.parse(wt);
                    var iFt=int.parse(ft);
                    var iInch=int.parse(inch);

                    var tinch=(iFt*12)+ iInch;
                    var tCm=tinch*2.54;
                    var tM=tCm/100;

                    var bmi=iWt/(tM*tM);

                    var msg="";

                    if(bmi>25){
                      msg="You are OverWeight!!";
                      bgColor=Colors.orange.shade200;

                    }
                    else if(bmi<18){
                      msg="You are UnderWeight!!";
                      bgColor=Colors.red.shade200;

                    }
                    else{
                      msg="You are Healthy!!";
                      bgColor=Colors.green.shade200;

                    }

                    setState(() {
                      result="$msg \n Your BMI is ${bmi.toStringAsFixed(3)}";
                    });



                  }
                  else{
                    setState(() {
                      result="Please fill all the Required blanks";
                    });

                  }

                }, child: Text('Calculate')),

                SizedBox(height: 11,),

                Text(result,style: TextStyle(fontSize: 20),),

                SizedBox(height: 200,),

                Center(child: Text("     Design BY \nMadhav Kumar"))

              ],
            ),
          ),
        ),
      )

    );
  }
}
