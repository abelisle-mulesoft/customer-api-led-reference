%dw 2.0
/*
 * Error response helper functions.
 *
 * This module centralizes construction of the standard API error envelope so that:
 * - all APIs return consistent error responses
 * - error-handling flows remain small and readable
 * - changes to error response structure can be made in one place
 *
 * This module is designed to produce objects compatible with the shared ApiResponse type.
 */
import nowUtc from modules::datetime::utils

/*
 * Returns a single-property object only when the supplied value is not null or empty.
 *
 * This helper is used to build response objects without emitting properties
 * whose values are null, empty strings, empty arrays, or empty objects.
 *
 * This function is intended for optional response fields where a minimal JSON
 * payload is preferred over explicitly returning empty values.
 */
fun includeIfPresent(key: String, value: Any | Null) =
  if (!isEmpty(value)) { (key): value } else {}

/*
 * Builds a single ResponseDetail object.
 *
 * Supported properties:
 * - message  (required)
 * - code     (optional)
 * - target   (optional)
 * - severity (optional, included only when explicitly provided)
 */
fun buildErrorDetail(args: {
  severity?: String | Null,
  code?: String | Null,
  message: String,
  target?: String | Null
}) =
  {
    (includeIfPresent("severity", args.severity)),
    (includeIfPresent("code", args.code)),
    message: args.message,
    (includeIfPresent("target", args.target))
  }

/*
 * Builds a standard ApiResponse error envelope.
 *
 * Supported properties:
 * - httpStatus    (required)
 * - message       (required)
 * - correlationId (optional)
 * - details       (optional)
 *
 * Notes:
 * - dateTime is always generated in UTC.
 * - status is always ERROR for this builder.
 * - details is omitted when null or empty.
 */
fun buildErrorResponse(args: {
  httpStatus: Number,
  message: String,
  correlationId?: String | Null,
  details?: Array<Object> | Null
}) =
  {
    dateTime: nowUtc(),
    httpStatus: args.httpStatus,
    status: "ERROR",
    message: args.message,
    (includeIfPresent("correlationId", args.correlationId)),
    (includeIfPresent("details", args.details))
  }

/*
 * Convenience helper:
 * Builds a standard ApiResponse error envelope with a single detail entry.
 *
 * Supported properties:
 * - httpStatus    (required)
 * - message       (required)
 * - correlationId (optional)
 * - detail        (required)
 */
fun buildErrorResponseWithDetail(args: {
  httpStatus: Number,
  message: String,
  correlationId?: String | Null,
  detail: Object
}) =
  buildErrorResponse({
    httpStatus: args.httpStatus,
    message: args.message,
    correlationId: args.correlationId,
    details: [ args.detail ]
  })

/*
 * Convenience helper:
 * Builds a standard ApiResponse error envelope with one detail generated inline.
 *
 * Supported properties:
 * - httpStatus    (required)
 * - message       (required)
 * - correlationId (optional)
 * - detailMessage (required)
 * - code          (optional)
 * - target        (optional)
 * - severity      (optional, included only when explicitly provided)
 */
fun buildErrorResponseWithInlineDetail(args: {
  httpStatus: Number,
  message: String,
  correlationId?: String | Null,
  severity?: String | Null,
  code?: String | Null,
  detailMessage: String,
  target?: String | Null
}) =
  buildErrorResponse({
    httpStatus: args.httpStatus,
    message: args.message,
    correlationId: args.correlationId,
    details: [
      buildErrorDetail({
        severity: args.severity,
        code: args.code,
        message: args.detailMessage,
        target: args.target
      })
    ]
  })
