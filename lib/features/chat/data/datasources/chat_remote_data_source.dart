import 'package:bond/core/services/api/converters_helper.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../models/response/ticket_model.dart';
import '../models/response/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<TicketModel>> getAllTickets();

  Future<TicketModel> createTicket({
    required String title,
    required String message,
  });

  Future<List<MessageModel>> getTicketDetails({required int ticketId});

  Future<MessageModel> sendMessage({
    required int ticketId,
    required String message,
  });
}

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DioConsumer dioConsumer;

  ChatRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<TicketModel>> getAllTickets() async {
    return await dioConsumer
        .get<List<TicketModel>>(EndPoints.tickets)
        .execute(
          (json) => ConvertersHelper.fromJsonList<TicketModel>(
            json,
            (item) => TicketModel.fromJson(item),
          ),
        );
  }

  @override
  Future<TicketModel> createTicket({
    required String title,
    required String message,
  }) async {
    return await dioConsumer
        .post<TicketModel>(
          EndPoints.tickets,
          data: {'title': title, 'message': message},
        )
        .execute(
          (json) => ConvertersHelper.fromJson<TicketModel>(
            json,
            (item) => TicketModel.fromJson(item),
          ),
        );
  }

  @override
  Future<List<MessageModel>> getTicketDetails({required int ticketId}) async {
    return await dioConsumer
        .get<List<MessageModel>>(EndPoints.ticketDetails(ticketId))
        .factory(
          (json) => ConvertersHelper.fromJsonList(json, MessageModel.fromJson),
        )
        .execute();
  }

  @override
  Future<MessageModel> sendMessage({
    required int ticketId,
    required String message,
  }) async {
    return await dioConsumer
        .post<MessageModel>(
          EndPoints.ticketMessages(ticketId),
          data: {'message': message},
        )
        .execute(
          (json) => ConvertersHelper.fromJson<MessageModel>(
            json,
            (item) => MessageModel.fromJson(item),
          ),
        );
  }
}
