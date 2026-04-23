## Overview

The Customer Canonical Data Types Library is a reusable RAML 1.0 library that defines canonical customer data types for use across Process APIs. As an asset of the Customer API-led reference architecture, the library provides a system-agnostic representation of customer data that abstracts underlying source systems such as Salesforce, SAP ECC, and Oracle EBS.

The library standardizes how customer data is represented and exchanged across APIs, enabling Process APIs to aggregate, normalize, and expose consistent business-aligned data structures. This approach ensures that downstream consumers interact with a unified customer model regardless of the originating systems.

The library provides reusable data types that represent canonical customer data and associated payload structures for API operations such as retrieval. Centralizing these definitions in a shared library enables API designers and integration developers to consistently apply the canonical customer model across multiple APIs, thereby reducing duplication and minimizing divergence over time.

## How These Libraries Work Together

The following diagram illustrates how system-aligned customer data is mapped to the canonical model and subsequently used by Process APIs. It highlights the role of the canonical model in normalizing and abstracting underlying source systems.

![Library Relationships](resources/lib-canonical-customer-types-diagram-1dff9f06-a385-4fda-a5f7-68f931fdcf2b.png)

The Customer Canonical Data Types Library defines the canonical data model illustrated in the diagram above, enabling consistent data representation and transformation across Process APIs. System-aligned models are defined by system-specific libraries such as the Salesforce Customer Data Types Library.

## Design Principles

**1. System-agnostic representation:** The data model abstracts underlying system-specific representations and avoids exposing source system semantics.

**2. Separation of concerns:** Canonical models are defined in Process APIs, while System APIs remain aligned to their respective source systems.

**3. Reuse through libraries:** The model is packaged as a RAML 1.0 library to enable import and reuse across multiple Process APIs.

**4. Consistency across APIs:** Employing a shared canonical model ensures that all Process APIs present customer data consistently, thereby enhancing usability and reducing confusion for API consumers.

**5. Extensibility:** The model supports evolution through optional fields and metadata without introducing breaking changes.

## Library Contents

The RAML library defines the following reusable types.

- `Customer` -- Represents a canonical customer using a normalized, business-aligned structure.
- `CustomerCollection` -- Represents a collection of canonical customer records.
- `CustomerGetData` -- Specifies the payload returned upon retrieval of multiple customer records.
- `CustomerSingleGetData` -- Specifies the payload returned upon retrieval of a single customer record.

## Typical Usage

This library is designed for use by Process APIs that orchestrate and transform customer data across multiple systems.

- Process APIs use these data types to expose canonical customer representations.
- System APIs provide system-aligned data structures that are transformed into the canonical model.
- Experience APIs typically consume canonical data exposed by Process APIs.

## Relationship to Other Assets

This library may be used alongside other assets in the reference architecture, including:

- [Common Response Types Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses): provides a shared response model that may be used when returning canonical data.

API designers can use this library for canonical data structures and may pair it with the Common Response Types Library when a shared response model is desirable.

## Versioning

This asset follows semantic versioning.

Backward-compatible changes such as documentation improvements, additional examples, and optional fields may be released as minor or patch revisions. Breaking changes should be released as a new major version.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
