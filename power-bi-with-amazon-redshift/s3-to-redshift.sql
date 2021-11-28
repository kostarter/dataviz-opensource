COPY public.customer 
FROM 's3://m2i-redshift-sample/tpch-data/customer/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.nation
FROM 's3://m2i-redshift-sample/tpch-data/nation/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.part
FROM 's3://m2i-redshift-sample/tpch-data/part/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.partsupp
FROM 's3://m2i-redshift-sample/tpch-data/partsupp/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.region
FROM 's3://m2i-redshift-sample/tpch-data/region/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.supplier
FROM 's3://m2i-redshift-sample/tpch-data/supplier/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.orders
FROM 's3://m2i-redshift-sample/tpch-data/orders/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

COPY public.lineitem 
FROM 's3://m2i-redshift-sample/tpch-data/lineitem/'
CREDENTIALS 'aws_access_key_id=<aws_access_key_id>;aws_secret_access_key=<aws_secret_access_key>';

SELECT COUNT(*) FROM public.customer; 
SELECT COUNT(*) FROM public.nation;
SELECT COUNT(*) FROM public.part;
SELECT COUNT(*) FROM public.partsupp;
SELECT COUNT(*) FROM public.region;
SELECT COUNT(*) FROM public.supplier;
SELECT COUNT(*) FROM public.orders;
SELECT COUNT(*) FROM public.lineitem;

SELECT n_name, COUNT(c_custkey) numOfCustomers
FROM nation n 
INNER JOIN customer c on n.n_nationkey = c.c_nationkey
GROUP BY n_name
ORDER BY n_name;
