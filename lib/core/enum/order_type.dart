import '../../generated/l10n.dart';

enum OrderType {
  pending("pending"),
  confirmed("confirmed"),
  inProgress("in_progress"),
  outForDeleivery("out_for_delivery"),
  delivered("delivered"),
  returns("returned"),
  canceled("canceled");

  final String name;

  const OrderType(this.name);
}

String handleOrderTypeToString({required OrderType code}) {
  if (code == OrderType.pending) {
    return S.current.underReview;
  } else if (code == OrderType.confirmed) {
    return S.current.confirmed;
  } else if (code == OrderType.inProgress) {
    return S.current.inProgress;
  } else if (code == OrderType.outForDeleivery) {
    return S.current.outForDeleivery;
  } else if (code == OrderType.delivered) {
    return S.current.deleiverd;
  } else if (code == OrderType.returns) {
    return S.current.returns;
  } else {
    return S.current.canceled;
  }
}

OrderType handleStringToOrderType({required String code}) {
  if (code == OrderType.pending.name) {
    return OrderType.pending;
  } else if (code == OrderType.confirmed.name) {
    return OrderType.confirmed;
  } else if (code == OrderType.inProgress.name) {
    return OrderType.inProgress;
  } else if (code == OrderType.delivered.name) {
    return OrderType.delivered;
  } else if (code == OrderType.outForDeleivery.name) {
    return OrderType.outForDeleivery;
  } else if (code == OrderType.returns.name) {
    return OrderType.returns;
  } else {
    return OrderType.canceled;
  }
}
