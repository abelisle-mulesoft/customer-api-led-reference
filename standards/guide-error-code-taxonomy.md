# Brilliant Mule Error Code Taxonomy

## Purpose
This document defines the enterprise standard for error codes used across all Brilliant Mule APIs. Error codes provide a consistent, machine-readable way to identify conditions, support troubleshooting, and enable reliable integrations across systems.

All APIs must use standardized error codes in the `ResponseDetail.code` field defined in the `lib-common-responses` library.

## Code Structure

Error codes should follow a stable, dot-separated hierarchical format, typically beginning with a domain and ending with a condition. Additional segments may be introduced as needed to improve clarity and specificity. Codes should remain concise, predictable, and meaningful to both developers and support teams.

Examples:
CUSTOMER.NOT_FOUND
ORDER.VALIDATION.FAILED
SAP.TIMEOUT
INTEGRATION.SALESFORCE.RATE_LIMIT

## Naming Rules
- Use uppercase letters only
- Use dot (`.`), hyphen (`-`), or underscore (`_`) as separators
- No spaces allowed
- Must start with a letter
- Recommended length: 3–64 characters

Recommended pattern:
^[A-Z][A-Z0-9._-]{2,63}$

## Domains
Domains represent the functional or system boundary where the error originates.

Common domains:
COMMON
CUSTOMER
ORDER
PAYMENT
SAP
SALESFORCE
INTEGRATION
SECURITY
SYSTEM

## Entities
Entities represent the primary business or technical object involved.

Examples:
CUSTOMER
ORDER
INVOICE
PAYMENT
ACCOUNT
API
REQUEST

## Conditions
Conditions describe the specific issue or state.

Common conditions:
NOT_FOUND
VALIDATION_FAILED
ALREADY_EXISTS
TIMEOUT
UNAUTHORIZED
FORBIDDEN
RATE_LIMIT
DEPENDENCY_FAILURE
INVALID_INPUT
MISSING_REQUIRED_FIELD
PROCESSING_ERROR

## Mapping to Response Model
Error codes are used in conjunction with the standard response envelope defined in `lib-common-responses`.

| HTTP Status | ApiResponse.status | ResponseDetail.severity |
|------------|-------------------|--------------------------|
| 200        | SUCCESS           | INFO                     |
| 200        | WARNING           | WARNING                  |
| 400        | ERROR             | ERROR                    |
| 401        | ERROR             | ERROR                    |
| 403        | ERROR             | ERROR                    |
| 404        | ERROR             | ERROR                    |
| 500        | ERROR             | ERROR                    |
| 503        | ERROR             | ERROR                    |

## Examples

### Validation Error
{
  "status": "ERROR",
  "message": "Validation failed.",
  "details": [
    {
      "severity": "ERROR",
      "code": "CUSTOMER.VALIDATION.MISSING_EMAIL",
      "message": "Email address is required.",
      "target": "email"
    }
  ]
}

### Integration Failure
{
  "status": "ERROR",
  "message": "SAP system unavailable.",
  "details": [
    {
      "severity": "ERROR",
      "code": "SAP.TIMEOUT",
      "message": "SAP ECC did not respond within 30 seconds."
    }
  ]
}

### Partial Success
{
  "status": "WARNING",
  "message": "Some records were skipped.",
  "details": [
    {
      "severity": "WARNING",
      "code": "CUSTOMER.SKIPPED_INACTIVE",
      "message": "Inactive customers were not processed."
    }
  ]
}

## Best Practices
- Always provide a meaningful `code` alongside a human-readable `message`
- Use `details` to include multiple issues when applicable
- Avoid exposing internal system errors directly; map them to standardized codes
- Ensure codes remain stable over time to avoid breaking consumers
- Document any domain-specific extensions if needed

## Summary
The error code taxonomy ensures consistency, improves observability, and enables scalable API design across the Brilliant Mule platform. All APIs are expected to comply with this standard.
