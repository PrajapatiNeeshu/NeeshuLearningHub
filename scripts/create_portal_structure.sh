#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOCS_DIR="$ROOT_DIR/docs"

mkdir -p \
  "$DOCS_DIR/interview-questions/manual-testing/easy-questions" \
  "$DOCS_DIR/interview-questions/manual-testing/medium-questions" \
  "$DOCS_DIR/interview-questions/manual-testing/hard-questions" \
  "$DOCS_DIR/interview-questions/api-testing/rest-api" \
  "$DOCS_DIR/interview-questions/api-testing/fastapi" \
  "$DOCS_DIR/interview-questions/api-testing/graphql" \
  "$DOCS_DIR/interview-questions/playwright/basic" \
  "$DOCS_DIR/interview-questions/playwright/advanced" \
  "$DOCS_DIR/interview-questions/playwright/framework" \
  "$DOCS_DIR/interview-questions/python/basic-coding" \
  "$DOCS_DIR/interview-questions/python/string-programs" \
  "$DOCS_DIR/interview-questions/python/interview-programs" \
  "$DOCS_DIR/interview-questions/java/core-java" \
  "$DOCS_DIR/interview-questions/java/collections" \
  "$DOCS_DIR/interview-questions/java/interview-questions" \
  "$DOCS_DIR/interview-questions/sql/basic-sql" \
  "$DOCS_DIR/interview-questions/sql/joins" \
  "$DOCS_DIR/interview-questions/sql/scenarios" \
  "$DOCS_DIR/interview-questions/ai-testing/prompt-testing" \
  "$DOCS_DIR/interview-questions/ai-testing/llm-testing" \
  "$DOCS_DIR/interview-questions/ai-testing/ai-bug-scenarios" \
  "$DOCS_DIR/interview-questions/security-testing/owasp" \
  "$DOCS_DIR/interview-questions/security-testing/api-security" \
  "$DOCS_DIR/interview-questions/security-testing/vapt" \
  "$DOCS_DIR/aws/notes" \
  "$DOCS_DIR/aws/certifications" \
  "$DOCS_DIR/aws/projects" \
  "$DOCS_DIR/playwright/notes" \
  "$DOCS_DIR/playwright/interview" \
  "$DOCS_DIR/playwright/framework" \
  "$DOCS_DIR/api-testing/notes" \
  "$DOCS_DIR/api-testing/rest-api" \
  "$DOCS_DIR/api-testing/fastapi" \
  "$DOCS_DIR/api-testing/graphql" \
  "$DOCS_DIR/testing/manual-testing" \
  "$DOCS_DIR/testing/automation" \
  "$DOCS_DIR/testing/qa" \
  "$DOCS_DIR/security-testing/owasp" \
  "$DOCS_DIR/security-testing/api-security" \
  "$DOCS_DIR/security-testing/vapt" \
  "$DOCS_DIR/ai-learning/foundation" \
  "$DOCS_DIR/ai-learning/agents" \
  "$DOCS_DIR/ai-learning/testing" \
  "$DOCS_DIR/devsecops/basics" \
  "$DOCS_DIR/devsecops/cicd" \
  "$DOCS_DIR/devsecops/cloud" \
  "$DOCS_DIR/primary-teacher/mcq" \
  "$DOCS_DIR/primary-teacher/notes" \
  "$DOCS_DIR/projects" \
  "$DOCS_DIR/certifications" \
  "$DOCS_DIR/study-roadmaps"

create_index() {
  local path="$1"
  local title="$2"
  cat > "$path/index.md" <<EOF
# $title

This page is a placeholder for the $title section.

Add your markdown notes here as the section grows.
EOF
}

create_index "$DOCS_DIR/interview-questions/manual-testing/easy-questions" "Easy Questions"
create_index "$DOCS_DIR/interview-questions/manual-testing/medium-questions" "Medium Questions"
create_index "$DOCS_DIR/interview-questions/manual-testing/hard-questions" "Hard Questions"
create_index "$DOCS_DIR/interview-questions/api-testing/rest-api" "REST API"
create_index "$DOCS_DIR/interview-questions/api-testing/fastapi" "FastAPI"
create_index "$DOCS_DIR/interview-questions/api-testing/graphql" "GraphQL"
create_index "$DOCS_DIR/interview-questions/playwright/basic" "Basic Playwright"
create_index "$DOCS_DIR/interview-questions/playwright/advanced" "Advanced Playwright"
create_index "$DOCS_DIR/interview-questions/playwright/framework" "Playwright Framework"
create_index "$DOCS_DIR/interview-questions/python/basic-coding" "Basic Python Coding"
create_index "$DOCS_DIR/interview-questions/python/string-programs" "String Programs"
create_index "$DOCS_DIR/interview-questions/python/interview-programs" "Interview Programs"
create_index "$DOCS_DIR/interview-questions/java/core-java" "Core Java"
create_index "$DOCS_DIR/interview-questions/java/collections" "Collections"
create_index "$DOCS_DIR/interview-questions/java/interview-questions" "Java Interview Questions"
create_index "$DOCS_DIR/interview-questions/sql/basic-sql" "Basic SQL"
create_index "$DOCS_DIR/interview-questions/sql/joins" "SQL Joins"
create_index "$DOCS_DIR/interview-questions/sql/scenarios" "SQL Scenarios"
create_index "$DOCS_DIR/interview-questions/ai-testing/prompt-testing" "Prompt Testing"
create_index "$DOCS_DIR/interview-questions/ai-testing/llm-testing" "LLM Testing"
create_index "$DOCS_DIR/interview-questions/ai-testing/ai-bug-scenarios" "AI Bug Scenarios"
create_index "$DOCS_DIR/interview-questions/security-testing/owasp" "OWASP"
create_index "$DOCS_DIR/interview-questions/security-testing/api-security" "API Security"
create_index "$DOCS_DIR/interview-questions/security-testing/vapt" "VAPT"
create_index "$DOCS_DIR/aws/notes" "AWS Notes"
create_index "$DOCS_DIR/aws/certifications" "AWS Certifications"
create_index "$DOCS_DIR/aws/projects" "AWS Projects"
create_index "$DOCS_DIR/playwright/notes" "Playwright Notes"
create_index "$DOCS_DIR/playwright/interview" "Playwright Interview"
create_index "$DOCS_DIR/playwright/framework" "Playwright Framework"
create_index "$DOCS_DIR/api-testing/notes" "API Testing Notes"
create_index "$DOCS_DIR/api-testing/rest-api" "REST API"
create_index "$DOCS_DIR/api-testing/fastapi" "FastAPI"
create_index "$DOCS_DIR/api-testing/graphql" "GraphQL"
create_index "$DOCS_DIR/testing/manual-testing" "Manual Testing"
create_index "$DOCS_DIR/testing/automation" "Automation Testing"
create_index "$DOCS_DIR/testing/qa" "QA Testing"
create_index "$DOCS_DIR/security-testing/owasp" "OWASP"
create_index "$DOCS_DIR/security-testing/api-security" "API Security"
create_index "$DOCS_DIR/security-testing/vapt" "VAPT"
create_index "$DOCS_DIR/ai-learning/foundation" "AI Foundations"
create_index "$DOCS_DIR/ai-learning/agents" "AI Agents"
create_index "$DOCS_DIR/ai-learning/testing" "AI Testing"
create_index "$DOCS_DIR/devsecops/basics" "DevSecOps Basics"
create_index "$DOCS_DIR/devsecops/cicd" "CI/CD Security"
create_index "$DOCS_DIR/devsecops/cloud" "Cloud Security"
create_index "$DOCS_DIR/primary-teacher/mcq" "Primary Teacher MCQ"
create_index "$DOCS_DIR/primary-teacher/notes" "Teacher Notes"
create_index "$DOCS_DIR/projects" "Projects"
create_index "$DOCS_DIR/certifications" "Certifications"
create_index "$DOCS_DIR/study-roadmaps" "Study Roadmaps"

echo "Portal structure created successfully under $DOCS_DIR"
