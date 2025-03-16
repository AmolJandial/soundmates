enum HttpCode {
  badRequest;

  int get statusCode => switch (this) {
    HttpCode.badRequest => 404,
  };
}
