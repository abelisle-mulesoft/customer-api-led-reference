## Overview

The API Security Traits Library is a reusable RAML 1.0 library that defines standardized security traits for use across APIs within the Customer API-led Reference Architecture.

It centralizes authentication and authorization requirements so APIs can consistently declare access control policies without duplicating security definitions.

This library defines access control as part of a broader model where:

- Access control is defined in this library.
- Response behavior is defined in the API Response Traits Library.
- Response structure is defined in the Common Response Types Library.

All APIs should apply standardized security traits defined in this library.

## Role in the Architecture

This library defines how access control is declared across the API-led connectivity model.

- System APIs use these traits to secure access to underlying systems.
- Process APIs use these traits to protect orchestration and transformation logic.
- Experience APIs use these traits to secure consumer-facing endpoints.

Security enforcement is defined declaratively in API specifications and implemented at runtime through the API gateway.

## Contents

This folder contains the design-time artifacts used to define and publish the API Security Traits Library to Anypoint Exchange.

- `raml/lib-security-traits.raml` -- RAML 1.0 library defining reusable security traits.
- `exchange-docs/` -- Anypoint Exchange documentation pages.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The API Security Traits Library is responsible for:

- Defining reusable traits for authentication and authorization requirements.
- Standardizing how access control is declared across APIs.
- Promoting consistent application of security policies.
- Reducing duplication of security definitions in API specifications.
- Aligning API specifications with gateway-enforced security policies.

## Core Traits

The library defines reusable traits for applying security requirements, including:

- `client-id-required` -- Enforces Client ID and Client Secret headers for API access.

Additional traits may be introduced to support evolving security requirements.

## Dependencies

This library does not depend on other APIs.

It is typically used with:

- API Response Traits Library -- defines standardized response behavior for security-related scenarios.
- Common Response Types Library -- provides the response envelope used for security-related responses.

## Usage

This library is intended to be imported and applied across all APIs.

Typical usage includes:

- Applying security traits to API methods to enforce access control.
- Declaring authentication and authorization requirements in API specifications.
- Ensuring consistent security behavior across System, Process, and Experience APIs.

## Relationship to Other Assets

This library is part of the Customer API-led Reference Architecture and works in conjunction with:

- API Response Traits Library -- defines response behavior for both successful and error scenarios.
- Common Response Types Library -- defines the response structure used for security-related responses.
- System, Process, and Experience APIs -- apply these traits to enforce access control.

## Versioning

This library follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
