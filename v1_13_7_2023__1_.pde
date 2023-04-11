/******************************IMPORTING LIBRARIES**************************************************/

import processing.serial.*;

import controlP5.*;

import grafica.*;
/******************************DECLARATIOTION OF GLOBAL VARIABLE *****************/

GPlot plot1, plot2; 

ControlP5 cp51;
ControlP5 cp5;
ControlP5 cp52,cp53;

Serial myPort;  // Create object from Serial class
int col;
DropdownList d2;
String serial_list;                // list of serial ports
int serial_list_index = 0;         // currently selected serial port 
String portname;                   // portname 

int state=0;
int enable=0;

void setup() {
   size(955, 627,P3D); // size should be same as background image 
   
   cp51 = new ControlP5(this);
   cp5 = new ControlP5(this);
    cp52 = new ControlP5(this);
    cp53 = new ControlP5(this);
   
   d2 = cp51.addDropdownList("select Port Numbers")
              .setPosition(250, 100)
              .setSize(200,200)
              .setId(1)             
              ;
      
   cp51.addButton("connect")
         .setValue(0)
         .setPosition(250,300)
         .setSize(200,25)
         .setId(2)
         ;
      customize(d2);
      
   // get the list of serial ports on the computer
      if( Serial.list().length <= 0)
      {
        println("no com ports available");
          serial_list = "0";
      }
     else
      {
      serial_list = Serial.list()[serial_list_index];
      println( serial_list );
      }
      cp51.setAutoDraw(false); 
      
      col= cp51.getController("connect").getColor().getBackground();   
       
      setLock(cp51.getController("connect"),true); 
      
      cp5 = new ControlP5(this);// controlp5 library initialization
      cp5.setColorBackground(0xffffffff);
      
       cp52.addButton("Start")
         .setValue(0)
         .setPosition(300,50)
         .setSize(200,25)
         .setId(3)
         ;
      cp53.addButton("Stop")
         .setValue(0)
         .setPosition(50,50)
         .setSize(200,25)
         .setId(4)
         ;
      // cp52.setColorBackground(0xffffffff);
       cp52.setAutoDraw(false);
       
      //  cp53.setColorBackground(0xffffffff);
       cp53.setAutoDraw(false);
       
//noLoop();
}  

void setLock(Controller theController, boolean theValue) 
{
  theController.setLock(theValue);
  if(theValue) 
  {
    theController.setColorBackground(color(100,100));
  } 
  else 
  {
    theController.setColorBackground(color(col));
  }
}

void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(25,25,112));
  ddl.setItemHeight(25);
  ddl.setBarHeight(25);
 for (int i=0;i<Serial.list().length;i++) {
    ddl.addItem(Serial.list()[i],Serial.list()[i]);
  }
 // ddl.addItem("COM7","COM7");
  ddl.setColorBackground(color(25,25,112));
  ddl.setColorActive(color(190, 128));
  
}

///////////////////////////////Draw function//////////////////////////////////////

void draw() 
{
  if(state==0)
  {
     background(180);   
     cp51.draw();
  }
  if(state==1)
  {
    background(50);
     cp52.draw();
  }
  if(state==2)
  {
      background(50);
        //plot the graph
      arrays();
      drawgraph();
      //arrays();
      plot1.beginDraw();
      plot1.drawBox();
      plot1.drawXAxis();
      plot1.drawYAxis();
      plot1.drawTitle();
      plot1.setAxesOffset(-1);
      plot1.drawLines();
      plot1.drawGridLines(GPlot.BOTH);
      //plot1.drawPoint(new GPoint(140,8.5));   
      plot1.endDraw(); 
      cp53.draw();
      
     // noLoop();
  }   
  
}

///////////Mouse or key press functions//////////////////////

void controlEvent(ControlEvent theEvent) 
{
  if(state==0)
  {
   if(theEvent.getId()==1)
   {
     if(int(cp51.getController("select Port Numbers").getValue())>=0)
     {
           setLock(cp51.getController("connect"),false);   
     }
   }
    
   if(theEvent.getId()==2)
   {
      int s=int(cp51.getController("select Port Numbers").getValue());
      println(Serial.list()[s]);
      portname = Serial.list()[s];
     // myPort = new Serial(this, portname , 9600);    
      state=1;
     // startingTime = millis();// initialize time
      
   }
  }
   if(state==1)
  {
   //if(theEvent.getId()==1)
   //{
   //  if(int(cp52.getController("").getValue())>=0)
   //  {
   //        setLock(cp51.getController("connect"),false);   
   //  }
   //}
   if(theEvent.getId()==3)
   {
     myPort = new Serial(this, portname , 9600);   
     startingTime = millis();// initialize time
      state=2;
     
   }
  }
  if(state==2)
  {
   if(theEvent.getId()==4)
   {
     print("clicked stop");
     myPort.stop();
     noLoop();
   }
  }
}
