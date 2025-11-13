           IDENTIFICATION DIVISION.
           PROGRAM-ID. HELLO.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 VAR-TEXT PIC X(20) VALUE "Hello med variabel".
           
           PROCEDURE DIVISION.
           
           DISPLAY VAR-TEXT
           STOP RUN.
