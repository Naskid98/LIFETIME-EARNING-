-- Prevent the same points-conversion request from crediting a wallet twice.
-- This migration is intentionally fail-safe: if historical duplicates exist,
-- it stops before creating the unique index so the data can be reviewed first.

DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM public.points_ledger
    WHERE event_key IS NOT NULL
    GROUP BY event_key
    HAVING COUNT(*) > 1
  ) THEN
    RAISE EXCEPTION
      'Cannot create points_ledger event_key guard: duplicate event_key values already exist.';
  END IF;
END
$$;

CREATE UNIQUE INDEX IF NOT EXISTS points_ledger_event_key_unique
  ON public.points_ledger (event_key)
  WHERE event_key IS NOT NULL;

COMMENT ON INDEX public.points_ledger_event_key_unique IS
  'Prevents replaying the same points conversion or other idempotent ledger event.';
