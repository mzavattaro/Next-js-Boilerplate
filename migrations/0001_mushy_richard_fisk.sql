CREATE TABLE IF NOT EXISTS "secondGuestbook" (
	"id" serial NOT NULL,
	"username" text NOT NULL,
	"body" text NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
