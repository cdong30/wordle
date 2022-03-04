/*
better wordle
 
 Current objective:
 - Organize coordinates
 
 Done:
 - Create class of boxes and display on screen
 
 */
boxes[][] b = new boxes[6][5];
int x;
int y;

void setup() {
  size(600, 600);
  background(50);

  for (int row = 0; row < 6; row++) {
    x = width/6;
    if (row == 0) {
      y = 60;
    } else {
      y += 85;
    }
    for (int col = 0; col < 5; col++) {
      b[row][col] = new boxes(x, y, 75);
      b[row][col].display();
      x += width/7;
      //println(x, y);
    }
  }
  
  textSize(40);
  fill(225);
  textAlign(CENTER);
  text("WORDLE", 300, 50);
}

void draw() {
}
