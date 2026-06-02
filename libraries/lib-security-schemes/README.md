## Overview

The API Security Schemes Library is a reusable RAML 1.0 library that defines standardized security schemes for use across APIs within the Customer API-led Reference Architecture. It centralizes authentication and authorization requirements so APIs can consistently declare access control policies without duplicating security definitions.

This library defines access control as part of a broader model where:

- Access control is defined in this library.
- Response behavior is defined in the API Response Traits Library.
- Response structure is defined in the Common Response Types Library.

APIs may apply the reusable security schemes defined in this library to declare common authentication and authorization requirements consistently.

## Role in the Architecture

This library defines how access control is declared across the API-led connectivity model.

- System APIs use these schemes to secure access to underlying systems.
- Process APIs use these schemes to protect orchestration and transformation logic.
- Experience APIs use these schemes to secure consumer-facing endpoints.

Security enforcement is defined declaratively in API specifications and implemented at runtime through the API gateway.

## Contents

This folder contains the design-time artifacts used to define and publish the API Security Schemes Library to Anypoint Exchange.

- `raml/lib-security-schemes.raml` -- RAML 1.0 library defining reusable security schemes.
- `exchange-docs/` -- Anypoint Exchange documentation pages.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The API Security Schemes Library is responsible for:

- Defining reusable schemes for authentication and authorization requirements.
- Promoting a consistent approach to declaring access control across APIs.
- Promoting consistent application of security policies.
- Reducing duplication of security definitions in API specifications.
- Aligning API specifications with gateway-enforced security policies.

## Core Schemes

The library defines reusable schemes for applying security requirements, including:

- `client-id-enforcement` -- Enforces Client ID and Client Secret headers for API access.

Additional schemes may be introduced to support evolving security requirements.

## Dependencies

This library does not depend on other APIs. It is typically used with:

- API Response Traits Library -- defines standardized response behavior for security-related scenarios.
- Common Response Types Library -- provides the response envelope used for security-related responses.

## Usage

This library is intended to be imported and applied where teams want reusable, consistent security declarations in API specifications. Typical usage includes:

- Applying security schemes to API methods to enforce access control.
- Declaring authentication and authorization requirements in API specifications.
- Promoting consistent security declarations across System, Process, and Experience APIs.

## Relationship to Other Assets

This library focuses on access control and can be used on its own or alongside libraries that define response behavior and structure. It is part of the Customer API-led Reference Architecture and complements other reusable assets:

- API Response Traits Library -- defines reusable response behaviors for common HTTP scenarios.
- Common Response Types Library -- defines a shared response model that may be used for security-related responses.
- System, Process, and Experience APIs -- may use these schemes to declare authentication and authorization requirements.

## Versioning

This library follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
