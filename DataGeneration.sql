--INSERT INTO dbo.Customer(CustomerId, CustomerFirstName, CustomerLastName)
--	VALUES
--	(1, 'Golder','Doki'),
--	(2, 'Hannah','Mayinza'),
--	(3, 'Collins','Tamale'),
--	(4, 'Kirabo','Atuhurira'),
--	(5, 'Lugonvu','Muna'),
--	(6, 'Raziah','Adite'),
--	(7, 'Daisy','Ainembabazi'),
--	(8, 'Sheila','Musinguzi'),
--	(9, 'Leilah','Nabuuso'),
--	(10, 'Mary','Akoth');

--INSERT INTO dbo.Address(AddressId, DeliveryAddress1, DeliveryAddress2, DeliveryCity, DeliveryZipCode)
--	VALUES
--	(1, 'Mutundwe', 'Uganda','Kampala','00256'),
--	(2, 'Zana', 'Uganda','Entebbe','00256'),
--	(3, 'Matuga', 'Uganda','Wakiso','00256'),
--	(4, 'Lakwit', 'Uganda','Gulu','00256'),
--	(5, 'Isingiro', 'Uganda','Mbarara','00256');

INSERT INTO dbo.Shift(shiftId, dayOfTheWeek, startTime, endTime)
	VALUES
	(1,'Monday','6:00 am','12:00 pm'),
	(2,'Monday','12:00 pm','6:00 pm'),
	(3,'Monday','6:00 pm','12:00 am'),
	(4,'Tuesday','12:00 am','6:00 am'),
	(5,'Tuesday','6:00 am','12:00 pm'),
	(6,'Tuesday','12:00 pm','6:00 pm'),
	(7,'Tuesday','6:00 pm','12:00 am'),
	(8,'Wednesday','12:00 am','6:00 am'),
	(9,'Wednesday','6:00 am','12:00 pm'),
	(10,'Wednesday','12:00 pm','6:00 pm'),
	(11,'Wednesday','6:00 pm','12:00 am');

