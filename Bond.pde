class Bond {

  int numBonds = 1;
  boolean lone = false;
  
  Bond(int numBonds, boolean lone) {
    this.numBonds = numBonds;
    this.lone = lone;
  }

  void show() {
    if(!lone) {
      if(numBonds == 1) {
        for(int i = 0; i < 12; i++) {
          fill(200, 200, 0);
          pushMatrix();
          translate(-50 - (i * 15), 0);
          box(15);
          popMatrix();
          
        }
      } else if(numBonds == 2) {
        for(int i = 0; i < 12; i++) {
          fill(200, 200, 0);
          pushMatrix();
          translate(-50 - (i * 15), 12);
          box(15);
          popMatrix();
          pushMatrix();
          translate(-50 - (i * 15), -12);
          box(15);
          popMatrix();
        }
      } else if(numBonds == 3) {
        for(int i = 0; i < 12; i++) {
          fill(200, 200, 0);
          pushMatrix();
          translate(-50 - (i * 15), 0);
          box(15);
          popMatrix();
          pushMatrix();
          translate(-30 - (i * 15), -22);
          box(15);
          popMatrix();
          pushMatrix();
          translate(-30 - (i * 15), 22);
          box(15);
          popMatrix();
        }
      }
      fill(0, 200, 0);
      pushMatrix();
      translate(-30 - (9 * 20), 0);
      sphere(40);
      popMatrix();
    } else {
      pushMatrix();
      translate(-80, 20);
      fill(255, 255, 0);
      sphere(15);
      popMatrix();
      pushMatrix();
      translate(-80, -20);
      fill(255, 255, 0);
      sphere(15);
      popMatrix();
      
    }
  }

}
