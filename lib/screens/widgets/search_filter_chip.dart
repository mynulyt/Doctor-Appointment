import 'package:flutter/material.dart';

class SearchFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  const SearchFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      labelStyle: TextStyle(
        color:
            selected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color:
              selected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
        ),
      ),
    );
  }
}
