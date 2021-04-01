class FifaResponseResponse<T> {
  Status status;
  T data;
  String message;

  FifaResponseResponse.loading(this.message) : status = Status.LOADING;
  FifaResponseResponse.completed(this.data) : status = Status.COMPLETED;
  FifaResponseResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }