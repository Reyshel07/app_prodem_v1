import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';

class Loading1 extends StatelessWidget {
  const Loading1({super.key, required this.smallSpacing});

  final double smallSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BarsLoadingIndicator(
                color: Theme.of(context).colorScheme.green,
                width: 6,
                height: smallSpacing * 1.2,
                barCount: 5,
              ),
              SizedBox(height: 12),
              Text(
                "Cargando...",
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BarsLoadingIndicator extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final int barCount;

  const BarsLoadingIndicator({
    Key? key,
    this.color = Colors.green,
    this.width = 4,
    this.height = 20,
    this.barCount = 5,
  }) : super(key: key);

  @override
  State<BarsLoadingIndicator> createState() => _BarsLoadingIndicatorState();
}

class _BarsLoadingIndicatorState extends State<BarsLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _animations = List.generate(widget.barCount, (index) {
      final start = index * 0.1;
      final end = start + 0.5;
      return Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.barCount, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 1),
              width: widget.width,
              height: widget.height * _animations[index].value,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          },
        );
      }),
    );
  }
}
