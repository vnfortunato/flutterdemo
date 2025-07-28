import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/appbar.dart';
import 'package:flutterdemo/widgets/drawer.dart';

class FirstPage extends StatefulWidget {
  const FirstPage ({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAAppBar(),
      drawer: CADrawer(firstPageActive: true),
      body: Container(
        margin: EdgeInsetsGeometry.fromLTRB(20, 0, 20, 0),
        child: Center(
          child: Column(children: [
            SizedBox(height: 70),
            Text("Apply for job", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: "Name", filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), textInputAction: TextInputAction.next),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(labelText: "Surname", filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), textInputAction: TextInputAction.next),
            SizedBox(height: 20),
            TextField(controller: _dateController, decoration: InputDecoration(labelText: "Date of birth", filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))), textInputAction: TextInputAction.next, onTap: () => _selectDate(context), readOnly: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: SizedBox(
                  width: 20,
                  height: 120,
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      SizedBox(
                          width: 110,
                          child: Text(
                            "Form Submitted", textAlign: TextAlign.center,
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
            ), child: Text("Submit"))
          ])
        ),
      ),
      );
  }
}
