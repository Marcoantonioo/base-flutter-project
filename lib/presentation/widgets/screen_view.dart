import 'package:base_flutter_project/architecture/injection/inj_container.dart';
import 'package:flutter/cupertino.dart';

abstract class ScreenView<T> extends StatelessWidget {
  const ScreenView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => InjectContainerImpl().find<T>(tag: tag)!;

  @override
  Widget build(BuildContext context);
}
