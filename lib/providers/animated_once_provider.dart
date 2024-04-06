import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedOnceNotifier extends StateNotifier<bool> {
  AnimatedOnceNotifier() : super(false);

  void setAnimatedOnce() {
    state = true;
  }
}

final animatedOnceProvider =
    StateNotifierProvider<AnimatedOnceNotifier, bool>((ref) {
  return AnimatedOnceNotifier();
});
