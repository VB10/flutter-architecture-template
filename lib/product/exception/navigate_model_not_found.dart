class NavigateException<T> implements Exception {

  NavigateException(this.model);
  final dynamic model;

  @override
  String toString() {
    return 'This model variable doesnt found in route $model and $T';
  }
}
