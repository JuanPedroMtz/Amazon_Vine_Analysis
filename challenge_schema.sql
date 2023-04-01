CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT,
  star_rating CHAR(50),
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);


SELECT vt.review_id,
vt.total_votes,
vt.helpful_votes
INTO helpful_votes
FROM vine_table as vt
WHERE (vt.total_votes > 20);

SELECT hv.review_id,
hv.total_votes,
hv.helpful_votes
INTO helpful_votes_percentage
FROM helpful_votes as hv
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

SELECT vt.review_id,
vt.vine,
vt.star_rating
INTO paid_program
FROM vine_table as vt
WHERE vt.vine = 'Y';

SELECT vt.review_id,
vt.vine,
vt.star_rating
INTO unpaid_program
FROM vine_table as vt
WHERE vt.vine = 'N';

SELECT vt.review_id,
vt.star_rating,
vt.vine
INTO five_stars
FROM vine_table as vt
WHERE vt.star_rating = '5';

SELECT fs.review_id
select * from vine_table