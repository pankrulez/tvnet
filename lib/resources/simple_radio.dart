import 'package:flutter/material.dart';

/// Minimal radio widgets that don't use the deprecated Radio group API.
/// These replicate the visual behaviour of [Radio] / [RadioListTile]
/// without depending on the deprecated properties.

class SimpleRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;

  const SimpleRadio({Key? key, required this.value, this.groupValue, this.onChanged, this.activeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool selected = value == groupValue;
    return IconButton(
      icon: Icon(
        selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: selected ? (activeColor ?? Theme.of(context).colorScheme.primary) : Colors.grey,
      ),
      onPressed: onChanged == null ? null : () => onChanged!(value),
    );
  }
}

class SimpleRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final bool dense;

  const SimpleRadioListTile({
    Key? key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.title,
    this.subtitle,
    this.dense = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SimpleRadio<T>(value: value, groupValue: groupValue, onChanged: onChanged),
      title: title,
      subtitle: subtitle,
      dense: dense,
      onTap: onChanged == null ? null : () => onChanged!(value),
    );
  }
}
