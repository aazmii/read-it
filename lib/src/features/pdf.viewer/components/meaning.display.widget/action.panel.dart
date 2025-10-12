import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ActionPanel extends StatefulWidget {
  const ActionPanel({super.key, this.text});
  final String? text;
  @override
  State<ActionPanel> createState() => _ActionPanelState();
}

class _ActionPanelState extends State<ActionPanel> {
  final _flutterTts = FlutterTts();
  Map<String, String>? voice;
  @override
  void initState() {
    super.initState();
    _initTTS();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () async {
            if (widget.text == null) return;
            // print(await _flutterTts.getLanguages);
            _flutterTts.speak(widget.text!);
          },
          icon: SvgPicture.asset(
            'assets/icons/volume_solid.svg',
            height: 40,
            width: 40,
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
        ),
        const IconButton(icon: Icon(Icons.copy), onPressed: null),
        const IconButton(icon: Icon(Icons.bookmark), onPressed: null),
        const IconButton(onPressed: null, icon: Icon(Icons.send)),
      ],
    );
  }

  void _initTTS() async {
    var voices = await _flutterTts.getVoices;

    var defaultVoiceRaw = await _flutterTts.getDefaultVoice;

    Map<String, String> defaultVoice = Map<String, String>.from(defaultVoiceRaw);

    if (voices.any((v) => v['name'] == defaultVoice['name'])) {
      await _flutterTts.setVoice({
        'name': defaultVoice['name']!,
        'locale': defaultVoice['locale']!,
      });
    } else {
      await _flutterTts.setLanguage('en-US');
    }

    setState(() {
      voice = defaultVoice;
    });
  }
}
