import 'package:flutter/material.dart';

final class GalleryModalUtil {
  static Future<T?> showAppDialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T?>(context: context, builder: builder);
  }

  static Future<T?> showAppBottom<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(context: context, builder: builder);
  }
}
