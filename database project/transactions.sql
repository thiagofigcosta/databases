-- Add a new mission
BEGIN TRANSACTION; -- starts the transaction
    -- CONCAT concatenates two strings
    -- SELECT last_value FROM SQ_MISSION_PK - gets the last value of sequence number
    INSERT INTO mission (start_at, end_at, name, description, id_dst_address, id_department) VALUES
        (NOW() + INTERVAL '10 days',NOW() + INTERVAL '25 days',CONCAT('Mission - ', (SELECT last_value FROM SQ_MISSION_PK)),'',1,(SELECT id FROM department WHERE name='Information Technology'));

    INSERT INTO mission_staff (id_mission, id_staff) VALUES 
        ( (SELECT last_value FROM SQ_MISSION_PK) ,1),
        ( (SELECT last_value FROM SQ_MISSION_PK) ,2),
        ( (SELECT last_value FROM SQ_MISSION_PK) ,3);
COMMIT;-- commits the transaction


-- Create expense reports 
BEGIN TRANSACTION;
    SELECT M.id AS mission_id, M.name AS mission_name, 
        D.name as department, 
        M.start_at AS mission_start, M.end_at AS mission_end,
        S.firstname AS staff, S.class AS staff_class, 
        MS.cost, MS.description, MS.cost_date,
        I.paid, I.attachment_path,
        A.status, A.checked_at,
        S2.firstname AS approver, S2.class AS approver_class
    FROM invoice I 
    FULL OUTER JOIN mission_costs MS ON MS.id=I.id_mission_cost  -- used full outer join because inner join would skip records with null value on PK or FK
    FULL OUTER JOIN mission M on MS.id_mission=M.id 
    FULL OUTER JOIN department D ON D.id=M.id_department
    FULL OUTER JOIN staff S ON S.id=MS.id_staff
    FULL OUTER JOIN approvement A ON A.id=I.id_approvement
    FULL OUTER JOIN staff S2 ON S2.id=A.id_checker_staff 
    WHERE M.id IS NOT NULL AND MS.cost IS NOT NULL -- added to filter excessive null entries
    ORDER BY M.id;
COMMIT;


