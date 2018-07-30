class Brick {
  color brick_stroke;
  color brick_colour;
  float brick_x;
  float brick_y;
  int score;
  boolean brick_active;
  
 Brick(float new_brick_x, float new_brick_y, color new_colour) {
    brick_stroke = black;
    brick_colour = new_colour;
    brick_x = new_brick_x;
    brick_y = new_brick_y;
    brick_active = true;
    //Define scores based on the colour of the brick
    if (brick_colour == red) {
      score = 4;
    }
    else if (brick_colour == orange) {
      score = 3;
    }
    else if (brick_colour == yellow) {
      score = 2;
    }
    else if (brick_colour == green) {
      score = 1;
    }
  }
  
  //Display the brick on the screen
  void display() {
    stroke(brick_stroke);
    fill(brick_colour);
    rectMode(CORNER);
    rect(brick_x, brick_y, brick_width, brick_height, 20);
  }
  
  //Checks for collision of ball with bricks
  void brick_collision() {     
      //Ball collides with bottom of brick
      if (brick_active == true && ball.ballTop() <= brickBottom() && ball.ballTop() >= brickTop() && ball.ball_pos_x >= brickLeft() && ball.ball_pos_x <= brickRight()) { 
        brick_active = false;  //Deactivate brick
        active_bricks -= 1;    //Minus one from total active bricks
        ball.y_speed = -ball.y_speed;  //Reverse ball's speed in the y direction
        ball.checkYDir();
        game.score += getScore();  //Calculate score
      }
      
      //Ball collides with top of brick
      else if (brick_active == true && ball.ballBottom() >= brickTop() && ball.ballBottom() <= brickBottom() && ball.ball_pos_x >= brickLeft() && ball.ball_pos_x <= brickRight()) {
        brick_active = false;  //Deactivate brick
        active_bricks -= 1;    //Minus one from total active bricks
        ball.y_speed = -ball.y_speed;  //Reverse ball's speed in the y direction
        ball.checkYDir();
        game.score += getScore();  //Calculate score
      }
      
      //Ball collides with left side of brick
      else if (brick_active == true && ball.ballRight() >= brickLeft() && ball.ballRight() <= brickRight() && ball.ball_pos_y >= brickTop() && ball.ball_pos_y <= brickBottom()) {
        brick_active = false;  //Deactivate brick
        active_bricks -= 1;    //Minus one from total active bricks
        ball.x_speed = -ball.x_speed;  //Reverse ball's speed in the y direction
        ball.checkXDir();
        game.score += getScore();  //Calculate score
      }
      
      //Ball collides with right side of brick
      else if (brick_active == true && ball.ballLeft() <= brickRight() && ball.ballLeft() >= brickLeft() && ball.ball_pos_y >= brickTop() && ball.ball_pos_y <= brickBottom()) {
        brick_active = false;  //Deactivate brick
        active_bricks -= 1;    //Minus one from total active bricks
        ball.x_speed = -ball.x_speed;  //Reverse ball's speed in the y direction
        ball.checkXDir();
        game.score += getScore();  //Calculate score
      }
  }
  
  //Get the brick's score
  int getScore() {
    return score;
  }
  
  //Find if brick has been hit by ball or not
  boolean is_active() {
    return brick_active;
  }
  
  //Return brick's leftmost point
  float brickLeft() {
    return brick_x;
  }
  
  //Return brick's rightmost point
  float brickRight() {
    return brick_x + brick_width;
  }
  
  //Return brick's highest point
  float brickTop() {
    return brick_y;
  }
  
  //Return brick's lowest point
  float brickBottom() {
    return brick_y + brick_height;
  }
  
}