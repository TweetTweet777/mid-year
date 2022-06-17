
'clears screen
CLS

'defines constants
T.RATE% = 0.3

'prints headings before loop
GOSUB HEADINGS

'counted loop for mulitple sets of data
FOR LCV% = 0 TO 10

    GOSUB RESETS
    GOSUB READ.INPUT
    GOSUB VALIDATION
    GOSUB CALCULATIONS
    GOSUB OUTPUTS

NEXT LCV%

GOSUB ACC.PRINT

'HALTS EXECUTION
END

'subroutine for printing headings before loop
HEADINGS:

PRINT TAB(20); "On the Road Again Car & Caravan Rental Co."
PRINT TAB(31); "Peekly Payroll Report"
PRINT TAB(20); "------------------------------------------"
PRINT: PRINT
PRINT TAB(7); "Employee"; TAB(28); "Hours"; TAB(49); "Gross"; TAB(70); "Tax"
PRINT TAB(9); "Name"; TAB(28); "Worked"; TAB(50); "Pay"; TAB(70); "Due"
PRINT TAB(7); "--------"; TAB(28); "------"; TAB(49); "-----"; TAB(70); "---"

RETURN

'subroutine for resetting read values after each loop
RESETS:

E.FLAG% = 0
E.RATE! = 0
E.YEARS! = 0
E.PAY! = 0
E.TAX! = 0
FNAME$ = ""
SNAME$ = ""

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

IF E.FLAG% <= 0 THEN

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
    E.TAX! = E.PAY! * T.RATE%

END IF

ACC.PAY! = ACC.PAY! + E.PAY!

RETURN

'subroutine for printing outputs
OUTPUTS:

IF E.FLAG% = 1 THEN
    PRINT USING "! & ### hrs & RECORD CONTAINS INVALID DATA!"; TAB(7); FNAME$; SNAME$; TAB(28); E.HRS!; TAB(44); A$
ELSEIF E.FLAG% = 2 THEN
    PRINT USING "! & & HASN'T WORKED THIS WEEK!"; TAB(7); FNAME$; SNAME$; TAB(28); A$
ELSE
    PRINT USING "! & ### hrs $$#####.## $$#####.##"; TAB(7); FNAME$; SNAME$; TAB(28); E.HRS!; TAB(44); E.PAY!; TAB(63); E.TAX!
END IF

RETURN

'subroutine for printing accumulated gross pay
ACC.PRINT:

PRINT STRING$(80, 45)
PRINT USING "Total Accumulated Gross Pay =  "; TAB(49); ACC.PAY!

RETURN

DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20
DATA "Bob","Ross",20,20

