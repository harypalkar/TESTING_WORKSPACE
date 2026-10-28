# NGO Connect — Live Demo

A self-contained, responsive demonstration of an NGO Management & Transparency Platform for Indian NGOs, charitable trusts, foundations, and social-welfare organizations.

## Deployment

This repository contains the complete browser-based demo and is ready for static hosting. Import it into Vercel, Netlify, Cloudflare Pages, or enable GitHub Pages from the repository root.

The earlier Bharat-owned Vercel URL is intentionally not listed here because this repository belongs to `harypalkar`.

## Demo accounts

All demo accounts use the password: `Demo@123`

| Role | Email |
|---|---|
| Platform Super Admin | `superadmin@ngoconnect.demo` |
| NGO Administrator | `admin@aarohan.demo` |
| Finance Manager | `finance@aarohan.demo` |
| Activity Manager | `staff@aarohan.demo` |
| Donor | `donor@ngoconnect.demo` |

The login page also has one-click role access.

## Included workflows

- Platform dashboard and NGO registration review
- NGO approval, rejection, suspension, and reopening
- Role-aware NGO, finance, activity-manager, donor, and Super Admin experiences
- Donation transaction ledger with successful, pending, failed, and refunded states
- Simulated payment flow with duplicate-reference protection
- General-fund and activity-specific donation allocation
- Activity budgets, progress, milestones, and financial summaries
- Expense submission, approval, rejection, budget-limit enforcement, and payment recording
- Donation receipt preview and generated PDF download
- Legal-document metadata, versions, review status, and expiry reminders
- Team membership and role management
- Public NGO profiles, activities, and donation journey
- KPI dashboards, charts, CSV exports, audit log, notifications, and resettable demo data
- Responsive desktop and mobile layouts

## Run locally

The application has no package-manager dependencies. Serve the folder over HTTP:

```bash
python3 -m http.server 8080
```

Then open `http://localhost:8080`.

Opening `index.html` directly may also work, but an HTTP server is recommended.

## Data and security notice

This is a client-side live demonstration. Demo data persists in the current browser through `localStorage` and can be restored using **Reset Demo Data**. Identities, NGO registrations, documents, statutory references, transactions, and receipts are fictional.

Mock payments do not transfer money. No raw card details, UPI PINs, bank passwords, OAuth secrets, or production credentials are included.

## Production implementation boundary

A production deployment still requires the server-side Java 21 / Spring Boot 3.5 application, PostgreSQL persistence, tenant-scoped authorization, secure object storage, Google OpenID Connect, Razorpay webhook verification, email delivery, database migrations, backups, and automated backend/frontend test suites. The current package is intended for client demonstrations and workflow validation.

## Source integrity

`SOURCE_SHA256.txt` records the SHA-256 digest of the verified original single-file demo before it was packaged into browser-loadable payload chunks for GitHub.
