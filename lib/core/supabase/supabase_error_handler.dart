import 'supabase_error_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SupabaseDataSource {
  AUTH_INVALID_CREDENTIALS,
  AUTH_USER_NOT_FOUND,
  AUTH_EMAIL_NOT_CONFIRMED,
  AUTH_WEAK_PASSWORD,
  AUTH_SIGNUP_DISABLED,
  AUTH_TOO_MANY_REQUESTS,
  AUTH_INVALID_TOKEN,
  AUTH_SESSION_EXPIRED,
  POSTGRES_UNIQUE_VIOLATION,
  POSTGRES_FOREIGN_KEY_VIOLATION,
  POSTGRES_NOT_NULL_VIOLATION,
  POSTGRES_CHECK_VIOLATION,
  POSTGRES_PERMISSION_DENIED,
  POSTGRES_ROW_LEVEL_SECURITY,
  POSTGRES_CONNECTION_ERROR,
  REALTIME_CONNECTION_ERROR,
  REALTIME_SUBSCRIPTION_ERROR,
  STORAGE_OBJECT_NOT_FOUND,
  STORAGE_BUCKET_NOT_FOUND,
  STORAGE_PERMISSION_DENIED,
  STORAGE_QUOTA_EXCEEDED,
  STORAGE_INVALID_FILE_TYPE,
  NETWORK_ERROR,
  TIMEOUT_ERROR,
  UNKNOWN_ERROR,
  DEFAULT,
}

class SupabaseResponseCode {
  // Auth error codes
  static const String AUTH_INVALID_CREDENTIALS = 'invalid_credentials';
  static const String AUTH_USER_NOT_FOUND = 'user_not_found';
  static const String AUTH_EMAIL_NOT_CONFIRMED = 'email_not_confirmed';
  static const String AUTH_WEAK_PASSWORD = 'weak_password';
  static const String AUTH_SIGNUP_DISABLED = 'signup_disabled';
  static const String AUTH_TOO_MANY_REQUESTS = 'too_many_requests';
  static const String AUTH_INVALID_TOKEN = 'invalid_token';
  static const String AUTH_SESSION_EXPIRED = 'session_expired';

  // PostgreSQL error codes
  static const String POSTGRES_UNIQUE_VIOLATION = '23505';
  static const String POSTGRES_FOREIGN_KEY_VIOLATION = '23503';
  static const String POSTGRES_NOT_NULL_VIOLATION = '23502';
  static const String POSTGRES_CHECK_VIOLATION = '23514';
  static const String POSTGRES_PERMISSION_DENIED = '42501';

  // HTTP status codes
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int CONFLICT = 409;
  static const int UNPROCESSABLE_ENTITY = 422;
  static const int TOO_MANY_REQUESTS = 429;
  static const int INTERNAL_SERVER_ERROR = 500;

  // Local status codes
  static const int TIMEOUT = -1;
  static const int NETWORK_ERROR = -2;
  static const int UNKNOWN = -3;
}

class SupabaseResponseMessage {
  // Auth messages
  static const String AUTH_INVALID_CREDENTIALS = 'Invalid email or password';
  static const String AUTH_USER_NOT_FOUND = 'User not found';
  static const String AUTH_EMAIL_NOT_CONFIRMED =
      'Please confirm your email address';
  static const String AUTH_WEAK_PASSWORD = 'Password is too weak';
  static const String AUTH_SIGNUP_DISABLED = 'Sign up is currently disabled';
  static const String AUTH_TOO_MANY_REQUESTS =
      'Too many requests. Please try again later';
  static const String AUTH_INVALID_TOKEN = 'Invalid or expired token';
  static const String AUTH_SESSION_EXPIRED =
      'Your session has expired. Please sign in again';

  // Database messages
  static const String POSTGRES_UNIQUE_VIOLATION = 'This record already exists';
  static const String POSTGRES_FOREIGN_KEY_VIOLATION =
      'Referenced record does not exist';
  static const String POSTGRES_NOT_NULL_VIOLATION = 'Required field is missing';
  static const String POSTGRES_CHECK_VIOLATION = 'Data validation failed';
  static const String POSTGRES_PERMISSION_DENIED = 'Permission denied';
  static const String POSTGRES_ROW_LEVEL_SECURITY =
      'Access denied by security policy';
  static const String POSTGRES_CONNECTION_ERROR = 'Database connection failed';

  // Realtime messages
  static const String REALTIME_CONNECTION_ERROR = 'Real-time connection failed';
  static const String REALTIME_SUBSCRIPTION_ERROR =
      'Failed to subscribe to real-time updates';

  // Storage messages
  static const String STORAGE_OBJECT_NOT_FOUND = 'File not found';
  static const String STORAGE_BUCKET_NOT_FOUND = 'Storage bucket not found';
  static const String STORAGE_PERMISSION_DENIED = 'Storage access denied';
  static const String STORAGE_QUOTA_EXCEEDED = 'Storage quota exceeded';
  static const String STORAGE_INVALID_FILE_TYPE = 'Invalid file type';

  // Network messages
  static const String NETWORK_ERROR = 'Network connection failed';
  static const String TIMEOUT_ERROR = 'Request timeout';
  static const String UNKNOWN_ERROR = 'An unexpected error occurred';
  static const String DEFAULT = 'Something went wrong';
}

extension SupabaseDataSourceExtension on SupabaseDataSource {
  SupabaseErrorModel getFailure() {
    switch (this) {
      case SupabaseDataSource.AUTH_INVALID_CREDENTIALS:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_INVALID_CREDENTIALS,
          statusCode: SupabaseResponseCode.UNAUTHORIZED,
        );
      case SupabaseDataSource.AUTH_USER_NOT_FOUND:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_USER_NOT_FOUND,
          statusCode: SupabaseResponseCode.NOT_FOUND,
        );
      case SupabaseDataSource.AUTH_EMAIL_NOT_CONFIRMED:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_EMAIL_NOT_CONFIRMED,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.AUTH_WEAK_PASSWORD:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_WEAK_PASSWORD,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.AUTH_SIGNUP_DISABLED:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_SIGNUP_DISABLED,
          statusCode: SupabaseResponseCode.FORBIDDEN,
        );
      case SupabaseDataSource.AUTH_TOO_MANY_REQUESTS:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_TOO_MANY_REQUESTS,
          statusCode: SupabaseResponseCode.TOO_MANY_REQUESTS,
        );
      case SupabaseDataSource.AUTH_INVALID_TOKEN:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_INVALID_TOKEN,
          statusCode: SupabaseResponseCode.UNAUTHORIZED,
        );
      case SupabaseDataSource.AUTH_SESSION_EXPIRED:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.AUTH_SESSION_EXPIRED,
          statusCode: SupabaseResponseCode.UNAUTHORIZED,
        );
      case SupabaseDataSource.POSTGRES_UNIQUE_VIOLATION:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_UNIQUE_VIOLATION,
          statusCode: SupabaseResponseCode.CONFLICT,
        );
      case SupabaseDataSource.POSTGRES_FOREIGN_KEY_VIOLATION:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_FOREIGN_KEY_VIOLATION,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.POSTGRES_NOT_NULL_VIOLATION:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_NOT_NULL_VIOLATION,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.POSTGRES_CHECK_VIOLATION:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_CHECK_VIOLATION,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.POSTGRES_PERMISSION_DENIED:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_PERMISSION_DENIED,
          statusCode: SupabaseResponseCode.FORBIDDEN,
        );
      case SupabaseDataSource.POSTGRES_ROW_LEVEL_SECURITY:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_ROW_LEVEL_SECURITY,
          statusCode: SupabaseResponseCode.FORBIDDEN,
        );
      case SupabaseDataSource.POSTGRES_CONNECTION_ERROR:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.POSTGRES_CONNECTION_ERROR,
          statusCode: SupabaseResponseCode.INTERNAL_SERVER_ERROR,
        );
      case SupabaseDataSource.REALTIME_CONNECTION_ERROR:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.REALTIME_CONNECTION_ERROR,
          statusCode: SupabaseResponseCode.INTERNAL_SERVER_ERROR,
        );
      case SupabaseDataSource.REALTIME_SUBSCRIPTION_ERROR:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.REALTIME_SUBSCRIPTION_ERROR,
          statusCode: SupabaseResponseCode.INTERNAL_SERVER_ERROR,
        );
      case SupabaseDataSource.STORAGE_OBJECT_NOT_FOUND:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.STORAGE_OBJECT_NOT_FOUND,
          statusCode: SupabaseResponseCode.NOT_FOUND,
        );
      case SupabaseDataSource.STORAGE_BUCKET_NOT_FOUND:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.STORAGE_BUCKET_NOT_FOUND,
          statusCode: SupabaseResponseCode.NOT_FOUND,
        );
      case SupabaseDataSource.STORAGE_PERMISSION_DENIED:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.STORAGE_PERMISSION_DENIED,
          statusCode: SupabaseResponseCode.FORBIDDEN,
        );
      case SupabaseDataSource.STORAGE_QUOTA_EXCEEDED:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.STORAGE_QUOTA_EXCEEDED,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.STORAGE_INVALID_FILE_TYPE:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.STORAGE_INVALID_FILE_TYPE,
          statusCode: SupabaseResponseCode.UNPROCESSABLE_ENTITY,
        );
      case SupabaseDataSource.NETWORK_ERROR:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.NETWORK_ERROR,
          statusCode: SupabaseResponseCode.NETWORK_ERROR,
        );
      case SupabaseDataSource.TIMEOUT_ERROR:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.TIMEOUT_ERROR,
          statusCode: SupabaseResponseCode.TIMEOUT,
        );
      case SupabaseDataSource.UNKNOWN_ERROR:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.UNKNOWN_ERROR,
          statusCode: SupabaseResponseCode.UNKNOWN,
        );
      case SupabaseDataSource.DEFAULT:
        return SupabaseErrorModel(
          message: SupabaseResponseMessage.DEFAULT,
          statusCode: SupabaseResponseCode.UNKNOWN,
        );
    }
  }
}

class SupabaseErrorHandler implements Exception {
  late SupabaseErrorModel supabaseErrorModel;

  SupabaseErrorHandler._handle(dynamic error) {
    if (error is AuthException) {
      supabaseErrorModel = _handleAuthError(error);
    } else if (error is PostgrestException) {
      supabaseErrorModel = _handlePostgrestError(error);
    } else if (error is StorageException) {
      supabaseErrorModel = _handleStorageError(error);
    } else {
      // Default error
      supabaseErrorModel = SupabaseDataSource.DEFAULT.getFailure();
    }
  }

  static SupabaseErrorModel handle(dynamic error) {
    final handler = SupabaseErrorHandler._handle(error);
    return handler.supabaseErrorModel;
  }
}

SupabaseErrorModel _handleAuthError(AuthException error) {
  final message = error.message.toLowerCase();

  if (message.contains('invalid login credentials') ||
      message.contains('invalid email or password')) {
    return SupabaseDataSource.AUTH_INVALID_CREDENTIALS.getFailure();
  } else if (message.contains('user not found')) {
    return SupabaseDataSource.AUTH_USER_NOT_FOUND.getFailure();
  } else if (message.contains('email not confirmed') ||
      message.contains('confirm your email')) {
    return SupabaseDataSource.AUTH_EMAIL_NOT_CONFIRMED.getFailure();
  } else if (message.contains('password') && message.contains('weak')) {
    return SupabaseDataSource.AUTH_WEAK_PASSWORD.getFailure();
  } else if (message.contains('signup') && message.contains('disabled')) {
    return SupabaseDataSource.AUTH_SIGNUP_DISABLED.getFailure();
  } else if (message.contains('too many requests') ||
      message.contains('rate limit')) {
    return SupabaseDataSource.AUTH_TOO_MANY_REQUESTS.getFailure();
  } else if (message.contains('invalid') && message.contains('token')) {
    return SupabaseDataSource.AUTH_INVALID_TOKEN.getFailure();
  } else if (message.contains('session') &&
      (message.contains('expired') || message.contains('invalid'))) {
    return SupabaseDataSource.AUTH_SESSION_EXPIRED.getFailure();
  } else {
    return SupabaseErrorModel(
      message: error.message,
      statusCode: SupabaseResponseCode.UNAUTHORIZED,
    );
  }
}

SupabaseErrorModel _handlePostgrestError(PostgrestException error) {
  final code = error.code;
  final message = error.message.toLowerCase();

  if (code == SupabaseResponseCode.POSTGRES_UNIQUE_VIOLATION ||
      message.contains('duplicate') ||
      message.contains('already exists')) {
    return SupabaseDataSource.POSTGRES_UNIQUE_VIOLATION.getFailure();
  } else if (code == SupabaseResponseCode.POSTGRES_FOREIGN_KEY_VIOLATION) {
    return SupabaseDataSource.POSTGRES_FOREIGN_KEY_VIOLATION.getFailure();
  } else if (code == SupabaseResponseCode.POSTGRES_NOT_NULL_VIOLATION ||
      message.contains('null value')) {
    return SupabaseDataSource.POSTGRES_NOT_NULL_VIOLATION.getFailure();
  } else if (code == SupabaseResponseCode.POSTGRES_CHECK_VIOLATION) {
    return SupabaseDataSource.POSTGRES_CHECK_VIOLATION.getFailure();
  } else if (code == SupabaseResponseCode.POSTGRES_PERMISSION_DENIED ||
      message.contains('permission denied')) {
    return SupabaseDataSource.POSTGRES_PERMISSION_DENIED.getFailure();
  } else if (message.contains('row level security') ||
      message.contains('rls')) {
    return SupabaseDataSource.POSTGRES_ROW_LEVEL_SECURITY.getFailure();
  } else if (message.contains('connection') && message.contains('failed')) {
    return SupabaseDataSource.POSTGRES_CONNECTION_ERROR.getFailure();
  } else {
    return SupabaseErrorModel(
      message: error.message,
      statusCode: error.code != null ? int.tryParse(error.code!) : null,
    );
  }
}

SupabaseErrorModel _handleStorageError(StorageException error) {
  final message = error.message.toLowerCase();

  if (message.contains('object not found') ||
      message.contains('file not found')) {
    return SupabaseDataSource.STORAGE_OBJECT_NOT_FOUND.getFailure();
  } else if (message.contains('bucket not found')) {
    return SupabaseDataSource.STORAGE_BUCKET_NOT_FOUND.getFailure();
  } else if (message.contains('permission denied') ||
      message.contains('access denied')) {
    return SupabaseDataSource.STORAGE_PERMISSION_DENIED.getFailure();
  } else if (message.contains('quota') && message.contains('exceeded')) {
    return SupabaseDataSource.STORAGE_QUOTA_EXCEEDED.getFailure();
  } else if (message.contains('invalid file type') ||
      message.contains('file type')) {
    return SupabaseDataSource.STORAGE_INVALID_FILE_TYPE.getFailure();
  } else {
    return SupabaseErrorModel(
      message: error.message,
      statusCode:
          error.statusCode != null ? int.tryParse(error.statusCode!) : null,
    );
  }
}

class SupabaseInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
