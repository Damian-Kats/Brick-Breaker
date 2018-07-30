class Ball {
  float ball_height;
  float ball_width;
  float ball_radius;
  float ball_pos_x;
  float ball_pos_y;
  color ball_colour;
  float x_speed;
  float y_speed;
  float move_speed;
  boolean x_negative;
  boolean y_negative;
  
  Ball () {
    ball_height = width*0.02;
    ball_width = ball_height;
    ball_radius = ball_height/2;
    ball_pos_x = width/2;
    ball_pos_y = (height-paddle.paddle_height) - (ball_radius+1);
    ball_colour = blue;
    x_speed = 0;
    y_speed = x_speed;
    move_speed = 6;
    x_negative = false;
    y_negative = true;
  }
  
  void display() {
    //Constrain ball to follow the paddle and mouse if the game hasn't yet begun
    if (game.game_start == false) {
      ball_pos_x = constrain(mouseX, paddle.paddle_width/2, width-paddle.paddle_width/2);
      stroke(black);
      fill(ball_colour);
      ellipse(ball_pos_x, ball_pos_y, ball_width, ball_height);
    }
    //Free the ball to move across the entire screen after game has started
    else {
      stroke(black);
      fill(ball_colour);
      ellipse(ball_pos_x, ball_pos_y, ball_width, ball_height);
    }
  }
  
  //Calculates the ball's position and ricochets
  void bounce() {
    //Move the ball by the value of x_speed and y_speed
    ball_pos_x += x_speed;
    ball_pos_y += y_speed;
    //If ball has contacts left or right wall, reverse direction    
    if (ball_pos_x > width-(ball_width/2) || ball_pos_x < 0 + (ball_width/2)) {
      x_speed = -x_speed;
      if (x_negative == true) {
        x_negative = false;
      }
      else {
        x_negative = true;
      }
    }
    //If ball has contact with top wall, reverse direction
    if (ball_pos_y < 0 + (ball_width/2)) {
      y_speed = -y_speed;
      if (y_negative == true) {
        y_negative = false;
      }
      else {
        y_negative = true;
      }
    }
    //If ball touches bottom of screen then lose life or trigger game over
    if (ball_pos_y >= height) {
      game.lives -= 1;
      if (game.lives == 0) {
        game.finished = true;
      }
      else {
        game.game_start = false;
        game.reset = true;
        game.reset();
      }
    }
  }
  
  //Return ball's speed in the x direction
  float getXspeed() {
    return x_speed;
  }
  
  //Return ball's leftmost point
  float ballLeft() {
    return ball_pos_x - ball_radius;
  }
  
  //Return brick's rightmost point
  float ballRight() {
    return ball_pos_x + ball_radius;
  }
  
  //Return brick's highest point
  float ballTop() {
    return ball_pos_y - ball_radius;
  }
  
  //Return brick's lowest point
  float ballBottom() {
    return ball_pos_y + ball_radius;
  }
  
  //Set value of ball's speed in the x direction
  void setXspeed(float speed) {
    x_speed = speed;
  }
  
  //Set value of ball's speed in the y direction
  void setYspeed(float speed) {
    y_speed = speed;
  }
  
  //Check if ball is moving right or left in the x plane
  void checkXDir() {
    if (x_negative == true) {
        x_negative = false;
      }
      else {
        x_negative = true;
      }
  }
  
  //Check if ball is moving right or left in the y plane
  void checkYDir() {
    if (y_negative == true) {
        y_negative = false;
      }
      else {
        y_negative = true;
      }
  }
}