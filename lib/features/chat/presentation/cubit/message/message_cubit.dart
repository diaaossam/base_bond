import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/chat/data/models/response/message_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../data/repositories/chat_repository_impl.dart';

@injectable
class MessageCubit extends Cubit<BaseState<List<MessageModel>>>
    with AsyncHandler<List<MessageModel>> {
  final ChatRepositoryImpl chatRepository;

  MessageCubit(this.chatRepository) : super(BaseState());

  Future<void> getTicketDetails({required int ticketId}) async {
    await handleAsync(
      call: () => chatRepository.getTicketDetails(ticketId: ticketId),
      onSuccess: (data) => data,
      identifier: "getTicketDetails",
    );
  }

  /// Send a message to an existing ticket
  Future<void> sendMessage({
    required int ticketId,
    required String message,
  }) async {
    await handleAsync(
      call: () =>
          chatRepository.sendMessage(ticketId: ticketId, message: message),
      onSuccess: (data) {
        final currentDetails = state.data;
        if (currentDetails != null) {
          final updatedMessages = [data,...currentDetails];
          return updatedMessages;
        }
        return state.data ?? [];
      },
      identifier: "sendMessage",
    );
  }
}
