
 class BaseResponse<T>{
  String message;
  String status;
  T data;


  BaseResponse({
    this.message,
    this.status,
    this.data,
  });


  factory BaseResponse.fromJson(Map<String,dynamic> parsedJson){
    return BaseResponse(
      message : parsedJson['message'],
      status : parsedJson['status'],
      data : parsedJson['data'] == null ? null : parsedJson['data'],
    );
  }



}