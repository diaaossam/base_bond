// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// 🌎 Project imports:
import '../config/theme/theme_helper.dart';
import '../core/extensions/app_localizations_extension.dart';
import '../core/extensions/color_extensions.dart';
import '../gen/assets.gen.dart';
import 'app_text.dart';
import 'image_picker/app_image.dart';

class AppSearchableDropDown<T> extends StatefulWidget {
  final String? label;
  final String? name;
  final bool enabled;
  final T? initialValue;
  final String loadingText;
  final String? hint;
  final double? verticalMargin;
  final String? Function(Object?)? validator;
  final List<DropdownMenuItem<T>>? items;
  final VoidCallback? onRetry;
  final bool isLoading;
  final void Function(T?)? onChanged;
  final Widget? icon, dropDownIcon;

  const AppSearchableDropDown({
    super.key,
    this.label,
    required this.items,
    this.onRetry,
    this.dropDownIcon,
    this.enabled = true,
    this.validator,
    this.isLoading = false,
    this.name,
    this.initialValue,
    this.hint,
    this.verticalMargin,
    this.onChanged,
    this.icon,
    required this.loadingText,
  });

  @override
  State<AppSearchableDropDown<T>> createState() =>
      _AppSearchableDropDownState<T>();
}

class _AppSearchableDropDownState<T> extends State<AppSearchableDropDown<T>> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isDropdownOpen = false;
  List<DropdownMenuItem<T>> _filteredItems = [];
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    _filteredItems = widget.items ?? [];
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didUpdateWidget(AppSearchableDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filteredItems = widget.items ?? [];
      _filterItems();

      // Check if current selected value exists in new items
      // Only clear if items list is not empty and value doesn't exist
      final hasItems = (widget.items?.isNotEmpty ?? false);
      final valueExists =
          widget.items?.any((item) => item.value == _selectedValue) ?? false;
      if (hasItems && !valueExists && _selectedValue != null) {
        _selectedValue = null;
      }
    }
    if (oldWidget.initialValue != widget.initialValue) {
      _selectedValue = widget.initialValue;
    }
  }

  void _onSearchChanged() {
    _filterItems();
  }

  void _filterItems() {
    if (widget.items == null) return;

    final searchText = _searchController.text.toLowerCase();
    if (searchText.isEmpty) {
      setState(() {
        _filteredItems = widget.items!;
      });
    } else {
      setState(() {
        _filteredItems = widget.items!.where((item) {
          final itemText = item.child is AppText
              ? (item.child as AppText).text.toLowerCase()
              : item.child.toString().toLowerCase();
          return itemText.contains(searchText);
        }).toList();
      });
    }
  }

  void _onItemSelected(T? value, FormFieldState<T>? field) {
    setState(() {
      _selectedValue = value;
      _isDropdownOpen = false;
    });
    _searchController.clear();
    _filterItems();
    field?.didChange(value);
    widget.onChanged?.call(value);
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
    if (_isDropdownOpen) {
      _focusNode.requestFocus();
    } else {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: widget.name ?? '',
      validator: widget.validator,
      initialValue: widget.initialValue,
      enabled: widget.enabled,
      onChanged: (value) => widget.onChanged?.call(value),
      builder: (FormFieldState<T> field) {
        // Only clear if items list is not empty and value doesn't exist
        final hasItems = (widget.items?.isNotEmpty ?? false);
        final valueExists =
            widget.items?.any((item) => item.value == field.value) ?? false;

        if (hasItems && !valueExists && field.value != null) {
          // If field has a value that doesn't exist in current items, clear it
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              field.didChange(null);
              setState(() {
                _selectedValue = null;
              });
            }
          });
        } else if (_selectedValue != field.value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _selectedValue = field.value;
              });
            }
          });
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: widget.enabled && !widget.isLoading
                  ? _toggleDropdown
                  : null,
              child: InputDecorator(
                decoration: InputDecoration(
                  prefixIcon: widget.icon,
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 40.h,
                    minHeight: 10.h,
                    minWidth: 40.w,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 40.h,
                    minHeight: 10.h,
                    minWidth: 40.w,
                  ),
                  suffixIcon: widget.isLoading
                      ? Container(
                          margin: REdgeInsetsDirectional.only(end: 10),
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : widget.onRetry != null
                      ? IconButton(
                          onPressed: widget.onRetry,
                          icon: Icon(
                            Icons.repeat,
                            color: context.colorScheme.primary,
                          ),
                        )
                      : AppImage.asset(Assets.icons.arrowDown),
                  filled: true,
                  fillColor: context.colorScheme.surface,
                  labelText: widget.hint,
                  labelStyle: ThemeHelper().hintTFFTextStyle(),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintStyle: ThemeHelper().hintTFFTextStyle(),
                  border: ThemeHelper().buildMainTffBorder(context: context),
                  disabledBorder: ThemeHelper().buildMainTffBorder(
                    context: context,
                  ),
                  errorBorder: ThemeHelper().buildErrorBorder(),
                  enabledBorder: ThemeHelper().buildMainTffBorder(
                    context: context,
                  ),
                  focusedBorder: ThemeHelper().buildMainTffBorder(
                    context: context,
                  ),
                  errorText: field.errorText,
                ),
                child: field.value != null
                    ? _buildSelectedItem(field.value)
                    : Text(
                        widget.hint ?? '',
                        style: ThemeHelper().hintTFFTextStyle(),
                      ),
              ),
            ),
            if (_isDropdownOpen) _buildDropdown(context: context, field: field),
          ],
        );
      },
    );
  }

  Widget _buildSelectedItem(T? value) {
    // Check if the value exists in current items
    final valueExists =
        widget.items?.any((item) => item.value == value) ?? false;

    if (!valueExists) {
      return Text(widget.hint ?? '', style: ThemeHelper().hintTFFTextStyle());
    }

    final selectedItem = widget.items?.firstWhere(
      (item) => item.value == value,
    );

    return selectedItem?.child ??
        Text(widget.hint ?? '', style: ThemeHelper().hintTFFTextStyle());
  }

  Widget _buildDropdown({
    required BuildContext context,
    required FormFieldState<T> field,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 4.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              style: ThemeHelper().mainTFFTextStyle(context),
              decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 40.h,
                  minHeight: 10.h,
                  minWidth: 40.w,
                ),
                suffixIconConstraints: BoxConstraints(
                  maxHeight: 40.h,
                  minHeight: 10.h,
                  minWidth: 40.w,
                ),
                hintText: context.localizations.searchHint,
                hintStyle: ThemeHelper().hintTFFTextStyle(),
                prefixIcon: AppImage.asset(Assets.icons.searchNormal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.colorScheme.outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: context.colorScheme.primary),
                ),
                contentPadding: REdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 200.h),
            child: _filteredItems.isEmpty
                ? Padding(
                    padding: REdgeInsets.all(16),
                    child: Text(
                      widget.loadingText,
                      style: ThemeHelper().hintTFFTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      final isSelected = item.value == _selectedValue;

                      return InkWell(
                        onTap: () => _onItemSelected(item.value, field),
                        child: Container(
                          padding: REdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? context.colorScheme.primary.withOpacity(0.1)
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Expanded(child: item.child),
                              if (isSelected)
                                Icon(
                                  Icons.check,
                                  color: context.colorScheme.primary,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
