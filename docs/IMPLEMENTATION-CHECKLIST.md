# Implementation checklist

## Completed in the frontend

- [x] Responsive landing page
- [x] Hausa, English, French, and Arabic UI
- [x] Arabic RTL support
- [x] Register/login/logout screens
- [x] Password recovery screens
- [x] User dashboard
- [x] Tasks and task-submission screens
- [x] Referral link UI
- [x] Points conversion UI
- [x] Wallet and withdrawal UI
- [x] Admin dashboard UI
- [x] GitHub Pages deployment

## Supabase verification still required

- [ ] Confirm every table used by `index.html` exists with the expected columns and data types.
- [ ] Confirm the RPC functions used by the frontend exist and return the expected values.
- [ ] Confirm profile and wallet rows are created automatically after registration.
- [ ] Confirm referral codes are created automatically and are unique.
- [ ] Confirm referral commission is awarded only after email verification and approval of the required tasks.
- [ ] Confirm points conversion is atomic and cannot be replayed.
- [ ] Confirm withdrawal requests reserve/debit funds atomically.
- [ ] Confirm rejected withdrawals refund funds exactly once.

## Prepared database hardening

- [x] Add a fail-safe migration for a unique `points_ledger.event_key` guard against replayed conversions.
- [x] Keep the conversion request ID stable for the duration of a frontend submission and show a clear duplicate-request message.
- [ ] Apply the migration to the Supabase production project and verify there are no historical duplicate event keys.

## Security checks

- [ ] Enable and test Row Level Security on every user-facing table.
- [ ] Ensure users can read only their own profile, wallet, ledger, referrals, submissions, and withdrawals.
- [ ] Ensure only admins can review tasks, review withdrawals, publish newsletters, and manage tasks.
- [ ] Validate all reward and money calculations inside trusted database functions.
- [ ] Add rate limits or abuse controls for registration, task submissions, conversions, and withdrawals.
- [ ] Confirm no `service_role` or private API key is present in the public frontend.
- [ ] Define retention and access rules for bank account details.

## Product completion

- [ ] Choose and integrate an approved ad provider, including verified completion callbacks.
- [ ] Decide between manual bank transfer and a payment provider for withdrawals.
- [ ] Add payment reference/proof and reconciliation workflow.
- [ ] Publish reward, referral, withdrawal, fraud, and dispute policies.
- [ ] Add user-facing Terms of Service and Privacy Policy.

## Functional testing

- [ ] Register a new user and verify the email flow.
- [ ] Log in and confirm profile, wallet, points, and referral data load.
- [ ] Submit each required task and review it as admin.
- [ ] Confirm approval updates points exactly once.
- [ ] Convert points and confirm the ledger and wallet transaction are consistent.
- [ ] Create, approve, reject, and mark a withdrawal as paid.
- [ ] Confirm a rejected withdrawal is refunded only once.
- [ ] Test referral registration and commission qualification.
- [ ] Test password recovery with both valid and invalid tokens.
- [ ] Test mobile layout and all four languages.

## Release checks

- [x] Add a real Supabase migration/schema file to the repository.
- [ ] Add a staging project or test data strategy.
- [ ] Run browser smoke tests before every release.
- [ ] Review the public Git history for accidental secrets.
- [ ] Confirm GitHub Pages is built from the intended branch and path.
- [ ] Record the deployed commit SHA in the release notes.
