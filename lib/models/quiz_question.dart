class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final newShuffledList = List.of(answers);
    newShuffledList.shuffle();
    return newShuffledList;
  }
}
