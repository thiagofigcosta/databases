-- View car's kms
SELECT C.id,C.brand,C.model,SUM(S.km_driven) FROM cars C INNER JOIN service_car_transport S ON C.id=S.id_car GROUP BY C.id ORDER BY C.id;

-- NOTES: very confuse query requests on guidelines

-- Employees
--- View his/her missions and their status
SELECT S.firstname, S.class, M.name, A.status FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE S.class='E' ORDER BY S.id;

--- Create new missions
INSERT INTO mission (start_at, end_at, name, description, id_dst_address, id_department) VALUES --create mission
    --just need to change the values
	($START,$END,$NAME,$DESCRIPTION,$ADDRID,(SELECT id FROM department WHERE name='$DEPARTNAME')); -- just replace the following:
                                                                                                    -- $START by start mission date
                                                                                                    -- $END by end mission date
                                                                                                    -- $NAME by the mission name
                                                                                                    -- $DESCRIPTION by mission description
                                                                                                    -- $ADDRID by destination address ID
                                                                                                    -- $DEPARTNAME by department name
INSERT INTO mission_staff (id_mission, id_staff) VALUES -- add employee
    --just need to change the values
	($X,$ID); -- replace $X by created mission id and $ID by the employee ID

--- View, modify, delete ongoing missions
----view
SELECT S.firstname, S.class, M.name, A.status FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE S.class='E' ORDER BY S.id;
----modify
UPDATE mission SET $COLUMN = $NEWVALUE WHERE id=$ID AND class='E'; -- replace $COLUMN by the desired field, $NEWVALUE by the new value, $ID by the id of the row to be updated
----delete
DELETE FROM mission WHERE id=$ID AND class='E'; -- replace $ID by the id of the entry to be removed

--- View, modify, delete personal information
----view
SELECT * FROM staff WHERE id=$ID AND class='E'; -- replace $ID by the employee id
----modify
UPDATE staff SET $COLUMN = $NEWVALUE WHERE id=$ID AND class='E'; -- replace $COLUMN by the desired field, $NEWVALUE by the new value, $ID by the staff id
----delete
DELETE FROM staff WHERE id=$ID AND class='E'; -- replace $ID by the id of the entry to be removed

-- Head of service
--- View his/her missions and their status
SELECT S.firstname, S.class, M.name, A.status FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE S.class='H' ORDER BY S.id;

--- Create new missions
INSERT INTO mission (start_at, end_at, name, description, id_dst_address, id_department) VALUES --create mission
    --just need to change the values
	($START,$END,$NAME,$DESCRIPTION,$ADDRID,(SELECT id FROM department WHERE name='$DEPARTNAME')); -- just replace the following:
                                                                                                    -- $START by start mission date
                                                                                                    -- $END by end mission date
                                                                                                    -- $NAME by the mission name
                                                                                                    -- $DESCRIPTION by mission description
                                                                                                    -- $ADDRID by destination address ID
                                                                                                    -- $DEPARTNAME by department name
INSERT INTO mission_staff (id_mission, id_staff) VALUES -- add employee
    --just need to change the values
	($X,$ID); -- replace $X by created mission id and $ID by the employee ID

--- View, modify, delete ongoing missions
----view
SELECT S.firstname, S.class, M.name, A.status FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE S.class='H' ORDER BY S.id;
----modify
UPDATE mission SET $COLUMN = $NEWVALUE WHERE id=$ID AND class='H'; -- replace $COLUMN by the desired field, $NEWVALUE by the new value, $ID by the id of the row to be updated
----delete
DELETE FROM mission WHERE id=$ID AND class='H'; -- replace $ID by the id of the entry to be removed

--- View, modify, delete personal information
----view
SELECT * FROM staff WHERE id=$ID AND class='H'; -- replace $ID by the employee id
----modify
UPDATE staff SET $COLUMN = $NEWVALUE WHERE id=$ID AND class='H'; -- replace $COLUMN by the desired field, $NEWVALUE by the new value, $ID by the staff id
----delete
DELETE FROM staff WHERE id=$ID AND class='H'; -- replace $ID by the id of the entry to be removed

---- View all missions of the service’s employees and their status
SELECT S.firstname, S.class, M.name, A.status, D.name AS department FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id INNER JOIN department_workers DW ON DW.id_staff=S.id INNER JOIN department D ON DW.id_department=D.id WHERE S.class='E' ORDER BY department;

---- View, modify and delete missions of an employee of the service
-- THIS WAS ALREADY DONE

---- Validate or reject a mission of an employee of the service
UPDATE approvement SET status='$STATUS',checked_at=NOW(),id_checker_staff=$HID 
WHERE id=(SELECT M.id_approvement FROM mission M WHERE M.id=$MID); -- replace $STATUS by V, D or R
                                                                        -- V=validated, D=denied, R=changes requested
                                                                    -- replace $HID by the id of the head
                                                                    -- replace $MID by the id of the mission


---- View, modify, delete personal information of an employee of the service
-- THIS WAS ALREADY DONE

-- Administrator
--- View his/her missions and their status
SELECT S.firstname, S.class, M.name, A.status FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE S.class='A' ORDER BY S.id;

--- Create new missions
INSERT INTO mission (start_at, end_at, name, description, id_dst_address, id_department) VALUES --create mission
    --just need to change the values
	($START,$END,$NAME,$DESCRIPTION,$ADDRID,(SELECT id FROM department WHERE name='$DEPARTNAME')); -- just replace the following:
                                                                                                    -- $START by start mission date
                                                                                                    -- $END by end mission date
                                                                                                    -- $NAME by the mission name
                                                                                                    -- $DESCRIPTION by mission description
                                                                                                    -- $ADDRID by destination address ID
                                                                                                    -- $DEPARTNAME by department name
INSERT INTO mission_staff (id_mission, id_staff) VALUES -- add employee
    --just need to change the values
	($X,$ID); -- replace $X by created mission id and $ID by the employee ID

--- View, modify, delete ongoing missions
----view
SELECT S.firstname, S.class, M.name, A.status FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE S.class='A' ORDER BY S.id;
----modify
UPDATE mission SET $COLUMN = $NEWVALUE WHERE id=$ID AND class='A'; -- replace $COLUMN by the desired field, $NEWVALUE by the new value, $ID by the id of the row to be updated
----delete
DELETE FROM mission WHERE id=$ID AND class='A'; -- replace $ID by the id of the entry to be removed

--- View, modify, delete personal information
----view
SELECT * FROM staff WHERE id=$ID AND class='A'; -- replace $ID by the employee id
----modify
UPDATE staff SET $COLUMN = $NEWVALUE WHERE id=$ID AND class='A'; -- replace $COLUMN by the desired field, $NEWVALUE by the new value, $ID by the staff id
----delete
DELETE FROM staff WHERE id=$ID AND class='A'; -- replace $ID by the id of the entry to be removed

---- View all missions of the service’s employees and their status
SELECT S.firstname, S.class, M.name, A.status, D.name AS department FROM staff S INNER JOIN mission_staff MS ON S.id=MS.id_staff INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id INNER JOIN department_workers DW ON DW.id_staff=S.id INNER JOIN department D ON DW.id_department=D.id WHERE S.class='E' ORDER BY department;

---- View, modify and delete missions of an employee of the service
-- THIS WAS ALREADY DONE

---- Validate or reject a mission of an employee of the service
UPDATE approvement SET status='$STATUS',checked_at=NOW(),id_checker_staff=$HID 
WHERE id=(SELECT M.id_approvement FROM mission M WHERE M.id=$MID); -- replace $STATUS by V, D or R
                                                                        -- V=validated, D=denied, R=changes requested
                                                                    -- replace $HID by the id of the head
                                                                    -- replace $MID by the id of the mission


---- View, create, modify, delete employees personal information
-- THIS WAS ALREADY DONE

---- View, create, modify, delete head of service personal information
-- THIS WAS ALREADY DONE

---- Display the list of missions needing validation 
SELECT M.id, M.name FROM mission M INNER JOIN approvement A ON M.id_approvement=A.id WHERE A.status!='V';

---- Display the list of missions on hold 
SELECT M.id, M.name FROM mission M INNER JOIN approvement A ON M.id_approvement=A.id WHERE A.status='H';

---- Show cars which technical control has been done more than a year ago (im assuming the LAST techincal)
SELECT * FROM (SELECT C.id, C.brand, C.model, MAX(M.inspected_at) AS last FROM cars C INNER JOIN car_maintenance M on C.id=M.id_car GROUP BY C.id) AS recent_maintenances WHERE last<=NOW()-INTERVAL '1 years';

---- show cars with more than 50000km done 
SELECT * FROM (SELECT C.id,C.brand,C.model,SUM(S.km_driven) AS total_km FROM cars C INNER JOIN service_car_transport S ON C.id=S.id_car GROUP BY C.id ORDER BY C.id) AS car_kms WHERE total_km>50000;

---- For each service: how many missions have been validated, how many are ongoing, how many have been rejected 
SELECT D.name,A.status,COUNT(*) FROM mission M INNER JOIN approvement A ON M.id_approvement=A.id INNER JOIN department D ON D.id=M.id_department GROUP BY D.name,A.status;
SELECT D.name,A.status FROM mission M INNER JOIN approvement A ON M.id_approvement=A.id INNER JOIN department D ON D.id=M.id_department; -- just to check the result of previous query
 
---- Show all the employees who got more than 2 missions rejected
SELECT * FROM (SELECT S.id, S.firstname, COUNT(A.status) AS "rejected missions" FROM staff S INNER JOIN mission_staff MS ON MS.id_staff=S.id INNER JOIN mission M ON MS.id_mission=M.id INNER JOIN approvement A ON M.id_approvement=A.id WHERE A.status='D' GROUP BY S.id) as rejectted_missions WHERE "rejected missions">2; -- "" just to accept espace inside column name