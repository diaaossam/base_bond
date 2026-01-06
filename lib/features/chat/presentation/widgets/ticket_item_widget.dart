import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/chat/data/models/response/ticket_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TicketItemWidget extends StatefulWidget {
  final TicketModel ticket;
  final int index;
  final VoidCallback onTap;

  const TicketItemWidget({
    super.key,
    required this.ticket,
    required this.index,
    required this.onTap,
  });

  @override
  State<TicketItemWidget> createState() => _TicketItemWidgetState();
}

class _TicketItemWidgetState extends State<TicketItemWidget> {
  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context, widget.ticket.status);
    final statusText = _getStatusText(context, widget.ticket.status);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: context.colorScheme.outline.withValues(alpha: 0.1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildTicketIcon(context, statusColor),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.title(
                        text: widget.ticket.title ?? '',
                        textSize: 14,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.confirmation_number_outlined,
                            size: 14.sp,
                            color: context.colorScheme.onSurface.withValues(
                              alpha: 0.5,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          AppText.hint(
                            text: '#${widget.ticket.ticketNumber ?? ''}',
                            textSize: 11,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buildStatusBadge(context, statusColor, statusText),
              ],
            ),
            Container(
              height: 1,
              color: context.colorScheme.outline.withValues(alpha: 0.1),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14.sp,
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    AppText.hint(
                      text: _formatDate(widget.ticket.createdAt),
                      textSize: 11,
                    ),
                  ],
                ),
                Row(
                  children: [
                    AppText.hint(
                      text: context.localizations.viewConversation,
                      textSize: 11,
                      color: context.colorScheme.primary,
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12.sp,
                      color: context.colorScheme.primary,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketIcon(BuildContext context, Color statusColor) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            statusColor.withValues(alpha: 0.2),
            statusColor.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.chat_bubble_outline_rounded,
        color: statusColor,
        size: 22.sp,
      ),
    );
  }

  Widget _buildStatusBadge(
    BuildContext context,
    Color statusColor,
    String statusText,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: statusColor.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: statusColor,
            ),
          ),
          SizedBox(width: 6.w),
          AppText(
            text: statusText,
            textSize: 10,
            color: statusColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(BuildContext context, String? status) {
    switch (status?.toLowerCase()) {
      case 'open':
        return const Color(0xFF22C55E);
      case 'pending':
        return const Color(0xFFF59E0B);
      case 'closed':
        return const Color(0xFF6B7280);
      case 'in_progress':
        return const Color(0xFF3B82F6);
      default:
        return context.colorScheme.primary;
    }
  }

  String _getStatusText(BuildContext context, String? status) {
    switch (status?.toLowerCase()) {
      case 'open':
        return context.localizations.ticketOpen;
      case 'pending':
        return context.localizations.ticketPending;
      case 'closed':
        return context.localizations.ticketClosed;
      case 'in_progress':
        return context.localizations.ticketInProgress;
      default:
        return status ?? '';
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null) return '';
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays == 0) {
        if (difference.inHours == 0) {
          return '${difference.inMinutes}m ago';
        }
        return '${difference.inHours}h ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d ago';
      } else {
        return DateFormat('MMM dd, yyyy').format(date);
      }
    } catch (e) {
      return dateString;
    }
  }
}



