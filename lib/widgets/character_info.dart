import 'package:flutter/cupertino.dart';

class CharacterInfoWidget extends StatelessWidget {
  const CharacterInfoWidget({Key? key, this.characteristic, this.value}) : super(key: key);

  final String? characteristic;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(style: const TextStyle(fontSize: 16), children: [
      TextSpan(text: '$characteristic: '),
      TextSpan(
        text: value ?? 'unknown',
      ),
    ]
    )
    );
  }
}