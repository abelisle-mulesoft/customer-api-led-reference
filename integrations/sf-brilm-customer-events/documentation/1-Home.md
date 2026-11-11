## Overview

The Salesforce Brilliant Mule Customer Events integration facilitates event-driven processing of Salesforce Change Data Capture (CDC) events generated when account records change in the Brilliant Mule instance. It processes account creation and update events, retrieves the corresponding canonical customer data through the Salesforce Brilliant Mule Customer System API, and prepares a customer synchronization event for delivery to the Customer Process API within the Customer API-led reference architecture.

## Purpose

This integration provides an event-driven mechanism to propagate changes to Salesforce Brilliant Mule account data into the Customer API-led reference architecture. By consuming Salesforce Account change events and leveraging the Salesforce Brilliant Mule Customer System API to retrieve canonical customer data, the integration supports downstream synchronization without exposing Salesforce-specific data structures to the Customer Process API.

## Capabilities

The Salesforce Brilliant Mule Customer Events integration provides the following capabilities:

- Subscribe to Salesforce Brilliant Mule Account Change Data Capture (CDC) events.
- Process Account CREATE and UPDATE events while ignoring unsupported change types and changes originating from the configured integration user.
- Retrieve canonical customer data through the Salesforce Brilliant Mule Customer System API.
- Construct customer synchronization events for downstream processing by the Customer Process API.

## Data Model

Incoming account data adheres to the Account object structure in the Salesforce Brilliant Mule instance. The integration process converts relevant account data into the canonical customer model specified by the Canonical Customer Types Library. This transformation guarantees that customer data provided to the Customer Process API aligns with the standardized enterprise representation utilized across the reference architecture.

## Integration Architecture

The Salesforce Brilliant Mule Customer Events integration operates in the System layer of the Customer API-led reference architecture and complements the Salesforce Brilliant Mule Customer System API by employing an event-driven integration pattern. This integration receives account data changes from the Salesforce Brilliant Mule instance and transmits canonical customer data to the Customer Process API.

The following diagram depicts the role of this integration within the reference architecture.

![Salesforce Brilliant Mule Customer Events integration in Customer API-Led Reference Architecture](resources/sf-brilm-customer-events-diagram-0fb5121c-d6c1-4c5c-950b-7e4a8ac363d4.png)

## Testing

The integration incorporates an HTTP listener to facilitate local development and testing without necessitating the Salesforce Brilliant Mule instance to publish a CDC event. Both the Salesforce Replay Channel listener and the HTTP test listener utilize an identical processing flow, which ensures consistent transformation and downstream delivery behavior.

Further information regarding implementation and testing can be found on the **Environments and Testing** documentation page.

