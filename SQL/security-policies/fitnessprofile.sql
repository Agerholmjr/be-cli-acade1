ALTER TABLE public.fitnessprofile ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS fitnessprofile_select on public.fitnessprofile;
CREATE POLICY fitnessprofile_select
ON public.fitnessprofile
AS PERMISSIVE
FOR SELECT TO authenticated USING (
  auth.uid() = id
);

DROP POLICY IF EXISTS fitnessprofile_update on public.fitnessprofile;
CREATE POLICY fitnessprofile_update
ON public.fitnessprofile
AS PERMISSIVE
FOR UPDATE TO authenticated USING (
  auth.uid() = id
)
WITH CHECK (
  auth.uid() = id
);

DROP POLICY IF EXISTS fitnessprofile_insert on public.fitnessprofile;
CREATE POLICY fitnessprofile_insert
ON public.fitnessprofile
AS PERMISSIVE
FOR INSERT TO authenticated 
WITH CHECK (
  auth.uid() = id
);

DROP POLICY IF EXISTS fitnessprofile_delete on public.fitnessprofile;
CREATE POLICY fitnessprofile_delete
ON public.fitnessprofile
AS PERMISSIVE
FOR DELETE TO authenticated 
USING (
  auth.uid() = id
);

