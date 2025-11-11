import 'package:flutter_riverpod/legacy.dart';

class ScreenNotifier extends StateNotifier<int> {
  ScreenNotifier() : super(0);

  void pageValueChange(int index) {
    state = index;
  }

  int get currentPage => state;
}

final currentPageProvider =
    StateNotifierProvider<ScreenNotifier, int>(
      (ref) => ScreenNotifier(),
    );