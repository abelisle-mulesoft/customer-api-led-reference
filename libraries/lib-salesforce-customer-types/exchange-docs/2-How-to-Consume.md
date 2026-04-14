## Overview

The Salesforce Customer Data Types Library is a reusable RAML 1.0 library is available as a reusable RAML 1.0 library in Anypoint Exchange. It provides Salesforce-aligned customer data types for use in API specifications. API designers import this library into their API specifications to reuse consistent Salesforce customer data structures across System APIs within the Customer API-led reference architecture.

## Import the Library

Add the RAML library as a dependency in your API specification.

Example:

``` yaml
uses:
uses:
  sfCustomer: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-salesforce-customer-types/1.0.0/lib-salesforce-customer-types.raml
```

Once imported, the library types can be referenced throughout the API specification.

## Use the Salesforce Customer Types

The library exposes reusable types that can be used in request and response definitions.

Common types include:

- `SalesforceCustomer`
- `SalesforceCustomerCollection`
- `SalesforceCustomerGetData`
- `SalesforceCustomerSingleGetData`
- `SalesforceCustomerUpsertData`

Example request body:

``` yaml
/customers:
  post:
    body:
      application/json:
        type: sfCustomer.SalesforceCustomerCollection
```

Example response payload:

``` yaml
types:
  GetCustomersResponse:
    type: common.ApiResponse
    properties:
      data?:
        type: sfCustomer.SalesforceCustomerGetData
```

## Combine with a Shared Response Model (Optional)

This library defines data types only. APIs may use the response model from the Common Response Types Library when a shared response structure is desirable.

Example:

``` yaml
uses:
  common: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses/1.0.0/lib-common-responses.raml
  sfCustomer: exchange_modules/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-salesforce-customer-types/1.0.0/lib-salesforce-customer-types.raml
```

Then constrain the data property:

``` yaml
types:
  GetCustomerResponse:
    type: common.ApiResponse
    properties:
      data?:
        type: sfCustomer.SalesforceCustomerSingleGetData
```

## Typical Usage Patterns

The Salesforce Customer Data Types Library is primarily utilized in APIs designed following the API-led connectivity methodology.

- System APIs use these types to expose Salesforce-aligned customer data.
- Process APIs handle transformations between canonical customer models and Salesforce-aligned models.
- Experience APIs generally consume canonical models and should utilize these types exclusively when there is a deliberate need to expose system-aligned data.

## Recommended Best Practices

- Restrict the use of this library to Salesforce System APIs only.
- Avoid mixing canonical models with system-aligned models within the same API layer.
- Ensure that transformations between canonical and system-aligned models occur exclusively within the Process API layer.
- Refrain from redefining these types locally to maintain consistency and prevent divergence.
- Adopt consistent library aliases, such as `sfCustomer`, across all implementations.

## Frequent Implementation Pitfalls

- Importing the library without consistently applying its types.
- Combining canonical customer fields with Salesforce-aligned fields within the same context.
- Redefining similar types across multiple APIs rather than reusing the centralized library.
- Utilizing system-aligned types in Experience APIs without explicit justification.
