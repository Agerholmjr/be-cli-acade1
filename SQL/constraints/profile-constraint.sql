-- Adds foreign key constraints to auth profile table

ALTER TABLE public.profile DROP CONSTRAINT IF EXISTS fk_private_profile_auth;
ALTER TABLE public.profile ADD CONSTRAINT fk_private_profile_auth FOREIGN KEY (id) REFERENCES auth.users (id);

-- Adds foreign key constraints to auth fitnessprofile table

ALTER TABLE public.fitnessprofile DROP CONSTRAINT IF EXISTS fk_private_profile_auth;
ALTER TABLE public.fitnessprofile ADD CONSTRAINT fk_private_profile_auth FOREIGN KEY (id) REFERENCES auth.users (id);