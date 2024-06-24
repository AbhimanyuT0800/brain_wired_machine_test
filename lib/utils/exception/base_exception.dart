class BaseException {
  final String message;
  BaseException(this.message);

  ///override toString method for getting message as return
  @override
  String toString() => message;
}
