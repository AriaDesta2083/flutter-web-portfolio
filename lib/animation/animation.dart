import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const CustomAnimation({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 300),
  });

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: widget.delay,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Mulai dari kanan (x: 1.0)
      end: const Offset(0.0, 0.0),   // Berakhir di posisi asal (x: 0.0)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // Mulai animasi setelah widget dimuat
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}