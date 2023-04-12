int player = 1;
int[][] board = new int[3][3];
int boxSize = 100;

void setup() {
  size(320, 320);
}

void draw() {
  background(255);
  drawBoard();
  checkWin();
}

void drawBoard() {
  stroke(0);
  strokeWeight(4);
  line(boxSize, 0, boxSize, height);
  line(boxSize * 2, 0, boxSize * 2, height);
  line(0, boxSize, width, boxSize);
  line(0, boxSize * 2, width, boxSize * 2);

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      int x = i * boxSize + boxSize / 2;
      int y = j * boxSize + boxSize / 2;
      if (board[i][j] == 1) {
        drawX(x, y);
      } else if (board[i][j] == 2) {
        drawO(x, y);
      }
    }
  }
}

void drawX(int x, int y) {
  stroke(255, 0, 0);
  strokeWeight(10);
  line(x - boxSize / 4, y - boxSize / 4, x + boxSize / 4, y + boxSize / 4);
  line(x + boxSize / 4, y - boxSize / 4, x - boxSize / 4, y + boxSize / 4);
}

void drawO(int x, int y) {
  noFill();
  stroke(0, 0, 255);
  strokeWeight(10);
  ellipse(x, y, boxSize / 2, boxSize / 2);
}

void mouseClicked() {
  int x = mouseX / boxSize;
  int y = mouseY / boxSize;
  if (x < 3 && y < 3 && board[x][y] == 0) {
    board[x][y] = player;
    player = (player == 1) ? 2 : 1;
  }
}

void checkWin() {
  int winner = 0;
  for (int i = 0; i < 3; i++) {
    if (board[i][0] != 0 && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
      winner = board[i][0];
    }
    if (board[0][i] != 0 && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
      winner = board[0][i];
    }
  }
  if (board[0][0] != 0 && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
    winner = board[0][0];
  }
  if (board[2][0] != 0 && board[2][0] == board[1][1] && board[1][1] == board[0][2]) {
    winner = board[2][0];
  }
  if (winner != 0) {
    textSize(48);
    fill(0, 255, 0);
    text("Player " + winner + " wins!", 10, height / 2);

    noLoop();
  }
}
