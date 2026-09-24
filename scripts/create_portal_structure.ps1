$root = Split-Path -Parent $PSScriptRoot
$docs = Join-Path $root "docs"

$folders = @(
    "docs/interview-questions/manual-testing/easy-questions",
    "docs/interview-questions/manual-testing/medium-questions",
    "docs/interview-questions/manual-testing/hard-questions",
    "docs/interview-questions/api-testing/rest-api",
    "docs/interview-questions/api-testing/fastapi",
    "docs/interview-questions/api-testing/graphql",
    "docs/interview-questions/playwright/basic",
    "docs/interview-questions/playwright/advanced",
    "docs/interview-questions/playwright/framework",
    "docs/interview-questions/python/basic-coding",
    "docs/interview-questions/python/string-programs",
    "docs/interview-questions/python/interview-programs",
    "docs/interview-questions/java/core-java",
    "docs/interview-questions/java/collections",
    "docs/interview-questions/java/interview-questions",
    "docs/interview-questions/sql/basic-sql",
    "docs/interview-questions/sql/joins",
    "docs/interview-questions/sql/scenarios",
    "docs/interview-questions/ai-testing/prompt-testing",
    "docs/interview-questions/ai-testing/llm-testing",
    "docs/interview-questions/ai-testing/ai-bug-scenarios",
    "docs/interview-questions/security-testing/owasp",
    "docs/interview-questions/security-testing/api-security",
    "docs/interview-questions/security-testing/vapt",
    "docs/aws/notes",
    "docs/aws/certifications",
    "docs/aws/projects",
    "docs/playwright/notes",
    "docs/playwright/interview",
    "docs/playwright/framework",
    "docs/api-testing/notes",
    "docs/api-testing/rest-api",
    "docs/api-testing/fastapi",
    "docs/api-testing/graphql",
    "docs/testing/manual-testing",
    "docs/testing/automation",
    "docs/testing/qa",
    "docs/security-testing/owasp",
    "docs/security-testing/api-security",
    "docs/security-testing/vapt",
    "docs/ai-learning/foundation",
    "docs/ai-learning/agents",
    "docs/ai-learning/testing",
    "docs/devsecops/basics",
    "docs/devsecops/cicd",
    "docs/devsecops/cloud",
    "docs/primary-teacher/mcq",
    "docs/primary-teacher/notes",
    "docs/projects",
    "docs/certifications",
    "docs/study-roadmaps"
)

foreach ($folder in $folders) {
    $fullPath = Join-Path $root $folder
    New-Item -ItemType Directory -Force -Path $fullPath | Out-Null
}

function New-IndexFile($path, $title) {
    $content = @"
# $title

This page is a placeholder for the $title section.

Add your markdown notes here as the section grows.
"@
    $filePath = Join-Path $path "index.md"
    Set-Content -Path $filePath -Value $content -Encoding UTF8
}

New-IndexFile (Join-Path $root "docs/interview-questions/manual-testing/easy-questions") "Easy Questions"
New-IndexFile (Join-Path $root "docs/interview-questions/manual-testing/medium-questions") "Medium Questions"
New-IndexFile (Join-Path $root "docs/interview-questions/manual-testing/hard-questions") "Hard Questions"
New-IndexFile (Join-Path $root "docs/interview-questions/api-testing/rest-api") "REST API"
New-IndexFile (Join-Path $root "docs/interview-questions/api-testing/fastapi") "FastAPI"
New-IndexFile (Join-Path $root "docs/interview-questions/api-testing/graphql") "GraphQL"
New-IndexFile (Join-Path $root "docs/interview-questions/playwright/basic") "Basic Playwright"
New-IndexFile (Join-Path $root "docs/interview-questions/playwright/advanced") "Advanced Playwright"
New-IndexFile (Join-Path $root "docs/interview-questions/playwright/framework") "Playwright Framework"
New-IndexFile (Join-Path $root "docs/interview-questions/python/basic-coding") "Basic Python Coding"
New-IndexFile (Join-Path $root "docs/interview-questions/python/string-programs") "String Programs"
New-IndexFile (Join-Path $root "docs/interview-questions/python/interview-programs") "Interview Programs"
New-IndexFile (Join-Path $root "docs/interview-questions/java/core-java") "Core Java"
New-IndexFile (Join-Path $root "docs/interview-questions/java/collections") "Collections"
New-IndexFile (Join-Path $root "docs/interview-questions/java/interview-questions") "Java Interview Questions"
New-IndexFile (Join-Path $root "docs/interview-questions/sql/basic-sql") "Basic SQL"
New-IndexFile (Join-Path $root "docs/interview-questions/sql/joins") "SQL Joins"
New-IndexFile (Join-Path $root "docs/interview-questions/sql/scenarios") "SQL Scenarios"
New-IndexFile (Join-Path $root "docs/interview-questions/ai-testing/prompt-testing") "Prompt Testing"
New-IndexFile (Join-Path $root "docs/interview-questions/ai-testing/llm-testing") "LLM Testing"
New-IndexFile (Join-Path $root "docs/interview-questions/ai-testing/ai-bug-scenarios") "AI Bug Scenarios"
New-IndexFile (Join-Path $root "docs/interview-questions/security-testing/owasp") "OWASP"
New-IndexFile (Join-Path $root "docs/interview-questions/security-testing/api-security") "API Security"
New-IndexFile (Join-Path $root "docs/interview-questions/security-testing/vapt") "VAPT"
New-IndexFile (Join-Path $root "docs/aws/notes") "AWS Notes"
New-IndexFile (Join-Path $root "docs/aws/certifications") "AWS Certifications"
New-IndexFile (Join-Path $root "docs/aws/projects") "AWS Projects"
New-IndexFile (Join-Path $root "docs/playwright/notes") "Playwright Notes"
New-IndexFile (Join-Path $root "docs/playwright/interview") "Playwright Interview"
New-IndexFile (Join-Path $root "docs/playwright/framework") "Playwright Framework"
New-IndexFile (Join-Path $root "docs/api-testing/notes") "API Testing Notes"
New-IndexFile (Join-Path $root "docs/api-testing/rest-api") "REST API"
New-IndexFile (Join-Path $root "docs/api-testing/fastapi") "FastAPI"
New-IndexFile (Join-Path $root "docs/api-testing/graphql") "GraphQL"
New-IndexFile (Join-Path $root "docs/testing/manual-testing") "Manual Testing"
New-IndexFile (Join-Path $root "docs/testing/automation") "Automation Testing"
New-IndexFile (Join-Path $root "docs/testing/qa") "QA Testing"
New-IndexFile (Join-Path $root "docs/security-testing/owasp") "OWASP"
New-IndexFile (Join-Path $root "docs/security-testing/api-security") "API Security"
New-IndexFile (Join-Path $root "docs/security-testing/vapt") "VAPT"
New-IndexFile (Join-Path $root "docs/ai-learning/foundation") "AI Foundations"
New-IndexFile (Join-Path $root "docs/ai-learning/agents") "AI Agents"
New-IndexFile (Join-Path $root "docs/ai-learning/testing") "AI Testing"
New-IndexFile (Join-Path $root "docs/devsecops/basics") "DevSecOps Basics"
New-IndexFile (Join-Path $root "docs/devsecops/cicd") "CI/CD Security"
New-IndexFile (Join-Path $root "docs/devsecops/cloud") "Cloud Security"
New-IndexFile (Join-Path $root "docs/primary-teacher/mcq") "Primary Teacher MCQ"
New-IndexFile (Join-Path $root "docs/primary-teacher/notes") "Teacher Notes"
New-IndexFile (Join-Path $root "docs/projects") "Projects"
New-IndexFile (Join-Path $root "docs/certifications") "Certifications"
New-IndexFile (Join-Path $root "docs/study-roadmaps") "Study Roadmaps"

Write-Host "Portal structure created successfully under $docs"
