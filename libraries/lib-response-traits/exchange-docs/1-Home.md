## Overview

The API Response Traits Library is a reusable RAML 1.0 library that defines standard response traits for in APIs within the Customer API-led reference architecture.

It centralizes method-level response definitions so APIs can consistently document common request, routing, negotiation, and runtime error conditions without duplicating response blocks.

## Mental Model

Think of these libraries as defining: who can call the API, what happens, and how responses are structured.

- **Who can call the API** → defined by the API Security Traits Library
- **What happens when a request is processed** → defined by the API Response Traits Library
- **How responses are structured** → defined by the Common Response Types Library

Together, they promote consistent access control, behavior, and response structure across APIs that adopt the shared model.

## How These Libraries Work Together

The following diagram visualizes how these libraries work together, showing how access control, response behavior, and response structure are defined across APIs.

![Library Relationships](resources/lib-response-traits-diagram-1f260164-0c83-49bd-9b2b-5071a7c0ebff.png)

The API Response Traits Library defines the response behavior illustrated in the diagram above, standardizing how APIs respond to both successful and error scenarios. Response structure is defined by the Common Response Types Library.

## Design Principles

- **Consistency**: Promote consistent error responses across APIs using a common response model.
- **Reusability**: Define traits once and reuse them across System, Process, and Experience APIs.
- **Separation of concerns**: Keep response behavior defined in reusable libraries rather than embedded in individual API specifications.
- **Alignment with platform standards**: Ensure compatibility with the Common Response Types Library and API Manager policies.

## Library Contents

This library defines reusable RAML traits for standard HTTP error responses, including:

- Request validation errors (400)
- Resource resolution errors (404)
- Method handling errors (405)
- Content negotiation errors (406, 415)
- Runtime errors (500)
- Not implemented responses (501)

Each trait is designed to work with the response model defined in the Common Response Types Library.

## Typical Usage

This library is designed for use across all API layers:

- **System APIs**: use these traits to document common HTTP error scenarios consistently.
- **Process APIs**: are strong candidates for these traits because they often orchestrate multiple systems and benefit from reusable error response definitions.
- **Experience APIs**: may use these traits when consistency across an internal portfolio is more important than a lighter or more consumer-specific response style.

## Relationship to Other Assets

This library defines standard response behavior and is used in conjunction with the following assets:

- [Common Response Types Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses): provides the standard response envelope used by all traits.
- [API Security Traits Library](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/lib-security-traits): defines access control requirements that complement response definitions.

Together, these libraries establish a consistent model where:

- Response behavior (status codes and scenarios) is defined in this library
- Response structure is defined in the Common Response Types Library
- Access control is defined in the API Security Traits Library

## Versioning

This asset follows semantic versioning.

Backward-compatible changes such as documentation updates or additional traits may be released as minor or patch versions. Breaking changes should be introduced in a new major version.

## Intended Audience

This asset is intended for:

- API designers
- Integration architects
- MuleSoft developers
- Platform engineers defining enterprise API standards
