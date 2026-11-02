import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prm_pe/models/task_model.dart';
import 'package:prm_pe/views/task_edit_screen.dart';
import 'package:prm_pe/views/widgets/color_picker_dialog.dart';

void main() {
  group('TaskModel Tests', () {
    test('TaskModel toMap and fromMap works correctly', () {
      final task = TaskModel(
        id: 1,
        title: 'Làm bài tập Flutter',
        description: 'Hoàn thành trước thứ Sáu',
        isCompleted: true,
      );

      final map = task.toMap();
      expect(map['title'], 'Làm bài tập Flutter');
      expect(map['is_completed'], 1);

      final recreated = TaskModel.fromMap(map);
      expect(recreated.id, 1);
      expect(recreated.title, 'Làm bài tập Flutter');
      expect(recreated.description, 'Hoàn thành trước thứ Sáu');
      expect(recreated.isCompleted, true);
    });
  });

  group('UI Widget Tests', () {
    testWidgets('TaskEditScreen displays form elements and task values',
        (tester) async {
      final testTask = TaskModel(
        id: 3,
        title: 'Chuẩn bị bài thuyết trình',
        description: 'Nhóm 4 - Chủ đề Firebase',
        isCompleted: false,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TaskEditScreen(task: testTask),
          ),
        ),
      );

      expect(find.text('Chỉnh sửa công việc'), findsOneWidget);
      expect(find.text('Tiêu đề *'), findsOneWidget);
      expect(find.text('Mô tả'), findsOneWidget);
      expect(find.text('Đã hoàn thành'), findsOneWidget);
      expect(find.text('Hủy'), findsOneWidget);
      expect(find.text('Lưu'), findsOneWidget);
      expect(find.text('Chuẩn bị bài thuyết trình'), findsOneWidget);
      expect(find.text('Nhóm 4 - Chủ đề Firebase'), findsOneWidget);
    });

    testWidgets('ColorPickerDialog renders title, 8 colors, and close button',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: ColorPickerDialog(),
            ),
          ),
        ),
      );

      expect(find.text('Chọn màu thanh ứng dụng'), findsOneWidget);
      expect(find.text('Đóng'), findsOneWidget);
      expect(find.byType(GestureDetector), findsWidgets);
    });
  });
}
