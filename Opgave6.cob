           IDENTIFICATION DIVISION.
           PROGRAM-ID. OPGAVE6.
           
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT KUNDEOPLFILE ASSIGN TO "Kundeoplysninger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD KUNDEOPLFILE.
           01 KUNDEOPLDEF.
               COPY "KUNDEOPL.cpy".

           WORKING-STORAGE SECTION.
           01 KUNDEOPLDATA.
               COPY "KUNDEOPL.cpy".
           01 END-OF-FILE              PIC 9(4) VALUE 0.
      *    01 TEMP                     PIC X(20) VALUE SPACES.

           PROCEDURE DIVISION.
           MOVE 1234567890 TO KUNDE-ID IN KUNDEOPLDATA.
           MOVE "Lars" TO FORNAVN IN KUNDEOPLDATA.
           MOVE "Hansen" TO EFTERNAVN IN KUNDEOPLDATA.
           MOVE "DK12345678912345" TO KONTONUMMER IN KUNDEOPLDATA.
           MOVE 2500.75 TO BALANCE IN KUNDEOPLDATA.
           MOVE "DKK" TO VALUTAKODE IN KUNDEOPLDATA.
           MOVE "Vej1" TO VEJNAVN IN KUNDEOPLDATA.
           MOVE "42" TO HUSNR IN KUNDEOPLDATA.
           MOVE "2" TO ETAGE IN KUNDEOPLDATA.
           MOVE "Side?" TO SIDE IN KUNDEOPLDATA.
           MOVE "Greve" TO BY-X IN KUNDEOPLDATA.
           MOVE "2670" TO POSTNR IN KUNDEOPLDATA.
           MOVE "DK" TO LANDE-KODE IN KUNDEOPLDATA.

      *    DISPLAY KUNDEOPLDATA.
           
           PERFORM READ-KUNDEOPL-FILE

           STOP RUN.

           READ-KUNDEOPL-FILE.
           OPEN INPUT KUNDEOPLFILE.

           PERFORM UNTIL END-OF-FILE = 1
               READ KUNDEOPLFILE INTO KUNDEOPLDEF
                   AT END
                       MOVE 1 TO END-OF-FILE
                   NOT AT END
                       DISPLAY KUNDEOPLDEF

      *                DISPLAY 
      *                "ID: " KUNDE-ID IN KUNDEOPLDEF
      *                ", Navn: " FORNAVN IN KUNDEOPLDEF
      *                EFTERNAVN IN KUNDEOPLDEF
      *                ", Tlf: " TELEFON IN KUNDEOPLDEF

      *                MOVE KUNDE-ID IN KUNDEOPLDEF TO TEMP
      *                DISPLAY "ID: " TEMP
      *                MOVE FORNAVN IN KUNDEOPLDEF TO TEMP
      *                DISPLAY "Fornavn: " TEMP
      
               END-READ
           END-PERFORM

           CLOSE KUNDEOPLFILE.
