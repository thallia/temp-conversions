( this is a forth program that converts an array of 12 fahrenheit temperatures to celsius temperatures to Kelvin )
( dara "thallia" klinkner march 2017 )

( fahrenheit array )

create f_array 4 , 18 , 21 , 34 , 45 , 60 , 74 , 90 , 94 , 123 , 354 , 456 , 576 ,

( loop to display all initial values )

variable floop
0 floop ! ( -- addr )
floop @   ( addr -- variable value )

: flimit   cells f_array + @ ; ( instant value -- cell value )

: f_loop   CR  13 0  DO floop @ ( cell# )
        flimit . ( prints cell value )
        1 floop +! ( increments variable to print all cells ) 
    LOOP ;

( celsius array )

variable c_array 12 cells allot    ( creates celsius array with 13 empty cells )

c_array 13 cells erase   ( fills 13 cells with 0 )

variable cloop
0 cloop !   ( -- addr )
cloop @   ( addr -- instant value )

: climit   cells c_array + @ ;

( Kelvin array )

variable k_array 12 cells allot   ( creates kelvin array with 13 empty cells )

k_array 13 cells erase   ( fills 13 cells with 0 )

variable kloop
0 kloop !
kloop @

( begin coversion process )
variable var
0 var !

: conversion   9 5 */ 32 + ; ( fahrenheit to celsius = * 9/5 + 32 )
: print   dup . ." degrees C, " ; ( duplicates, prints a copy for the user, and leaves value on stack )
: storec   cells c_array + ! ; ( stores converted value in c_array )
: inc_c   1 cloop +! ; ( increments cloop by 1 )
: inc_var   1 var +! ; ( increments var by 1 )
: inc_b   inc_c inc_var ;
: store_valuec   cloop @ var @ = IF var @ storec THEN ;


: f-c   CR  13 0  DO cloop @ flimit   ( puts cell value on the stack )
        conversion print   ( converts the f temp, prints result in string)
        store_valuec   ( stores new c value in c_array )
        inc_b   ( increments cloop and var by 1 )
    LOOP ;

( celsius to kelvin )
: reset   0 var ! ;
: conversion2   273 + ; ( converts to kelvin )
: print2   dup . ." K, " ; ( prints new value in string )
: storek   cells k_array + ! ; ( stores converted value in k_array )
: inc_k   1 kloop +! ; ( increments kloop by 1 )
: inc_b2   inc_k inc_var ; 
: store_valuek   kloop @ var @ = IF var @ storek THEN ;


: c-k   CR reset  13 0  DO kloop @ climit   ( puts c_array cell value on the stack )
        conversion2 print2   ( converts C temp to K, prints result in string )
        store_valuek   ( stores new k value in k_array )
        inc_b2   ( increments k by 1 )
   LOOP ;


( beginning display )
page cr 
." Here are 13 fahrenheit temperatures we will convert into celsius: "
cr f_loop cr cr
." fahrenheit to celsius: "
cr cr f-c cr cr
." celsius to kelvin: " 
cr cr c-k cr cr
." complete. " quit
