
enum TextSizes { small, medium, large }

enum OrderStatus { pending, processing, shipped, delivered }

enum PaymentStatus { pending, processing, paid, failed }

enum VError {
  invalidCredentials,
  networkError,
  serverError,
  unknownError,
}
