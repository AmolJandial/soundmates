enum HttpCode {
  success(200),
  badRequest(400),
  unauthotized(401),
  invalidFormat(422),
  notFound(404);

  final int statusCode;

  const HttpCode(this.statusCode);
}
