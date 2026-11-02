import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/theme_viewmodel.dart';

class ColorPickerDialog extends ConsumerWidget {
  const ColorPickerDialog({super.key});

  static const List<Map<String, dynamic>> colorPalette = [
    {'name': 'Xám đen', 'color': Color(0xFF2C3E50)},
    {'name': 'Xanh dương', 'color': Color(0xFF1976D2)},
    {'name': 'Xanh lá', 'color': Color(0xFF388E3C)},
    {'name': 'Tím', 'color': Color(0xFF7B1FA2)},
    {'name': 'Xanh mòng két', 'color': Color(0xFF00796B)},
    {'name': 'Cam', 'color': Color(0xFFE65100)},
    {'name': 'Đỏ hồng', 'color': Color(0xFFC2185B)},
    {'name': 'Xanh chàm', 'color': Color(0xFF303F9F)},
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentColorAsync = ref.watch(appBarColorViewModelProvider);
    final currentColor = currentColorAsync.value ?? const Color(0xFF2C3E50);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Chọn màu thanh ứng dụng',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            // 2 rows x 4 columns grid of color circles
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: colorPalette.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = colorPalette[index];
                final color = item['color'] as Color;
                final isSelected = currentColor.toARGB32() == color.toARGB32();

                return GestureDetector(
                  onTap: () {
                    ref.read(appBarColorViewModelProvider.notifier).setColor(color);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          )
                        : null,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Đóng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
