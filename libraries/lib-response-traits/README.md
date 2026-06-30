## Overview

The API Response Traits Library is a reusable RAML 1.0 library within the Customer API-led Reference Architecture. It standardizes response traits for use across APIs, centralizing method-level response definitions. This approach enables consistent documentation of common requests, routing, negotiation, and runtime error conditions without duplicating response blocks. This library specifies response behavior as part of a broader model in which:

- Response structure is defined in the Common Response Types Library.
- Response behavior is defined in this library.
- Access control is defined in the API Security Schemes Library.

APIs can use the reusable response traits from this library to consistently document common HTTP error scenarios.

## Role in the Architecture

This library defines how APIs respond to standard HTTP scenarios across the API-led connectivity model.

- System APIs use these traits to standardize error handling when exposing system-aligned data.
- Process APIs use these traits to ensure consistent behavior across orchestration and transformation flows.
- Experience APIs may use these traits to provide predictable and uniform responses to consuming applications.

## Contents

This folder contains the assets that define and document the API Response Traits Library. Its structure reflects the opinionated conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `raml/lib-response-traits.raml` -- RAML 1.0 library defining reusable response traits.
- `exchange-docs/` -- Documentation pages published to Anypoint Exchange.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The API Response Traits Library is responsible for:

- Defining reusable traits for standard HTTP response scenarios.
- Standardizing how APIs define and document error handling behavior.
- Promoting consistent response behavior across APIs that choose to adopt these traits.
- Promoting reuse and reducing duplication in API specifications.
- Aligning response definitions with the Common Response Types Library.

## Core Traits

The library defines reusable traits for standard HTTP response scenarios, including:

- 400 Bad Request
- 404 Not Found
- 405 Method Not Allowed
- 406 Not Acceptable
- 415 Unsupported Media Type
- 500 Internal Server Error
- 501 Not Implemented

Each trait is designed to work with the response model defined in the Common Response Types Library.

## Related Assets

The API Response Traits Library is part of the Customer API-led Reference Architecture and works in conjunction with the following assets.

### RAML Libraries

- Common Response Types Library -- Provides the standard response envelope used by all traits.

### APIs

- Customer Process API -- Applies these traits to standardize documented response behavior.
- Oracle E-Business Suite Customer System API -- Applies these traits to standardize documented response behavior.
- Salesforce Brilliant Mule Customer System API -- Applies these traits to standardize documented response behavior.
- Salesforce Umbrella Customer System API -- Applies these traits to standardize documented response behavior.
- SAP ECC Customer System API -- Applies these traits to standardize documented response behavior.

## Usage

This library is intended to be imported and applied where teams want reusable, consistent documentation for common HTTP error scenarios. Typical usage includes:

- Applying standard response traits to API methods.
- Ensuring consistent documentation of HTTP response scenarios.
- Reusing predefined response definitions instead of redefining responses inline.
- Aligning API specifications with platform-wide response standards.

## Versioning

This library follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
