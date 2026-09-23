# Custom Blog CMS Requirements

A private WordPress-style CMS for publishing SEO-friendly articles alongside the Neeshu Learning Hub.

## Recommended Stack

- **Frontend:** Next.js 15, App Router, TypeScript, Tailwind CSS
- **Editor:** Tiptap
- **Backend:** Next.js Route Handlers or Node.js
- **Database:** PostgreSQL with Prisma
- **Authentication:** Firebase Phone OTP with server-side authorization
- **Storage:** Managed object storage for optimized images
- **Deployment:** Vercel and managed PostgreSQL

The CMS should remain a separate `admin/` application while the existing MkDocs site continues to serve learning documentation.

## Authentication

- Phone OTP login only
- No public registration
- One approved administrator
- Server-side authorization on every admin route and API request
- Secure HTTP-only sessions
- Rate limiting for OTP and login requests
- Approved phone number stored as a deployment secret

```env
ALLOWED_ADMIN_PHONE=+91XXXXXXXXXX
```

The placeholder must be replaced through deployment secrets before production use.

## Admin Menu

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

Posts should support:

- Title and editable unique slug
- Category and tags
- Rich text content
- Featured image and alt text
- Draft, scheduled, and published status
- Autosave and preview
- Related articles
- Table of contents
- Breadcrumb metadata
- FAQ schema

Example public URLs:

```text
/blog/playwright-interview-questions
/blog/api-testing-guide
/blog/python-coding-questions
```

## SEO Fields

Each post should have:

- SEO title
- Meta description
- Focus keyword
- Canonical URL
- Robots index setting
- Open Graph title, description, and image
- Twitter card settings
- Schema type and FAQ schema data

The public page should generate title, description, canonical, Open Graph, and JSON-LD metadata through Next.js `generateMetadata`.

## Media Management

- Upload and validate image files
- Enforce file type and size limits
- Resize large images
- Convert supported files to WebP or AVIF
- Generate descriptive alt text
- Select a featured image
- Store media in object storage

Example path:

```text
/articles/api-testing/featured.webp
```

## Dashboard and Integrations

Display total posts, published posts, drafts, scheduled posts, views, top keywords, recent articles, and most-read articles.

Planned integrations:

- Google Analytics
- Google Search Console
- WhatsApp, Telegram, LinkedIn, and Facebook sharing
- Sitemap, `robots.txt`, and RSS generation
- AdSense-ready layouts

## AI Blog Generator

Inputs:

- Keyword
- Tone
- Target length
- Audience
- Category

Generated output may include article content, SEO title, meta description, focus keyword suggestions, tags, and FAQ schema. AI output must always be saved as a draft for human review and must never publish automatically.

## Data Model

Core entities:

- User
- Post
- Category
- Tag
- Media
- SEO metadata
- Analytics event
- Comment

Important post fields include `title`, `slug`, `content`, `status`, `metaTitle`, `metaDescription`, `focusKeyword`, `canonicalUrl`, `featuredImage`, `publishedAt`, `createdAt`, and `updatedAt`.

## Suggested Structure

```text
admin/
├── src/app/admin/
│   ├── dashboard/
│   ├── posts/
│   ├── categories/
│   ├── media/
│   ├── seo/
│   └── settings/
├── src/app/api/
│   ├── auth/
│   ├── posts/
│   └── upload/
├── src/app/blog/[slug]/
├── src/components/
├── src/lib/
├── prisma/schema.prisma
└── middleware.ts
```

## Security Rules

- Sanitize rich text content.
- Validate all server inputs.
- Protect every admin mutation with server-side authorization.
- Validate upload types and sizes.
- Keep database, Firebase, AI, and storage credentials out of source control.
- Add audit logs for publish, delete, and settings actions.
- Use soft delete or recovery where practical.

## Implementation Phases

1. Create the separate Next.js application and configure Prisma.
2. Add Firebase OTP and protected admin sessions.
3. Implement post CRUD, slugs, drafts, previews, and publishing.
4. Add categories, tags, media, SEO metadata, sitemap, and RSS.
5. Add analytics, social sharing, and AI-assisted draft generation.

## Acceptance Criteria

- Only the configured administrator can access `/admin`.
- Posts can be drafted, autosaved, previewed, scheduled, and published.
- Published posts have unique editable URLs and valid SEO metadata.
- Drafts and scheduled posts remain private until publication.
- Images are validated and optimized.
- The existing MkDocs site continues to pass `python -m mkdocs build --strict`.
