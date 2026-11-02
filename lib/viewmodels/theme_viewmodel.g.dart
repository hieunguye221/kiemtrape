// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppBarColorViewModel)
final appBarColorViewModelProvider = AppBarColorViewModelProvider._();

final class AppBarColorViewModelProvider
    extends $AsyncNotifierProvider<AppBarColorViewModel, Color> {
  AppBarColorViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appBarColorViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appBarColorViewModelHash();

  @$internal
  @override
  AppBarColorViewModel create() => AppBarColorViewModel();
}

String _$appBarColorViewModelHash() =>
    r'dceea904bc932cc7513c1b60ed7de7b048be6598';

abstract class _$AppBarColorViewModel extends $AsyncNotifier<Color> {
  FutureOr<Color> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Color>, Color>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Color>, Color>,
              AsyncValue<Color>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
