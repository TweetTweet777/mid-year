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

RETURN

'subroutine for resetting read values after each loop
RESETS:

E.FLAG% = 0
E.RATE! = 0
E.YEARS! = 0
E.PAY! = 0
E.TAX! = 0

RETURN

'subroutine for reading inputs
READ.INPUT:

READ FNAME$, SNAME$, E.RATE!, E.YEARS!
INPUT E.HRS!

RETURN

'subroutine for validating data
VALIDATION:
IF (E.HRS! > 168) OR (E.HRS < 0) OR (E.RATE! <= 0) OR (E.YEARS! < 0) THEN
    E.FLAG% = 1


END IF

RETURN

'subroutine for calculating gross pay, tax due and accumulated gross pay
CALCULATIONS:

RETURN

'subroutine for printing outputs
OUTPUTS:

RETURN

'subroutine for printing accumulated gross pay
ACC.PRINT:

RETURN
