#include <wiringPi.h>
#include <stdio.h>

void HighLow(int, int);
void delayTicks(int);
void readRight();
void readLeft();
void serialToInt32Right(int);
void serialToInt32Left(int);
void littleEndianToBigEndian();


short int serialData = 0;
unsigned int left  = 0;
unsigned int right = 0;
const int clk   = 0;
const int ws    = 2;
const int data  = 3;
const int delay1 = 25;

unsigned int leftArr[44100];
unsigned int rightArr[44100];
short int leftArrBigEndian[44100];
short int rightArrBigEndian[44100];

int j;


int main(void)
{
    // Red LED: Physical pin 18, BCM GPIO24, and WiringPi pin 5.
    wiringPiSetup();

    pinMode(clk, OUTPUT);
    pinMode(ws, OUTPUT);
    pinMode(data,INPUT);

    //initial
    digitalWrite(clk, HIGH);
    digitalWrite(ws, HIGH);

    for(j=0; j< 44100;j++) {
    digitalWrite(ws, LOW);
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
    digitalWrite(ws, HIGH);
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
    leftArr[j] = left<<1;
    rightArr[j] = right<<1;
    left = 0;
    right= 0;
    } 
    //write to file
    FILE *write_ptr;
    write_ptr = fopen("test.raw","wb");
    fwrite(leftArr,4,44100,write_ptr);
    fclose(write_ptr);

    return 0;
}

void HighLow(int gpio, int delay)
{
    delayTicks(delay);
    digitalWrite(gpio,HIGH);
    delayTicks(delay);
    digitalWrite(gpio, LOW);
}

void delayTicks(int ticks)
{
    for(int i = 0; i< ticks; i++)
    {
        ;
    }
}

void serialToInt32Left(int serialData)
{
    left = left << 1;
    left += serialData;
}

void serialToInt32Right(int serialData)
{
    right = right << 1;
    right += serialData;
}

void readLeft()
{
    HighLow(clk, delay1);
    serialToInt32Left(digitalRead(data));
}

void readRight()
{
    HighLow(clk, delay1);
    serialToInt32Right(digitalRead(data));
}

void littleEndianToBigEndian()
{
    int j = 0;
    unsigned short int LSB = 0;
    unsigned short int MSB = 0;
    //fisrt 16 bits only
    for(j=0; j < 44100;j++)
    {
        leftArr[j] = leftArr[j] >> 16;
        LSB = leftArr[j] >> 8;
        MSB = leftArr[j] << 8;
        leftArrBigEndian[j] = LSB + MSB;
    }

    for(j=0; j < 44100;j++)
    {
        rightArr[j] = rightArr[j] >> 16;
        LSB = rightArr[j] >> 8;
        MSB = rightArr[j] << 8;
        rightArrBigEndian[j] = LSB + MSB;
    }

}


