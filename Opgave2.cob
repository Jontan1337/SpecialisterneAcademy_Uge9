           IDENTIFICATION DIVISION.
           PROGRAM-ID. OPGAVE2.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 Kunde-id             PIC X(10) VALUE SPACES.
           01 Fornavn              PIC X(20) VALUE SPACES.
           01 Efternavn            PIC X(20) VALUE SPACES.
           01 Kontonummer          PIC X(20) VALUE SPACES.
           01 Balance              PIC 9(7)V99 VALUE 0.
           01 Valutakode           PIC X(3) VALUE SPACES.

           PROCEDURE DIVISION.
           MOVE 1234567890 TO Kunde-id.
           MOVE "Lars" TO Fornavn.
           MOVE "Hansen" TO Efternavn.
           MOVE "DK12345678912345" TO Kontonummer.
           MOVE 2500.75 TO Balance.
           MOVE "DKK" TO Valutakode.

           DISPLAY Kunde-id.
           DISPLAY Fornavn Efternavn
           DISPLAY Kontonummer.
           DISPLAY Balance " " Valutakode.
           STOP RUN.
