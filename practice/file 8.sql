CREATE TABLE pairs(
     A INT,
     B INT
);

INSERT INTO pairs
        VALUES(1,2),(2,4),(2,1),(3,2),(4,2),(5,6),(6,5),(7,8);
        
SELECT * FROM pairs;

-- METHOD 1 - JOINS
SELECT lt.* FROM pairs lt LEFT JOIN pairs rt ON lt.A = rt.B AND lt.B = rt.A
           WHERE rt.A is NULL OR lt.A < rt.A;
