import processing.serial.*;
int i = 0;

Serial myPort;
OutputStream output;
PImage img;

 void setup() {

  size(320, 240);
  myPort = new Serial( this, "COM1", 9600);
  myPort.clear();

  output = createOutput("test19.jpg");
}

void draw() {
  

  try { 
    if(myPort.available () > 0 ){
      println(i);
      i++;
      //output.open();
    }
    while ( myPort.available () > 0 ) {
      output.write(myPort.read());
      delay(1);
      
    }//output.close(); 
    
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}
void keyPressed() {
  img = loadImage("test19.jpg");
  image(img, 0, 0);     

}


