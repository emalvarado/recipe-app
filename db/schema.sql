CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_email character varying(50),
    user_hash text
);

CREATE TABLE "public"."recipe" (
    "recipe_id" serial,
    "user_id" integer,
    "rec_method" text,
    "rec_date" date,
    "rec_nutrition" text,
    PRIMARY KEY ("recipe_id"),
    FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id")
);

CREATE TABLE "public"."ingredient" (
    "ing_id" serial,
    "recipe_id" integer,
    "ing_name" varchar(100),
    "ing_quant" decimal(3,2),
    "ing_measurement" varchar(20),
    PRIMARY KEY ("ing_id"),
    FOREIGN KEY ("recipe_id") REFERENCES "public"."recipe"("recipe_id")
);
COMMENT ON COLUMN "public"."ingredient"."ing_measurement" IS 'add drop down on front-end with preset values';

CREATE TABLE "public"."tag" (
    "tag_id" serial,
    "recipe_id" integer,
    "tag_name" varchar(50),
    PRIMARY KEY ("tag_id"),
    FOREIGN KEY ("recipe_id") REFERENCES "public"."recipe"("recipe_id")
);




INSERT INTO "public"."users"("user_email", "user_hash") VALUES('test1', 'test1') RETURNING "user_id", "user_email", "user_hash";
INSERT INTO "public"."users"("user_email", "user_hash") VALUES('test2', 'test2') RETURNING "user_id", "user_email", "user_hash";


INSERT INTO "public"."recipe"("user_id", "rec_method", "rec_nutrition") VALUES(1, '1. step 1 2. another step 3. the next step', 'calories: 500 protein: 30g') RETURNING "recipe_id", "user_id", "rec_method", "rec_date", "rec_nutrition";
INSERT INTO "public"."recipe"("user_id", "rec_method", "rec_date", "rec_nutrition") VALUES(1, '1. a step 2. another step 3. the 3rd step', '1/7/19', 'calories: 300 carbs: 30g') RETURNING "recipe_id", "user_id", "rec_method", "rec_date", "rec_nutrition";
INSERT INTO "public"."recipe"("user_id", "rec_method", "rec_date", "rec_nutrition") VALUES(2, '1. first step 2. the second 3. another one', '8/20/18', 'calories: 200 fat: 20g') RETURNING "recipe_id", "user_id", "rec_method", "rec_date", "rec_nutrition";


INSERT INTO "public"."tag"("recipe_id", "tag_name") VALUES(1, 'dinner') RETURNING "tag_id", "recipe_id", "tag_name";
INSERT INTO "public"."tag"("recipe_id", "tag_name") VALUES(1, 'healthy') RETURNING "tag_id", "recipe_id", "tag_name";
INSERT INTO "public"."tag"("recipe_id", "tag_name") VALUES(2, 'snack') RETURNING "tag_id", "recipe_id", "tag_name";
INSERT INTO "public"."tag"("recipe_id", "tag_name") VALUES(3, 'breakfast') RETURNING "tag_id", "recipe_id", "tag_name";
INSERT INTO "public"."tag"("recipe_id", "tag_name") VALUES(2, 'breakfast') RETURNING "tag_id", "recipe_id", "tag_name";


INSERT INTO "public"."ingredient" VALUES(DEFAULT) RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant") VALUES(1, 1, 'eggs', 2) RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement") VALUES(2, 1, 'bacon', 0.5, 'lb') RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant") VALUES(3, 1, 'avocados', 1) RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement") VALUES(4, 2, 'lettuce', 1, 'cup') RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant") VALUES(5, 2, 'tomato', 1) RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement") VALUES(6, 2, 'bacon', 0.25, 'lb') RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement") VALUES(7, 3, 'cinnamon', 0.5, 'tsp') RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement") VALUES(8, 3, 'salt', 1, 'pinch') RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
INSERT INTO "public"."ingredient"("ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement") VALUES(9, 3, 'flour', 2, 'cup') RETURNING "ing_id", "recipe_id", "ing_name", "ing_quant", "ing_measurement";
