Create Table assignment1
(
Sender_id int,
Receiver_id int,
Amount int,
Transaction_date date
)
INSERT assignment1 VALUES
(55, 22, 500, '2021-05-18'),
(11, 33, 350, '2021-05-19'),
(22, 11, 650, '2021-05-19'),
(22, 33, 900, '2021-05-20'),
(33, 11, 500, '2021-05-21'),
(33, 22, 750, '2021-05-21'),
(11, 44, 300,  '2021-05-22')

--	Sum amounts for each sender (debits) and receiver (credits),

select Sender_ID, SUM (Amount) As Sender
from Transactions
group by Sender_ID;


select Receiver_ID, SUM (Amount) As Receiver
from Transactions
group by Receiver_ID

--Full (outer) join debits and credits tables on account id, taking net change as difference between credits and debits, coercing nulls to zeros with coalesce()

SELECT	*
FROM	(
		SELECT	sender_id, SUM(amount) AS send_amount
		FROM	assignment1
		GROUP BY sender_id
		) S
FULL OUTER JOIN	
		(
		SELECT	receiver_id, SUM(amount) AS receive_amount
		FROM	assignment1
		GROUP BY receiver_id
		) R
ON		S.Sender_id = R.receiver_id