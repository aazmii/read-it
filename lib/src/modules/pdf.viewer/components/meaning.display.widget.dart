import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';

class MeaningDisplayWidget extends StatelessWidget {
  const MeaningDisplayWidget({super.key, required this.meaning});
  final Translation meaning;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SizedBox(
        height: context.height * 0.58,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CustomTextField(text: meaning.en)),
                    const ActionPanel(),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: CustomTextField(
                text: meaning.bn,
                readOnly: true,
                // showLoader: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionPanel extends StatelessWidget {
  const ActionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
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
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, this.readOnly, this.showLoader = false});
  final String text;
  final bool? readOnly, showLoader;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Stack(
        children: [
          TextFormField(
            initialValue: text,
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
          if (showLoader!) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
