## Overview

The SAP ECC Customer System API is part of the Customer API-led Reference Architecture and implements the System API layer for the Customer domain. This API provides system-aligned access to customer data in SAP ECC. It exposes resources and data structures that reflect the underlying system without applying canonical transformations.

## Role in the Architecture

This API represents the System API layer in an API-led connectivity architecture.

- System APIs provide system-aligned access to customer data.
- The Process API orchestrates and transforms this data into a canonical model.
- Experience APIs consume Process APIs to deliver channel-specific experiences.

This separation ensures loose coupling and enables independent evolution of systems and consumers.

## System Context

This API provides access to customer data in SAP ECC using system-specific structures, identifiers, and constraints.

It reflects the capabilities and limitations of the underlying system, including SAP ECC data models and integration patterns such as BAPIs and IDocs, and does not abstract or normalize data into a canonical model.

## Contents

This folder contains the design-time and implementation artifacts for the SAP ECC Customer System API.

- `raml/sap-ecc-customer-sapi.raml` -- RAML specification defining the API contract.
- `exchange-docs/` -- Anypoint Exchange documentation pages (as per best practices).
  - `1-Home.md` -- Introduces the API and its role in the architecture (overrides the default `home` page).
	- `2-How-to-Consume.md` -- Describes how to request access and successfully invoke the API.
	- `3-Security.md` -- Describes security requirements and policies applied to the API (e.g., client ID enforcement).
	- `4-Environments-and-Testing.md` -- Lists available environments, endpoints, and prerequisites for testing the API.
	- `5-Getting-Help.md` -- Describes how to get support and additional information.  ￼
- `implementation/sap-ecc-customer-sapi/` -- Anypoint Studio Mule project implementing the API.
  - Contains the Mule flows, configurations, and DataWeave logic that realize the API contract.
  - Can be imported directly into Anypoint Studio for development and deployment.

## Implementation

The `implementation/sap-ecc-customer-sapi` folder contains the Anypoint Studio Mule project that implements this API. The Mule project can be imported into Anypoint Studio and deployed across environments using a build-once, deploy-everywhere approach. This implementation:

- Adheres to the RAML specification defined in `raml/sap-ecc-customer-sapi.raml`.
- Enforces the API contract, including request/response structures and error handling.
- Is intended as a reference implementation aligned with API-led connectivity best practices.
- Focuses on demonstrating API-led connectivity patterns rather than system-specific integration details.
- Provides a stubbed implementation aligned with the API contract, enabling development, testing, and demonstration without requiring a fully configured SAP ECC instance.
- Uses Mule flows and DataWeave scripts to simulate SAP ECC interactions.

The RAML specification defines the contract, while the Mule implementation realizes that contract at runtime.

## Key Responsibilities

The SAP ECC Customer System API is responsible for:

- Providing access to customer data in SAP ECC.
- Exposing system-aligned data structures and identifiers.
- Supporting CRUD operations and/or system-specific interactions.
- Enforcing system-specific constraints and validation rules.
- Returning consistent responses using the standard response envelope.

## Capabilities

This API supports the following capabilities:

- Retrieve customer records from SAP ECC.
- Create and update customer data where supported.
- Expose SAP ECC-specific identifiers and attributes.

## Dependencies

This API depends on the following RAML libraries:

- API Response Traits Library.
- API Security Traits Library.
- Common Response Types Library.

This API does not depend on other APIs.

## Usage

API consumers and Process APIs use this API to interact with customer data in SAP ECC.

Typical use cases include:

- Retrieve customer data from the system of record.
- Create or update customer records in the system.
- Access system-specific attributes required for downstream processing.

## Relationship to Other Assets

This API is part of the Customer API-led Reference Architecture and works in conjunction with:

- API Response Traits Library -- standardized response behaviors and status handling.
- API Security Traits Library -- reusable security traits such as client ID enforcement.
- Code Taxonomy Guide -- standardized response codes.
- Common Response Types Library -- standard response envelope.
- Customer Process API -- orchestrates and transforms data across multiple System APIs.

## Versioning

This API follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers implementing API-led connectivity patterns.
