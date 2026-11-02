// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TaskListViewModel)
final taskListViewModelProvider = TaskListViewModelProvider._();

final class TaskListViewModelProvider
    extends $AsyncNotifierProvider<TaskListViewModel, List<TaskModel>> {
  TaskListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskListViewModelHash();

  @$internal
  @override
  TaskListViewModel create() => TaskListViewModel();
}

String _$taskListViewModelHash() => r'c0f3333c482f327076a1a822f22dd29d3b913b5f';

abstract class _$TaskListViewModel extends $AsyncNotifier<List<TaskModel>> {
  FutureOr<List<TaskModel>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<TaskModel>>, List<TaskModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TaskModel>>, List<TaskModel>>,
              AsyncValue<List<TaskModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
