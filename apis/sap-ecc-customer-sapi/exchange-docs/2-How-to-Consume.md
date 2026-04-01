## Overview
The SAP ECC Customer System API can be consumed by applications requiring access to customer data in SAP ECC. To consume it:

1. Review the API Documentation

    First, consult this portal's ***API Summary*** section for details on the available resources, methods, and their expected behavior. You can use the API mocking service to simulate the behavior of the SAP ECC Customer System API and even leverage it to test your client application without requiring access to an API instance.

2. Request Access

    Next, you must register a client application and request access to an API instance. Once submitted, a member of our support team will review your request. For more information, please refer to the article [Request Access](https://docs.mulesoft.com/anypoint-exchange/to-request-access) in the Anypoint Exchange documentation.

3. Once Approved, Access the API

    Once your request is approved, you will receive an email confirmation. You can access the API using your registered application’s `client_id` and `client_secret` in each request.

4. Please Provide Feedback

    Feedback is encouraged to improve the API and ensure it delivers value to consumers. Constructive feedback based on your experience using the SAP ECC Customer System API is appreciated.

## Sample Requests

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
     -d '{
           "customers": [
             {
               "sapCustomerNumber": "0001001001",
               "accountGroup": "Z001",
               "companyCode": "1000",
               "salesOrganization": "1000",
               "distributionChannel": "10",
               "division": "00",
               "nameLine1": "Acme Corporation",
               "nameLine2": "Northwest Division",
               "searchTerm": "ACME",
               "streetAddress": "100 Main Street",
               "city": "Seattle",
               "region": "WA",
               "postalCode": "98101",
               "countryCode": "US",
               "phoneNumber": "+1-206-555-0100",
               "emailAddress": "ops@acme.example",
               "taxNumber1": "TAX-123456",
               "deletionFlag": false,
               "centralPostingBlock": false,
               "createdDate": "2026-03-12",
               "createdBy": "RFC_USER",
               "lastChangedDate": "2026-03-15"
             }
           ]
         }'
```

## System-Aligned Customer Model

All requests and responses follow a system-aligned customer model derived from SAP ECC customer concepts and structures. Canonical transformation is performed by the Process API layer.

