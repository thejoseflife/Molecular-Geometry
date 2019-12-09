int bonds = numberOfBonds - numberOfLones;
int lones = numberOfLones;

void determineGeometries() {
  bonds = numberOfBonds - numberOfLones;
  lones = numberOfLones;
  if(bonds == 1 && lones == 0) {
    molecularShape = "Linear";
    electronDomain = "Linear";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 1 && lones == 1) {
    molecularShape = "Linear";
    electronDomain = "Linear";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 2 && lones == 0) {
    molecularShape = "Linear";
    electronDomain = "Linear";
    bondAngle = 180;
    bondAngle2 = 0;
  }
  if(bonds == 3 && lones == 0) {
    molecularShape = "Trigonal Planar";
    electronDomain = "Trigonal Planar";
    bondAngle = 120;
    bondAngle2 = 0;
  }
  if(bonds == 2 && lones == 1) {
    molecularShape = "Bent";
    electronDomain = "Trigonal Planar";
    bondAngle = 120;
    bondAngle2 = 0;
  }
  if(bonds == 4 && lones == 0) {
    molecularShape = "Tetrahedral";
    electronDomain = "Tetrahedral";
    bondAngle = 109.5;
    bondAngle2 = 0;
  }
  if(bonds == 3 && lones == 1) {
    molecularShape = "Trigonal Pyramidal";
    electronDomain = "Tetrahedral";
    bondAngle = 109.5;
    bondAngle2 = 0;
  }
  if(bonds == 2 && lones == 2) {
    molecularShape = "Bent";
    electronDomain = "Tetrahedral";
    bondAngle = 109.5;
    bondAngle2 = 0;
  }
  if(bonds == 1 && lones == 3) {
    molecularShape = "Linear";
    electronDomain = "Tetrahedral";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 5 && lones == 0) {
    molecularShape = "Trigonal Bipyramidal";
    electronDomain = "Trigonal Bipyramidal";
    bondAngle = 90;
    bondAngle2 = 120;
  }
  if(bonds == 4 && lones == 1) {
    molecularShape = "Seesaw";
    electronDomain = "Trigonal Bipyramidal";
    bondAngle = 90;
    bondAngle2 = 0;
  }
  if(bonds == 3 && lones == 3) {
    molecularShape = "T-Shaped";
    electronDomain = "Octahedral";
    bondAngle = 90;
    bondAngle2 = 0;
  }
  if(bonds == 3 && lones == 2) {
    molecularShape = "T-Shaped";
    electronDomain = "Trigonal Bipyramidal";
    bondAngle = 90;
    bondAngle2 = 0;
  }
  if(bonds == 2 && lones == 3) {
    molecularShape = "Linear";
    electronDomain = "Trigonal Bipyramidal";
    bondAngle = 180;
    bondAngle2 = 0;
  }
  if(bonds == 6 && lones == 0) {
    molecularShape = "Octahedral";
    electronDomain = "Octahedral";
    bondAngle = 90;
    bondAngle2 = 0;
  }
  if(bonds == 5 && lones == 1) {
    molecularShape = "Square Pyramidal";
    electronDomain = "Octahedral";
    bondAngle = 90;
    bondAngle2 = 0;
  }
  if(bonds == 4 && lones == 2) {
    molecularShape = "Square Planar";
    electronDomain = "Octahedral";
    bondAngle = 90;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 0) {
    molecularShape = "N/A";
    electronDomain = "N/A";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 1 && lones == 2) {
    molecularShape = "Linear";
    electronDomain = "Trigonal Planar";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 1 && lones == 4) {
    molecularShape = "Linear";
    electronDomain = "Trigonal Bipyramidal";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 1 && lones == 5) {
    molecularShape = "Linear";
    electronDomain = "Octahedral";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 1) {
    molecularShape = "N/A";
    electronDomain = "Linear";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 2) {
    molecularShape = "N/A";
    electronDomain = "Linear";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 3) {
    molecularShape = "N/A";
    electronDomain = "Trigonal Planar";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 4) {
    molecularShape = "N/A";
    electronDomain = "Tetrahedral";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 5) {
    molecularShape = "N/A";
    electronDomain = "Trigonal Bipyramidal";
    bondAngle = 0;
    bondAngle2 = 0;
  }
  if(bonds == 0 && lones == 6) {
    molecularShape = "N/A";
    electronDomain = "Octahedral";
    bondAngle = 0;
    bondAngle2 = 0;
  }
}
