import 'package:flutter_project/constants/image_constants.dart';

class AccountItem {
  final String label;
  final String iconPath;

  AccountItem(this.label, this.iconPath);
}

List<AccountItem> accountItems = [
  AccountItem("Orders", Images.ordersSVG),
  AccountItem("My Details", Images.detailsSVG),
  AccountItem(
      "Delivery Access", Images.deliverySVG),
  AccountItem("Payment Methods", Images.paymentSVG),
  AccountItem("Promo Card", Images.promoSVG),
  AccountItem(
      "Notifications", Images.notificationSVG),
  AccountItem("Help", Images.helpSVG),
  AccountItem("About", Images.aboutSVG),
];
