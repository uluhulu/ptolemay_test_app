
class MainPageState {
  final int counterValue;
  final bool isDark;
  final bool isLoading;
  final String city;
  final String temperature;

  MainPageState({
    required this.counterValue,
    required this.isDark,
    required this.isLoading,
    required this.city,
    required this.temperature,
  });

  MainPageState.initial()
      : counterValue = 0,
        isDark = false,
        isLoading = false,
        city = "",
        temperature = "";

  MainPageState copyWith({
    int? counterValue,
    bool? isDark,
    bool? isLoading,
    String? city,
    String? temperature,
  }) {
    return MainPageState(
      counterValue: counterValue ?? this.counterValue,
      isDark: isDark ?? this.isDark,
      isLoading: isLoading ?? this.isLoading,
      city: city ?? this.city,
      temperature: temperature ?? this.temperature,
    );
  }
}
