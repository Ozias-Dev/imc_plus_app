import 'package:flutter/material.dart';
import 'package:imc_plus_app/constant/colors.dart';
import 'package:imc_plus_app/views/result.dart';

class Ctrl extends StatefulWidget {
  bool isHomme = true;
  Ctrl({super.key, required this.isHomme});

  @override
  State<Ctrl> createState() => _CtrlState();
}
int poids = 25;
int taille = 100;

class _CtrlState extends State<Ctrl> {
  
  @override
  Widget build(BuildContext context) {
    Color hColorMain = widget.isHomme ? hbleue : hred;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, left: 30),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios_new, color: hColorMain,)),
                            SizedBox(width: 10,),
                            Text("IMC Plus", style: TextStyle(color: hColorMain, fontSize: 25, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.isHomme?"Homme": "Femme", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            Icon(widget.isHomme?Icons.male : Icons.female, size:130, color: hColorMain,),
                            Text("Poids (KG)", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 30,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext,index){
                            int i = (index + 5)*5;
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      poids = i;
                                      print(i);
                                    });
                                  },
                                  child: Center(
                                    child: Text("$i", 
                                    style: TextStyle(
                                      fontSize: poids==i ? 45 : 24,
                                      color: poids==i ? hColorMain :Colors.black),),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ],
                  ),
                )),
                Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: hColorMain
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50.0, left: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Taille\n (CM)", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 30,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext,index){
                            int j = (index + 16)*5;
                            return Container(
                              margin: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: taille==j? Colors.white:hColorMain,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      taille = j;
                                    });
                                  },
                                  child: Center(
                                    child: Text("$j", 
                                    style: TextStyle(
                                      fontSize: 24, 
                                      color:taille == j ? hColorMain : Colors.white, ),),
                                  ),
                                ),
                              ),
                            );
                          })),
                    ],
                  ),
                ))
            ],
          ),
          Positioned(
            bottom: 15,
            right: MediaQuery.of(context).size.width*0.23,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: hyellow,
                shape: BeveledRectangleBorder()
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("CALC", style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),),
              ),))
        ],
      ),
    );
  }
}