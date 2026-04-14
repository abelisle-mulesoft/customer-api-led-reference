## Overview

The Salesforce Customer Data Types Library is a reusable RAML 1.0 library that defines customer data types for use across Salesforce System APIs. As a component of the Customer API-led reference architecture, the library provides system-aligned representations of Salesforce Account data within the System API layer. It standardizes the representation of Salesforce Account data in APIs while preventing direct exposure of the source system's internals. This approach allows API designers to utilize consistent, human-readable data structures that accurately reflect Salesforce concepts.

The library provides reusable data types that represent Salesforce Account data and associated payload structures for API operations such as retrieval and upsert. Centralizing these definitions in a shared library enables API designers and integration developers to consistently apply the Salesforce-aligned customer model across multiple APIs, thereby reducing duplication and minimizing divergence over time.

## How These Libraries Work Together

The following diagram illustrates how system-aligned customer data provided by System APIs is mapped to the canonical model used by Process APIs. It highlights the role of system-specific libraries in accurately representing source system data before transformation into a canonical representation.

![Library Relationships](resources/lib-salesforce-customer-types-diagram-9b9175fa-ca24-463d-b9c4-0779acfec97d.png)

The Salesforce Customer Data Types Library defines the system-aligned data model illustrated in the diagram above, providing a consistent representation of Salesforce customer data across System APIs. Canonical transformation is handled by the Customer Canonical Data Types Library.

## Design Principles

**1. Alignment with the source system:** The data model maintains consistency with Salesforce Account concepts and fields. Field names are designed to be both readable and consumer-friendly, while accurately reflecting the underlying system.

**2. Separation from the canonical model:** The library deliberately excludes the enterprise canonical customer model. Canonical representations are designated for the Process API layer, whereas System APIs provide system-aligned representations.

**3. Reuse through libraries:** The model is packaged as a RAML 1.0 library to enable import and reuse across multiple Salesforce System APIs.

**4. Consistency across APIs:** Employing a shared library ensures that all Salesforce System APIs present customer data consistently, thereby enhancing usability and minimizing confusion for API consumers.

**5. Encapsulation of system complexity:** The library conceals cryptic Salesforce field names while preserving the meaning and structure of the source data.

## Library Contents

The RAML library defines the following reusable types.

- `SalesforceCustomer` -- Represents a Salesforce Account record using a Salesforce-aligned and consumer-friendly structure.
- `SalesforceCustomerCollection` -- Represents a collection of Salesforce customer records.
- `SalesforceCustomerGetData` -- Specifies the payload returned upon retrieval of multiple customer records.
- `SalesforceCustomerSingleGetData` -- Specifies the payload returned upon retrieval of a single customer record.
- `SalesforceCustomerUpsertData` -- Represents the payload returned when processing create or update operations.

## Typical Usage

This library is designed for use by Salesforce System APIs that provide access to customer account data.

- System APIs utilize these data types to define request and response payloads aligned with Salesforce.
- Process APIs convert between canonical customer data models and the Salesforce-aligned data types provided by this library.
- Experience APIs are not intended to use this library directly unless there is a deliberate requirement to expose system-aligned data.

## Relationship to Other Assets

This library may be used alongside other assets in the reference architecture, including:

- [Common Response Types Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses): provides a shared response model that may be used when returning system-aligned data.
- [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy): defines the standard code taxonomy for response details.
- [Customer Canonical Data Types Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-canonical-customer-types): defines canonical data models used in Process APIs.

API designers can use this library for system-aligned data structures and may pair it with the Common Response Types Library when a shared response model is desirable.

## Versioning

This asset follows semantic versioning.

Backward-compatible changes such as documentation improvements, additional examples, and optional fields may be released as minor or patch revisions. Breaking changes should be released as a new major version.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
