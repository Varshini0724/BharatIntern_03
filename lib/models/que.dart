class Question{
  final String question;
  final List<String>options;
  final int crctAnswerIndex;
  const Question({
    required this.options,
    required this.question,
    required this.crctAnswerIndex,
});
}