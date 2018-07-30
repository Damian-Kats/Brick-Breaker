class Paddle {
  float paddle_width;
  float paddle_height;
  float paddle_pos_x;
  float paddle_pos_y;
  color paddle_colour;
  
  Paddle() {
    paddle_width = width/5;
    paddle_height = 8;
    paddle_pos_x = width/2;
    paddle_pos_y = height-paddle_height/2;
    paddle_colour = orange;
  }
  
  //Display the paddle on the screen
  void display() {
    paddle_pos_x = constrain(mouseX, paddle_width/2, width-paddle_width/2);
    stroke(black);
    fill(paddle_colour);
    rectMode(CENTER);
    rect(paddle_pos_x, paddle_pos_y, paddle_width, paddle_height, 20);
  }
  
  //Return paddle's leftmost point
  float paddleLeft() {
    return paddle_pos_x - paddle_width/2;
  }
  
  //Return paddle's rightmost point
  float paddleRight() {
    return paddle_pos_x + paddle_width/2;
  }
  
  //Return paddle's highest point
  float paddleTop() {
    return paddle_pos_y - paddle_height/2;
  }
  
  //Return paddle's lowest point
  float paddleBottom() {
    return paddle_pos_y + paddle_height/2;
  }
}