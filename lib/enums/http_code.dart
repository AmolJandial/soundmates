enum HttpCode {
  success(200),
  badRequest(400),
  unauthotized(401),
  notFound(404);

  final int statusCode;

  const HttpCode(this.statusCode);
}
