import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAlertbox(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyAlertbox extends StatefulWidget {
  const MyAlertbox({super.key});
  @override
  State createState() => _MyAlertBoxState();
}

class _MyAlertBoxState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOFBirthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog box"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Your name",
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dateOFBirthController,
              decoration: const InputDecoration(
                hintText: "Enter your Date of Birth",
                prefixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
                String dateFormate = DateFormat.yMMMd().format(pickDate!);
                setState(() {
                  dateOFBirthController.text = dateFormate;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isNotEmpty &&
                    dateOFBirthController.text.trim().isNotEmpty) {
                  setState(() {});
                  showAlertBoox();
                } else {
                  showWarnig();
                }
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              child: const Text(
                "Validate",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showWarnig() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Warning"),
          content: const Text("Please enter valid details"),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Ok",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showAlertBoox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          content: const Text("Do you want save details"),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue)),
              onPressed: () {
                setState(() {});
                nameController.clear();
                dateOFBirthController.clear();

                Navigator.of(context).pop();
              },
              child: const Text(
                "Yes",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
