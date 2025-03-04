CREATE TYPE "public"."borrow_status" AS ENUM('Borrowed', 'Returned');--> statement-breakpoint
CREATE TYPE "public"."role" AS ENUM('User', 'Admin');--> statement-breakpoint
CREATE TYPE "public"."status" AS ENUM('Pending', 'Approved', 'Rejected');--> statement-breakpoint
CREATE TABLE "users" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"full_name" varchar(255) NOT NULL,
	"email" text NOT NULL,
	"university_id" integer NOT NULL,
	"password" text NOT NULL,
	"university_card" text NOT NULL,
	"status" "status" DEFAULT 'Pending',
	"role" "role" DEFAULT 'User',
	"last_activity_date" date DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "users_id_unique" UNIQUE("id"),
	CONSTRAINT "users_email_unique" UNIQUE("email"),
	CONSTRAINT "users_university_id_unique" UNIQUE("university_id")
);
