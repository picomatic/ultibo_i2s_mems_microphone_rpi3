program mems;

{$mode objfpc}{$H+}

{ Raspberry Pi 3 Application                                                   }
{  Add your program code below, add additional units to the "uses" section if  }
{  required and create new units by selecting File, New Unit from the menu.    }
{                                                                              }
{  To compile your program select Run, Compile (or Run, Build) from the menu.  }

uses
  RaspberryPi3,
  GlobalConfig,
  GlobalConst,
  GlobalTypes,
  Platform,
  Threads,
  SysUtils,
  Classes,
  Ultibo,
  Console
  { Add additional units here };

var 
    left: longWord = 0;
    right: longWord = 0;
    count: longWord; //don't inite here, will generate loop counter error
const
  CLK  = GPIO_PIN_17;
  WS   = GPIO_PIN_27;
  DATA = GPIO_PIN_22;
  DELAYLOW  = 25;
  DELAYHIGH = 25;

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
    GPIOOutputSet(CLK,GPIO_LEVEL_HIGH);
    Delay(postDelay);
    GPIOOutputSet(CLK,GPIO_LEVEL_LOW);
end;

(*read left channel*)
procedure readLeft();
begin
    HighLow(CLK, DELAYLOW, DELAYHIGH);
    //TODO read DATA gpio
end;
(**)
(*read right channel*)
procedure readRight();
begin
    HighLow(CLK, DELAYLOW, DELAYHIGH);
    //TODO read DATA gpio
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
     GPIOPullSelect(CLK,GPIO_PULL_NONE);
     GPIOPullSelect(WS,GPIO_PULL_NONE);
     GPIOPullSelect(DATA,GPIO_PULL_NONE);
 
     {And make GPIO pins an Output}
     GPIOFunctionSelect(CLK,GPIO_FUNCTION_OUT);
     GPIOFunctionSelect(WS,GPIO_FUNCTION_OUT);
     GPIOFunctionSelect(DATA,GPIO_FUNCTION_IN);
 
     {Finally set the value of GPIO pins to HIGH}
     GPIOOutputSet(CLK,GPIO_LEVEL_HIGH);
     GPIOOutputSet(WS,GPIO_LEVEL_HIGH);
end;

(*Main function*)
begin
    (*Init GPIO*)
    initGPIO();

    for count:=1 to 44100 do
      begin
      (*Read 32 bits left channel*)
      GPIOOutputSet(WS,GPIO_LEVEL_LOW);
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

      (*Read 32 bits right channel*)
      GPIOOutputSet(WS,GPIO_LEVEL_HIGH);

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
    end;
end.
(**)
