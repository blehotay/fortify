/// {@template api_config}
/// Parameters required for Fortify API integration
/// {@endtemplate}
class ApiConfig {
  /// {@macro api_config}
  const ApiConfig({
    required this.baseUrl,
  });

  /// The base URL for the Fortify API.
  final String baseUrl;
}
