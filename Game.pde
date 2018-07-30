class Game {
  int score;
  int lives;
  boolean reset;
  boolean game_start;
  boolean finished;
  
  Game() {
    score = 0;
    lives = 5;
    reset = false;
    game_start = false;
    finished = false;
  }
  
  //Display all of the bricks on the screen
  void build() {
    for (int i=0; i<columns; i++) {
      for (int j=0; j<rows[i]; j++) {  //The array rows[] contains the randomised row values for each column that were calculated during the setup
        bricks[i][j].brick_collision(); //Check if ball has collided with brick
        if (bricks[i][j].is_active() == true) {
          bricks[i][j].display();  //Display the brick
        }
      }
    }
  }
  
  //Checks for collision of ball with paddle
  void paddle_collision() {
    if ((ball.ball_pos_x <= paddle.paddleRight()) && //if ball is left of paddle's right edge
        (ball.ball_pos_x >= paddle.paddleLeft()) && //if ball is right of paddle's left edge
        (ball.ballBottom() >= paddle.paddleTop())) { //if ball is on paddle's top edge
          ball.y_speed = -ball.y_speed; //reverse ball's direction
          if (ball.y_negative == true) {
            ball.y_negative = false;
          }
          else {
            ball.y_negative = true;
          }
          //If ball lands on right side of paddle then ball will ricochet off to the right
          if (ball.ball_pos_x >= paddle.paddle_pos_x && ball.ball_pos_x <= paddle.paddleRight()) {
            ball.x_speed = abs(ball.x_speed);
            ball.x_negative = false;
          }
          //If ball lands on left side of paddle then ball will ricochet off to the left
          else if (ball.ball_pos_x >= paddle.paddleLeft() && ball.ball_pos_x <= paddle.paddle_pos_x) {
            ball.x_speed = -abs(ball.x_speed);
            ball.x_negative = true;
          }
    }
  }
  
  //Displays the score in the top left of the screen
  void display_score() {
    textSize(15);
    fill(0);
    String mytext = "Score: " + score;
    text(mytext, 15, 15);
  }
  
  //Displays the lives in the top right of the screen
  void display_lives() {
    textSize(15);
    fill(0);
    String mytext = "Lives: " + lives;
    text(mytext, width - 100, 15);
  }
  
  //Resets ball speed and position onto paddle if it touches bottom wall of screen
  void reset() {
    if (reset == true) {
      ball.x_speed = 0;
      ball.y_speed = 0;
      ball.x_negative = false;
      ball.y_negative = true;
      ball.ball_pos_x = width/2;
      ball.ball_pos_y = (height-paddle.paddle_height) - (ball.ball_radius+1);
      ball.display();
    }
  }
  
  //Game over screen
  void game_over() {
    if (lives == 0) {  //If player lost the game
      textSize(width/10);
      fill(0, 102, 153, 204);
      text("Game Over", width/4, height/3);
      String mytext = "Score: " + score;
      textSize(width/15);
      fill(0, 102, 153, 204);
      text(mytext, width/3, height/2);
    }
    else if (active_bricks == 0) {  //if player won the game
      textSize(width/10);
      fill(0, 102, 153, 204);
      text("You won!", width/4, height/3);
      String mytext = "Score: " + score;
      textSize(width/15);
      fill(0, 102, 153, 204);
      text(mytext, width/3, height/2);
    }
  }
}