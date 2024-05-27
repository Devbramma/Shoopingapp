import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/Login_Mobile.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? lang;
  List<String> selectedItems = [];
  var list = [
    "Hindi",
    "Tamil",
    "Telugu",
    "Kannada",
    "English",
    "Punjabi",
    "Odia",
    "Assamese",
    "Gujarati",
    "Malayalam",
    "Marathi",
    "Bengali"
  ];
  var list1 = [
    "हिंदी",
    "தமிழ்",
    "తెలుగు",
    "ಕನ್ನಡ",
    "English",
    "ਪੰਜਾਬੀ",
    "ଓଡ଼ିଆ",
    "অসমীয়া",
    "ગુજરાત",
    "മലയാളം",
    "मराठी",
    "বাংলা",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.blue[600],
          title: const Text('Choosen Language'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    return languageTile(context, i);
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginMobile()),
                      );
                    },
                    child: const Text(
                      "CONTINUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget languageTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _toggleSelection(list[index]);
      },
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: Radio(
                value: list[index],
                groupValue: lang,
                onChanged: (String? value) {
                  _toggleSelection(value!);
                },
              ),
            ),
            Column(
              children: [
                Text(
                  list[index],
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(list1[index]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _toggleSelection(String language) {
    setState(() {
      if (selectedItems.contains(language)) {
        selectedItems.remove(language);
        if (lang == language) {
          lang = null;
        }
      } else {
        selectedItems.add(language);
        lang = language;
      }
    });
  }
}