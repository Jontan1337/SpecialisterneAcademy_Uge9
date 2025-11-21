           IDENTIFICATION DIVISION.
           PROGRAM-ID. OPGAVE8.
           
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
      *    Kunde oplysninger
           SELECT KUNDEOPLFILEIN ASSIGN TO "Kundeoplysninger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT KUNDEOPLFILEOUT ASSIGN TO "KundeoplysningerOut.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
      *    Kunde oplysninger end

      *    Konto oplysninger
           SELECT KONTOOPLFILEIN ASSIGN TO "KontoOpl.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT KUNDEKONTOFILEOUT ASSIGN TO "KUNDEKONTO.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
      *    Konto oplysninger end

           DATA DIVISION.
           FILE SECTION.

      *    Kunde oplysninger
           FD KUNDEOPLFILEIN.
           01 KUNDEOPLINDEF.
               COPY "KUNDEOPL.cpy".
           
           FD KUNDEOPLFILEOUT.
           01 KUNDEOPLOUTDEF.
               COPY "KUNDEOPL.cpy".
      *    Kunde oplysninger end

      *    Konto oplysninger
           FD KONTOOPLFILEIN.
           01 KUNDEKONTOIN.
               COPY "KONTOOPL.cpy".

           FD KUNDEKONTOFILEOUT.
           01 KUNDEKONTOOUT.
               COPY "KONTOOPL.cpy".
      *    Konto oplysninger end

           WORKING-STORAGE SECTION.
           01 KUNDEOPLDATA.
               COPY "KUNDEOPL.cpy".
           
           01 KUNDEOPL-FILE-PROCESS.
               02 NAVN-ADR             PIC X(100) VALUE SPACES.
           
           01 END-OF-FILE-RKF              PIC 9(4) VALUE 0.
           01 END-OF-FILE-FKK              PIC 9(4) VALUE 0.

      *    PARAGRAPH FINDKUNDEKONTO
           01 FKK-PARAM-KUNDE-ID           PIC X(10) VALUE SPACES.
      *    PARAGRAPH FINDKUNDEKONTO END

      *    CLEANTEXT PARAMETERS
           01 CT-IN                        PIC X(100) VALUE SPACES.
           01 CT-OUT                       PIC X(100) VALUE SPACES.
           01 CT-IX                        PIC 9(3) VALUE ZEROES.
           01 CT-IX2                       PIC 9(3) VALUE ZEROES.
           01 CT-CURRENTCHAR               PIC X(1) VALUE SPACES.
           01 CT-PREVIOUSCHAR              PIC X(1) VALUE SPACES.
      *    CLEANTEXT PARAMETERS END

           01 TESTDATA                     PIC X(100) VALUE SPACES.

           PROCEDURE DIVISION.

           PERFORM READ-KUNDEOPL-FILE.

           STOP RUN.

           READ-KUNDEOPL-FILE.
           OPEN INPUT KUNDEOPLFILEIN.
           OPEN OUTPUT KUNDEKONTOFILEOUT.

           PERFORM UNTIL END-OF-FILE-RKF = 1
               READ KUNDEOPLFILEIN INTO KUNDEOPLINDEF
                   AT END
                       MOVE 1 TO END-OF-FILE-RKF
                   NOT AT END
                       MOVE KUNDE-ID IN KUNDEOPLINDEF TO KUNDEKONTOOUT
                       WRITE KUNDEKONTOOUT
                       MOVE SPACES TO KUNDEKONTOOUT

                       PERFORM FORMAT-NAVN

                       PERFORM FORMAT-ADDRESSE

                       PERFORM FORMAT-BY

      *                Find all konti matching KUNDE-ID and write them.
                       PERFORM PREPARE-WRITEALLKUNDEKONTI
                       MOVE KUNDE-ID IN KUNDEOPLINDEF
                       TO FKK-PARAM-KUNDE-ID
                       PERFORM WRITEALLKUNDEKONTI

      *                KUNDE separating line.
                       WRITE KUNDEKONTOOUT
               END-READ
           END-PERFORM

           CLOSE KUNDEOPLFILEIN.
           CLOSE KUNDEKONTOFILEOUT.

           WRITEALLKUNDEKONTI.
           OPEN INPUT KONTOOPLFILEIN.

           PERFORM UNTIL END-OF-FILE-FKK = 1
               READ KONTOOPLFILEIN INTO KUNDEKONTOIN
                   AT END
                       MOVE 1 TO END-OF-FILE-FKK
                   NOT AT END
                       IF KUNDE-ID IN KUNDEKONTOIN = FKK-PARAM-KUNDE-ID
                           MOVE KUNDEKONTOIN TO KUNDEKONTOOUT
                           WRITE KUNDEKONTOOUT
                           MOVE SPACES TO KUNDEKONTOOUT
                       END-IF
               END-READ
           END-PERFORM
           
           CLOSE KONTOOPLFILEIN.

           PREPARE-WRITEALLKUNDEKONTI.
           MOVE SPACES TO FKK-PARAM-KUNDE-ID.
           MOVE 0 TO END-OF-FILE-FKK.

           TRIMSPACES.
           MOVE ZEROES TO CT-IX.
           MOVE ZEROES TO CT-IX2.
           PERFORM UNTIL CT-IX = LENGTH OF CT-IN
           MOVE CT-IN(CT-IX:1) TO CT-CURRENTCHAR
           ADD 1 TO CT-IX
           IF NOT CT-CURRENTCHAR = SPACE OR NOT CT-PREVIOUSCHAR = SPACE
               MOVE CT-CURRENTCHAR TO CT-OUT(CT-IX2:1)
               MOVE CT-CURRENTCHAR TO CT-PREVIOUSCHAR
               ADD 1 TO CT-IX2
           END-IF
           END-PERFORM
           MOVE SPACES TO CT-IN.

           FORMAT-NAVN.
           STRING
           FORNAVN IN KUNDEOPLINDEF DELIMITED BY SIZE
           " "
           EFTERNAVN IN KUNDEOPLINDEF DELIMITED BY SIZE
           INTO CT-IN.
           PERFORM TRIMSPACES.
           MOVE CT-OUT TO KUNDEKONTOOUT.
           WRITE KUNDEKONTOOUT.
           MOVE SPACES TO CT-OUT.
           MOVE SPACES TO KUNDEKONTOOUT.

           FORMAT-ADDRESSE.
           STRING
           VEJNAVN IN KUNDEOPLINDEF DELIMITED BY SIZE
           " "
           HUSNR IN KUNDEOPLINDEF DELIMITED BY SIZE
           " "
           ETAGE IN KUNDEOPLINDEF DELIMITED BY SIZE
           " "
           SIDE IN KUNDEOPLINDEF DELIMITED BY SIZE
           INTO CT-IN.
           PERFORM TRIMSPACES.
           MOVE CT-OUT TO KUNDEKONTOOUT.
           WRITE KUNDEKONTOOUT.
           MOVE SPACES TO CT-OUT.
           MOVE SPACES TO KUNDEKONTOOUT.

           FORMAT-BY.
           STRING
           POSTNR IN KUNDEOPLINDEF DELIMITED BY SIZE
           " "
           BY-X IN KUNDEOPLINDEF DELIMITED BY SIZE
           INTO CT-IN.
           PERFORM TRIMSPACES.
           MOVE CT-OUT TO KUNDEKONTOOUT.
           WRITE KUNDEKONTOOUT.
           MOVE SPACES TO CT-OUT.
           MOVE SPACES TO KUNDEKONTOOUT.
