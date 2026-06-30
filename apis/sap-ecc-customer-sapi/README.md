## Overview

The SAP ECC Customer System API is part of the Customer API-led Reference Architecture and implements the System API layer within the Customer domain. This API provides system-aligned access to customer data in SAP ECC. It exposes resources and data structures that reflect the underlying system, without applying canonical transformations.

## Role in the Architecture

This API represents the System API layer in an API-led connectivity architecture.

- System APIs provide system-aligned access to customer data.
- Process APIs orchestrate and transform data from System APIs into canonical models.
- Experience APIs consume the canonical model exposed by a Process API to deliver channel-specific experiences.

This separation ensures loose coupling, reusability, and consistent data representation across systems.

## System Context

This API provides access to customer data in SAP ECC using system-specific structures, identifiers, and constraints. It reflects the capabilities and limitations of the underlying system, including SAP ECC data models and common integration patterns such as BAPIs and IDocs, and does not abstract or normalize data into a canonical model.

## Contents

This folder contains the assets that define, document, and implement the SAP ECC Customer System API. Its structure reflects the opinionated conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `raml/sap-ecc-customer-sapi.raml` -- RAML specification defining the API contract.
- `implementation/sap-ecc-customer-sapi/` -- Mule application implementation containing flows, configurations, and supporting resources.
- `exchange-docs/` -- Documentation pages published to Anypoint Exchange.
  - `1-Home.md` -- Introduces the API and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Describes how to request access and successfully invoke the API.
  - `3-Security.md` -- Describes security requirements and policies applied to the API.
  - `4-Environments-and-Testing.md` -- Lists available environments, endpoints, and prerequisites for testing the API.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.
- `README.md` -- This document, providing an overview of the API and its role within the reference architecture.

## Implementation Notes

The current implementation is intentionally stubbed and aligned with the API contract, enabling development, testing, and demonstration without requiring a fully configured SAP ECC environment. As such, it returns mocked responses for all operations.

## Key Responsibilities

The SAP ECC Customer System API is responsible for:

- Providing system-aligned access to SAP ECC customer account data.
- Exposing SAP ECC customer structures, identifiers, and constraints without transforming them into the enterprise canonical customer model.
- Encapsulating SAP ECC-specific integration details behind a stable API contract.
- Enforcing standard API security and response behavior.
- Returning consistent responses using the standard response envelope.

## Capabilities

This API supports the following capabilities:

- Retrieve SAP ECC customer account records.
- Create or update multiple SAP ECC customer account records through an upsert operation.
- Return SAP ECC customer data using SAP ECC-aligned field names and the standard response envelope.

## Related Assets

The SAP ECC Customer System API is part of the Customer API-led Reference Architecture and works in conjunction with the following assets.

### RAML Libraries

- API Response Traits Library -- Defines standardized response behaviors and HTTP status handling.
- API Security Schemes Library -- Defines reusable security schemes such as client ID enforcement.
- Common Response Types Library -- Defines the standard response envelope used across APIs.

### Standards

- Code Taxonomy Guide -- Defines standardized response and error codes used across the architecture.

## Usage

Process APIs and other consumers use this API to interact with customer data in SAP ECC. Typical use cases include:

- Retrieve customer data from the system of record.
- Create or update customer records in the system.
- Access system-specific attributes required for downstream processing.

## Versioning

This API follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers implementing API-led connectivity patterns.
