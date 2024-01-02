enum AppStatus {
  initial,
  loading,
  error,
  success;

  bool get isInitial => this == AppStatus.initial;
  bool get isLoading => this == AppStatus.loading;
  bool get isError => this == AppStatus.error;
  bool get isSuccess => this == AppStatus.success;
}
