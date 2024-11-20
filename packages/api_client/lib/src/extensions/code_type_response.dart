
// enum ResponseStatusType {
//   clientError,
//   noContent,
//   serverError,
//   success,
//   unathenticated,
//   unknown,
// }

// extension ErrorTypeResponse on ApiClientError {
//   ResponseStatusType get statusType => switch (statusCode) {
//         204 => ResponseStatusType.noContent,
//         >= 200 && < 300 => ResponseStatusType.success,
//         == 401 => ResponseStatusType.unathenticated,
//         >= 400 && < 500 => ResponseStatusType.clientError,
//         >= 500 && < 600 => ResponseStatusType.serverError,
//         _ => ResponseStatusType.unknown,
//       };
// }
