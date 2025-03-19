Stream<int> numberStream(int max) async* {
  for (int i = 0; i < max; i++) {
    yield i;
    await Future.delayed(const Duration(seconds: 2));
  }
}
