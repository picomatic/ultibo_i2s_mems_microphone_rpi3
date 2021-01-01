program hello;
uses sysutils;

var 
    left: longWord = 0;
    right: longWord = 0;

(*delay for x clock ticks*)
procedure Delay(tics: longWord);
var
    i: longWord;
begin
    for i:= 1 to tics do
    ;//Will create nop cpu instruction
end;
(**)

(*Clock High Low*)
procedure HighLow(gpio: Shortint; preDelay, postDelay :longWord);
begin
    Delay(preDelay);
    ;//code for high here
    Delay(postDelay);
    ;//code for low here
end;

(*read left channel*)
procedure readLeft();
begin
end;
(**)
(*read right channel*)
procedure readRight();
begin
end;
(**)

(*Read left bit and shift into long*)
procedure serialToInt32Left(serialData: longWord);
begin
    left:= left << 1;
    left:= left + serialData;
end;

(*Read right bit and shift into longWord 32 bit*)
procedure serialToInt32Right(serialData: longWord);
begin
    right:= right << 1;
    right:= right + serialData;
end;

(*Init GPIO*)
procedure initGPIO();
begin
     {Now set GPIO pins to Pull None}
     GPIOPullSelect(GPIO_PIN_17,GPIO_PULL_NONE);
     GPIOPullSelect(GPIO_PIN_27,GPIO_PULL_NONE);
     GPIOPullSelect(GPIO_PIN_22,GPIO_PULL_NONE);
 
     {And make GPIO pins an Output}
     GPIOFunctionSelect(GPIO_PIN_17,GPIO_FUNCTION_OUT);
     GPIOFunctionSelect(GPIO_PIN_27,GPIO_FUNCTION_OUT);
 
     {Finally set the value of GPIO pins to HIGH}
     GPIOOutputSet(GPIO_PIN_17,GPIO_LEVEL_HIGH);
     GPIOOutputSet(GPIO_PIN_27,GPIO_LEVEL_HIGH);
end;

(*Main function*)
begin
    initGPIO();

    //TODO WS
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    readLeft();
    //TODO WS
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    readRight();
    //TODO WS

end.
(**)