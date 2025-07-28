import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/apply.dart';
import 'package:flutterdemo/widgets/appbar.dart';
import 'package:flutterdemo/widgets/ca_card.dart';
import 'package:flutterdemo/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(title: "Code Architects App"),
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
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() => opacity = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAAppBar(),
      drawer: CADrawer(homepageActive: true),
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            width: 411,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "If you don’t think about the future, you cannot have one.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "John Galsworthy",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Welcome to Code Architects",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  height: 5,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              radius: Radius.circular(10),
              child: ListView(
                padding: EdgeInsets.all(50),
                children: [
                  CACard(
                    offset: -2,
                    icon: Icons.developer_mode_rounded,
                    title: "Software Development",
                    descriptions: [
                      "Enterprise applications for the cloud",
                      "Database, big data and Business Intelligence",
                    ],
                    color: Color.fromRGBO(54, 169, 225, 1.0),
                  ),
                  SizedBox(height: 20),
                  CACard(
                    offset: 2,
                    icon: Icons.rocket,
                    title: "Mechatronics",
                    descriptions: [
                      "Special machine design",
                      "Industrial vehicles and custom mobile robots",
                    ],
                    color: Color.fromRGBO(41, 35, 92, 1.0),
                  ),
                  SizedBox(height: 20),
                  CACard(
                    offset: -2,
                    icon: Icons.developer_mode_rounded,
                    title: "Consulting",
                    descriptions: [
                      "Formazione & Mentoring",
                      "Ricerca & Sviluppo",
                    ],
                    color: Color.fromRGBO(230, 0, 126, 1.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
            child: SizedBox(
              width: 25,
              height: 180,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        "Code Architects was founded in 2002 in Santeramo in Colle (BA), by Francesco Balena and Giuseppe Dimauro",
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Icon(Icons.info),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
