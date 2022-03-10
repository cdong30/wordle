/*
better wordle
 
 Current objective:
 - Get text to display after storing it into a variable
 
 Done:
 - Create class of boxes and display on screen
 
 */

boxes[][] b = new boxes[6][5];
int x;
int y;
//------------------------
char[] lowercase = {'a', 'b', 'c', 'd', 'e', 'f', 
  'g', 'h', 'i', 'j', 'k', 'l', 
  'm', 'n', 'o', 'p', 'q', 'r', 
  's', 't', 'u', 'v', 'w', 'x', 
  'y', 'z'};
String guess = "";
int state = 0;
//------------------------
void setup() {  
  background(50);
  size(600, 600);

  for (int row = 0; row < 6; row++) {
    x = width/6;
    if (row == 0) {
      y = 60;
    } else {
      y += 85;
    }
    for (int col = 0; col < 5; col++) {
      b[row][col] = new boxes(x, y, 60);
      b[row][col].display();
      x += width/7;
    }
  }
}
//------------------------
void draw() {
  textSize(40);
  fill(200);
  textAlign(CENTER);
  text("WORDLE", width/2, 50);

  textAlign(BASELINE);
  //come up with math to add x and y
  text(guess, x, y);
}
//------------------------
void keyPressed() {
  x = 0;
  y = 85;

  if (key == BACKSPACE) {
    if (guess.length() > 0) { 
      guess = guess.substring(0, guess.length()-1);
    }
  } else {
    if (keyCheck(key) && state == 0) {
      char uppercase = Character.toUpperCase(key);
      guess += uppercase;
      //x += width/7;
      if(guess.length() >= 5){
        
        state = 1;
      }
    }
  }
}
//------------------------
boolean keyCheck(char k) {
  for (int i = 0; i < lowercase.length; i++) {
    if (k == lowercase[i]) { 
      return true;
    }
  }
  return false;
}
