import 'package:my_framework/study/demo_dependency_injection/bank_service.dart';

class VietcomBank extends BankService{

  @override
  void thanhToan() {
    // TODO: implement thanhToan
    super.thanhToan();
    print("Thanh toan = viet combank");
  }

}