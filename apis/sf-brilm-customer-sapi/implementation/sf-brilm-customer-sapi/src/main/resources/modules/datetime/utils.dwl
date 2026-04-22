%dw 2.0
/**
 * UTC Time Utility Functions.
 *
 * This module centralizes UTC-based date and time handling to ensure consistent,
 * timezone-safe behavior across APIs. It is intended for use in response envelopes,
 * logging, correlation, and any logic that depends on the current UTC timestamp.
 */

/**
 * Returns the current date and time as a DateTime object in UTC.
 *
 * This function provides the raw UTC DateTime value without applying any formatting.
 * It is useful when additional date/time manipulation is required (for example,
 * deriving file names, calculating date ranges, or applying custom formats).
 */
fun nowUtcDateTime(): DateTime =
  now() as DateTime { timezone: "UTC" }

/**
 * Returns the current timestamp in UTC, formatted as an ISO-8601 string.
 *
 * Format:
 *   yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
 *
 * Example:
 *   2023-01-01T16:00:00.000Z
 *
 * This function is typically used for:
 * - API response envelopes (dateTime field)
 * - Logging and tracing
 * - Asynchronous job status responses
 */
fun nowUtc(): String =
  nowUtcDateTime() as String { format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" }
