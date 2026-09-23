# Custom Blog CMS Requirements

A private, WordPress-style CMS for publishing SEO-friendly learning and engineering articles alongside the Neeshu Learning Hub.

> This page documents the proposed architecture and requirements. It does not expose admin credentials or production secrets.

## Goals

- Publish and manage articles without editing Markdown manually.
- Keep admin access private to one approved phone number.
- Support SEO metadata, optimized images, analytics, and social sharing.
- Render public blog posts with clean, editable URLs.
- Keep the existing MkDocs learning portal stable while the CMS is developed separately.

## Recommended Architecture

| Layer | Technology |
|---|---|
| Admin and public blog frontend | Next.js 15, App Router, TypeScript |
| Styling | Tailwind CSS |
| Rich text editor | Tiptap |
| API | Next.js Route Handlers or a small Node.js service |
| Database | PostgreSQL |
| ORM | Prisma |
| Authentication | Firebase Phone Authentication with server-side authorization |
| Image storage | Object storage or a managed media service |
| Deployment | Vercel for the web app and managed PostgreSQL |

The CMS should live in a separate `cms/` application while the current MkDocs site remains the documentation portal.

## Admin Authentication

- Phone OTP login only.
- No public registration.
- One approved administrator account.
- Server-side authorization on every admin route and API request.
- Short-lived authenticated sessions with secure, HTTP-only cookies.
- Never rely only on a client-side phone-number check.
- Store the approved phone number in an environment variable, not in source control.

Example configuration:

```env
ALLOWED_ADMIN_PHONE=+91XXXXXXXXXX
```

The placeholder must be replaced through deployment secrets before production use.

## Admin Panel Navigation

- Dashboard
- Posts
- Categories
- Tags
- Media
- SEO
- Comments
- Users
- Settings
- Analytics

## Blog Management

### Create and Edit Posts

Each post should support:

- Title
- Editable slug
- Category
- Tags
- Rich text content
- Featured image
- Image alt text
- Draft or published status
- Scheduled publish date
- Created, updated, and published timestamps
- Preview before publishing
- Autosave drafts
- Related articles
- Table of contents
- Breadcrumb metadata
- FAQ schema content

Example post:

| Field | Example |
|---|---|
| Title | Top 10 API Testing Interview Questions |
| Slug | `top-10-api-testing-interview-questions` |
| Category | Testing |
| Tags | API, Postman, SDET |
| Status | Draft or Published |

### URL Rules

Public articles should use clean URLs such as:

```text
/blog/playwright-interview-questions
/blog/api-testing-guide
/blog/python-coding-questions
```

Slugs must be unique, lowercase, readable, and validated before saving.

## SEO Management

Every post should have an SEO panel containing:

- SEO title
- Meta description
- Focus keyword
- Canonical URL
- Robots index setting
- Open Graph title
- Open Graph description
- Open Graph image
- Twitter card settings
- Schema type
- FAQ schema data

The public blog page should generate:

```html
<title>...</title>
<meta name="description" content="...">
<link rel="canonical" href="...">
<script type="application/ld+json">...</script>
```

Use Next.js `generateMetadata` and validate generated schema before publishing.

## Media Management

- Upload images from the admin panel.
- Validate file type and file size.
- Resize large images automatically.
- Convert supported images to WebP or AVIF.
- Generate or request descriptive alt text.
- Select a featured image for each article.
- Store files in object storage rather than local deployment storage.
- Keep the original filename and a safe generated storage key.

Example storage path:

```text
/articles/api-testing/featured.webp
```

## Dashboard and Analytics

The dashboard should display:

- Total posts
- Published posts
- Draft posts
- Scheduled posts
- Total views
- Top keywords
- Recent articles
- Most-read articles
- Publishing activity

Integrations can be added for Google Analytics and Google Search Console after the core publishing workflow is stable.

## AI Blog Generator

The admin panel may include a **Generate with AI** workflow with these inputs:

- Keyword
- Tone
- Target length
- Audience
- Category

The generator may produce:

- Draft article content
- SEO title
- Meta description
- Focus keyword suggestions
- Tags
- FAQ schema draft

AI output must always be saved as a draft for human review. It must not publish automatically, and API keys must remain server-side.

## Categories

Initial categories:

- Technology
- QA Automation
- Playwright
- API Testing
- AWS
- DevOps
- Security Testing
- Generative AI
- Jobs

Categories and tags should be editable from the admin panel and use unique slugs.

## Social Sharing

After publishing, provide share actions for:

- WhatsApp
- Telegram
- LinkedIn
- Facebook

Sharing should use the final canonical URL and should not expose private admin data.

## Generated Site Files

The public application should generate or serve:

- `sitemap.xml`
- `robots.txt`
- RSS feed
- Canonical article URLs
- Open Graph metadata
- JSON-LD structured data

## Suggested Project Structure

```text
cms/
├── src/
│   ├── app/
│   │   ├── admin/
│   │   │   ├── dashboard/
│   │   │   ├── posts/
│   │   │   ├── categories/
│   │   │   ├── media/
│   │   │   ├── seo/
│   │   │   └── settings/
│   │   ├── api/
│   │   │   ├── auth/
│   │   │   ├── posts/
│   │   │   └── upload/
│   │   └── blog/[slug]/
│   ├── components/
│   │   ├── AdminSidebar.tsx
│   │   ├── DashboardStats.tsx
│   │   ├── PostEditor.tsx
│   │   └── SeoPanel.tsx
│   └── lib/
│       ├── auth.ts
│       ├── db.ts
│       └── seo.ts
├── prisma/
│   └── schema.prisma
└── middleware.ts
```

## Core Data Model

Minimum entities:

- User
- Post
- Category
- Tag
- Media
- SEO metadata
- Analytics event
- Comment

Suggested post fields:

| Field | Purpose |
|---|---|
| `id` | Unique post identifier |
| `title` | Public article title |
| `slug` | Unique public URL segment |
| `content` | Rich text article content |
| `status` | Draft, scheduled, or published |
| `metaTitle` | SEO title |
| `metaDescription` | Search description |
| `focusKeyword` | Primary search phrase |
| `canonicalUrl` | Preferred public URL |
| `featuredImage` | Featured media reference |
| `publishedAt` | Publication time |
| `createdAt` | Creation time |
| `updatedAt` | Last update time |

## Security Requirements

- Validate and sanitize rich text content.
- Check authorization on the server for every mutation.
- Rate-limit OTP requests and login attempts.
- Validate uploaded file types and sizes.
- Generate slugs on the server and prevent collisions.
- Protect admin routes with middleware and server-side session checks.
- Keep database credentials, Firebase keys, AI keys, and storage credentials in environment variables.
- Add audit logging for publish, delete, and settings actions.
- Use soft delete or recovery for posts where practical.

## Implementation Phases

### Phase 1: Foundation

- Create the separate Next.js 15 application.
- Configure TypeScript, Tailwind, Prisma, and PostgreSQL.
- Add environment variable validation.
- Add the admin layout and protected route structure.

### Phase 2: Authentication

- Configure Firebase phone OTP.
- Add approved-phone authorization.
- Add secure server-side sessions.
- Add logout and rate limiting.

### Phase 3: Publishing

- Add post CRUD operations.
- Add slug generation and validation.
- Add draft, preview, publish, and schedule workflows.
- Add categories and tags.

### Phase 4: SEO and Media

- Add the SEO panel and `generateMetadata`.
- Add image upload, resizing, and WebP conversion.
- Add sitemap, robots, RSS, and JSON-LD generation.

### Phase 5: Analytics and Automation

- Add dashboard metrics.
- Add social sharing.
- Add Google Analytics and Search Console integrations.
- Add AI-assisted draft generation with human approval.

## Acceptance Criteria

- Only the configured administrator can access `/admin`.
- A draft can be created, edited, previewed, and autosaved.
- A post can be published at an editable unique slug.
- Public pages expose correct title, description, canonical URL, and schema.
- Featured images render with useful alt text and optimized formats.
- Sitemap and RSS include published posts only.
- Draft and scheduled posts are never publicly accessible before publication.
- Existing MkDocs documentation continues to build successfully.
