# Ruflo: AI Agent Orchestration Resource

Ruflo is an open-source agent meta-harness for Claude Code and Codex. It adds the execution layer around an AI model: tools, memory, loops, sandboxes, multi-agent coordination, model routing, and security controls.

- [Ruflo GitHub repository](https://github.com/ruvnet/ruflo)
- [Ruflo Marketplace documentation](https://github.com/ruvnet/ruflo/blob/main/docs/index.md)
- [Ruflo User Guide](https://github.com/ruvnet/ruflo/blob/main/docs/USERGUIDE.md)
- [npm package](https://www.npmjs.com/package/ruflo)
- [Hosted Web UI beta](https://flo.ruv.io/)
- [Goal Planner](https://goal.ruv.io/)

This page is a practical learning summary of the cloned repository. The full source, tests, examples, architecture decision records, and benchmark data remain in the [upstream repository](https://github.com/ruvnet/ruflo).

## What Ruflo Provides

| Capability | What it is useful for |
|---|---|
| Specialized agents | Coding, testing, security review, documentation, architecture, and DevOps tasks |
| Swarm coordination | Running agents in hierarchical, mesh, ring, or star-style teams |
| MCP integration | Exposing orchestration, memory, browser, security, and development tools to an AI client |
| Self-learning | Storing successful trajectories and reasoning patterns for later retrieval |
| Vector memory | HNSW-indexed AgentDB and RuVector-backed semantic search |
| Background workers | Scheduled audit, optimization, test-gap, and maintenance workflows |
| Model routing | Connecting Claude, GPT, Gemini, Cohere, Ollama, and other compatible providers |
| Federation | Secure communication between Ruflo installations on different machines |
| Security controls | Prompt-injection defense, PII detection, input validation, CVE checks, and audit trails |
| Plugin marketplace | Installing or creating reusable Claude Code capabilities |

## Quick Start

### Windows PowerShell, macOS, Linux, and WSL

The interactive wizard is the cross-platform option:

```bash
npx ruflo@latest init wizard
```

For a quick non-interactive setup:

```bash
npx ruflo@latest init
```

The POSIX installer is also available for macOS, Linux, WSL, Git Bash, and MSYS:

```bash
curl -fsSL https://cdn.jsdelivr.net/gh/ruvnet/ruflo@main/scripts/install.sh | bash
```

Windows users running native PowerShell or Command Prompt should use the `npx` wizard because the `curl ... | bash` command requires a POSIX shell.

### Add the MCP server

To register Ruflo with Claude Code:

```bash
claude mcp add claude-flow -- npx ruflo@latest mcp start
```

After initialization, use Claude Code normally. Ruflo's hooks and routing layer can select agents and coordinate work in the background; advanced commands are available when fine-grained control is needed.

## Plugin Installation

Ruflo supports a lighter plugin-only path. Add the marketplace, then install the capabilities you need:

```text
/plugin marketplace add ruvnet/ruflo
/plugin install ruflo-core@ruflo
/plugin install ruflo-swarm@ruflo
/plugin install ruflo-rag-memory@ruflo
/plugin install ruflo-testgen@ruflo
```

Important distinction:

- **Plugins** provide selected slash commands, skills, and agent definitions without changing the workspace.
- **CLI initialization** installs the complete loop, including the MCP server, hooks, daemon, configuration, and workspace helpers.

## Core Learning Areas

### Agents and swarms

Use specialized agents for focused tasks and swarms when a problem benefits from parallel roles. Typical roles include `coder`, `tester`, `reviewer`, `architect`, and `security-auditor`. Swarm topologies organize communication and work distribution; consensus options include Raft, Byzantine fault tolerance, and gossip-style coordination.

### Memory and RAG

Ruflo can persist memories, retrieve related patterns, and connect vector search with graph relationships. The learning loop described in the project documentation is:

```text
RETRIEVE -> JUDGE -> DISTILL -> CONSOLIDATE -> ROUTE
```

This is useful for QA automation when previous test fixes, failure patterns, selectors, API behaviors, or security findings should inform future work.

### Testing and quality

The `ruflo-testgen` plugin focuses on test-gap detection, coverage analysis, and test-driven workflows. The repository also documents a three-layer validation approach:

1. Behavioral smoke tests exercise user-visible failure paths.
2. A cryptographic witness manifest confirms that documented fixes remain present.
3. Append-only history records when regressions appear.

See the [Validation System](https://github.com/ruvnet/ruflo/blob/main/docs/validation/README.md) for the complete design.

### Browser automation

The `ruflo-browser` plugin provides Playwright-based browser automation, testing, and scraping workflows. It is a natural companion to the [Playwright learning path](../playwright/playwright-basics.md) in this portal.

### Security

Use `ruflo-security-audit` for dependency and security checks and `ruflo-aidefence` for AI safety scanning, PII detection, and prompt-defense workflows. Treat generated changes as proposals: review permissions, credentials, network access, and tool configuration before enabling autonomous execution.

## Useful Plugin Map

| Learning goal | Ruflo plugin |
|---|---|
| Learn orchestration fundamentals | `ruflo-core`, `ruflo-swarm` |
| Schedule recurring work | `ruflo-loop-workers`, `ruflo-autopilot` |
| Build reusable workflows | `ruflo-workflows` |
| Practice RAG and vector search | `ruflo-agentdb`, `ruflo-rag-memory`, `ruflo-rvf` |
| Generate and improve tests | `ruflo-testgen`, `ruflo-browser` |
| Review changes safely | `ruflo-jujutsu`, `ruflo-security-audit`, `ruflo-aidefence` |
| Track architecture decisions | `ruflo-adr`, `ruflo-ddd`, `ruflo-sparc` |
| Monitor usage and cost | `ruflo-observability`, `ruflo-cost-tracker` |
| Create extensions | `ruflo-plugin-creator` |

## Suggested QA Practice Project

Build a small e-commerce test workspace and ask Ruflo to:

1. Create a test plan for login, search, checkout, and API error handling.
2. Assign browser, API, security, and reviewer agents to separate work.
3. Store stable selectors, test data rules, and known failure patterns in memory.
4. Generate Playwright and API tests, then run them in CI.
5. Review the generated changes and inspect the validation evidence.

This project connects Ruflo to the existing [API Testing](../api-testing/api-fundamentals.md), [Playwright](../playwright/playwright-basics.md), [Security Testing](../security/security-basics.md), and [DevSecOps](../devsecops/devsecops-intro.md) material.

## Official Documentation Map

- [User Guide](https://github.com/ruvnet/ruflo/blob/main/docs/USERGUIDE.md): installation, CLI, memory, integrations, deployment, and configuration.
- [Marketplace](https://github.com/ruvnet/ruflo/blob/main/docs/index.md): Claude Code plugins and installation commands.
- [Federation Guide](https://github.com/ruvnet/ruflo/blob/main/docs/federation/README.md): trust levels, signed envelopes, budgets, and cross-machine communication.
- [Validation System](https://github.com/ruvnet/ruflo/blob/main/docs/validation/README.md): smoke tests, witness manifests, and temporal history.
- [Benchmark matrix](https://github.com/ruvnet/ruflo/blob/main/docs/benchmarks/BEIR-MATRIX.md): measured retrieval experiments and caveats.
- [Architecture Decision Records](https://github.com/ruvnet/ruflo/tree/main/v3/docs/adr): design decisions and implementation history.

## Safety Checklist

- Pin versions for reproducible CI and production installs.
- Review plugin permissions and MCP tool descriptions before enabling them.
- Keep API keys in environment variables or a secret manager, never in Markdown or source control.
- Start with approval-required workflows before enabling autonomous loops.
- Run smoke tests and inspect generated diffs before accepting agent changes.
- Treat benchmark claims as repository-specific measurements, not universal guarantees.

**Source:** [ruvnet/ruflo](https://github.com/ruvnet/ruflo), cloned at commit `3c99b1c84` on 2026-08-23.