void mousePressed() {
  if(mouseButton == LEFT) {
    if(page == 1) {
      if(intersect(mouseX, mouseY, width - 160, 10, 150, 50)) addBond();
      if(intersect(mouseX, mouseY, width - 160, 70, 150, 50)) removeBond();
      if(intersect(mouseX, mouseY, width - 160, 130, 150, 50)) addLonePair();
      if(intersect(mouseX, mouseY, width - 160, 190, 150, 50)) removePair();
      if(intersect(mouseX, mouseY, width - 160, height - 60, 150, 50)) reset();
      determineGeometries();
      
      if(intersect(mouseX, mouseY, width - 160, 250, 43, 50)) bondSelection = 1;
      if(intersect(mouseX, mouseY, width - 107, 250, 43, 50)) bondSelection = 2;
      if(intersect(mouseX, mouseY, width - 54, 250, 43, 50)) bondSelection = 3;
    } else if(page == 0) {
      if(intersect(mouseX, mouseY, width/2 - 200, height/2, 400, 200)) page = 1;
    }
  }
}

int recentBond = 0;

boolean intersect(int x, int y, int rectX, int rectY, int rectWidth, int rectHeight) {
  if(x >= rectX && x <= rectX + rectWidth && y >= rectY && y <= rectY + rectHeight) return true;
  return false;
}

void reset() {
  numberOfBonds = 0;
  numberOfLones = 0;
  n = 1;
  n1 = 1;
  n2 = 1;
  n3 = 1;
  n4 = 1;
  n5 = 1;
  numberOfSingleBonds = 0;
  numberOfDoubleBonds = 0;
  numberOfTripleBonds = 0;
}

void addBond() {
  if(numberOfBonds < 6) {
    if(bondSelection == 1) {
      numberOfSingleBonds++;
      recentBond = 1;
    }
    if(bondSelection == 2) {
      numberOfDoubleBonds++;
      recentBond = 2;
    }
    if(bondSelection == 3) {
      numberOfTripleBonds++;
      recentBond = 3;
    }
    numberOfBonds++;
  }
}

void removeBond() {
  if(numberOfBonds > 0 && numberOfBonds > numberOfLones) {
    numberOfBonds--;
    if(recentBond == 1 && numberOfSingleBonds > 0) numberOfSingleBonds--;
    else if(recentBond == 1 && numberOfSingleBonds == 0) {
      if(numberOfDoubleBonds > 0) numberOfDoubleBonds--;
      else if(numberOfTripleBonds > 0 && numberOfDoubleBonds == 0) numberOfTripleBonds--;
    }
    if(recentBond == 2 && numberOfDoubleBonds > 0) numberOfDoubleBonds--;
    else if(recentBond == 2 && numberOfDoubleBonds == 0) {
      if(numberOfSingleBonds > 0) numberOfSingleBonds--;
      else if(numberOfTripleBonds > 0 && numberOfSingleBonds == 0) numberOfTripleBonds--;
    }   
    if(recentBond == 3 && numberOfTripleBonds > 0) numberOfTripleBonds--;
    else if(recentBond == 3 && numberOfTripleBonds == 0) {
      if(numberOfSingleBonds > 0) numberOfSingleBonds--;
      else if(numberOfDoubleBonds > 0 && numberOfSingleBonds == 0) numberOfDoubleBonds--;
    }   
  }
}

void addLonePair() {
  if(numberOfBonds < 6) {
    numberOfBonds++;
    numberOfLones++;
  }
}

void removePair() {
  if(numberOfBonds > 0 && numberOfLones > 0) {
    numberOfBonds--;
    numberOfLones--;
  }
}
