enum Endpoint {
  refreshToken("/refreshtoken"),
  login("/signin/email"),
  profile("/profile"),
  getSubinfoDetail("/getSubinfoDetailRev"),
  register("/register"),
  products("/products");

  final String path;
  const Endpoint(this.path);

  /// Build full URL using baseUrl + path
  String url(String baseUrl) => "$baseUrl$path";
}
