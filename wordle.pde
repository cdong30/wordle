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
int row;
int col;
int side = 60;
//------------------------
char[] lowercase = {'a', 'b', 'c', 'd', 'e', 'f', 
                    'g', 'h', 'i', 'j', 'k', 'l', 
                    'm', 'n', 'o', 'p', 'q', 'r', 
                    's', 't', 'u', 'v', 'w', 'x', 
                    'y', 'z'};
String guess = "";
int state = 0;
int counter = 0;
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
      b[row][col] = new boxes(x, y, side);
      b[row][col].display();
      b[row][col].squares();
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
}
//------------------------
void keyPressed() {

  if (key == BACKSPACE) {
    if (guess.length() > 0) {
      guess = guess.substring(0, guess.length()-1);
      col = guess.length();
      b[row][col].squares();
      state = 0;
    }
  } else {
    if (keyCheck(key) && state == 0) {
      char uppercase = Character.toUpperCase(key);
      col = guess.length();
      guess += uppercase;
      println(guess);
      b[row][col] = new boxes(width/6 + width/7 * col, 60 + row * 85, 60, guess.charAt(guess.length()-1));
      b[row][col].display();

      if (guess.length() == 5) {
        state = 1;
      }
    }
  }

  if (key == ENTER && guess.length() == 5) {
    guess = "";
    counter += 1;
    row += 1;
    state = 0;
    println(counter);
  }

  if (counter == 6) {
    if (wordCheck(guess) == true) {
      rect(width/6, height/6, width/6, width/6);
      
    } else {
      background(50);
      text(" YAY!? ", width/2, height/2);
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
//------------------------
boolean wordCheck(String guessWord) {
  return true;
}
