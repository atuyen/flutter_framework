




class UserData {
  bool success;
  String token;
  String message;
  int userType;
  int userId;

  UserData({this.success, this.token, this.userId, this.message, this.userType});
  factory UserData.fromJson(Map<String, dynamic> map) {
    return UserData(
      success: map['success'],
      token: map['token'],
      message: map['message'],
      userType: map['userType'],
        userId: map['userId']
    );
  }




}