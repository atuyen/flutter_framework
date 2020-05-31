

abstract class IGetNotificationNumberListener {
  onGetNotificationNumberSuccess(int notificationNumber);

  onGetNotificationNumberFailed(errMsg);
}

class NotificationRepository{

  void getNotificationNumber(IGetNotificationNumberListener listener){
    Future.delayed(Duration(seconds: 2),(){
      listener.onGetNotificationNumberSuccess(5);
    });


  }




}