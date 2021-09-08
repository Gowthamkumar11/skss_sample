import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  dynamic categorylistvalue = [
    "Food",
    "Arts & Entertainment",
    "Music",
    "Writing",
    "Sports & Gaming",
    "Design & Style",
    "Business",
    "Science & Tech",
    "Home & Lifestyle",
    "Community & Government",
    "Wellness"
  ];
  final TextEditingController textController = TextEditingController();
  final FocusNode textFocus = FocusNode();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 10,
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: textController,
              focusNode: textFocus,

              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                fillColor: Color(0xff212121), filled: true,
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.amber)),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    textController.clear();
                    textFocus.unfocus();
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    textController.clear();
                    textFocus.unfocus();
                  },
                ),
                labelText: 'Try "Film and TV"',
                // errorText: 'field cannot be empty',
                hintText: '',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              //     validator: (value) {
              //       value = textController.text;
              //  return value.clear();
              //       // if (value.isEmpty ||
              //       //     value.length > 12) {
              //       //   value = 'Enter valid coupon';
              //       //   return value;
              //       // } else {
              //       //   return null;
              //       // }
              //     },
            ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   color: Colors.blue,
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: ListView.builder(
                      itemCount: categorylistvalue.length,
                      itemBuilder: (context, index1) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 4,
                            top: 10,
                            bottom: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Container(
                                  width: 100,
                                  child: Text(
                                    categorylistvalue[index1],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              // Container(
                              //   height: 25,
                              //   color: Colors.red,
                              //   width: 3,
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                    color: Color(0xff212121),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 600,
                    // MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: ListView.builder(
                      itemCount: categorylistvalue.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${categorylistvalue[index]} classes",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 2,
                              itemBuilder: (contex, vindex) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NormalPlayerPage(),
                                          ),
                                        );
                                      },
                                      onDoubleTap: () => null,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              color: Colors.amber,
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Name',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text('heading',
                                                  style: TextStyle(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 4,
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
