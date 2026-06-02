## Overview

The Salesforce Brilliant Mule Customer System API can be consumed by applications requiring access to customer data in the Salesforce Brilliant Mule instance. To consume it:

1. Review the API Documentation

    First, consult this portal's ***API Summary*** section for details on the available resources, methods, and their expected behavior. You can use the API mocking service to simulate the behavior of the Salesforce Brilliant Mule Customer System API and even leverage it to test your client application without requiring access to an API instance.

2. Request Access

    Next, you must register a client application and request access to an API instance. Once submitted, a member of our support team will review your request. For more information, please refer to the article [Request Access](https://docs.mulesoft.com/anypoint-exchange/to-request-access) in the Anypoint Exchange documentation.

3. Once Approved, Access the API

    Once your request is approved, you will receive an email confirmation. You can access the API using your registered application’s `client_id` and `client_secret` in each request.

4. Please Provide Feedback

    Feedback is encouraged to improve the API and ensure it delivers value to consumers. Constructive feedback based on your experience using the Salesforce Brilliant Mule Customer System API is appreciated.

## Sample Requests

### Example: Retrieve Customer by ID with cURL

```bash
curl -X GET https://your-api-host/v1/customers/001bm00000J2nswAAB \
		 -H "client_id: {client_id}" \
		 -H "client_secret: {client_secret}"
```

### Example: Retrieve Customers with cURL

```bash
curl -X GET https://your-api-host/v1/customers \
		 -H "client_id: {client_id}" \
		 -H "client_secret: {client_secret}"
```

### Example: Upsert Customers with cURL

```bash
curl -X POST https://your-api-host/v1/customers \
		 -H "client_id: {client_id}" \
		 -H "client_secret: {client_secret}" \
     -H "Content-Type: application/json" \
     -d '[
						{
							"salesforceAccountId": "001bm00000J2nswAAB",
							"name": "Acme Corporation",
							"industry": "Manufacturing"
						},
						{
							"salesforceAccountId": "001bm00000J2ntwAAB",
							"name": "Beta Industries",
							"industry": "Technology"
						}
         ]'
```

## System-Aligned Customer Model

All requests and responses follow a system-aligned customer model derived from Salesforce customer account concepts and structures. Canonical transformation is performed by the Process API layer.

