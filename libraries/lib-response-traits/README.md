## Overview

The API Response Traits Library is a reusable RAML 1.0 library that defines standard response traits for use across APIs within the Customer API-led Reference Architecture.

It centralizes method-level response definitions so APIs can consistently document common request, routing, negotiation, and runtime error conditions without duplicating response blocks.

This library defines response behavior as part of a broader model where:

- Response structure is defined in the Common Response Types Library.
- Response behavior is defined in this library.
- Access control is defined in the API Security Schemes Library.

APIs may apply the reusable response traits defined in this library to document common HTTP error scenarios consistently.

## Role in the Architecture

This library defines how APIs respond to standard HTTP scenarios across the API-led connectivity model.

- System APIs use these traits to standardize error handling when exposing system-aligned data.
- Process APIs use these traits to ensure consistent behavior across orchestration and transformation flows.
- Experience APIs use these traits to provide predictable and uniform responses to consuming applications.

## Contents

This folder contains the design-time artifacts used to define and publish the API Response Traits Library to Anypoint Exchange.

- `raml/lib-response-traits.raml` -- RAML 1.0 library defining reusable response traits.
- `exchange-docs/` -- Anypoint Exchange documentation pages.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The API Response Traits Library is responsible for:

- Defining reusable traits for standard HTTP response scenarios.
- Standardizing how APIs document and implement error handling.
- Promoting consistent response behavior across APIs that choose to adopt these traits.
- Promoting reuse and reducing duplication in API specifications.
- Aligning response definitions with the Common Response Types Library.

## Core Traits

The library defines reusable traits for standard HTTP response scenarios, including:

- Request validation errors (400)
- Resource resolution errors (404)
- Method handling errors (405)
- Content negotiation errors (406, 415)
- Runtime errors (500)
- Not implemented responses (501)

Each trait is designed to work with the response model defined in the Common Response Types Library.

## Dependencies

This library does not depend on other APIs.

It is typically used with:

- Common Response Types Library -- provides the standard response envelope used by all traits.
- API Security Schemes Library -- complements response behavior with access control requirements.

## Usage

This library is intended to be imported and applied where teams want reusable, consistent documentation for common HTTP error scenarios.

Typical usage includes:

- Applying standard response traits to API methods.
- Ensuring consistent documentation of HTTP response scenarios.
- Reusing predefined response definitions instead of redefining responses inline.
- Aligning API behavior with platform-wide response standards.

## Relationship to Other Assets

This library focuses on response behavior and can be used on its own or alongside libraries that define response structure and access control. It is part of the Customer API-led Reference Architecture and complements other reusable assets:

- Common Response Types Library -- defines a shared response model that may be used by these traits.
- API Security Schemes Library -- defines access control requirements that may accompany response behavior.
- System, Process, and Experience APIs -- may use these traits to document common HTTP response scenarios consistently.

## Versioning

This library follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
