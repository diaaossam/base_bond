import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/chat/data/models/response/ticket_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../data/repositories/chat_repository_impl.dart';

@injectable
class TicketCubit extends Cubit<BaseState<List<TicketModel>>>
    with AsyncHandler<List<TicketModel>> {
  final ChatRepositoryImpl chatRepository;

  TicketCubit(this.chatRepository) : super(BaseState());

  Future<void> getAllTickets() async {
    await handleAsync(
      call: () => chatRepository.getAllTickets(),
      onSuccess: (data) => data,
      identifier: "getTickets",
    );
  }

  /// Create a new ticket
  Future<TicketModel?> createTicket({
    required String title,
    required String message,
  }) async {
    return await handleAsync(
      call: () => chatRepository.createTicket(title: title, message: message),
      onSuccess: (data) {
        final currentTickets = state.data ?? [];
        return [data, ...currentTickets];
      },
      identifier: "createTicket",
    );
  }
}
