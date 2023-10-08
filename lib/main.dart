
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';

// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'World Cup Presentation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=0;

  // final DatabaseReference _database = FirebaseDatabase.instance.ref();
  // List<String> images = [];
  //
  // @override
  // void initState() {
  //
  //   super.initState();
  //   getDataFromFirebase();
  // }
  //
  // void getDataFromFirebase() {
  //   try {
  //     _database.child('images').once().then((DatabaseEvent event) {
  //       final dynamic data = event.snapshot.value;
  //       if (data is Map<dynamic, dynamic>?) {
  //         final Map<dynamic, dynamic>? values = data;
  //         if (values != null) {
  //           values.forEach((key, value) {
  //             images.add(value.toString());
  //           });
  //           // You now have your data in the `dataList`.
  //           setState(() {
  //             // Update the UI with the retrieved data.
  //           });
  //         }
  //       }
  //     }).catchError((error) {
  //       // Handle Firebase Database error
  //       print("Firebase Database Error: $error");
  //     });
  //   } catch (e) {
  //     // Handle other errors, e.g., Firebase.initializeApp() errors
  //     print("Error: $e");
  //   }
  // }

  List<String> images=[
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_01-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_02-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_03-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_04-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_05-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_06-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_07-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_08-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_09-830.webp",
    "https://www.slideegg.com/image/WebpV2/830/200440-World-Cup-Cricket-2023_10-830.webp",
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            elevation: 5,
            child: Container(
              child: Text("ICC Cricket World Cup 2023"),
            ),
          ),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  currentIndex=index%images.length;
                });
              },
              //itemCount: images.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Material(
                    elevation: 6,
                    child: SizedBox(
                      height: 500,
                      width: double.infinity,
                      child: Image.network(
                        images[index%images.length],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
            }
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
            for(var i=0;i<images.length;i++) buildIndicator(currentIndex==i)

          ],),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),

      ),
    );
  }
}
