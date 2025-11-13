           IDENTIFICATION DIVISION.
           PROGRAM-ID. OPGAVE3.
           
           DATA DIVISION.
               WORKING-STORAGE SECTION.
               01 KUNDE-ID             PIC X(10) VALUE SPACES.
               01 FORNAVN              PIC X(20) VALUE SPACES.
               01 EFTERNAVN            PIC X(20) VALUE SPACES.
               01 FULDENAVN            PIC X(40) VALUE SPACES.
               01 KONTONUMMER          PIC X(20) VALUE SPACES.
               01 BALANCE              PIC 9(7)V99 VALUE ZEROES.
               01 VALUTAKODE           PIC X(3) VALUE SPACES.
               01 IX                   PIC 9(2) VALUE ZEROES.
               01 IX2                  PIC 9(2) VALUE ZEROES.
               01 CURRENTCHAR          PIC X(1) VALUE SPACES.
               01 PREVIOUSCHAR         PIC X(1) VALUE SPACES.
               01 RENSET-FULDENAVN       PIC X(40) VALUE SPACES.

           PROCEDURE DIVISION.
               MOVE 1234567890 TO KUNDE-ID.
               MOVE "Lars" TO FORNAVN.
               MOVE "Hansen" TO EFTERNAVN.
               MOVE "DK12345678912345" TO KONTONUMMER.
               MOVE 2500.75 TO BALANCE.
               MOVE "DKK" TO VALUTAKODE.

               STRING FORNAVN DELIMITED BY SIZE " "
                   EFTERNAVN DELIMITED BY SIZE
                   INTO FULDENAVN

               PERFORM CREATECLEANFULLNAME WITH TEST AFTER UNTIL IX>40.

               DISPLAY KUNDE-ID.
               DISPLAY RENSET-FULDENAVN.
               DISPLAY KONTONUMMER.
               DISPLAY BALANCE " " VALUTAKODE.

           STOP RUN.
    
           CREATECLEANFULLNAME.
           MOVE FULDENAVN(IX:1) TO CURRENTCHAR.
           ADD 1 TO IX.
           IF NOT CURRENTCHAR = SPACE OR NOT PREVIOUSCHAR = SPACE
               MOVE CURRENTCHAR TO RENSET-FULDENAVN(IX2:1)
               MOVE FULDENAVN(IX2:1) TO PREVIOUSCHAR
               ADD 1 TO IX2
           END-IF.
