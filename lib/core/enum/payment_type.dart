import '../../generated/l10n.dart';

enum PaymentType {
  cash('cash'),
  visa('visa');

  final String name;

  const PaymentType(this.name);
}

String handlePaymentTypeToString({required PaymentType payment}) {
  if (payment == PaymentType.cash) {
    return S.current.cash;
  }
  return S.current.visa;
}
