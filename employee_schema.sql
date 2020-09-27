-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/opiuSG
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Department" (
    "Dept_no" varchar   NOT NULL,
    "Dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_emp" (
    "Emp_no" int   NOT NULL,
    "Dept_no" varchar   NOT NULL
);

CREATE TABLE "Dept_manager" (
    "Dept_no" varchar   NOT NULL,
    "Emp_no" int   NOT NULL
);

CREATE TABLE "Empolyees" (
    "Emp_no" int   NOT NULL,
    "Emp_title" varchar   NOT NULL,
    "Birthday" date   NOT NULL,
    "First_name" varchar   NOT NULL,
    "Last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "Hire_date" date   NOT NULL,
    CONSTRAINT "pk_Empolyees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Salaries" (
    "Emp_no" int   NOT NULL,
    "Salary" int   NOT NULL
);

CREATE TABLE "Titles" (
    "Title_id" varchar   NOT NULL,
    "Title" varchar   NOT NULL
);

ALTER TABLE "Department" ADD CONSTRAINT "fk_Department_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Dept_emp" ("Dept_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Empolyees" ("Emp_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Department" ("Dept_no");

ALTER TABLE "Empolyees" ADD CONSTRAINT "fk_Empolyees_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Dept_manager" ("Emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "Empolyees" ("Emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Title_id" FOREIGN KEY("Title_id")
REFERENCES "Empolyees" ("Emp_title");

