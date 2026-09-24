# AI QA / SDET Interview Prep (2026)

**Purpose:** One study file from your LinkedIn/Cisco screenshots + classic automation questions.  
**Target roles:** Senior QA / SDET / AI Quality & Testing (e.g. Cisco-style AI Quality Engineer).

---

## 1. Requirements analysis (what employers want)

### A. Using AI to improve testing (skills you must show)

| Area | What to learn | Interview signal |
|------|----------------|------------------|
| GenAI basics | AI vs ML vs DL, LLMs, tokens, context window, temperature, hallucinations, embeddings, vector DB, RAG | Explain concepts in plain English + one testing example each |
| Prompt engineering | Test cases, scenarios, edge cases, bug analysis, test data, API scenarios, SQL, code help | Show a structured prompt you use at work |
| AI-assisted automation | Playwright/Selenium scripts, locators, refactor, flaky analysis, maintenance | Stress: **you still validate AI-generated code** |
| API / DB with AI | Positive/negative, JSON validation, boundaries, SQL, data compare, error analysis | Combine AI draft + your assertion strategy |

### B. Testing AI / LLM products (new QA work)

You must test beyond “pass/fail UI”:

- Accuracy, relevance, consistency  
- Hallucination, toxicity, bias  
- Prompt injection, context handling, guardrails  
- Latency, cost / token usage  
- RAG: retrieval quality, grounding, citation correctness, chunking failures  

Cisco-style extras: **LLM-as-judge**, behavioral regression, tenant isolation probes, audit logs, contract testing, security compliance.

### C. Classic automation depth (still mandatory)

- Core frameworks over chasing tools (Playwright / Selenium / RestAssured / k6 / Pact)  
- Test pyramid / trophy, FIRST, SOLID, AAA, POM  
- Unit → Integration → E2E mastery  
- CI/CD, Docker/K8s, reporting (Allure), flaky control  
- Java/Python OOP in framework design  

### D. Cisco “Senior Software Engineer – AI Quality & Testing” themes

- 8+ years, large-scale test ecosystems  
- **Python + Go**, scalable test infra  
- Contract testing, Playwright  
- Security: OCSF, vacuum linter, Caldera, tenant isolation, audit log validation  
- AI: Claude/Codex, prompt engineering, agentic workflows, LangChain/LangSmith, LLM-as-judge  
- Performance: k6, JMeter  

**How to answer in interviews:** Pair every AI topic with a **concrete validation method** (metric, rubric, golden set, or probe).

---

## 2. How to use this file

1. Read **Section 1** once (map your experience).  
2. Practice **Q&A** out loud (STAR: Situation → Task → Action → Result).  
3. For coding Qs, write code on paper/IDE without autocomplete first.  
4. Keep 2–3 stories ready: flaky fix, framework design, AI-assisted test you validated.

---

## 3. AI & GenAI fundamentals — interview Q&A

### Q1. AI vs ML vs Deep Learning — explain with a testing example
**Answer outline:**  
- **AI:** broad systems that act “smart” (rules + ML).  
- **ML:** learns from data (spam model).  
- **DL:** neural nets for complex patterns (LLM).  
**Testing example:** Rule-based validator = AI-ish; classifier for log severity = ML; LLM summarizing bugs = DL/GenAI. QA validates correctness differently for each.

### Q2. What is an LLM? What are tokens and context window?
**Answer:** LLM predicts next tokens from training + prompt. **Token** ≈ piece of text. **Context window** = max tokens model can see at once.  
**QA impact:** Long chats truncate history → inconsistent answers; test long-context and summarization behavior.

### Q3. What is temperature? How does it affect testing?
**Answer:** Higher temperature → more random/creative; lower → more deterministic.  
**QA:** For regression, use low temperature / fixed seed if available; for creativity features, assert ranges/rubrics not exact string match.

### Q4. What is hallucination? How do you test for it?
**Answer:** Model invents facts.  
**Tests:** Golden Q&A, known false prompts, require citations, compare against source docs (RAG), LLM-as-judge with ground truth, human spot-check.

### Q5. Embeddings + vector DB — why do testers care?
**Answer:** Embeddings map text to vectors; vector DB stores/searches similar chunks for RAG.  
**Tests:** Wrong chunk retrieved, stale index, embedding model change, empty retrieval, multilingual mismatch.

### Q6. Explain RAG and what can break
**Answer:** Retrieve docs → inject into prompt → generate.  
**Failures:** bad chunking, wrong top-k, outdated index, prompt ignores context, citation mismatch, PII leakage from retrieved docs.

### Q7. How would you design a golden dataset for an LLM feature?
**Answer:** Cover happy, adversarial, multilingual, empty, long context, safety. Version it. Store expected rubric scores + must-include / must-not-include phrases. Track regressions per release.

---

## 4. Prompt engineering for QA — interview Q&A

### Q8. Give a structured prompt to generate API negative tests
**Example structure:** Role → API contract → constraints → output format (table) → severity.  
Show you force: status codes, schema, auth failures, rate limit, idempotency.

### Q9. How do you stop the model from inventing endpoints?
**Answer:** Paste OpenAPI/Swagger only; say “only use listed paths”; ask model to mark unknowns as OUT_OF_SCOPE.

### Q10. Prompt for bug analysis from logs + steps
**Answer:** Provide logs, expected vs actual, ask for root-cause hypotheses ranked, missing evidence, next debug commands — not a fake root cause.

### Q11. When should you NOT trust AI-generated tests?
**Answer:** Security-critical paths, flaky-prone UI, unclear requirements, no assertions, hardcoded sleeps, invented locators/APIs. Always review + run.

---

## 5. Testing AI/LLM applications — interview Q&A

### Q12. How is LLM testing different from traditional UI testing?
**Answer:** Non-deterministic outputs; need rubrics, semantic similarity, judges, safety suites — not only exact string equals.

### Q13. How do you test consistency?
**Answer:** Same prompt N times; measure variance; fail if answer category flips or critical facts change beyond threshold.

### Q14. How do you test prompt injection?
**Answer:** Inject “ignore previous instructions…”, exfiltrate system prompt, jailbreak to reveal secrets; assert guardrails block and audit logs fire.

### Q15. What is LLM-as-judge? Risks?
**Answer:** Another model scores outputs against a rubric.  
**Risks:** judge bias, circular agreement, cost. Mitigate with human calibration set + multiple judges + fixed rubric.

### Q16. How do you test toxicity / bias?
**Answer:** Adversarial prompt sets, demographic parity checks where relevant, blocklist/classifier scores, policy thresholds, escalation paths.

### Q17. Latency and cost testing for LLM APIs
**Answer:** p50/p95 latency, tokens in/out, cost per 1k requests, cache hit rate, streaming vs non-streaming, timeout/retry storms.

### Q18. Tenant isolation probes (Cisco-style)
**Answer:** As tenant A, try to read tenant B data via prompts, IDs, RAG filters, admin APIs. Assert deny + audit. Automate cross-tenant ID fuzzing.

### Q19. Behavioral regression suite for AI
**Answer:** Freeze prompt version + model version + golden set; store previous scores; fail on score drop or new safety violations.

---

## 6. RAG testing — interview Q&A

### Q20. What do you validate in a RAG pipeline?
**Answer:**  
1) Query → retrieval recall/precision  
2) Context packing  
3) Answer grounded in retrieved text  
4) Citations correct  
5) “I don’t know” when no context  
6) Freshness after doc update  

### Q21. How do you test “answer not in docs”?
**Answer:** Ask out-of-corpus questions; expect refusal or clear uncertainty, not hallucination.

---

## 7. AI-assisted automation — interview Q&A

### Q22. How do you use Cursor/Copilot safely in automation?
**Answer:** Generate draft → review locators/assertions → run locally → check flaky waits → PR review same as prod code.

### Q23. Self-healing locators — pros/cons
**Answer:** Pros: less maintenance. Cons: masks real UI bugs, flaky healing, hard-to-debug. Prefer stable testids; healing as fallback with alerts.

### Q24. Agentic testing workflows — explain
**Answer:** Agents plan cases, generate scripts, execute, triage failures. QA owns oracles, environments, and go/no-go gates.

### Q25. Playwright MCP — what would you say in interview?
**Answer:** MCP lets AI tools drive browser/test authoring with structured context. You still verify selectors, isolation, and CI stability.

---

## 8. Classic Java / collections — detailed Q&A (from your Q list)

### Q26. List vs Set in automation — when?
**Answer:**  
- **List:** ordered steps, duplicates allowed (multiple same toast text).  
- **Set:** unique IDs, unique broken URLs, unique window handles.  
Prefer `LinkedHashSet` if you need unique + insertion order.

### Q27. Remove duplicates from a collection
**Answer:** `new LinkedHashSet<>(list)` or stream `distinct()`. Discuss `equals/hashCode` for custom objects.

### Q28. Maintain insertion order while removing duplicates
**Answer:** `LinkedHashSet` (not `HashSet`).

### Q29. Store API response data dynamically
**Answer:** `Map<String, Object>`, JsonPath, POJOs/`record`, or schema-validated JsonNode. Avoid fragile string splits.

### Q30. HashMap in multithreading — what happens?
**Answer:** `HashMap` not thread-safe → corruption/infinite loops historically. Use `ConcurrentHashMap`, or confine to one thread, or synchronize carefully.

### Q31. `==` vs `equals()` with real scenario
**Answer:** `==` reference; `equals` value.  
**Scenario:** Two `String`/`Page` status objects look equal by value but `==` fails; assert with `equals` or Objects.equals.  
Improper `equals` override breaks Set/Map uniqueness of test data keys.

### Q32. NullPointerException handling
**Answer:** Optional, null checks at boundaries, fail soft with clear assertion message, never swallow silently in tests.

---

## 9. OOP in automation frameworks — detailed Q&A

### Q33. Where did you use abstraction?
**Answer:** `BasePage` / `DriverFactory` / `ApiClient` interfaces; tests depend on abstractions not ChromeDriver details.

### Q34. Inheritance issue you faced
**Answer:** Deep BasePage hierarchy → tight coupling. Prefer composition/fixtures over 5-level inheritance.

### Q35. Interface vs abstract class
**Answer:** Interface = capability contract (multi). Abstract class = shared partial implementation. Prefer interfaces + small base helpers.

### Q36. Polymorphism in framework design
**Answer:** `Browser` interface with Chrome/Firefox impl; same test runs multi-browser via config.

### Q37. Encapsulation in POM
**Answer:** Locators private; public methods = user actions/assertions. Tests never touch raw By/xpath.

---

## 10. Selenium / UI automation — detailed Q&A

### Q38. Element not clickable due to overlay
**Answer:** Wait for overlay gone; scroll into view; JS click only as last resort; fix z-index app bug if real.

### Q39. Dynamic XPath failing — approach
**Answer:** Prefer stable `data-testid`; relative xpath/css; avoid index; debug DOM after wait; avoid absolute paths.

### Q40. Slow page — synchronization
**Answer:** Explicit waits for conditions (visible/clickable/network idle), not fixed sleep. Playwright auto-wait / expect.

### Q41. StaleElementReferenceException
**Answer:** Re-find element after DOM refresh; wait for stable state; avoid storing WebElement across navigations.

### Q42. Multiple windows/tabs
**Answer:** Store handles; switch by title/URL; close extras; in Playwright use `context.pages()` / popup events.

### Q43. Dropdown not `<select>`
**Answer:** Click custom control → click option by text/role; avoid Select class.

### Q44. Verify broken links
**Answer:** Collect `a[href]` → HTTP HEAD/GET → assert status; skip mailto/javascript; report list.

### Q45. File upload in Selenium
**Answer:** `sendKeys` to `<input type=file>`; if hidden, don’t click OS dialog; Playwright `setInputFiles`.

---

## 11. API testing — detailed Q&A

### Q46. API returns 200 but body wrong — what to validate?
**Answer:** Schema, critical fields, business rules, IDs, pagination totals, error object absence, headers (cache/auth).

### Q47. Validate JSON dynamically
**Answer:** JsonSchema, JsonPath asserts, soft assertions for multi-field, contract tests (Pact).

### Q48. Token-based auth testing
**Answer:** Get token → reuse → expiry → refresh → invalid/revoked token → missing scope → assert 401/403.

### Q49. Negative API scenarios
**Answer:** Bad payload, missing fields, wrong types, oversized body, SQL/XSS in fields, IDOR (other user ID), rate limit.

### Q50. Chain multiple API requests
**Answer:** Create → capture ID → get → update → delete; share state in test context; isolate with cleanup; avoid order dependence across classes.

---

## 12. Framework design / CI — detailed Q&A

### Q51. Framework slow — how optimize?
**Answer:** Parallelize, shard, fewer E2E, API for setup, headless, reuse auth state, trim waits, selective suites, cache deps.

### Q52. Design a hybrid framework
**Answer:** POM + data-driven (CSV/JSON) + optional keyword layer; config by env; clear layers: tests / pages / API / utilities / reporting.

### Q53. Test data management
**Answer:** Factories/Faker, isolated tenants, cleanup hooks, secrets in vault/CI vars, no prod PII in git.

### Q54. Retry for flaky tests
**Answer:** Retry only known transient infra; quarantine chronic flakes; fix root cause; don’t hide product bugs with infinite retries.

### Q55. Reporting
**Answer:** Allure/ReportPortal/HTML; attach logs, screenshots, trace, request/response; link to CI build.

### Q56. Jenkins / CI integration
**Answer:** Pipeline stages: build → unit → api → ui smoke → publish report → gate on failures; parallel agents; artifacts.

### Q57. Migrate Selenium → Playwright — steps
**Answer:**  
1) Spike critical journeys  
2) Map waits/locators  
3) Dual-run period  
4) Port fixtures/auth  
5) Replace Grid with Playwright projects  
6) Train team  
7) Decommission Selenium suite gradually  

### Q58. Flaky tests — identify and fix
**Answer:** Track flake rate by test; classify timing/data/env/locator; add traces; fix sync/data isolation; quarantine with owner.

---

## 13. Modern practices / architecture — interview Q&A

### Q59. Test pyramid vs testing trophy
**Answer:** Pyramid: many unit, fewer E2E. Trophy (web): static → unit → integration heavy → fewer E2E. Explain fit for your product.

### Q60. Contract testing (Pact) — why?
**Answer:** Consumer expectations verified against provider without full E2E; catches breaking API changes early. Cisco JD emphasizes this.

### Q61. Shift-left vs shift-right
**Answer:** Left: unit/API/contracts in PR. Right: prod monitoring, synthetic checks, observability (OpenTelemetry).

### Q62. Feature flags in testing
**Answer:** Test both flag on/off; avoid sticky flags in shared envs; cleanup; LaunchDarkly/Unleash awareness.

### Q63. Performance testing with k6
**Answer:** Script scenarios, thresholds (SLO p95), run in CI for smoke load; separate full soak; watch error rate + latency.

### Q64. Security basics for SDET
**Answer:** OWASP Top 10 awareness, ZAP/Burp smoke, authZ tests, secrets scanning; for AI roles: isolation, audit logs, OCSF-shaped events.

---

## 14. Coding / logic questions (practice answers)

### Q65. Next greater element for a key in array
**Approach:** Brute force O(n²); optimize with stack monotonic O(n). Discuss duplicates.

### Q66. Optimize instead of nested loops
**Answer:** HashMap/HashSet for O(n), sorting + two pointers, sliding window — pick by problem.

### Q67. Second largest in array
**Answer:** One pass track largest & second; handle duplicates/negatives/size < 2.

### Q68. Sort without inbuilt methods
**Answer:** Implement merge/quick sort; state complexity; for interviews prefer merge sort clarity.

---

## 15. Cisco / AI Quality role — scenario questions

### Q69. Design validation for an AI security assistant
**Cover:** accuracy on known threats, hallucination on fake CVEs, prompt injection, tenant isolation, audit log fields, latency SLOs, LLM-as-judge + human sample.

### Q70. How would you implement behavioral regression for prompts?
**Answer:** Version prompts; golden set; score with rubric; compare to baseline; block release on drop; dashboard in LangSmith or custom.

### Q71. Write AI skills to build automation — what does that mean?
**Answer:** Reusable prompts/agents that generate tests from stories, map to Playwright, open PR; human review gate; CI still runs real tests.

### Q72. Go vs Python in test infra
**Answer:** Python fast for scripting/AI glue; Go for high-concurrency probes/services. Mention willingness to use both per JD.

---

## 16. 30-minute mock interview set (practice)

1. Explain RAG and 3 failure modes you would automate.  
2. API 200 but wrong body — walk validation layers.  
3. StaleElement + flake triage story.  
4. Design hybrid framework in 5 minutes on whiteboard.  
5. How LLM-as-judge can be wrong — mitigations.  
6. Tenant isolation probe design.  
7. Selenium → Playwright migration plan.  
8. HashMap multithreading pitfall.  

---

## 17. One-page cheat sheet

| Topic | Remember |
|-------|----------|
| AI testing | Rubrics > exact match; safety + grounding |
| RAG | Retrieve → ground → cite → refuse |
| Automation AI | Generate ≠ done; you validate |
| UI sync | Explicit waits; no blind sleep |
| API | Status + schema + business asserts |
| Framework | POM, config-driven, parallel, reports |
| Flakes | Measure → classify → fix → quarantine |
| Cisco JD | Python/Go, contracts, isolation, LLM-as-judge, k6 |

---

## 18. Suggested weekly study plan

| Day | Focus |
|-----|--------|
| Mon | GenAI + RAG Q1–Q21 |
| Tue | Java OOP + collections Q26–Q37 |
| Wed | Selenium UI Q38–Q45 |
| Thu | API + framework Q46–Q58 |
| Fri | Cisco scenarios Q69–Q72 + mock set |
| Sat | Write 1 Playwright + 1 API test without AI, then with AI and compare |
| Sun | Revise cheat sheet + your 3 STAR stories |

---

*Compiled from your screenshots: AI QA learning path, Naveen Automation Labs 2026 roadmap, automation interview Qs 1–40, Cisco Senior SWE – AI Quality & Testing JD.*
