// ignore_for_file: public_member_api_docs, sort_constructors_first
//A
class Task {
  final String name;
  bool isDone;
  Task({
    required this.name,
    this.isDone = true,
  });
  //method to control change of done or not of widgt
  void donechange() {
    isDone = !isDone;
  }
}
