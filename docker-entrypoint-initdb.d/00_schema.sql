CREATE DATABASE db;
\connect db;
DROP TABLE IF EXISTS "items";
CREATE TABLE IF NOT EXISTS "items" (
    "id" BIGSERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "created" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "items"("name") VALUES
(gen_random_uuid()::text),
(gen_random_uuid()::text),
(gen_random_uuid()::text),
(gen_random_uuid()::text),
(gen_random_uuid()::text);
