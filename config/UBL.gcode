; G29 L0 ; Wczytuje siatkę ze slotu 0 (użyj odpowiedniego numeru slotu)
; G29 S -1 ; zrzut
; wynik wklejony poniżej

; G29 -1 output starts here
G29 I999
M421 I0 J0 Z0.0348
M421 I0 J1 Z0.0018
M421 I0 J2 Z-0.0287
M421 I0 J3 Z-0.0452
M421 I0 J4 Z-0.0277
M421 I1 J0 Z0.0348
M421 I1 J1 Z0.0018
M421 I1 J2 Z-0.0287
M421 I1 J3 Z-0.0452
M421 I1 J4 Z-0.0277
M421 I2 J0 Z0.0399
M421 I2 J1 Z0.0309
M421 I2 J2 Z-0.0061
M421 I2 J3 Z0.0139
M421 I2 J4 Z0.0144
M421 I3 J0 Z0.1145
M421 I3 J1 Z0.0800
M421 I3 J2 Z0.0560
M421 I3 J3 Z0.0810
M421 I3 J4 Z0.0985
M421 I4 J0 Z0.1635
M421 I4 J1 Z0.1505
M421 I4 J2 Z0.1240
M421 I4 J3 Z0.1530
M421 I4 J4 Z0.1845
; G29 -1 output ends here

G29 S0 ; Zapisuje bieżącą siatkę z RAM do slotu 0
G29 A  ; Włącza system UBL (odpowiednik M420 S1)
M500   ; Zapisuje konfigurację i aktywny slot w EEPROM

G29 T  ; Print mesh to console 
