           IDENTIFICATION DIVISION.
           PROGRAM-ID. OPGAVE4.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 KUNDE-OP.
               02 KUNDE-ID             PIC X(10) VALUE SPACES.
               02 FORNAVN              PIC X(20) VALUE SPACES.
               02 EFTERNAVN            PIC X(20) VALUE SPACES.
           01 KONTO-INFO.
               02 KONTONUMMER          PIC X(20) VALUE SPACES.
               02 BALANCE              PIC 9(7)V99 VALUE 0.
               02 VALUTAKODE           PIC X(3) VALUE SPACES.

           PROCEDURE DIVISION.
           MOVE 1234567890 TO KUNDE-ID.
           MOVE "Lars" TO FORNAVN.
           MOVE "Hansen" TO EFTERNAVN.
           MOVE "DK12345678912345" TO KONTONUMMER.
           MOVE 2500.75 TO BALANCE.
           MOVE "DKK" TO VALUTAKODE.

           DISPLAY KUNDE-OP.
           DISPLAY KONTO-INFO.
           STOP RUN.
