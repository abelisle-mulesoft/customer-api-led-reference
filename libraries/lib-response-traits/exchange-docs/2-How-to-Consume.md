## Overview

This library provides reusable standard response traits that can be applied to API specifications to consistently document common request, routing, negotiation, and runtime error conditions without duplicating response blocks.

API designers import this library into their API specifications and apply the defined traits to methods.

## Import the Library

Add the RAML library as a dependency in your API specification.

Example:

```yaml
uses:
  responseTraits: exchange_modules/<org-id>/lib-response-traits/1.0.0/lib-response-traits.raml
```

Once imported, the traits can be applied to API methods.

## Apply Standard Response Traits

Standard response traits are applied at the method level to declare consistent error responses.

Example:

```yaml
/customers:
  get:
    is: [ responseTraits.common-routing-and-runtime-errors ]
```

This helps the method document common HTTP error responses using the shared response model.

## Typical Usage Patterns

- Apply response traits consistently across all endpoints within an API.
- Use a single alias (e.g., `responseTraits`) across all API specifications.
- Combine with the Common Response Types Library when a shared response model is desirable.
- Use alongside the API Security Traits Library to ensure consistent alignment between access control and error responses.

## Recommended Patterns

- Use predefined traits when you want reusable documentation for common HTTP error scenarios.
- Apply response traits consistently within an API when adopting the shared response model.
- Combine with the Common Response Types Library when a structured response model is appropriate for the API.
- Keep documented responses aligned with actual implementation behavior.

## Frequent Implementation Pitfalls

- Importing the library but not applying traits to all methods.
- Mixing custom response definitions with standardized traits.
- Using inconsistent aliases across APIs.
- Misalignment between documented responses and actual implementation behavior.
