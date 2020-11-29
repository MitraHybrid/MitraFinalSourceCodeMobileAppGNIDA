class ApiResponse<T> {
  ApiStatus status;
  T data;
  String message;

  ApiResponse.loading(this.message) : status = ApiStatus.Loading;
  ApiResponse.completed(this.data) : status = ApiStatus.Completed;
  ApiResponse.error(this.message) : status = ApiStatus.Error;
}

enum ApiStatus { Loading, Completed, Error }
