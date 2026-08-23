# Complete API Testing Interview Questions & Notes

**Comprehensive Study Guide**  
**Compiled from all conversation content – Nothing skipped**

---

## Table of Contents

1. Basic API Concepts
2. REST vs SOAP
3. HTTP Methods
4. Status Codes
5. Authentication vs Authorization
6. Caching
7. API Versioning
8. Query Parameters vs Path Parameters
9. Idempotency & Safe Methods
10. REST Assured Notes
11. Postman Notes & Features
12. Advanced Postman Scripting Examples
13. RESTful Booker API Practice Guide
14. AWS for QA / Automation Testing
15. Additional Important Interview Questions

---

## 1. Basic API Concepts

### What is an API?
An **Application Programming Interface (API)** is a set of defined rules and protocols that enable different software applications to communicate with each other. It specifies how requests should be made and responses formatted, typically using HTTP for web APIs.

**Real-time Example:**  
A weather app does not store weather data itself. It calls a weather service API (e.g., OpenWeatherMap), sends location data, and receives current weather information.

### Why is API Testing Important?
- APIs are the backbone of modern applications (especially microservices).
- Issues at the API level can break multiple downstream systems.
- API tests execute much faster than UI tests.
- Enables early detection of backend logic issues.
- Validates functionality, reliability, performance, and security.

### Types of APIs
- **Public APIs** – Available to any developer (e.g., Google Maps API)
- **Private APIs** – Internal to an organization
- **Partner APIs** – Shared with specific business partners
- **Composite APIs** – Combine multiple APIs into one call

### What is REST API?
**REST (Representational State Transfer)** is an architectural style for designing networked applications that use HTTP methods to perform operations on resources.

**Real-time Example (Food Delivery App):**
- `GET /restaurants` – Fetch available restaurants
- `POST /orders` – Place a new order
- `GET /orders/{id}` – Check order status
- `DELETE /orders/{id}` – Cancel an order

### REST Constraints (6 Constraints)
1. **Client-Server** – Separation of concerns between UI and data storage
2. **Stateless** – Each request contains all information needed
3. **Cacheable** – Responses must indicate if they can be cached
4. **Layered System** – Components cannot see beyond their immediate layer
5. **Uniform Interface** – Standardized way to interact with resources
6. **Code-on-Demand (optional)** – Servers can send executable code to clients

### What is Statelessness?
Each request from client to server must contain all the information needed to understand and process the request. The server does not store any client context between requests. Authentication tokens must be sent with every request.

### What is CRUD?
**CRUD** stands for Create, Read, Update, Delete.

| Operation | HTTP Method | Example |
|-----------|-------------|---------|
| Create    | POST        | `POST /articles` |
| Read      | GET         | `GET /articles/{id}` |
| Update    | PUT / PATCH | `PUT /articles/{id}` |
| Delete    | DELETE      | `DELETE /articles/{id}` |

---

## 2. REST vs SOAP

| Aspect          | REST                              | SOAP                              |
|-----------------|-----------------------------------|-----------------------------------|
| Type            | Architectural Style               | Protocol                          |
| Format          | JSON, XML, others                 | XML only                          |
| Transport       | HTTP                              | HTTP, SMTP, others                |
| Caching         | Native HTTP caching               | Not cacheable                     |
| Performance     | Lightweight                       | Higher overhead                   |
| Standards       | Relies on HTTP methods            | Strict contracts (WSDL)           |
| Use Cases       | Web/mobile, microservices         | Enterprise systems needing ACID   |

SOAP still makes sense for systems requiring formal contracts (WSDL) or message-level security (WS-Security).

---

## 3. HTTP Methods

| Method  | Purpose                        | Example              | Idempotent | Safe |
|---------|--------------------------------|----------------------|------------|------|
| GET     | Retrieve a resource            | `GET /users/123`     | Yes        | Yes  |
| POST    | Create a new resource          | `POST /users`        | No         | No   |
| PUT     | Replace a resource entirely    | `PUT /users/123`     | Yes        | No   |
| PATCH   | Partially update a resource    | `PATCH /users/123`   | Depends    | No   |
| DELETE  | Remove a resource              | `DELETE /users/123`  | Yes        | No   |
| OPTIONS | Returns supported methods      | Used for CORS        | Yes        | Yes  |
| HEAD    | Same as GET but no body        | Used for metadata    | Yes        | Yes  |

### Difference between PUT and POST
- **POST**: Server decides the URI of the new resource.
- **PUT**: Client specifies the exact URI. If the resource exists, it is replaced; if not, it may be created.

### Difference between PUT and PATCH
- **PUT** replaces the entire resource.
- **PATCH** applies partial modifications.

**Example PUT:**
```json
{
  "name": "Khalid",
  "email": "khalid@example.com",
  "role": "admin"
}
```

**Example PATCH:**
```json
{
  "role": "admin"
}
```

### Idempotency
An operation is **idempotent** if performing it multiple times produces the same result as performing it once.

- GET, PUT, DELETE → Idempotent
- POST → Not idempotent
- PATCH → Depends on the operation

### Safe Methods
Safe methods do not modify resources (GET, HEAD, OPTIONS). All safe methods are idempotent, but not all idempotent methods are safe (DELETE is idempotent but not safe).

---

## 4. Status Codes

### Essential Status Codes

| Code | Name                    | When to Use                              |
|------|-------------------------|------------------------------------------|
| 200  | OK                      | Successful GET, PUT, PATCH               |
| 201  | Created                 | Successful POST (include Location header)|
| 204  | No Content              | Successful DELETE                        |
| 400  | Bad Request             | Malformed syntax                         |
| 401  | Unauthorized            | Authentication required or failed        |
| 403  | Forbidden               | Authenticated but no permission          |
| 404  | Not Found               | Resource does not exist                  |
| 409  | Conflict                | Request conflicts with current state     |
| 422  | Unprocessable Entity    | Valid syntax but semantic validation fails|
| 429  | Too Many Requests       | Rate limit exceeded                      |
| 500  | Internal Server Error   | Server-side failure                      |

### 401 vs 403
- **401 Unauthorized** → Unauthenticated (server does not know who you are)
- **403 Forbidden** → Authenticated but lacks permission

### 400 vs 422
- **400 Bad Request** → Cannot parse the request (invalid JSON structure)
- **422 Unprocessable Entity** → JSON is valid but data fails validation (e.g., invalid email format)

### 201 vs 204
- **201 Created** → Successful creation of a resource (often includes Location header)
- **204 No Content** → Successful request with no response body

---

## 5. Authentication vs Authorization

| Aspect              | Authentication (AuthN)                  | Authorization (AuthZ)                     |
|---------------------|-----------------------------------------|-------------------------------------------|
| Purpose             | Verify identity                         | Verify permissions                        |
| Question Answered   | “Who are you?”                          | “What are you allowed to do?”             |
| When it happens     | First step                              | After successful authentication           |
| Failure Code        | 401 Unauthorized                        | 403 Forbidden                             |
| Common Methods      | Username/Password, API Key, JWT, OAuth, Basic Auth, Bearer Token | RBAC, ABAC, Scopes, Claims in JWT |

**Golden Rule:**  
Authentication proves **who** you are. Authorization proves **what** you can do.

### Common Authentication Methods
- Basic Auth
- API Keys
- Bearer Token / JWT
- OAuth 2.0 / OpenID Connect

### Common Authorization Methods
- Role-Based Access Control (RBAC)
- Attribute-Based Access Control (ABAC)
- OAuth Scopes
- Claims inside JWT

---

## 6. What is Cache?

Cache is a temporary storage mechanism that retains copies of frequently accessed data or responses to serve future requests more efficiently.

### Key HTTP Caching Headers
- **Cache-Control** – Directives such as `max-age=3600`, `no-cache`, `no-store`, `public`, `private`
- **Expires** – Absolute expiration time
- **ETag** – Unique identifier for resource version (used with `If-None-Match`)
- **Last-Modified** – Used with `If-Modified-Since`

### Benefits
- Improves response time
- Reduces server load and database queries
- Lowers bandwidth consumption
- Enhances scalability

### Types of Caching
- Client-side cache
- Server-side cache (Redis, Memcached)
- CDN / Proxy cache
- API Gateway cache

**Important Note:** Caching is most effective for safe and idempotent methods (primarily GET).

---

## 7. API Versioning

API versioning manages changes to an API over time while ensuring backward compatibility.

### Common Strategies

**1. URI Versioning (Most Common)**
```
GET /v1/users
GET /v2/users
```
- Explicit and easy to debug
- Recommended for public APIs

**2. Header Versioning**
```
GET /users
Accept-Version: v2
```
- Cleaner URLs
- Harder to test in browsers

**3. Query Parameter Versioning**
```
GET /users?version=2
```
- Easy to implement
- Can clutter URLs

### Best Practices
- Prefer URI versioning for public APIs
- Document deprecation clearly
- Maintain backward compatibility for at least one major version
- Use semantic versioning

---

## 8. Query Parameters vs Path Parameters

| Type              | Purpose                              | Example                              |
|-------------------|--------------------------------------|--------------------------------------|
| Path Parameter    | Identify a specific resource         | `/users/123`                         |
| Query Parameter   | Filter, sort, or paginate collections| `/users?status=active&sort=name&limit=10` |

**Path parameters** are mandatory for resource identification.  
**Query parameters** are optional and used for filtering/searching.

---

## 9. Content Negotiation & OPTIONS Method

**Content Negotiation** allows clients to request different representations of a resource using the `Accept` header.

```
Accept: application/json  → Server returns JSON
Accept: application/xml   → Server returns XML
```

**OPTIONS Method** returns the HTTP methods supported for a specific URL. Browsers use it for CORS preflight requests.

---

## 10. REST Assured Notes

### What is REST Assured?
REST Assured is a Java library designed for simplifying and automating the testing of RESTful APIs. It provides a domain-specific language (DSL) for writing readable tests.

### Maven Dependency
```xml
<dependency>
    <groupId>io.rest-assured</groupId>
    <artifactId>rest-assured</artifactId>
    <version>5.4.0</version>
    <scope>test</scope>
</dependency>
```

### Basic GET Request
```java
import static io.restassured.RestAssured.*;
import io.restassured.response.Response;

Response response = get("https://api.example.com/resource");
```

### POST Request Example
```java
given()
    .contentType("application/json")
    .body(requestBody)
.when()
    .post("https://api.example.com/resource")
.then()
    .statusCode(201);
```

### Validation Example
```java
response.then()
    .statusCode(200)
    .contentType("application/json")
    .body("name", equalTo("John"));
```

### JSONPath Extraction
```java
String value = response.then()
    .extract()
    .jsonPath()
    .getString("key.subkey");
```

### Authentication
```java
given()
    .auth().basic("username", "password")
.when()
    .get("https://api.example.com/resource")
.then()
    .statusCode(200);
```

### Request & Response Specifications
Request Specifications allow pre-defining headers, authentication, base URI, etc. for reuse.  
Response Specifications allow pre-defining expected status codes, content types, and assertions.

### Serialization & Deserialization
- **Serialization**: Converting Java objects to JSON/XML for request body
- **Deserialization**: Converting response JSON/XML back into Java objects (POJOs)

---

## 11. Postman Notes & Features

### Key Benefits of Postman
- Simplified API testing process
- Robust automation capabilities
- Excellent team collaboration
- Comprehensive test reporting
- Easy CI/CD integration (via Newman)

### Environment Variables
```json
{
  "base_url": "https://api.example.com",
  "auth_token": "{{your_auth_token}}",
  "timeout": 5000
}
```

### Basic Test Scripts
```javascript
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response time is acceptable", function () {
    pm.expect(pm.response.responseTime).to.be.below(200);
});

pm.test("Content-Type header is present", function () {
    pm.response.to.have.header("Content-Type");
});
```

### Schema Validation
```javascript
const schema = {
    "type": "object",
    "properties": {
        "id": { "type": "integer" },
        "name": { "type": "string" },
        "email": { "type": "string" }
    },
    "required": ["id", "name", "email"]
};

pm.test("Schema validation", function () {
    pm.response.to.have.jsonSchema(schema);
});
```

### Newman CLI
```bash
newman run mycollection.json -e environment.json
newman run mycollection.json -r htmlextra
```

### CI/CD Integration Examples

**Jenkins:**
```groovy
pipeline {
    agent any
    stages {
        stage('API Tests') {
            steps {
                sh 'newman run collection.json -e env.json'
            }
        }
    }
}
```

**GitHub Actions:**
```yaml
name: API Tests
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Install Newman
        run: npm install -g newman
      - name: Run API Tests
        run: newman run collection.json -e env.json
```

---

## 12. Advanced Postman Scripting Examples

### 1. Pre-Request Script – Dynamic Data Generation
```javascript
const uuid = require('uuid');
pm.environment.set("user_id", uuid.v4());

pm.environment.set("timestamp", Date.now());

const moment = require('moment');
pm.environment.set("future_date", moment().add(7, 'days').format('YYYY-MM-DD'));
```

### 2. Custom Utility Library
```javascript
const utils = {
    validateStatusCode: function(expected) {
        pm.test(`Status code is ${expected}`, () => {
            pm.response.to.have.status(expected);
        });
    },
    validateEmail: function(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        pm.test("Email format is valid", () => {
            pm.expect(regex.test(email)).to.be.true;
        });
    },
    generateRandomString: function(length) {
        return Array(length)
            .fill('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz')
            .map(x => x[Math.floor(Math.random() * x.length)])
            .join('');
    }
};

utils.validateStatusCode(200);
```

### 3. OAuth / JWT Token Validation
```javascript
pm.test("OAuth token is valid", () => {
    const token = pm.response.json().access_token;
    pm.expect(token).to.match(/^[\w-]*\.[\w-]*\.[\w-]*$/);

    const [, payload] = token.split('.');
    const decoded = JSON.parse(atob(payload));

    pm.expect(decoded.exp * 1000).to.be.above(Date.now());
    pm.expect(decoded.aud).to.equal(pm.environment.get("client_id"));
});
```

### 4. Security Headers Validation
```javascript
pm.test("Security headers are present", () => {
    const requiredHeaders = [
        "Strict-Transport-Security",
        "X-Content-Type-Options",
        "X-Frame-Options",
        "X-XSS-Protection",
        "Content-Security-Policy"
    ];
    requiredHeaders.forEach(header => {
        pm.response.to.have.header(header);
    });
});
```

### 5. Performance Metrics Collection
```javascript
pm.test("Collect performance metrics", () => {
    const metrics = {
        timestamp: new Date().toISOString(),
        endpoint: pm.request.url.toString(),
        method: pm.request.method,
        responseTime: pm.response.responseTime,
        status: pm.response.status,
        size: pm.response.size().body
    };

    let allMetrics = JSON.parse(pm.environment.get("performanceMetrics") || "[]");
    allMetrics.push(metrics);
    if (allMetrics.length > 100) allMetrics.shift();

    pm.environment.set("performanceMetrics", JSON.stringify(allMetrics));
});
```

### 6. Data-Driven Testing
```javascript
const testData = JSON.parse(pm.environment.get("testData"));

testData.userScenarios.forEach(scenario => {
    pm.test(scenario.description, () => {
        pm.sendRequest({
            url: pm.environment.get("base_url") + "/users",
            method: "POST",
            header: { "Content-Type": "application/json" },
            body: {
                mode: "raw",
                raw: JSON.stringify(scenario.input)
            }
        }, (err, res) => {
            pm.expect(res.code).to.equal(scenario.expectedStatus);
            pm.expect(res.json()).to.deep.include(scenario.expectedResponse);
        });
    });
});
```

### 7. Complex Workflow Automation
```javascript
const workflow = async () => {
    // Step 1: Create order
    const orderRes = await pm.sendRequest({
        url: pm.environment.get("base_url") + "/orders",
        method: "POST",
        body: {
            mode: "raw",
            raw: JSON.stringify({ items: [{ id: "123", quantity: 1 }] })
        }
    });
    const orderId = orderRes.json().id;

    // Step 2: Process payment
    await pm.sendRequest({
        url: pm.environment.get("base_url") + "/payments",
        method: "POST",
        body: {
            mode: "raw",
            raw: JSON.stringify({
                orderId: orderId,
                amount: orderRes.json().total
            })
        }
    });

    // Step 3: Verify status
    const statusRes = await pm.sendRequest({
        url: `${pm.environment.get("base_url")}/orders/${orderId}`,
        method: "GET"
    });

    pm.test("Complete order workflow succeeded", () => {
        pm.expect(statusRes.json().status).to.equal("PAID");
    });
};

workflow();
```

### 8. Encryption Example
```javascript
const CryptoJS = require('crypto-js');
const encrypted = CryptoJS.AES.encrypt(
    pm.environment.get("card_number"),
    pm.environment.get("encryption_key")
).toString();

pm.environment.set("encrypted_card", encrypted);
```

---

## 13. RESTful Booker API – Practice Guide

**Base URL:** `https://restful-booker.herokuapp.com`

### 1. Authentication
**Endpoint:** `POST /auth`

**Body:**
```json
{
  "username": "admin",
  "password": "password123"
}
```

**Response:**
```json
{
  "token": "abc123"
}
```

### 2. Get All Booking IDs
`GET /booking`  
Optional filters: `firstname`, `lastname`, `checkin`, `checkout`

### 3. Get Booking by ID
`GET /booking/{id}`  
Header: `Accept: application/json`

### 4. Create Booking
`POST /booking`

**Body Example:**
```json
{
  "firstname": "Jim",
  "lastname": "Brown",
  "totalprice": 111,
  "depositpaid": true,
  "bookingdates": {
    "checkin": "2018-01-01",
    "checkout": "2019-01-01"
  },
  "additionalneeds": "Breakfast"
}
```

### 5. Update Booking (Full)
`PUT /booking/{id}`  
Requires token in Cookie or Authorization header.

### 6. Partial Update
`PATCH /booking/{id}`

### 7. Delete Booking
`DELETE /booking/{id}`  
Requires authentication.

**Quick Tips:**
- Always authenticate before update or delete.
- Use dates in `YYYY-MM-DD` format.
- Excellent practice API for Postman / Rest Assured.

---

## 14. AWS for QA / Automation Testing

### How AWS Helps in Parallel Test Execution
AWS provides scalable infrastructure. Example: 1000 tests that take 5 hours locally can run on 50 EC2 nodes in approximately 20 minutes.

### Difference between S3 and EBS

| Feature       | S3                  | EBS                  |
|---------------|---------------------|----------------------|
| Storage Type  | Object storage      | Block storage        |
| Use Case      | Files & reports     | Disk for EC2         |
| Access        | Web access          | Attached to EC2      |

### Typical Cloud-Based Test Architecture
```
Git Repository
    ↓
Jenkins / CodePipeline
    ↓
Deploy Build
    ↓
EC2 Selenium Grid / Test Runners
    ↓
Run Automation Tests
    ↓
Reports → S3
Logs → CloudWatch
```

### Benefits of AWS for QA Teams
- Massive scalability (run thousands of tests in parallel)
- Instant environment provisioning
- Cost optimization (pay only for usage)
- Seamless integration with Jenkins, Git, and CI/CD pipelines
- Centralized monitoring with CloudWatch

### How to Connect Automation Project to AWS
1. Run Selenium tests on EC2 using `RemoteWebDriver`
2. Automatically trigger tests after deployment via CI/CD
3. Store reports in S3 (TestNG, Allure, Extent Reports)

---

## 15. Additional Important Interview Questions

### What is a Resource vs Endpoint?
- **Resource** → The data entity (User, Order, Product)
- **Endpoint** → The URL path that provides access to the resource

### Best Practices for URI Design
- Use nouns, not verbs
- Keep URIs lowercase with hyphens
- Use plural nouns for collections
- Avoid deep nesting

**Good:** `/users`, `/users/123`, `/order-items`  
**Bad:** `/getUsers`, `/Users`, `/order_items`

### What is Pagination?
Two common approaches:
- **Offset-based:** `GET /users?limit=20&offset=40`
- **Cursor-based:** `GET /users?limit=20&cursor=eyJpZCI6MTIzfQ` (preferred for large datasets)

### What is ETag?
An ETag is a version identifier for a resource. The server sends it in the response. The client sends it back in subsequent requests to check if the resource has changed (conditional requests).

### What is Content-Type vs Accept Header?
- **Content-Type** → Format of the data being **sent** in the request body
- **Accept** → Format the client expects in the **response**

### What is Payload?
Payload is the actual data sent in the request or response body (usually JSON).

### What is TRACE Method?
TRACE performs a message loop-back test for debugging. It is often disabled due to security risks (Cross-Site Tracing attacks).

---

## Final Notes for Interview Preparation

1. Always explain concepts with real-world examples.
2. Know the difference between 401 and 403 very clearly.
3. Be prepared to write Rest Assured and Postman test scripts on the spot.
4. Understand when to use each HTTP method and status code.
5. Practice the RESTful Booker API thoroughly.
6. Be ready to discuss CI/CD integration with Newman.
7. Understand authentication flows (Basic, Bearer, OAuth 2.0).
8. Know caching headers and versioning strategies.

---

**End of Complete Notes**

This file contains **all content** from the conversation without any omissions.
```
