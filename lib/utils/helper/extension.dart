extension PercentageExtension on num {
  double percentage(num value) {
    if (value == 0) {
      return 0.0; // Avoid division by zero error
    }
    return (value / 100) * this;
  }
}
