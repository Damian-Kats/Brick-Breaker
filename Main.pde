import java.util.concurrent.ThreadLocalRandom;

int width = 1200;
int height = 700;
int columns = 6;
int max_column_length = 7;
int min_column_length = 3;
int active_bricks = 0;
float brick_width = (width/columns)*0.67;
float brick_height = height/20;
float brick_gap_x = brick_width/3;
float brick_gap_y = brick_height/3;
float starting_x_pos = (width/columns)*0.5;
float starting_y_pos = height/10;
Brick[][] bricks = new Brick[columns][max_column_length];
int rows[] = new int[columns];
Game game;
Paddle paddle;
Ball ball;

void settings() {
  size(width,height);
}

void setup() {
  background(255);
  game = new Game();
  paddle = new Paddle();
  ball = new Ball();
  
  //Initialise bricks in arrays
  for (int i=0; i<columns; i++) {
    int randomNum = ThreadLocalRandom.current().nextInt(min_column_length, max_column_length+1);
    rows[i] = randomNum;
    for (int j=0; j<randomNum; j++) {
      color newColour = getRandomColour(brick_colour_array);
      bricks[i][j] = new Brick(starting_x_pos+(i*brick_width)+(i*brick_gap_x), starting_y_pos+(j*brick_height)+(j*brick_gap_y), newColour);
      active_bricks += 1;
    }
  }
  
}

void draw() {
  background(255);
  if (active_bricks == 0) {       //If no more active bricks left then game is finished
    game.finished = true;
  }
  if (game.finished == true) {    //If game is finished, proceed to game over function for either win or lose screen
    game.game_over();
  }
  else {
    game.build();                 //Display all bricks and calculate if any have collided with the ball
    paddle.display();             //Display the paddle 
    ball.display();               //Display the ball
    if (ball.getXspeed() != 0) {  //If ball is moving then allow it to bounce
      ball.bounce();
    }
    game.paddle_collision();      //Calculate whether ball has collided with paddle and, if so, its new directions
    game.display_score();         //Display the current score
    game.display_lives();         //Display the player's current amount of lives
  }
}

//Begin game, launch ball from paddle or pause
void mouseClicked() {
  if (game.game_start == false) { //If game hasn't started then change ball's trajectory based on position of the paddle
    if (mouseX > width/2) {
      ball.x_negative = true;
    }
    else {
      ball.x_negative = false;
    }
  }
  game.game_start = true;        //If game has started
  if (ball.x_speed == 0) {       //If ball is not moving, check it's prior directions and continue it's movement
    if (ball.x_negative == false) {
      ball.setXspeed(ball.move_speed);
    }
    else {
      ball.setXspeed(-ball.move_speed);
    }
    if (ball.y_negative == false) {
      ball.setYspeed(ball.move_speed);
    }
    else {
      ball.setYspeed(-ball.move_speed);
    }
  }
  else {                         //If ball is moving then stop it
    ball.setXspeed(0);
    ball.setYspeed(0);
  }
}