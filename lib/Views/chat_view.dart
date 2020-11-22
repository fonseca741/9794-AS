import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Chat extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat',style: TextStyle(fontSize: 22),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
            
              child: Text('Boutique do Zé', style: TextStyle(fontSize: 22) ,
              ),
            ),
            
          ),
          Divider(
                    color: Color(0xff1d3557),
          ),
          Padding(padding: const EdgeInsets.all(278) 
          ),
          Row(
            children:[
                        Expanded(child: TextField(
            keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Escreva uma mensagem',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
            
                               ),
                              ),
                              IconButton(
                                icon: Icon(Icons.send, color: Colors.green,size: 40,), 
                                onPressed: (){},
                              ),

          ],
          )
          
        ],
      ),)
    );      
  }
}