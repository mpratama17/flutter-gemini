import 'package:berl1n_gemini/chat_and_image.dart';
import 'package:berl1n_gemini/main.dart';
import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({
    super.key,
  });

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Gemini Ai"),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(text: "Text"),
                  Tab(text: "Text with Image"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [TextOnly(), TextWithImage()],
            )));
  }
}

class TextOnly extends StatefulWidget {
  const TextOnly({
    super.key,
  });

  @override
  State<TextOnly> createState() => _TextOnlyState();
}

class _TextOnlyState extends State<TextOnly> {
  bool loading = false;
  List textChat = [];
  List textWithImageChat = [];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  void fromText({required String query}) {
    setState(() {
      loading = true;
      textChat.add({
        "photo": "assets/images/6.jpg",
        "role": "Berl1n",
        "text": query,
      });
      _textController.clear();
    });
    scrollToTheEnd();

    gemini.generateFromText(query).then((value) {
      setState(() {
        loading = false;
        textChat.add({
          "photo": "assets/images/gemini.jpg",
          "role": "Gemini",
          "text": value.text,
        });
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textChat.add({
          "photo": "assets/images/gemini.jpg",
          "role": "Gemini",
          "text": error.toString(),
        });
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: textChat.length,
            padding: const EdgeInsets.only(bottom: 10),
            itemBuilder: (context, index) {
              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage(textChat[index]["photo"].toString()),
                  // child: Text(textChat[index]["role"].substring(0, 1)),
                ),
                title: Text(
                  textChat[index]["role"],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  textChat[index]["text"],
                  style: GoogleFonts.poppins(),
                ),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                    hintText: "Tanya apa saja",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none),
                    fillColor: Colors.transparent,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              IconButton(
                icon: loading
                    ? LoadingAnimationWidget.inkDrop(
                        color: Colors.lightBlue, size: 30)
                    : const Icon(Icons.send),
                onPressed: () {
                  fromText(query: _textController.text);
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}

// ------------------------------ Text with Image ------------------------------

