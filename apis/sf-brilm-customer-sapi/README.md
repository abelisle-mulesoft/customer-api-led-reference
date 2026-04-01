## Overview

The Salesforce Brilliant Mule Customer System API is part of the Customer API-led Reference Architecture and implements the System API layer for the Customer domain.

This API provides system-aligned access to customer data in the Salesforce Brilliant Mule instance. It exposes resources and data structures that reflect the underlying system without applying canonical transformations.

## Role in the Architecture

This API represents the System API layer in an API-led connectivity architecture.

- System APIs provide system-aligned access to customer data.
- The Process API orchestrates and transforms this data into a canonical model.
- Experience APIs consume Process APIs to deliver channel-specific experiences.

This separation ensures loose coupling and enables independent evolution of systems and consumers.

## System Context

This API provides access to customer data in Salesforce Brilliant Mule using system-specific structures, identifiers, and constraints.

It reflects the capabilities and limitations of the underlying system, including Salesforce data models (such as Account and related objects) and integration patterns.

In addition to synchronous request-response access, the implementation may also support event-driven integration using Salesforce Change Data Capture (CDC). This event-driven behavior remains system-aligned and is treated as part of the underlying system interaction model rather than as a canonical or separately modeled API contract.

## Contents

This folder contains the design-time artifacts used to define and publish the Salesforce Brilliant Mule Customer System API to Anypoint Exchange.

- `raml/sf-brilm-customer-sapi.raml` -- RAML specification defining the API contract.
- `exchange-docs/` -- Anypoint Exchange documentation pages (as per best practices).
  - `1-Home.md` -- Introduces the API and its role in the architecture (overrides the default `home` page).
	- `2-How-to-Consume.md` -- Describes how to request access and successfully invoke the API.
	- `3-Security.md` -- Describes security requirements and policies applied to the API (e.g., client ID enforcement).
	- `4-Environments-and-Testing.md` -- Lists available environments, endpoints, and prerequisites for testing the API.
	- `5-Getting-Help.md` -- Describes how to get support and additional information.  ￼

## Key Responsibilities

The Salesforce Brilliant Mule Customer System API is responsible for:

- Providing access to customer data in Salesforce Brilliant Mule.
- Exposing system-aligned data structures and identifiers.
- Supporting synchronous CRUD operations and system-specific interactions.
- Supporting event-driven interaction patterns where applicable, such as Salesforce Change Data Capture (CDC).
- Enforcing system-specific constraints and validation rules.
- Returning consistent responses using the standard response envelope.


## Capabilities

This API supports the following capabilities:

- Retrieve customer records from Salesforce Brilliant Mule.
- Create and update customer data where supported.
- Expose Salesforce-specific identifiers and attributes (e.g., Account IDs and related object references).
- Support event-driven customer change processing through Salesforce Change Data Capture (CDC) where applicable.

## Dependencies

This API depends on the following RAML libraries:

- API Response Traits Library.
- API Security Traits Library.
- Common Response Types Library.
- Salesforce Customer Data Types Library.

This API does not depend on other APIs.

## Usage

API consumers and Process APIs use this API to interact with customer data in Salesforce Brilliant Mule.

Typical use cases include:

- Retrieve customer data from the system of record.
- Create or update customer records in the system.
- Access system-specific attributes required for downstream processing.
- Consume customer change events from Salesforce Brilliant Mule where event-driven integration is required.

## Relationship to Other Assets

This API is part of the Customer API-led Reference Architecture and works in conjunction with:

- API Response Traits Library -- standardized response behaviors and status handling.
- API Security Traits Library -- reusable security traits such as client ID enforcement.
- Code Taxonomy Guide -- standardized response codes.
- Common Response Types Library -- standard response envelope.
- Customer Process API -- orchestrates and transforms data across multiple System APIs.
- Salesforce Customer Data Types Library -- system-aligned customer data model.

## Versioning

This API follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers implementing API-led connectivity patterns.
