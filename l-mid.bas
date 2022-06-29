'FILENAME: l-mid.bas
'PROGRAMMER: Ly, Max
'DATE: 27/06/2022
'VERSION: Final

'PURPOSE:
'The purpose of this program is to calculate and produce a weekly payroll report of a company's 10 employees.

'INPUT:
'This program will require the user to enter the hours each employee worked each week.
'The program is required to also read the employees first name, surname, pay rate and number of years employed.

'PROCESSING:
'The program must calculate the gross pay of each employee which includes any overtime pay (which an employee is paid more for,
'depending on how long they worked overtime and how long they have been employed in the company for) and the amount of tax to be paid.
'The tax rate is to be assigned as a constant. The accumulated gross pay for all employees is to be calculated as well.
'The program will check whether the values inputted are valid and will assign an error code if an invalid value is entered so that when
'each employee’s information is printed, it will notify the user if the data is invalid and their pay will not be added to the accumulated total.
'The program will also check whether the employee has worked no hours, which a variable will be assigned so that the report can notify the user if an employee has worked no hours.

'OUTPUT:
'This program will output a report with a main title, a subtitle and column headings (on 2 lines).
'The employee’s first name initial, the full surname, the hours worked, the gross pay and the amount of tax to be paid are to be printed on one line under each column heading.
'Underneath all that, the program will output the accumulated gross pay of all employees.
'If the employee has not worked during the week, the report prints a message stating that no hours have been worked (in place of the gross pay and tax amount.)
'and if the employee has invalid data prints a message stating that “record contains invalid data”.

'DATA DICTIONARY

'Data Name       Data Type   Represents
'T.RATE%         Integer     Current tax rate stored as a constant
'LCV%            Integer     Loop control variable
'E.FLAG%         Integer     ERROR Flag
'FNAME$          String      First name of an Employee
'SNAME$          String      Surname of an Employee
'E.RATE!         Float       Pay rate/wage of a given an employee
'E.YEARS!        Float       Amount of years a given employee has been employed with the company
'E.HRS!          Float       The number of hours a given employee has worked over a period of a week
'E.PAY!          Float       The gross pay of a given employee
'E.TAX!          Float       The tax value/amount due for a given employee
'ACC.PAY!        Float       The accumulated total gross pay of all employees

'------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

'clears screen
CLS

'defines constants
T.RATE! = 0.3

'prints headings before loop
GOSUB HEADINGS

'counted loop for mulitple sets of data
FOR LCV% = 1 TO 10

    GOSUB READ.INPUT
    GOSUB VALIDATION
    GOSUB CALCULATIONS
    GOSUB OUTPUTS

NEXT LCV%

GOSUB ACC.PRINT

'HALTS EXECUTION
END

'data
DATA "Jules","Dupont",10,4
DATA "Jamillia","Ballard",20,5
DATA "Bella","Sweeny",10,6
DATA "Kyra","McFarland",20,6
DATA "Dante","Beech",10,5
DATA "Jack","White",20,4
DATA "Theo","Norris",10,9
DATA "Josh","Einhar",20,10
DATA "Holly","Franklin",10,1
DATA "Squiggles","White",10,-1

'subroutine for printing headings before loop
HEADINGS:

    LPRINT TAB(20); "On the Road Again Car & Caravan Rental Co."
    LPRINT TAB(31); "Weekly Payroll Report"
    LPRINT TAB(20); "------------------------------------------"
    LPRINT: LPRINT
    LPRINT TAB(7); "Employee"; TAB(28); "Hours"; TAB(49); "Gross"; TAB(70); "Tax"
    LPRINT TAB(9); "Name"; TAB(28); "Worked"; TAB(50); "Pay"; TAB(70); "Due"
    LPRINT TAB(7); "--------"; TAB(28); "-------"; TAB(49); "-----"; TAB(70); "---"

RETURN

'subroutine for reading inputs
READ.INPUT:

    READ FNAME$, SNAME$, E.RATE!, E.YEARS!
    PRINT "Input hours worked for "; FNAME$; " "; SNAME$; ":",
    INPUT " ", E.HRS!

RETURN

'subroutine for validating data
VALIDATION:

    IF (E.HRS! > 168) OR (E.HRS < 0) OR (E.RATE! <= 0) OR (E.YEARS! < 0) THEN
        E.FLAG% = 1
        E.PAY! = 0
    ELSEIF E.HRS! = 0 THEN
        E.FLAG% = 2
        E.PAY! = 0

    END IF

RETURN

'subroutine for calculating gross pay, tax due and accumulated gross pay
CALCULATIONS:

    IF E.FLAG% = 0 THEN

        IF E.HRS! > 40 THEN

            IF E.YEARS! < 5 THEN
                E.OV! = 1.5
            ELSE
                E.OV! = 2
            END IF

            E.PAY! = (40 * E.RATE!) + (E.RATE! * E.OV! * (E.HRS! - 40))

        ELSE

            E.PAY! = E.HRS! * E.RATE!

        END IF



    END IF

    E.TAX! = E.PAY! * T.RATE!
    ACC.PAY! = ACC.PAY! + E.PAY!

RETURN

'subroutine for printing outputs
OUTPUTS:
    LPRINT USING "! & "; TAB(7); FNAME$; SNAME$;

    IF E.FLAG% = 1 THEN

        LPRINT USING "### hrs "; TAB(28); E.HRS!;
        LPRINT TAB(44); "RECORD CONTAINS INVALID DATA!"

    ELSEIF E.FLAG% = 2 THEN

        LPRINT TAB(28); "HASN'T WORKED THIS WEEK!"
    ELSE
        LPRINT USING "### hrs $$##,###.## $$##,###.##"; TAB(28); E.HRS!; TAB(43); E.PAY!; TAB(62); E.TAX!
    END IF

RETURN

'subroutine for printing accumulated gross pay
ACC.PRINT:

    LPRINT STRING$(80, 45)
    LPRINT TAB(7); "Total Accumulated Gross Pay = ";
    LPRINT USING "$$##,###.## "; TAB(43); ACC.PAY!

RETURN
