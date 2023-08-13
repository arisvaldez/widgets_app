import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Counter',
      subTitle: 'Counter With RiverPod',
      link: '/counter',
      icon: Icons.countertops_outlined),
  MenuItem(
      title: 'Buttons',
      subTitle: 'Various buttons',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Cards',
      subTitle: 'Stylized container',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generals and controlled',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars',
      subTitle: 'Snackbar and dialogs',
      link: '/snackbars',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Animated Container',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controls + Tiles',
      subTitle: 'Ui Controls and Tiles',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'App Tutorial',
      subTitle: 'App Tutorial step by step',
      link: '/tutorial',
      icon: Icons.play_circle_outline),
  MenuItem(
      title: 'Infinite Scroll and Pull Refresh',
      subTitle: 'Infinite Scroll and Pull Refresh',
      link: '/infinite',
      icon: Icons.slow_motion_video),
  MenuItem(
      title: 'Theme Changer',
      subTitle: 'Change Application theme',
      link: '/theme-change',
      icon: Icons.color_lens_outlined),
];
