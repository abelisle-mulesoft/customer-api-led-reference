## Overview

This library provides reusable security traits that can be applied to API specifications to declare consistent authentication and authorization requirements.

API designers import this library into their API specifications and apply the defined traits to methods requiring security enforcement.

## Import the Library

Add the RAML library as a dependency in your API specification.

Example:

```yaml
uses:
  security: exchange_modules/<org-id>/lib-security-traits/1.0.0/lib-security-traits.raml
```

Once imported, the traits can be applied to API methods.

## Apply Security Traits

Security traits are applied at the method level to enforce required headers and access controls.

Example:

```yaml
/customers:
  get:
    is: [ security.client-id-required ]
```

This enforces the presence of required authentication headers for the operation.

## Combine with API Manager Policies

The traits defined in this library describe the contract-level requirements for security. Runtime enforcement is implemented through policies applied in Anypoint API Manager.

Typical flow:
- The API specification defines required headers using traits.
- The API is deployed behind the MuleSoft API gateway.
- A corresponding policy (e.g., Client ID Enforcement) is applied in API Manager.

Both layers must be aligned to ensure proper enforcement.

## Typical Usage Patterns

- Apply security traits consistently across endpoints that share the same access control requirements.
- Use a single alias (e.g., security) across all API specifications.
- Combine with the Common Response Types Library when a shared response model is desirable for security-related error responses.

## Recommended Best Practices

- Apply security traits to all externally accessible endpoints.
- Avoid redefining security requirements directly in API specifications.
- Ensure alignment between RAML traits and API Manager policies.
- Use consistent header names and validation rules across APIs.

## Frequent Implementation Pitfalls

- Importing the library without applying traits to all required methods.
- Misalignment between defined traits and applied API Manager policies.
- Inconsistent use of aliases across API specifications.
- Defining security logic directly in implementations instead of using standardized traits.
