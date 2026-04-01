## Overview

The Common Response Types Library is available as a reusable RAML 1.0 library in Anypoint Exchange. API designers incorporate this library into their API specifications to enforce a consistent response structure across APIs and integrations. Using a shared response library maintains uniform contracts, enhances observability, and reduces discrepancies in response handling across domains.

The library offers reusable response types that can be referenced directly in API specifications and extended by constraining the `ApiResponse.data` property to an operation-specific payload. The `ResponseDetail.code` field in this library must adhere to the standard outlined in the Brilliant Mule [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy).

## Import the Library

Add the RAML library as a dependency in your API specification.

Example:

``` yaml
uses:
  common: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses/1.0.0/lib-common-responses.raml
```

Once imported, the library types can be referenced throughout the API specification.

## Use the Standard Envelope

The library exposes several reusable types that can be used in request and response definitions. In most cases, API designers reference the standard envelope `common.ApiResponse` as the response type. This establishes a consistent response contract while allowing the payload structure to remain flexible.

Example:

``` yaml
/customers/{id}:
  get:
    responses:
      200:
        body:
          application/json:
            type: common.ApiResponse
```

This approach is useful when API designers want to adopt the standard envelope without further constraining the `ApiResponse.data` property.

## Constrain the `ApiResponse.data` Property for a Specific API

The recommended pattern is to reuse the standard envelope while constraining the `ApiResponse.data` property to an operation-specific type. This approach provides strong typing for consumers without compromising the consistency of the response envelope.

Example:

``` yaml
types:
  CustomerGetData:
    type: object
    properties:
      customerId: string
      companyName: string

  GetCustomerResponse:
    type: common.ApiResponse
    properties:
      data?:
        type: CustomerGetData
```

This preserves the enterprise-standard envelope while giving API consumers a stronger and more explicit contract for the operation-specific payload.

## Use `ResponseDetail` for Additional Conditions

A `ResponseDetail` entry provides a standardized way to communicate additional informational, warning, and error conditions. Multiple `ResponseDetail` entries may be returned to represent multiple conditions within a single response. Typical uses of a `ResponseDetail` entry include:

- Validation messages.
- Partial processing warnings.
- Dependency failures.
- Informational completion messages.

Example:

``` yaml
types:
  ValidationErrorResponse:
    type: common.ApiResponse
    properties:
      details?:
        type: common.ResponseDetail[]
```

Example payload:

``` json
{
  "dateTime": "2026-03-17T22:17:00Z",
  "httpStatus": 400,
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
```

The `ResponseDetail.code` field must adhere to the standard outlined in the Brilliant Mule [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy).

## Recommended Pattern

When using the Common Response Types Library:

- Always use `ApiResponse` as the response envelope.
- Constrain the `ApiResponse.data` property to an operation-specific type.
- Use `ResponseDetail` to communicate validation issues, warnings, and additional conditions.
- Ensure all `ResponseDetail.code` values follow the Code Taxonomy Guide.

This pattern ensures consistency, strong typing, and clear communication of outcomes across APIs.

## Typical Usage Patterns

The Common Response Types Library is typically used across APIs structured according to the API-led connectivity approach.

- System APIs use the library to standardize backend-facing response structures.

- Process APIs use the library to communicate orchestration outcomes, warnings, and detail conditions consistently across multi-system workflows.

- Experience APIs use the library to provide predictable response envelopes to applications and channels while maintaining the same response semantics used elsewhere in the platform.

## Related Standards

The following Platform Standards assets are typically used together:

- Common Response Types Library -- standard response structure.
- [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy) -- standard code taxonomy for informational, warning, and error conditions.

API designers should review both assets when designing or revising API contracts.
