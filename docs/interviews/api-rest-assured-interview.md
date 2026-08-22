# API Testing and Rest Assured Interview Questions

This guide covers API fundamentals, HTTP, authentication, Rest Assured, test design, and CI/CD topics commonly discussed in API testing interviews.

## API Fundamentals

### Q1: What is an API, and why is API testing important?

**Answer:** An Application Programming Interface (API) is a contract that allows software components to communicate. API testing validates that the contract, business rules, data, security, and error handling work correctly without depending on a user interface.

API testing is valuable because it is fast, stable, supports early testing, provides broad coverage, and catches integration defects before UI testing.

### Q2: What are the different types of API testing?

**Answer:** Common types include:

- Functional and integration testing
- Regression and smoke testing
- Contract and schema validation
- Performance, load, and stress testing
- Security and authorization testing
- Negative and error handling testing
- End-to-end workflow testing

### Q3: What are the main components of an API request?

**Answer:** An API request contains the HTTP method, URL, path, query parameters, headers, authentication, and optional request body. The body is commonly sent as JSON, XML, form data, or multipart data.

### Q4: What is the difference between query parameters and path parameters?

**Answer:** A path parameter identifies a resource and is part of the URL path, such as `/users/42`. A query parameter filters or modifies a request, such as `/users?role=admin`.

### Q5: What are HTTP methods? Give examples.

**Answer:**

| Method | Typical purpose | Example |
|---|---|---|
| GET | Read data | `GET /users/42` |
| POST | Create a resource | `POST /users` |
| PUT | Replace a resource | `PUT /users/42` |
| PATCH | Partially update a resource | `PATCH /users/42` |
| DELETE | Delete a resource | `DELETE /users/42` |
| HEAD | Return headers without a body | `HEAD /users/42` |
| OPTIONS | Report supported operations | `OPTIONS /users` |
| TRACE | Echo the request for diagnostic purposes | `TRACE /users` |

### Q6: What is the difference between PUT and PATCH?

**Answer:** PUT generally replaces the complete resource and is idempotent. PATCH updates only selected fields and may not be idempotent, depending on the API implementation.

### Q7: Can GET replace PUT for resource creation?

**Answer:** No. GET should be safe and read-only. Creating a resource with GET violates HTTP semantics, can be triggered unintentionally by crawlers or caches, and makes the API harder to reason about. POST or PUT should be used according to the API contract.

### Q8: What is the difference between REST and SOAP?

**Answer:** REST is an architectural style that commonly uses HTTP resources and JSON, while SOAP is a protocol based on XML envelopes and formal contracts such as WSDL. REST is usually simpler and lighter; SOAP provides built-in standards for enterprise messaging, transactions, and security.

### Q9: What are common HTTP status codes?

**Answer:**

| Code | Meaning |
|---|---|
| 200 | Successful request |
| 201 | Resource created |
| 202 | Request accepted for processing |
| 204 | Successful request with no response body |
| 400 | Invalid request |
| 401 | Missing or invalid authentication |
| 403 | Authenticated but not authorized |
| 404 | Resource not found |
| 405 | HTTP method not allowed |
| 409 | Resource conflict |
| 429 | Too many requests |
| 500 | Internal server error |
| 502 | Bad gateway |
| 503 | Service unavailable |

### Q10: What is the difference between 401 and 403?

**Answer:** A `401` response means the client has not supplied valid authentication credentials. A `403` response means the server knows the client identity but that identity does not have permission to perform the operation.

### Q11: What is the difference between 201 and 204?

**Answer:** `201 Created` confirms that a new resource was created and commonly includes its location or representation. `204 No Content` confirms success but intentionally returns no response body, often after an update or delete.

### Q12: What is the difference between 4xx and 5xx errors?

**Answer:** A `4xx` error indicates a problem with the client request, credentials, or permissions. A `5xx` error indicates that the server or an upstream dependency failed while handling a valid request.

## Authentication and Validation

### Q13: Which API authentication techniques do you know?

**Answer:** Common techniques include Basic Authentication, API keys, Bearer tokens, OAuth 2.0, JWT, mutual TLS, and signed requests. Tests should verify missing, expired, malformed, underprivileged, and revoked credentials.

### Q14: What is the difference between Basic Auth, OAuth, and Bearer Token authentication?

**Answer:** Basic Auth sends a username and password, normally over HTTPS. A Bearer token grants access to whoever possesses the token. OAuth 2.0 is an authorization framework for obtaining scoped access tokens without sharing the user's password with every client.

### Q15: What is the difference between OAuth 1.0 and OAuth 2.0?

**Answer:** OAuth 1.0 signs requests with a client secret and token secret. OAuth 2.0 uses access tokens and defined grant flows, scopes, and refresh tokens. OAuth 2.0 is more flexible, but the authorization server and client must implement its security guidance correctly.

### Q16: What is a JWT?

**Answer:** A JSON Web Token contains a header, claims payload, and signature. The claims can carry identity, expiry, and permissions. The signature provides integrity, but the payload is not encrypted by default, so secrets must never be placed in it.

### Q17: What is JSON Schema validation?

**Answer:** JSON Schema defines the expected structure, data types, required fields, formats, and allowed values in a response. Schema validation catches contract changes even when individual field assertions still pass.

### Q18: What should you validate in an API response?

**Answer:** Validate the status code, headers, content type, response time, schema, required fields, values, data types, business rules, and correlation identifiers. Also verify that sensitive fields are not exposed.

## Rest Assured

### Q19: What is Rest Assured, and how is it used?

**Answer:** Rest Assured is a Java library for testing REST APIs. It provides a readable DSL for building requests, sending them, extracting responses, and asserting status codes, headers, body fields, and schemas.

### Q20: How do you set up Rest Assured in a Maven project?

**Answer:** Add the Rest Assured and test framework dependencies to `pom.xml`, then configure the base URI and test lifecycle in the test project.

```xml
<dependency>
  <groupId>io.rest-assured</groupId>
  <artifactId>rest-assured</artifactId>
  <version>5.5.6</version>
  <scope>test</scope>
</dependency>
```

The exact version should be managed centrally and kept current with the project's supported Java version.

### Q21: How do you send a GET request using Rest Assured?

```java
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.equalTo;

given()
    .baseUri("https://api.example.com")
    .pathParam("id", 42)
.when()
    .get("/users/{id}")
.then()
    .statusCode(200)
    .body("id", equalTo(42));
```

### Q22: How do you send a POST request with a request body?

```java
String requestBody = """
    {"name":"Neeshu","role":"qa-engineer"}
    """;

given()
    .baseUri("https://api.example.com")
    .contentType("application/json")
    .body(requestBody)
.when()
    .post("/users")
.then()
    .statusCode(201)
    .body("name", equalTo("Neeshu"));
```

### Q23: How do you pass query and path parameters in Rest Assured?

```java
given()
    .queryParam("role", "admin")
    .pathParam("userId", 42)
.when()
    .get("/users/{userId}/permissions")
.then()
    .statusCode(200);
```

### Q24: How do you validate status code, headers, and body?

```java
given()
.when()
    .get("/users/42")
.then()
    .statusCode(200)
    .header("Content-Type", org.hamcrest.Matchers.containsString("application/json"))
    .body("active", equalTo(true));
```

### Q25: What is a request specification?

**Answer:** A `RequestSpecification` stores reusable request settings such as the base URI, common headers, authentication, content type, and logging. It avoids repeating setup in every test.

```java
import static io.restassured.builder.RequestSpecBuilder.*;
import io.restassured.specification.RequestSpecification;

RequestSpecification requestSpec = new RequestSpecBuilder()
    .setBaseUri("https://api.example.com")
    .setContentType("application/json")
    .addHeader("Accept", "application/json")
    .build();
```

### Q26: How do you pass authentication in Rest Assured?

```java
given()
    .auth().oauth2(System.getenv("API_TOKEN"))
.when()
    .get("/profile")
.then()
    .statusCode(200);
```

Use environment variables or a secret manager for tokens. Do not commit credentials to source control or print them in logs.

### Q27: How do you deserialize a response in Rest Assured?

**Answer:** With Jackson or another object mapper on the classpath, use `extract().as(User.class)` to convert JSON into a Java object. Serialization converts a Java object to JSON for a request; deserialization converts a response into a Java object.

```java
User user = given()
    .get("/users/42")
    .then()
    .statusCode(200)
    .extract()
    .as(User.class);
```

### Q28: How do you perform schema validation in Rest Assured?

**Answer:** Add the `json-schema-validator` module and compare the response with a checked-in schema.

```java
then()
    .body(matchesJsonSchemaInClasspath("schemas/user.json"));
```

### Q29: How do you extract a value from a response?

```java
String userId = given()
    .get("/users")
    .then()
    .statusCode(200)
    .extract()
    .path("data[0].id");
```

### Q30: How do you chain API tests?

**Answer:** Send the first request, extract a value such as an ID or token, and use it in the next request. Keep the chain short, clean up created data, and separate independent tests so one failure does not hide other defects.

```java
int createdId = given()
    .body("{\"name\":\"test-user\"}")
    .contentType("application/json")
.when()
    .post("/users")
.then()
    .statusCode(201)
    .extract().path("id");

given()
    .pathParam("id", createdId)
.when()
    .get("/users/{id}")
.then()
    .statusCode(200);
```

### Q31: Rest Assured versus Postman: what is the difference?

**Answer:** Postman is useful for exploratory testing, manual requests, collections, and quick collaboration. Rest Assured is code-based, easier to review and reuse in a build, and integrates naturally with JUnit, TestNG, Maven, and CI/CD. Many teams use both.

### Q32: What utilities belong in an API automation framework?

**Answer:** Useful utilities include configuration readers, request specifications, authentication helpers, data builders, JSON and schema helpers, response extractors, logging, retry handling, test-data cleanup, reporting, and environment selection. Utilities should remove duplication without hiding important assertions.

## Framework and CI/CD Design

### Q33: How would you design an API automation framework?

**Answer:** I would separate test cases, API clients or service objects, request and response models, configuration, test data, authentication, assertions, logging, and reporting. The framework should support tags such as smoke and regression, parallel execution where safe, isolated test data, and environment-specific configuration.

### Q34: How do you generate and manage test data?

**Answer:** Use builders or factories for valid data, boundary-value data, invalid data, and unique values. Keep test data isolated, resettable, non-sensitive, and independent of production. Generate unique IDs when parallel tests can collide.

### Q35: How do you run Rest Assured tests in Jenkins or another CI/CD pipeline?

**Answer:** Store environment settings and secrets in the CI system, install the required Java and Maven versions, run the targeted Maven profile, publish JUnit or Allure results, and retain logs and reports on failure.

```bash
mvn clean test -Dgroups=smoke -Denv=qa
```

The pipeline should fail on test failures and should never expose tokens in console output.

### Q36: How do you handle API rate limits and retries?

**Answer:** Assert the expected `429` behavior, honor `Retry-After` when provided, use bounded exponential backoff with jitter for transient failures, and avoid retrying validation or client errors. Retries should be observable and must not mask real defects.

### Q37: How do you troubleshoot an API response that takes one minute?

**Answer:** First reproduce it with a request ID and timing data. Check DNS, connection and TLS time, server processing time, database calls, downstream services, queues, payload size, and infrastructure metrics. Compare the same request across environments and inspect server and gateway logs before adding a client-side timeout.

### Q38: How frequently should API regression tests run?

**Answer:** Run fast smoke tests on every pull request, broader functional and contract tests after deployment, and scheduled full regression and performance suites. The frequency should reflect risk, execution time, and the cost of discovering a defect later.

### Q39: What is an API test case for an Amazon or other government service?

**Answer:** Use the official API contract and test approved sandbox data. Cover authentication, required headers, valid and invalid payloads, status codes, schema, authorization, idempotency, audit fields, rate limits, and sensitive-data handling. Never test against a production government endpoint without explicit authorization.

### Q40: What makes a good API test?

**Answer:** A good API test is deterministic, independent, focused, readable, fast, secure, and valuable. It verifies both a positive business outcome and meaningful negative behavior, while producing enough diagnostics to explain a failure.