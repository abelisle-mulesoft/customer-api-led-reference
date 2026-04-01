## Overview

The Customer Process API is part of the Customer API-led Reference Architecture and implements the Process API layer for the Customer domain.

This API orchestrates, aggregates, and transforms customer data from underlying systems such as Salesforce, Oracle E-Business Suite, and SAP ECC, exposing a canonical customer representation to upstream consumers.

The API uses the enterprise canonical customer model and serves as the primary entry point for consumer applications requiring unified customer data.

## Role in the Architecture

This API represents the Process API layer in an API-led connectivity architecture.

- System APIs provide system-aligned access to customer data.
- The Process API orchestrates and transforms this data into a canonical model.
- Experience APIs consume the canonical model exposed by this API to deliver channel-specific experiences.

This separation ensures loose coupling, reusability, and consistent data representation across systems.

## Contents

This folder contains the design-time artifacts used to define and publish the Customer Process API to Anypoint Exchange.

- `raml/customer-papi.raml` -- RAML specification defining the API contract.
- `exchange-docs/` -- Anypoint Exchange documentation pages (as per best practices).
  - `1-Home.md` -- Introduces the API and its role in the architecture (overrides the default `home` page).
	- `2-How-to-Consume.md` -- Describes how to request access and successfully invoke the API.
	- `3-Security.md` -- Describes security requirements and policies applied to the API (e.g., client ID enforcement).
	- `4-Environments-and-Testing.md` -- Lists available environments, endpoints, and prerequisites for testing the API.
	- `5-Getting-Help.md` -- Describes how to get support and additional information.  ￼

## Key Responsibilities

The Customer Process API is responsible for:

- Orchestrating calls to multiple System APIs.
- Transforming system-aligned data into the canonical customer model.
- Aggregating customer data across systems.
- Applying business logic and validation.
- Returning consistent responses using the standard response envelope.

## Dependencies

This API depends on the following RAML libraries:

- API Response Traits Library.
- API Security Traits Library.
- Common Response Types Library.
- Customer Canonical Data Types Library.

This API depends on the following APIs:

- Oracle E-Business Suite Customer System API.
- Salesforce Brilliant Mule Customer System API.
- Salesforce Umbrella Customer System API.
- SAP ECC Customer System API.

## Usage

API consumers interact with this API to retrieve or manage customer data using a canonical representation.

Typical use cases include:

- Retrieve a unified customer view across systems.
- Create or update customer records through orchestrated workflows.
- Apply cross-system business rules and validation.

## Relationship to Other Assets

This API is part of the Customer API-led Reference Architecture and works in conjunction with:

- API Response Traits Library -- standardized response behaviors and status handling.
- API Security Traits Library -- reusable security traits such as client ID enforcement.
- Code Taxonomy Guide -- standardized response codes.
- Common Response Types Library -- standard response envelope.
- Customer Canonical Data Types Library -- canonical customer model.

## Versioning

This API follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers implementing API-led connectivity patterns.
