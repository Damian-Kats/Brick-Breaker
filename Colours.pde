import java.util.Random;

//predefined values for the possible brick colours and stroke colour
color red = color(255,0,0);
color orange = color(255,100,0);
color yellow = color(255,255,0);
color green = color(0,255,0);
color blue = color(0,0,255);
color black = color(0);
color[] brick_colour_array = {red, orange, yellow, green};  //Array of possible colours for bricks

//A method for getting a random colour for a brick
public static int getRandomColour(color[] array) {
  int random = new Random().nextInt(array.length);
  return array[random];
}