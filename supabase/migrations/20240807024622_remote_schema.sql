create extension if not exists "hypopg" with schema "extensions";
create extension if not exists "index_advisor" with schema "extensions";
create type if not exists "public"."rooms_status" as enum ('NONE', 'READY', 'RUN', 'CLOSED');
CREATE TABLE IF NOT EXISTS "public"."rooms" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "screenplay" "uuid" NOT NULL,
    "status" rooms_status not null default 'NONE'::rooms_status
);
ALTER TABLE "public"."rooms" OWNER TO "postgres";
CREATE TABLE IF NOT EXISTS "public"."screenplays" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "created_by" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "display_name" character varying NOT NULL,
    "display_description" "text" NOT NULL
);
ALTER TABLE "public"."screenplays" OWNER TO "postgres";
ALTER TABLE ONLY "public"."rooms"
ADD CONSTRAINT "rooms_pkey" PRIMARY KEY ("id");
ALTER TABLE ONLY "public"."screenplays"
ADD CONSTRAINT "screenplays_pkey" PRIMARY KEY ("id");
ALTER TABLE ONLY "public"."rooms"
ADD CONSTRAINT "rooms_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id");
ALTER TABLE ONLY "public"."rooms"
ADD CONSTRAINT "rooms_screenplay_fkey" FOREIGN KEY ("screenplay") REFERENCES "public"."screenplays"("id");
ALTER TABLE ONLY "public"."screenplays"
ADD CONSTRAINT "screenplays_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "auth"."users"("id");
CREATE POLICY "Enable insert for authenticated users only" ON "public"."screenplays" FOR
INSERT TO "authenticated" WITH CHECK (true);
CREATE POLICY "Enable read access for all users" ON "public"."rooms" FOR
SELECT TO "authenticated" USING (true);
CREATE POLICY "Enable update for users" ON "public"."screenplays" FOR
UPDATE TO "authenticated" USING (
        (
            (
                SELECT "auth"."uid"() AS "uid"
            ) = "created_by"
        )
    ) WITH CHECK (
        (
            (
                SELECT "auth"."uid"() AS "uid"
            ) = "created_by"
        )
    );
ALTER TABLE "public"."rooms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "public"."screenplays" ENABLE ROW LEVEL SECURITY;
ALTER PUBLICATION "supabase_realtime"
ADD TABLE ONLY "public"."rooms";
RESET ALL;