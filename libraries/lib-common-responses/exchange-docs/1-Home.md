## Overview

The Common Response Types Library is a reusable RAML 1.0 library that defines a reference response model for Brilliant Mule APIs. This library establishes uniform communication of request outcomes, detailed messages, and operation-specific payloads. Centralizing these definitions enables API designers to maintain consistent response structures across system, process, and experience APIs.

The library provides reusable data types that address common API design and runtime scenarios, including:

- Consistent success, warning, and error responses.
- Validation feedback and business-rule messaging.
- Standardized observability and troubleshooting.
- Stable and predictable response contracts across reusable APIs.

## Mental Model

Think of these libraries as defining: who can call the API, what happens, and how responses are structured.

- **Who can call the API** → API Security Traits Library
- **What happens** → API Response Traits Library
- **How responses look** → Common Response Types Library

Together, they ensure consistent access control, behavior, and response structure across all APIs.

## How These Libraries Work Together

The following diagram visualizes how these libraries work together, showing how access control, response behavior, and response structure are defined across APIs.

![Library Relationships](resources/lib-common-responses-diagram-f48532ea-b170-4112-adbe-eff7863a26c2.png)

The Common Response Types Library defines the response structure referenced in the diagram above, providing a consistent response model that can be adopted across APIs. Response behavior is defined by the API Response Traits Library.

## Response Model Overview

The following representation focuses on the response structure referenced in the diagram above. It illustrates the structure and relationships of the response data types defined in this library.

```text
lib-common-responses.raml
└── types
    ├── ApiResponseStatus (string enum)
    │   ├── SUCCESS
    │   ├── WARNING
    │   └── ERROR
    │
    ├── Severity (string enum)
    │   ├── INFO
    │   ├── WARNING
    │   └── ERROR
    │
    ├── ResponseDetail (object)
    │   ├── severity: Severity
    │   ├── code?: string
    │   ├── message: string
    │   └── target?: string
    │
    └── ApiResponse (object)
        ├── dateTime: datetime
        ├── httpStatus: integer
        ├── status: ApiResponseStatus
        ├── message: string
        ├── correlationId?: string
        ├── details?: ResponseDetail[]
        └── data?: any
```

This structure establishes a consistent response envelope while allowing APIs to define operation-specific payloads within the `ApiResponse.data` property, enabling reuse without constraining domain-specific models.

## Design Principles

The Common Response Types Library follows several guiding principles.

**1. Consistency across APIs:** APIs may adopt a consistent response structure to enable uniform interpretation across domains and implementations.

**2. Separation of HTTP and business outcome:** HTTP status codes communicate transport-level results, while `ApiResponse.status` communicates the business outcome of the request independent of transport. This allows APIs to clearly express successful processing, partial success, warnings, and failures.

**3. Reuse through libraries:** The model is packaged as a RAML 1.0 library so API designers can import and reuse the same response types across multiple API specifications.

**4. Extensible payloads:** The `ApiResponse` envelope provides a stable top-level structure while allowing individual APIs to constrain the `ApiResponse.data` property to an operation-specific payload.

**5. Structured details:** The `details` array provides a standard way to communicate additional informational, warning, and error conditions without changing the top-level response structure.

**6. Code-driven observability:** Each `ResponseDetail.code` value should follow the enterprise standard documented in the Brilliant Mule [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy). This promotes consistency, easier troubleshooting, and more reliable automation.

## Library Contents

The RAML library defines the following reusable types.

- `ApiResponse`: Represents the reference response envelope that can be used across APIs. The envelope includes:

  - `dateTime` -- timestamp indicating when the response was generated.
  - `httpStatus` -- HTTP status code returned by the API.
  - `status` -- business outcome of the request.
  - `message` -- top-level summary of the outcome.
  - `correlationId` -- optional identifier used for distributed tracing.
  - `details` -- optional array of structured detail messages.
  - `data` -- optional operation-specific response payload.

- `ApiResponseStatus`: Represents the business outcome of the API request. `ApiResponseStatus` is independent of the HTTP status code. For example, an API may return HTTP 200 with `status` set to `WARNING` when the request completed but one or more non-fatal conditions occurred.

- `ResponseDetail`: Represents a structured detail message returned by the API. A response may include multiple detail entries in the `ApiResponse.details` array. The typical fields of a `ResponseDetail` entry include:

  - `severity` -- severity level of the detail.
  - `code` -- machine-readable code identifying the condition.
  - `message` -- human-readable explanation of the condition. The `code` field should conform to the Brilliant Mule standard documented in the [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy) asset.
  - `target` -- optional field, object path, or parameter associated with the condition.

- `Severity`: Represents the severity of a `ResponseDetail` entry. `Severity` is used to classify the nature of a detail message and helps clients interpret additional conditions returned by the API.

### Examples

Example of a `ResponseDetail` entry:

``` json
{
  "severity": "ERROR",
  "code": "CUSTOMER.VALIDATION.MISSING_EMAIL",
  "message": "Email address is required.",
  "target": "email"
}
```

Example of an `ApiResponse`:

``` json
{
  "dateTime": "2026-03-17T22:15:00Z",
  "httpStatus": 200,
  "status": "WARNING",
  "message": "Request completed with warnings.",
  "correlationId": "8af51c4a-1c90-4f92-9d4d-2f56a61a9b8f",
  "details": [
    {
      "severity": "WARNING",
      "code": "CUSTOMER.SKIPPED_INACTIVE",
      "message": "Inactive customers were not processed.",
      "target": "records[3]"
    }
  ],
  "data": {
    "recordCount": 10,
    "processedCount": 9,
    "skippedCount": 1
  }
}
```

## Relationship to Other Assets

This library defines the reference response model used within the Customer API-led reference architecture.

It works in conjunction with:

- [API Response Traits Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-response-traits): applies standardized HTTP response definitions at the method level using this response model.
- [API Security Traits Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-security-traits): defines access control requirements that may result in standardized error responses structured using this library.

Together, these libraries establish a consistent model where:

- Response structure is defined here.
- Response behavior is defined in response traits.
- Access control is defined in security traits.

## Typical Usage

The Common Response Types Library is typically used across APIs structured according to the API-led connectivity approach.

- System APIs can use the library to standardize backend-facing response structures.

- Process APIs are the strongest candidates for the full response envelope, as they often need to communicate orchestration outcomes, warnings, and multi-system conditions.

- Experience APIs may adopt the full envelope when consistency across an internal portfolio is more important than a lightweight client-facing shape.

## Versioning

This asset follows semantic versioning.

Backward-compatible changes such as documentation improvements, additional examples, and optional fields may be released as minor or patch revisions. Breaking changes to the response contract should be released as a new major version.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
