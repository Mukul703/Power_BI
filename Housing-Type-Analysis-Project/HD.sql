SELECT * FROM `nice-plexus-459412-r7.1.Housing Data` LIMIT 1000 ;
create table `nice-plexus-459412-r7.1.Test` As
SELECT * FROM `nice-plexus-459412-r7.1.Housing Data` ;

SELECT * FROM `nice-plexus-459412-r7.1.Test` LIMIT 1000 ;

SELECT sales_type,AVG(purchase_price) FROM `nice-plexus-459412-r7.1.Test`
group by sales_type;

update `nice-plexus-459412-r7.1.Test` set sqm = 100 where no_rooms = 3;  