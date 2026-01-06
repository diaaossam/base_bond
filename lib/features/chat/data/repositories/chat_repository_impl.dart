import 'package:bond/core/services/network/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/api_handler_mixin.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/response/message_model.dart';
import '../models/response/ticket_model.dart';

@LazySingleton()
class ChatRepositoryImpl with ApiHandlerMixin {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({required this.chatRemoteDataSource});

  Future<Either<Failure, List<TicketModel>>> getAllTickets() async {
    return handleApi(() => chatRemoteDataSource.getAllTickets());
  }

  Future<Either<Failure, TicketModel>> createTicket({
    required String title,
    required String message,
  }) async {
    return handleApi(
      () => chatRemoteDataSource.createTicket(title: title, message: message),
    );
  }

  Future<Either<Failure, List<MessageModel>>> getTicketDetails({
    required int ticketId,
  }) async {

    return handleApi(
      () => chatRemoteDataSource.getTicketDetails(ticketId: ticketId),
    );
  }

  Future<Either<Failure, MessageModel>> sendMessage({
    required int ticketId,
    required String message,
  }) async {
    return handleApi(
      () => chatRemoteDataSource.sendMessage(
        ticketId: ticketId,
        message: message,
      ),
    );
  }
}



