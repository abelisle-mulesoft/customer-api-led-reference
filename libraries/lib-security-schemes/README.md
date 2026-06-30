## Overview

The API Security Schemes Library is a reusable RAML 1.0 library within the Customer API-led Reference Architecture. It standardizes API security schemes and centralizes authentication and authorization requirements, enabling consistent access control policies without duplicating definitions. This library defines access control as part of a broader model where:

- Access control is defined in this library.
- Response behavior is defined in the API Response Traits Library.
- Response structure is defined in the Common Response Types Library.

APIs can use the security schemes from this library to consistently declare authentication and authorization requirements.

## Role in the Architecture

This library defines how access control is declared across the API-led connectivity model.

- System APIs use these schemes to secure access to underlying systems.
- Process APIs use these schemes to secure access to orchestration and transformation capabilities.
- Experience APIs use these schemes to secure consumer-facing endpoints.

Security enforcement is defined declaratively in API specifications and implemented at runtime through the API gateway.

## Contents

This folder contains the assets that define and document the API Security Schemes Library. Its structure reflects the opinionated conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `raml/lib-security-schemes.raml` -- RAML 1.0 library defining reusable security schemes.
- `exchange-docs/` -- Documentation pages published to Anypoint Exchange.
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

The library defines reusable security schemes, including:

- `client-id-enforcement` -- Enforces Client ID and Client Secret headers for API access.

Additional schemes may be introduced to support evolving security requirements.

## Related Assets

The API Security Schemes Library is part of the Customer API-led Reference Architecture and works in conjunction with the following assets.

### RAML Libraries

- API Response Traits Library -- Often used alongside this library to define responses for authentication and authorization failures.

### APIs

- Customer Process API -- Applies these schemes to standardize documented authentication and authorization requirements.
- Oracle E-Business Suite Customer System API -- Applies these schemes to standardize documented authentication and authorization requirements.
- Salesforce Brilliant Mule Customer System API -- Applies these schemes to standardize documented authentication and authorization requirements.
- Salesforce Umbrella Customer System API -- Applies these schemes to standardize documented authentication and authorization requirements.
- SAP ECC Customer System API -- Applies these schemes to standardize documented authentication and authorization requirements.

## Usage

This library is intended to be imported and applied where teams want reusable, consistent security declarations in API specifications. Typical usage includes:

- Applying security schemes to API methods to enforce access control.
- Declaring authentication and authorization requirements in API specifications.
- Promoting consistent security declarations across System, Process, and Experience APIs.

## Versioning

This library follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
