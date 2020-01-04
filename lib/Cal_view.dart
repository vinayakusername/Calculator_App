import 'package:calflutter_app/Cal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add&Subtract Two Numbers';


    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  
  String Num1,Num2;
  int result;
  @override
  Widget build(BuildContext context) {

    final ArithmeticOperation AmOperation = Provider.of<ArithmeticOperation>(context);
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter First Number'),
            validator: (input) => input.isEmpty?'Please Enter Some Number':null, 
                onSaved:(input) => Num1= input,
              
             ),
           Padding(padding: EdgeInsets.all(5.0),),
           TextFormField(
             decoration: InputDecoration(labelText: 'Enter Second Number'),
             validator: (input) => input.isEmpty?'Please Enter Some Number':null ,
             onSaved:(input) => Num2 = input,
            
          ),
           

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  int num1 = int.parse(Num1.toString());
                  int num2= int.parse(Num2.toString());
                   
                 result=  AmOperation.Add(num1,num2);
                 Text(result.toString());
                 
                }
              },
              child: Text('Add'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();

                    int num1 = int.parse(Num1.toString());
                    int num2 = int.parse(Num2.toString());

                   result= AmOperation.Subtract(num1, num2);
                   Text(result.toString());
                 
                }
              },
              child: Text('Subtract'),
            ),
          ),








        ],
      ),
    );
  }
}