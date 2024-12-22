import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';


class VocalAssistant extends StatefulWidget {
  const VocalAssistant({super.key});

  @override
  State<VocalAssistant> createState() => _VocalAssistantState(); // Ensure this is properly aligned
}

class _VocalAssistantState extends State<VocalAssistant> {
  SpeechToText _speechToText = SpeechToText(); // Initialize the speech-to-text instance
  bool _speechEnabled = false;
  String _lastWords = '';
  String _responseText = ''; 
  PickedFile? pickedImage;
  File _image = File('');
  bool _load = false;
  final picker = ImagePicker();


  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: "AIzaSyAu49xMSATwaSwLi-IjvlyNSqj9-UTGxSU",
  );

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }
    Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
    Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
void _onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      _lastWords = result.recognizedWords;
    });

    if (_lastWords.isNotEmpty) {
      try {
        // Generate content from the model
        final response =
            await model.generateContent([Content.text(_lastWords)]);
        setState(() {
          _responseText = response.text!; // Update the UI with the response
        });
      } catch (e) {
        setState(() {
          _responseText = 'Error generating response: $e';
        });
      }
    }
  }
    Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }




//final response = await model.generateContent([Content.text(prompt)]);
//print(response.text);

  @override
  Widget build(BuildContext context) {

  final prompt =_lastWords;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocal Assistant'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _speechEnabled
                ? 'Tap the microphone to start listening...'
                : 'Speech recognition not available',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            'Last recognized words:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent)
            ),
            child: Text(_lastWords,),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _speechEnabled ? _startListening : null,
                child: const Icon(Icons.mic),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _speechEnabled ? _stopListening : null,
                child: const Icon(Icons.stop),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent)
            ),
            child: Text(_responseText),
            
          ),
          TextButton(
            onPressed: showOptions,
            child: Text('Select Image'),
          ),
          //  Center(
          //   child: _image == null ? Text('No Image selected') : Image.file(_image),
          // ),
        ],
      ),
    );
  }
}
