## Overview

The SAP ECC Customer Events integration facilitates event-driven processing of customer master data changes from SAP ECC 6.0. It receives SAP IDocs via the MuleSoft SAP Connector, transforms the data into the canonical customer model, and transmits the resulting customer data to the Customer Process API within the Customer API-led reference architecture.

## Purpose

This integration provides an event-driven mechanism to propagate SAP ECC customer master data changes into the Customer API-led reference architecture. By processing SAP-specific IDoc structures and converting them into the canonical customer model, it supports downstream processing while preventing exposure of SAP-specific data structures to the Customer Process API.

## Capabilities

The SAP ECC Customer Events integration provides the following capabilities:

- Receive customer master data changes through SAP DEBMAS07 IDocs.
- Transform SAP-specific customer data into the canonical customer model.
- Deliver the transformed customer data to the Customer Process API.

## Data Model

Incoming customer master data adheres to the SAP DEBMAS07 IDoc structure. The integration process converts relevant SAP customer data into the canonical customer model specified by the Canonical Customer Types Library. This transformation guarantees that customer data provided to the Customer Process API aligns with the standardized enterprise representation utilized across the reference architecture.

## Integration Architecture

The SAP ECC Customer Events integration operates in the System layer of the Customer API-led reference architecture and complements the SAP ECC Customer System API by employing an event-driven integration pattern. This integration receives customer master data changes from SAP ECC and transmits canonical customer data to the Customer Process API.

The following diagram depicts the role of this integration within the reference architecture.

![SAP ECC Customer Events integration in Customer API-Led Reference Architecture](resources/sap-ecc-customer-events-diagram-3987af78-7ded-48f0-849e-a98aaffbd189.png)

## Testing

The integration incorporates an HTTP listener to facilitate local development and testing without necessitating SAP ECC to transmit an IDoc. Both the SAP IDoc listener and the HTTP test listener utilize an identical processing flow, which ensures consistent transformation and downstream delivery behavior.

Further information regarding implementation and testing can be found on the Implementation and Testing documentation page.

