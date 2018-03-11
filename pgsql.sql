DROP TABLE IF EXISTS "event_streams";
CREATE TABLE "event_streams" (
  "no"               BIGINT                 NOT NULL PRIMARY KEY,
  "real_stream_name" CHARACTER VARYING(150) NOT NULL,
  "stream_name"      CHARACTER VARYING(41)  NOT NULL,
  "metadata"         JSONB                  DEFAULT NULL,
  "category"         CHARACTER VARYING(150) DEFAULT NULL,
  CONSTRAINT "real_stream_name_unique" UNIQUE ("real_stream_name")
);
CREATE INDEX "ix_cat"
  ON "event_streams" ("category");

DROP TABLE IF EXISTS "projections";
CREATE TABLE "projections" (
  "no"           BIGINT                 NOT NULL PRIMARY KEY,
  "name"         CHARACTER VARYING(150) NOT NULL,
  "position"     JSONB                 DEFAULT NULL,
  "state"        JSONB                 DEFAULT NULL,
  "status"       CHARACTER VARYING(28)  NOT NULL,
  "locked_until" CHARACTER VARYING(26) DEFAULT NULL,
  CONSTRAINT "name_unique" UNIQUE ("name")
);

DROP TABLE IF EXISTS "read_users";
CREATE TABLE "read_users" (
  "id"       INT NOT NULL PRIMARY KEY,
  "email"    CHARACTER VARYING(45) DEFAULT NULL,
  "password" CHARACTER VARYING(45) DEFAULT NULL
);

DROP TABLE IF EXISTS "snapshots";
CREATE TABLE "snapshots" (
  "aggregate_id"   CHARACTER VARYING(150) NOT NULL,
  "aggregate_type" CHARACTER VARYING(150) NOT NULL,
  "last_version"   INT                    NOT NULL,
  "created_at"     CHARACTER VARYING(26)  NOT NULL,
  "aggregate_root" BYTEA,
  CONSTRAINT "aggregate_id_unique" UNIQUE ("aggregate_id")
);