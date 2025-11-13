           IDENTIFICATION DIVISION.
           PROGRAM-ID. OPGAVE5.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 KUNDEOPL.
               COPY "KUNDEOPL.cpy".

           PROCEDURE DIVISION.
           MOVE 1234567890 TO KUNDE-ID.
           MOVE "Lars" TO FORNAVN.
           MOVE "Hansen" TO EFTERNAVN.
           MOVE "DK12345678912345" TO KONTONUMMER.
           MOVE 2500.75 TO BALANCE.
           MOVE "DKK" TO VALUTAKODE.
           MOVE "Vej1" TO VEJNAVN.
           MOVE "42" TO HUSNR.
           MOVE "2" TO ETAGE.
           MOVE "Side?" TO SIDE.
           MOVE "Greve" TO BY-X.
           MOVE "2670" TO POSTNR.
           MOVE "DK" TO LANDE-KODE.

           DISPLAY KUNDEOPL.
           STOP RUN.
