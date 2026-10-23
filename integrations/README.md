# Integrations

This folder contains the integration components that complement the Customer API-led Reference Architecture, supporting event-driven, scheduled, batch, and file-based integration patterns.

## Event-Driven Integrations

Event-driven integrations process changes originating from external systems and deliver the resulting data to the appropriate APIs.

- `sap-ecc-customer-events` -- Receives SAP ECC customer master data changes through DEBMAS07 IDocs, transforms them into the canonical customer model, and delivers the resulting data to the Customer Process API.

## Folder Structure

Integration projects adhere to standardized folder structures to ensure consistency throughout the reference architecture. Each integration project contains the following components:

- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `implementation/` -- Mule application implementation artifacts.
- `README.md` -- Provides an overview and usage guidance.

> [!NOTE]
> Integration projects may also include a `design/` folder containing formal specifications, such as AsyncAPI, and associated Anypoint Exchange metadata when applicable.
