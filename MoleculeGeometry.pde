import peasy.*;

PeasyCam cam;
int numberOfBonds = 0;
int numberOfLones = 0; //Lone Pairs
int bondSelection = 1;
String electronDomain = "N/A";
String molecularShape = "N/A";
double bondAngle = 0;
double bondAngle2 = 0;
int[] nValues = new int[6];
int n = 1;
int n1 = 1;
int n2 = 1;
int n3 = 1;
int n4 = 1;
int n5 = 1;
int numberOfSingleBonds = 0;
int numberOfDoubleBonds = 0;
int numberOfTripleBonds = 0;

color addBondColor = color(255);
color removeBondColor = color(255);
color addPairColor = color(255);
color removePairColor = color(255);
color resetColor = color(255);
color mouseOver = color(255, 180, 0);
color startColor = color(255);

float timer = 0;
int page = 0;

void setup() {
  size(900, 600, P3D);
  cam = new PeasyCam(this, 600);
  cam.setWheelHandler(null);
  cam.setResetOnDoubleClick(false);
}

void draw() {
  background(0);

  if(page == 0) {
    
    cam.beginHUD();
    if(intersect(mouseX, mouseY, width/2 - 200, height/2, 400, 200)) fill(mouseOver);
    else fill(255);
    rect(width/2 - 200, height/2, 400, 200);
    textSize(50);
    fill(0);
    text("Let's simulate!", width/2 - 175, height/2 + 115);
    fill(255, 100, 0);
    
    text("TheJosefLife's", 280, 100);
    text("Molecular Geometry Simulation", 70, 180);
    textSize(20);
    fill(255);
    text("Welcome to my Molecular Geometry Simulation, where you can learn about different\n      molecular shapes and electron domains! To begin, press the button below!", 55, 230);
    cam.endHUD();
    
  }

  if(page == 1) {
    timer += 0.5f;
    
    if(intersect(mouseX, mouseY, width - 160, 10, 150, 50)) {
      addBondColor = mouseOver;
    } else addBondColor = color(255);
    if(intersect(mouseX, mouseY, width - 160, 70, 150, 50)) {
      removeBondColor = mouseOver;
    } else removeBondColor = color(255);
    if(intersect(mouseX, mouseY, width - 160, 130, 150, 50)) {
      addPairColor = mouseOver;
    } else addPairColor = color(255);
    if(intersect(mouseX, mouseY, width - 160, 190, 150, 50)) {
      removePairColor = mouseOver;
    } else removePairColor = color(255);
    if(intersect(mouseX, mouseY, width - 160, height - 60, 150, 50)) {
      resetColor = mouseOver;
    } else resetColor = color(255);
    
    cam.beginHUD();
    textSize(20);
    fill(addBondColor);
    rect(width - 160, 10, 150, 50);
    fill(removeBondColor);
    rect(width - 160, 70, 150, 50);
    fill(addPairColor);
    rect(width - 160, 130, 150, 50);
    fill(removePairColor);
    rect(width - 160, 190, 150, 50);
    fill(resetColor);
    rect(width - 160, height - 60, 150, 50);
    fill(255);
    if(bondSelection == 1) fill(200);
    else fill(255);
    rect(width - 160, 250, 43, 50);
    if(bondSelection == 2) fill(200);
    else fill(255);
    rect(width - 107, 250, 43, 50);
    if(bondSelection == 3) fill(200);
    else fill(255);
    rect(width - 54, 250, 43, 50);
    fill(255);
    rect(10, 10, 250, 80);
    rect(10, 100, 250, 80);
    rect(10, 190, 250, 80);
    fill(0);
    text("Add Bond", width - 135, 42);
    text("Remove Bond", width - 150, 102);
    text("Add Lone Pair", width - 152, 163);
    text("Remove Pair", width - 145, 221);
    text("Molecular Geometry", 35, 40);
    text("Electron Domain", 35, 130);
    text("Bond Angle(s)", 35, 220);
    text("Reset", width - 112, height - 28);
    textSize(17);
    text(molecularShape, 35, 70);
    text(electronDomain, 35, 160);
    if(bondAngle > 0) {
      if(bondAngle2 == 0) {
      text(bondAngle + "", 35, 250);
      } else {
        text(bondAngle + ", " + bondAngle2, 35, 250);
      }
    } else {
      text("N/A", 35, 250);
    }
    
    fill(0);
    textSize(12);
    text("Single\nBonds", width - 156, 269);
    text("Double\nBonds", width - 106, 269);
    text("Triple\nBonds", width - 51, 269);
    
  
    cam.endHUD();
    
    fill(255, 0, 255);
    strokeWeight(0);
    sphere(50);
    
    //Insert Bonds here
    
    manageBonds();
    
  }
}

void manageBonds() {
  int index = 0;
  for(int i = 0; i < numberOfSingleBonds; i++) {
    nValues[index] = 1;
    index++;
  }
  
  for(int i = 0; i < numberOfDoubleBonds; i++) {
    nValues[index] = 2;
    index++;
  }
  
  for(int i = 0; i < numberOfTripleBonds; i++) {
    nValues[index] = 3;
    index++;
  }
  
  n = nValues[0];
  n1 = nValues[1];
  n2 = nValues[2];
  n3 = nValues[3];
  n4 = nValues[4];
  n5 = nValues[5];
  
  
  if(numberOfLones == 0) {
    if(numberOfBonds == 1) new Bond(n, false).show();
    if(numberOfBonds == 2) {
      pushMatrix();
      new Bond(n, false).show();
      rotate(PI);
      new Bond(n1, false).show();
      popMatrix();
    }
    if(numberOfBonds == 3) {
      pushMatrix();
      new Bond(n, false).show();
      rotate(2 * PI/3);
      new Bond(n1, false).show();
      rotate(2 * PI/3);
      new Bond(n2, false).show();
      popMatrix();
    }
    if(numberOfBonds == 4) {
      rotateZ(PI/2);
      new Bond(n, false).show();
      pushMatrix();
      rotateY(109.5 * PI / 180);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateX(2 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n2, false).show();
      popMatrix();
      pushMatrix();
      rotateX(4 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n3, false).show();
      popMatrix();
    }
    if(numberOfBonds == 5) {
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n, false).show();
      rotateZ(PI);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(n2, false).show();
      rotateY(2 * PI / 3);
      new Bond(n3, false).show();
      rotateY(2 * PI / 3);
      new Bond(n4, false).show();
      popMatrix();
    }
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(n, false).show();
      rotate(PI);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(n2, false).show();
      rotateY(PI);
      new Bond(n3, false).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n4, false).show();
      rotateZ(PI);
      new Bond(n5, false).show();
      popMatrix();
    }
  }
  if(numberOfLones == 1) { //LONES == 1
    if(numberOfBonds == 1) new Bond(1, true).show();
    if(numberOfBonds == 2) {
      new Bond(n, false).show();
      rotate(PI);
      new Bond(1, true).show();
    }
    if(numberOfBonds == 3) {
      new Bond(1, true).show();
      rotate(2 * PI/3);
      new Bond(n, false).show();
      rotate(2 * PI/3);
      new Bond(n1, false).show();
    }
    if(numberOfBonds == 4) {
      rotateZ(PI/2);
      new Bond(1, true).show();
      pushMatrix();
      rotateY(109.5 * PI / 180);
      new Bond(n, false).show();
      popMatrix();
      pushMatrix();
      rotateX(2 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateX(4 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n2, false).show();
      popMatrix();
    }
    if(numberOfBonds == 5) {
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n, false).show();
      rotateZ(PI);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(n2, false).show();
      rotateY(2 * PI / 3);
      new Bond(n3, false).show();
      popMatrix();
    }
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(1, true).show();
      rotate(PI);
      new Bond(n, false).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(n1, false).show();
      rotateY(PI);
      new Bond(n2, false).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n3, false).show();
      rotateZ(PI);
      new Bond(n4, false).show();
      popMatrix();
    }
  }
  if(numberOfLones == 2) { //LONES == 2
    if(numberOfBonds == 2) {
      new Bond(1, true).show();
      rotate(PI);
      new Bond(1, true).show();
    }
    if(numberOfBonds == 3) {
      new Bond(1, true).show();
      rotate(2 * PI/3);
      new Bond(1, true).show();
      rotate(2 * PI/3);
      new Bond(n, false).show();
    }
    if(numberOfBonds == 4) {
      rotateZ(PI/2);
      new Bond(1, true).show();
      pushMatrix();
      rotateY(109.5 * PI / 180);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateX(2 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n, false).show();
      popMatrix();
      pushMatrix();
      rotateX(4 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n1, false).show();
      popMatrix();
    }
    if(numberOfBonds == 5) {
      rotateZ(-PI/2);
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n, false).show();
      rotateZ(PI);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(n2, false).show();
      popMatrix();
    }
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(1, true).show();
      rotate(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(n, false).show();
      rotateY(PI);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n2, false).show();
      rotateZ(PI);
      new Bond(n3, false).show();
      popMatrix();
    }
  }
  if(numberOfLones == 3) { //LONES == 3
    if(numberOfBonds == 3) {
      new Bond(1, true).show();
      rotate(2 * PI/3);
      new Bond(1, true).show();
      rotate(2 * PI/3);
      new Bond(1, true).show();
    }
    if(numberOfBonds == 4) {
      rotateZ(PI/2);
      new Bond(1, true).show();
      pushMatrix();
      rotateY(109.5 * PI / 180);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateX(2 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateX(4 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(n, false).show();
      popMatrix();
    }
    if(numberOfBonds == 5) {
      rotateZ(-PI/2);
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n, false).show();
      rotateZ(PI);
      new Bond(n1, false).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      popMatrix();
    }
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(1, true).show();
      rotate(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(PI);
      new Bond(n, false).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n1, false).show();
      rotateZ(PI);
      new Bond(n2, false).show();
      popMatrix();
    }
  }
  if(numberOfLones == 4) { //LONES == 4
    if(numberOfBonds == 4) {
      rotateZ(PI/2);
      new Bond(1, true).show();
      pushMatrix();
      rotateY(109.5 * PI / 180);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateX(2 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateX(4 * PI / 3);
      rotateY(109.5 * PI / 180);
      new Bond(1, true).show();
      popMatrix();
    }
    if(numberOfBonds == 5) {
      rotateZ(-PI/2);
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n, false).show();
      rotateZ(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      popMatrix();
    }
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(1, true).show();
      rotate(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(n, false).show();
      rotateZ(PI);
      new Bond(n1, false).show();
      popMatrix();
    }
  }
  if(numberOfLones == 5) { //LONES == 5
    if(numberOfBonds == 5) {
      rotateZ(-PI/2);
      pushMatrix();
      rotateZ(PI/2);
      new Bond(1, true).show();
      rotateZ(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      rotateY(2 * PI / 3);
      new Bond(1, true).show();
      popMatrix();
    }
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(1, true).show();
      rotate(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(1, true).show();
      rotateZ(PI);
      new Bond(n, false).show();
      popMatrix();
    }
  }
  if(numberOfLones == 6) { //LONES == 6
    if(numberOfBonds == 6) {
      pushMatrix();
      new Bond(1, true).show();
      rotate(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateY(PI/2);
      new Bond(1, true).show();
      rotateY(PI);
      new Bond(1, true).show();
      popMatrix();
      pushMatrix();
      rotateZ(PI/2);
      new Bond(1, true).show();
      rotateZ(PI);
      new Bond(1, true).show();
      popMatrix();
    }
  }
}
