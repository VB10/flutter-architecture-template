class NavigateException<T> implements Exception {
  final dynamic model;

  NavigateException(this.model);

  @override
  String toString() {
    return 'This model variable doesnt found in route $model and $T';
  }
}
