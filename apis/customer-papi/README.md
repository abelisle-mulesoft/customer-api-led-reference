## Overview

The Customer Process API is part of the Customer API-led Reference Architecture, implementing the Process API layer within the Customer domain. It orchestrates, aggregates, and transforms customer data from underlying systems, including the Brilliant Mule Salesforce instance, the Umbrella Salesforce instance, Oracle E-Business Suite, and SAP ECC, and exposes a canonical customer representation to upstream consumers. The API leverages the enterprise canonical customer model and functions as the primary entry point for consumer applications that require unified customer data.

## Role in the Architecture

This API represents the Process API layer in an API-led connectivity architecture.

- System APIs provide system-aligned access to customer data.
- Process APIs orchestrate and transform data from System APIs into canonical models.
- Experience APIs consume the canonical model exposed by a Process API to deliver channel-specific experiences.

This separation ensures loose coupling, reusability, and consistent data representation across systems.

## Contents

This folder contains the assets that define, document, and implement the Customer Process API. Its structure reflects the opinionated conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `raml/customer-papi.raml` -- RAML specification defining the API contract.
- `implementation/customer-papi` -- Mule application implementation containing flows, configurations, and supporting resources.
- `exchange-docs/` -- Documentation pages published to Anypoint Exchange.
  - `1-Home.md` -- Introduces the API and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Describes how to request access and successfully invoke the API.
  - `3-Security.md` -- Describes security requirements and policies applied to the API.
  - `4-Environments-and-Testing.md` -- Lists available environments, endpoints, and prerequisites for testing the API.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.
- `README.md` -- This document, providing an overview of the API and its role within the reference architecture.

## Key Responsibilities

The Customer Process API is responsible for:

- Orchestrating calls to multiple System APIs.
- Transforming system-aligned data into the canonical customer model.
- Aggregating customer data across systems.
- Applying business logic and validation.
- Returning consistent responses using the standard response envelope.

## Related Assets

The Customer Process API is part of the Customer API-led Reference Architecture and works in conjunction with the following assets.

### RAML Libraries

- API Response Traits Library -- Defines standardized response behaviors and HTTP status handling.
- API Security Schemes Library -- Defines reusable security schemes such as client ID enforcement.
- Common Response Types Library -- Defines the standard response envelope used across APIs.
- Customer Canonical Data Types Library -- Defines the canonical customer model used by Process APIs.

### APIs

- Oracle E-Business Suite Customer System API -- Provides access to Oracle customer data.
- Salesforce Brilliant Mule Customer System API -- Provides access to customer data in the Brilliant Mule Salesforce instance.
- Salesforce Umbrella Customer System API -- Provides access to customer data in the Umbrella Salesforce instance.
- SAP ECC Customer System API -- Provides access to SAP customer data.

### Standards

- Code Taxonomy Guide -- Defines standardized response and error codes used across the architecture.

## Usage

API consumers interact with this API to retrieve or manage customer data using a canonical representation. Typical use cases include:

- Retrieve a unified customer view across systems.
- Apply cross-system business rules and validation.

## Versioning

This API follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers implementing API-led connectivity patterns.
