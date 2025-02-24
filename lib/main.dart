import 'dart:io' show File;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

void main() {
  runApp(LetterApp());
}

class LetterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Project',
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
      //   ),
      // ),
      home: H1(),
    );
  }
}

class H1 extends StatelessWidget {
  const H1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Ai Agent's",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Text(
            "  Explore AI Agents     ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Most popular Agents by our community ",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Stack(alignment: Alignment.topLeft, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    color: Color(0xffFAE7F9),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 4,
                        // spreadRadius: 2
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text("fdvfd"),

                    Container(
                      width: 300,
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Ai Letter Agent",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(""),
                              SizedBox(
                                width: 200,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LetterTypeSelectionPage()));
                                },
                                child: Container(
                                  width: 80,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Recruit",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  )),
                                ),
                              ),
                            ],
                          ),

                          // Text("",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 0.1,
                              // spreadRadius: 2
                            )
                          ]),
                      // child: ,
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}

class LetterTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Letter Type")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LetterCategoryPage(isFormal: true)),
                );
              },
              child: Text("Formal Letter"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LetterCategoryPage(isFormal: false)),
                );
              },
              child: Text("Informal Letter"),
            ),
          ],
        ),
      ),
    );
  }
}

class LetterCategoryPage extends StatelessWidget {
  final bool isFormal;
  final Map<String, List<String>> formalFields = {
    "Job Application Letter": [
      "Your Name",
      "Your Address",
      "City, State, ZIP Code",
      "Your Email",
      "Your Phone Number",
      "Date",
      "Hiring Manager’s Name",
      "Company Name",
      "Company Address",
      "City, State, ZIP Code",
      "Job Position",
      "Your Field/Experience",
      "Your Qualifications"
    ],
    "Resignation Letter": [
      "Your Name",
      "Your Address",
      "City, State, ZIP Code",
      "Your Email",
      "Your Phone Number",
      "Date",
      "Manager’s Name",
      "Company Name",
      "Company Address",
      "City, State, ZIP Code",
      "Your Position",
      "Last Working Date"
    ],
    "Leave of Absence Request": [
      "Your Name",
      "Your Address",
      "City, State, ZIP Code",
      "Your Email",
      "Your Phone Number",
      "Date",
      "Manager’s Name",
      "Company Name",
      "Company Address",
      "City, State, ZIP Code",
      "Start Date",
      "End Date",
      "Reason"
    ],
    "Invitation Letter for an Event": [
      "Your Name/Organization Name",
      "Your Address",
      "City, State, ZIP Code",
      "Your Email",
      "Your Phone Number",
      "Date",
      "Recipient’s Name",
      "Recipient’s Address",
      "City, State, ZIP Code",
      "Event Name",
      "Date",
      "Venue/Location",
      "Time",
      "Event Highlights",
      "RSVP Date",
      "Your Contact Information"
    ],
  };
  final List<String> informalLetters = [
    "Letter to a Friend (Sharing News)",
    "Letter to a Family Member (Expressing Gratitude)",
    "Letter to a Cousin (Holiday Experience)"
  ];

  LetterCategoryPage({required this.isFormal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              isFormal ? "Select Formal Letter" : "Select Informal Letter")),
      body: ListView(
        children: (isFormal ? formalFields.keys.toList() : informalLetters)
            .map((letterType) {
          return ListTile(
            title: Text(letterType),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LetterGeneratorPage(
                      letterType: letterType,
                      fields: isFormal ? formalFields[letterType]! : []),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class LetterGeneratorPage extends StatefulWidget {
  final String letterType;
  final List<String> fields;
  LetterGeneratorPage({required this.letterType, required this.fields});

  @override
  _LetterGeneratorPageState createState() => _LetterGeneratorPageState();
}

class _LetterGeneratorPageState extends State<LetterGeneratorPage> {
  bool reload = true;
  final Map<String, TextEditingController> controllers = {};
  final TextEditingController _letterEditingController =
      TextEditingController();
  String generatedLetter = "";

  @override
  void initState() {
    super.initState();
    for (var field in widget.fields) {
      controllers[field] = TextEditingController();
    }
    _letterEditingController.addListener(_updateGeneratedLetter);
  }

  void _updateGeneratedLetter() {
    setState(() {
      generatedLetter = _letterEditingController.text;
    });
  }

//apiiiii inteeegration
  Future<void> generateLetter() async {
    const String apiKey = "AIzaSyBwQ267Mz_6jSKhRF7Kx-ybRKZxhsL_qbI";
    final String url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$apiKey";
    final details =
        controllers.entries.map((e) => "${e.key}: ${e.value.text}").join("\n");
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "Generate a ${widget.letterType} using these details:\n$details"
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData.containsKey("candidates") &&
          responseData["candidates"].isNotEmpty) {
        setState(() {
          generatedLetter =
              responseData["candidates"][0]["content"]["parts"][0]["text"];
          _letterEditingController.text = generatedLetter;
        });
      }
    } else {
      setState(() {
        generatedLetter = "Error: Unable to generate letter. Please try again.";
        _letterEditingController.text = generatedLetter;
      });
    }
  }

//pdffff
  Future<void> _generatePdfAndShare() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(generatedLetter, style: pw.TextStyle(fontSize: 16)),
          );
        },
      ),
    );
//
    if (kIsWeb) {
      // For web
      final bytes = await pdf.save();
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute("download", "${widget.letterType}.pdf")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // For mobile
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/${widget.letterType}.pdf");
      await file.writeAsBytes(await pdf.save());
    }
  }

  @override
  void dispose() {
    _letterEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.letterType),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _generatePdfAndShare,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ...widget.fields.map((field) {
            bool isDateField = field.toLowerCase().contains("date");
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: controllers[field],
                readOnly: isDateField,
                decoration: InputDecoration(
                  labelText: field,
                  suffixIcon: isDateField ? Icon(Icons.calendar_today) : null,
                ),
                onTap: isDateField
                    ? () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          controllers[field]!.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                        }
                      }
                    : null,
              ),
            );
          }).toList(),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: reload ? generateLetter : null,
              child: Text(
                  reload ? "Generate Letter" : "reload for another letter ")),
          SizedBox(height: 20),
          TextFormField(
            controller: _letterEditingController,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Generated Letter',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
