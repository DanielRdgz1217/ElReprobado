import 'package:flutter/material.dart';

class HerPresentation extends StatelessWidget implements PreferredSizeWidget {
  final String nombre;
  final String urlAvatar;
  final VoidCallback? clearFunction;

  const HerPresentation({
    super.key,
    this.nombre = 'mi vida, mi amor',
    this.urlAvatar =
        'https://pbs.twimg.com/profile_images/597967561909805056/kTlNI7RH_400x400.jpg',
    this.clearFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(urlAvatar),
        ),
      ),
      title: Text(nombre),
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: clearFunction,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
