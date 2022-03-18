/*
better wordle
 
 Current objective:
 - Fixing the yellow boxes!
 
 Done:
 - Create class of boxes and display on screen
 - Get text to display after storing it into a variable 
 - parsing text
 - boolean check if the guessword is the randomWord
 - check if the guessWord is a word from allWords
 - invalid word cover up
 - Changing boxes to green, yellow, grey
 */

boxes[][] b = new boxes[6][5];
int x;
int y;
int row;
int col;
int side = 60;
int store;
//------------------------
char[] lowercase = {
  'a', 'b', 'c', 'd', 'e', 'f', 
  'g', 'h', 'i', 'j', 'k', 'l', 
  'm', 'n', 'o', 'p', 'q', 'r', 
  's', 't', 'u', 'v', 'w', 'x', 
  'y', 'z'};
String guess = "";
int state = 0;
int counter = 0;
String invalidWord;

String[] allWords;
String[] sensible;
String randomWord;

color storeColor = color(255);

IntList charCounter;
//------------------------

void setup() {  
  background(50);
  size(600, 600);
  allWords = loadStrings("all_words.txt");
  sensible = loadStrings("sensible_words.txt");

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
  randomWord = sensible[int(random(sensible.length))];
  randomWord = randomWord.toUpperCase();
  println(randomWord);
}
//------------------------
void draw() {
  //println(frameCount);
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
      fillback();
      char uppercase = Character.toUpperCase(key);
      col = guess.length();
      guess += uppercase;
      b[row][col] = new boxes(width/6 + width/7 * col, 60 + row * 85, 60, guess.charAt(guess.length()-1), storeColor);
      b[row][col].display();

      if (guess.length() == 5) {
        state = 1;
      }
    }
  }
  //------------------------
  if (key == ENTER && guess.length() == 5) {
    counter += 1;

    for (int i = 0; i < randomWord.length(); i++) {
      if (guess.charAt(i) == randomWord.charAt(i)) {
        storeColor = color(0, 255, 0);
        b[row][i].co = storeColor;
        b[row][i].display();
        //println("green");
      } else if (randomWord.indexOf(guess.charAt(i)) > -1) { //defunct
        
        storeColor = color(255, 255, 0);
        b[row][i].co = storeColor;
        b[row][i].display();
        //println("yellow");
      } else {
        storeColor = color(200);
        b[row][i].co = storeColor;
        b[row][i].display();
        //println("grey");
      }
    }

    if ( dictCheck(guess) == false) {
      invalid();
      for (int i = 0; i < 5; i++) {
        b[row][i].c = ' ';
        b[row][i].co = 255;
        b[row][i].display();
      }
      row -= 1;
      counter -= 1;
    }
    if (correctCheck(guess) == true) {
      winning();
    }
    if (counter == 6 && correctCheck(guess) == false) {
      losing();
    }

    guess = "";
    row += 1;
    state = 0;
    storeColor = color(255);
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
boolean correctCheck(String guessWord) {
  if (guessWord.equals(randomWord)) {
    return true;
  }
  return false;
}
//------------------------
boolean dictCheck(String guessWord) {
  boolean result = false;
  for (int i = 0; i < allWords.length; i++) {
    if (allWords[i].toUpperCase().equals(guessWord)) {
      return true;
    }
  }
  return result;
}
//------------------------
void invalid() {
  fill(255);
  invalidWord = "Invalid Word";
  textSize(20);
  textAlign(CENTER);
  text(invalidWord, width/2, 580);
}

void winning() {
  fill(0);
  rect(225, 250, 150, 150);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("WINNER!", width/2, height/2);
  text("# of Tries:" + counter, width/2, height/2 + 50);
}

void losing() {
  background(40);
  textSize(20);
  textAlign(CENTER);
  fill(255);
  text(" Better Luck Next Time ", width/2, height/2);
}

void fillback() {
  fill(50);
  rect(200, 550, 200, 50);
}
