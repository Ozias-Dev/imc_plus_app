import 'package:flutter/material.dart';
import 'package:imc_plus_app/constant/colors.dart';
import 'package:imc_plus_app/views/control.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Ctrl(isHomme: true,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: hbleue,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.male,color: Colors.white,size: 80, ),
                      SizedBox(height: 10,),
                      Text("Homme",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              )),
              Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Ctrl(isHomme: false,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: hred,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female, color: Colors.white,size: 80,),
                      SizedBox(height: 10,),
                      Text("Femme",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ))
          ],
        )),
    );
  }
}