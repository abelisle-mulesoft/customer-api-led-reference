## Overview

The Customer Process API can be consumed by applications requiring access to customer data. To consume it:

1. Review the API Documentation

    First, consult this portal's ***API Summary*** section for details on the available resources, methods, and their expected behavior. You can use the API mocking service to simulate the behavior of the Customer Process API and even leverage it to test your client application without requiring access to an API instance.

2. Request Access

    Next, you must register a client application and request access to an API instance. Once submitted, a member of our support team will review your request. For more information, please refer to the article [Request Access](https://docs.mulesoft.com/anypoint-exchange/to-request-access) in the Anypoint Exchange documentation.

3. Once Approved, Access the API

    Once your request is approved, you will receive an email confirmation. You can access the API using your registered application’s `client_id` and `client_secret` in each request.

4. Please Provide Feedback

    Feedback is encouraged to improve the API and ensure it delivers value to consumers. Constructive feedback based on your experience using the Customer Process API is appreciated.

## Sample Requests

### Example: Retrieve Customer by ID with cURL

```bash
curl -X GET https://your-api-host/v1/customers/CUST-10001 \
		 -H "client_id: {client_id}" \
		 -H "client_secret: {client_secret}"
```

### Example: Retrieve Customers with cURL

```bash
curl -X GET https://your-api-host/v1/customers \
		 -H "client_id: {client_id}" \
		 -H "client_secret: {client_secret}"
```

### Example: Process Customer Synchronization Event with cURL

```bash
curl -X POST https://your-api-host/v1/customer-sync-events \
		 -H "client_id: {client_id}" \
		 -H "client_secret: {client_secret}" \
     -H "Content-Type: application/json" \
     -d '{
            "eventType": "CUSTOMER_UPDATED",
            "sourceSystem": "SALESFORCE",
            "occurredAt": "2026-03-24T17:30:00Z",
            "customer": {
              "id": "CUST-10001",
              "externalIds": {
                "salesforceAccountId": "001bm00000J2nswAAB",
                "sapCustomerNumber": "0001234567"
              },
              "sourceSystems": ["SALESFORCE", "SAP_ECC"],
              "name": "Acme Corporation",
              "customerType": "BUSINESS",
              "status": "ACTIVE",
              "contacts": [
                {
                  "role": "PRIMARY",
                  "name": "Jane Doe",
                  "email": "jane.doe@acme.example",
                  "phone": "+1-206-555-0112"
                }
              ],
              "addresses": [
                {
                  "addressType": "BILLING",
                  "line1": "100 Main Street",
                  "city": "Seattle",
                  "state": "WA",
                  "postalCode": "98101",
                  "country": "USA"
                }
              ],
              "metadata": {
                "industry": "Manufacturing"
              },
              "createdDate": "2026-03-12T18:25:43Z",
              "lastModifiedDate": "2026-03-16T09:42:10Z"
            }
          }'

```

## Customer Canonical Model

All requests and responses use the enterprise canonical customer model, as defined in the Customer Canonical Data Types Library. The Process API aggregates and normalizes data from multiple system APIs into this canonical representation.

