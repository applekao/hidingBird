import processing.serial.*; // import the Processing serial library
Serial myPort;// The serial port
Bird[] flyBird = new Bird[3];
Tree[] bigTree = new Tree[1];
float fgcolor=0;
float xpos, ypos;
float haveBird;
boolean firstContact; 

void setup() {
  size(640, 360);
  //conect to arduino
  println(Serial.list());
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');


  //make many bird
  for (int i = 0; i < flyBird.length; i ++ ) {
    flyBird[i] = new Bird(random(width), random(height), 30, 30, 8);
  }
  for (int i = 0; i < bigTree.length; i ++ ) {
    bigTree[i] = new Tree(width/2, height/2, 40, 100);
  }
}

void draw() {
  background(255); // Draw a black background
  for (int i = 0; i < flyBird.length; i ++ ) {
    flyBird[i].display();
    flyBird[i].jiggle();
    flyBird[i].hide();
  }
  bigTree[0].display();
  
}
   

// void mousePressed(){
// for (int i = 0; i < flyBird.length; i ++ ) {
//     flyBird[i].hide();
//   }
// }

void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  println("incoming "+ myString);
  // if you got any bytes other than the linefeed:
  if (myString != null) {
 
    myString = trim(myString);

    // if you haven't heard from the microncontroller yet, listen:
    if (firstContact == false) {
      if (myString.equals("hello")) {
        myPort.clear();          // clear the serial port buffer
        firstContact = true;     // you've had first contact from the microcontroller
        myPort.write('A');       // ask for more
      }
    }
    // if you have heard from the microcontroller, proceed:
    else {
      // split the string at the commas
      // and convert the sections into integers:
      int sensors[] = int(split(myString, ','));
 
      // print out the values you got:
      for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
        print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
      }
      // add a linefeed after all the sensor values are printed:
      println();
      if (sensors.length > 1) {
        xpos = map(sensors[0], 300,400,0,width);
        ypos = map(sensors[1], 300,400,0,height/2);
        fgcolor =sensors[0];
        // fgcolor = sensors[2] * 255;
        
      }
    }
    // print(" xpos " + xpos); 
    // print(" ypos " + ypos);
    // when you've parsed the data you have, ask for more:
    myPort.write("A");
  }
}
