part of weather_app;

class loadingAnimation extends StatelessWidget {
  final bool isLoading;

  const loadingAnimation({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.grey.withOpacity(0.3), // 灰色遮罩
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox();
  }
}
