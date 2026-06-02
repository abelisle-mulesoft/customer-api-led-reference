## Overview

The Customer Canonical Data Types Library is available as a reusable RAML 1.0 library in Anypoint Exchange. It provides canonical customer data types for use in API specifications. API designers import this library into their API specifications to reuse consistent, system-agnostic customer data structures across Process APIs.

## Import the Library

Add the RAML library as a dependency in your API specification.

Example:

``` yaml
uses:
  customer: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-canonical-customer-types/1.0.0/lib-canonical-customer-types.raml
```

Once imported, the library types can be referenced throughout the API specification.

## Use the Customer Types

The library exposes reusable types that can be used in request and response definitions.

Common types include:

- `Customer`
- `CustomerCollection`
- `CustomerGetData`
- `CustomerSingleGetData`

Example request body:

``` yaml
/customers:
  post:
    body:
      application/json:
        type: customer.CustomerCollection
```

Example response payload:

``` yaml
types:
  GetCustomersResponse:
    type: common.ApiResponse
    properties:
      data?:
        type: customer.CustomerGetData
```

## Combine with a Shared Response Model (Optional)

This library defines data types only. APIs may use the response model from the Common Response Types Library when a shared response structure is desirable.

Example:

``` yaml
uses:
  common: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses/1.0.0/lib-common-responses.raml
  customer: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-canonical-customer-types/1.0.0/lib-canonical-customer-types.raml
```

Then constrain the data property:

``` yaml
types:
  GetCustomerResponse:
    type: common.ApiResponse
    properties:
      data?:
        type: customer.CustomerSingleGetData
```

## Typical Usage Patterns

The Customer Canonical Data Types Library is primarily utilized in APIs designed following the API-led connectivity methodology.

- Process APIs use these types to expose canonical customer data.
- System APIs provide system-aligned data that is transformed into the canonical model.
- Experience APIs consume canonical representations exposed by Process APIs.

## Recommended Best Practices

- Restrict the use of this library to Process APIs.
- Avoid mixing canonical models with system-aligned models within the same API layer.
- Ensure that transformations between canonical and system-aligned models occur exclusively within the Process API layer.
- Refrain from redefining these types locally to maintain consistency and prevent divergence.
- Adopt consistent library aliases, such as `customer`, across all implementations.

## Frequent Implementation Pitfalls

- Importing the library without consistently applying its types.
- Combining canonical fields with system-specific fields within the same context.
- Redefining similar types across multiple APIs rather than reusing the centralized library.
- Exposing system-aligned models directly from Process APIs.
