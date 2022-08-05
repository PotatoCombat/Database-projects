DROP TABLE IF EXISTS
Offices,
Departments,
Employees,
Engineers,
Managers,
Projects,
WorkType,
Works
CASCADE;

CREATE TABLE Offices (
    oid INTEGER,
    address VARCHAR(60),
    PRIMARY KEY (oid)
);

--eid = eid of department's manager
CREATE TABLE Departments (
    did INTEGER ,
    dbudget INTEGER NOT NULL,
    oid INTEGER NOT NULL,
    eid INTEGER NOT NULL,
    PRIMARY KEY (did),
    FOREIGN KEY (oid) REFERENCES Offices
);


CREATE TABLE Employees (
    eid INTEGER ,
    did INTEGER NOT NULL,
    PRIMARY KEY (eid),
    FOREIGN KEY (did) REFERENCES Departments
);

CREATE TABLE Engineers (
    eid INTEGER ,
    PRIMARY KEY (eid),
    FOREIGN KEY (eid) REFERENCES Employees
);

CREATE TABLE Managers (
    eid INTEGER ,
    PRIMARY KEY (eid),
    FOREIGN KEY (eid) REFERENCES Employees
);

--eid = eid of project's supervisor
CREATE TABLE Projects (
    pid INTEGER ,
    pbudget INTEGER NOT NULL,
    eid INTEGER NOT NULL,
    PRIMARY KEY (pid),
    FOREIGN KEY (eid) REFERENCES Managers
);

CREATE TABLE WorkType (
    wid INTEGER ,
    max_hours INTEGER NOT NULL,
    PRIMARY KEY (wid)
);

CREATE TABLE Works (
    pid INTEGER ,
    eid INTEGER ,
    wid INTEGER ,
    hours INTEGER NOT NULL,
    PRIMARY KEY (pid,eid),
    FOREIGN KEY (eid) REFERENCES Engineers ,
    FOREIGN KEY (pid) REFERENCES Projects ,
    FOREIGN KEY (wid) REFERENCES WorkType
        ON DELETE CASCADE
);

CREATE OR REPLACE FUNCTION reject_engineers_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.eid IN (SELECT * FROM Engineers) AND (TG_OP='INSERT' OR TG_OP='UPDATE')) THEN
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION reject_managers_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.eid IN (SELECT * FROM Managers) AND (TG_OP='INSERT' OR TG_OP='UPDATE')) THEN
        RETURN NULL;
    ELSE
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER reject_managers
BEFORE INSERT OR UPDATE ON Engineers
FOR EACH ROW EXECUTE FUNCTION reject_managers_fn();

CREATE TRIGGER reject_engineers
BEFORE INSERT OR UPDATE ON Managers
FOR EACH ROW EXECUTE FUNCTION reject_engineers_fn();

INSERT INTO Offices(oid, address) VALUES
(1, 'NUS'),
(2, 'NTU');

INSERT INTO Departments(did, dbudget, oid, eid) VALUES
(1, 100, 2, 1),
(2, 200, 1, 2);

INSERT INTO Employees(eid, did) VALUES
(1, 1),
(2, 2),
(3, 1);

INSERT INTO Engineers(eid) VALUES
(2);

INSERT INTO Managers(eid) VALUES
(1),
(2);

INSERT INTO Engineers(eid) VALUES
(1);

UPDATE Managers SET eid='3' WHERE eid='1'

