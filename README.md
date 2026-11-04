# LIFETIME EARNING

LIFETIME EARNING is a Hausa-first rewards platform prototype for tasks, referrals, points, wallet activity, and withdrawal requests. It is currently deployed as a static site on GitHub Pages and uses Supabase for authentication and application data.

## Live site

- GitHub repository: <https://github.com/Naskid98/LIFETIME-EARNING->
- GitHub Pages: <https://naskid98.github.io/LIFETIME-EARNING-/>

## Current features

- Hausa, English, French, and Arabic interface support.
- Arabic right-to-left layout.
- Supabase email registration, login, logout, and password recovery.
- User profile and dashboard.
- Dynamic tasks and task-submission review flow.
- Referral code and referral link flow.
- Points ledger and points-to-wallet conversion.
- Wallet balance and withdrawal requests.
- Admin dashboard for tasks, task reviews, newsletters, users, and withdrawals.
- GitHub Pages deployment from the `main` branch.

## Local preview

This is a static frontend, so it can be previewed with any static web server:

```bash
python3 -m http.server 8080
```

Then open <http://localhost:8080/>.

Do not open the HTML file directly when testing authentication; use HTTP so browser storage and redirects behave consistently.

## Supabase requirements

The frontend expects the Supabase project configured in `index.html` and calls the following tables:

- `profiles`
- `wallets`
- `wallet_transactions`
- `withdrawal_requests`
- `referral_codes`
- `referrals`
- `points_ledger`
- `tasks`
- `task_submissions`
- `newsletters`

It also expects these RPC functions:

- `is_app_admin`
- `convert_points_to_wallet`
- `request_withdrawal`
- `admin_dashboard_stats`
- `admin_review_task_submission`
- `admin_review_withdrawal`
- `admin_mark_withdrawal_paid`
- `submit_task_for_review`

The SQL schema and RLS policies must be kept in Supabase migrations before the app is treated as production-ready. Never place a Supabase `service_role` key in this public frontend.

## Important current limitations

- Watch Ads is a UI placeholder; no ad provider is connected yet.
- Withdrawals create requests for admin review; automatic bank payment is not connected.
- Production security depends on correct Supabase RLS policies and server-side RPC validation.
- The reward rules, fraud controls, and payment operations still need a documented production policy.

## Testing checklist

See [`docs/IMPLEMENTATION-CHECKLIST.md`](docs/IMPLEMENTATION-CHECKLIST.md) for the database, security, functional, and deployment checks that remain.

## Deployment

GitHub Pages is configured to publish the root of the `main` branch. A push to `main` updates the live site after the Pages build completes.
