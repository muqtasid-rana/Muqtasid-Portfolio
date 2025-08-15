import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';

/// HoverScale - scales widget on hover
class HoverScale extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const HoverScale({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? widget.scale : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}

/// HoverContainer - adds shadow & color change on hover
class HoverContainer extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final double borderRadius;
  final Duration duration;

  const HoverContainer({
    super.key,
    required this.child,
    this.backgroundColor = secondaryColor,
    this.borderRadius = 12,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: widget.duration,
        padding: AppPaddings.horizontal2Vertical1,
        decoration: BoxDecoration(
          color: widget.backgroundColor.withOpacity(_hovering ? 1.0 : 0.9),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
