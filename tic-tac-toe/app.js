(function() {
  var container, events, game, render;

  container = null;

  game = null;

  render = function() {
    var html, msg, msgtext, row, tile, x, y, _i, _j, _len, _len1, _ref;
    html = "";
    _ref = game.board;
    for (x = _i = 0, _len = _ref.length; _i < _len; x = ++_i) {
      row = _ref[x];
      for (y = _j = 0, _len1 = row.length; _j < _len1; y = ++_j) {
        tile = row[y];
        html = "" + html + "<a href=\"#\" data-x=\"" + x + "\" data-y=\"" + y + "\" class=\"tile-" + (tile.textStatus()) + "\">";
        html = "" + html + "<span class=\"x\">X</span><span class=\"o\">O</span></a>";
      }
    }
    html = "" + html + "<div id=\"msg\" class=\"msg\"></div>";
    container.innerHTML = html;
    game.textStatus().split(' ').forEach(function(c) {
      return container.classList.add(c);
    });
    if (game.textStatus().indexOf("done") >= 0) {
      msg = document.getElementById("msg");
      switch (game.status) {
        case gamestatus.won.x:
          msgtext = "X is the winner!";
          break;
        case gamestatus.won.o:
          msgtext = "O is the winner!";
          break;
        case gamestatus.draw:
          msgtext = "It's a draw.";
      }
      msg.innerHTML = msgtext;
      return setTimeout(function() {
        game = new TicTacToe();
        container.setAttribute("class", "");
        msg.innerHTML = "";
        return render();
      }, 3000);
    } else {
      return events();
    }
  };

  events = function() {
    var node, _i, _len, _ref, _results;
    _ref = container.childNodes;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      node = _ref[_i];
      _results.push(node.addEventListener("click", function(e) {
        var data;
        e.preventDefault();
        data = this.dataset;
        game.setMove(data.x, data.y);
        return render();
      }));
    }
    return _results;
  };

  window.addEventListener("DOMContentLoaded", function() {
    container = document.getElementById("game");
    game = new TicTacToe();
    return render();
  });

}).call(this);

(function() {
  var TicTacToe, Tile, gamestatus, tilestatus;

  tilestatus = {
    empty: 10,
    x: 11,
    o: 12,
    reverse: function(status) {
      switch (status) {
        case this.empty:
          return "";
        case this.x:
          return "X";
        case this.o:
          return "O";
      }
    }
  };

  gamestatus = {
    active: 20,
    won: {
      x: 21,
      o: 22
    },
    draw: 23,
    reverse: function(status) {
      switch (status) {
        case this.active:
          return "active";
        case this.won.x:
          return "done x-won";
        case this.won.o:
          return "done o-won";
        case this.draw:
          return "done draw";
      }
    }
  };

  Tile = (function() {
    function Tile() {
      this.status = tilestatus.empty;
    }

    Tile.prototype.textStatus = function() {
      return tilestatus.reverse(this.status);
    };

    return Tile;

  })();

  TicTacToe = (function() {
    function TicTacToe() {
      var i, j, _i, _j;
      this.status = gamestatus.active;
      for (i = _i = 0; _i <= 2; i = ++_i) {
        this.board[i] = [];
        for (j = _j = 0; _j <= 2; j = ++_j) {
          this.board[i][j] = new Tile();
        }
      }
    }

    TicTacToe.prototype.board = [];

    TicTacToe.prototype.turn = tilestatus.x;

    TicTacToe.prototype.textStatus = function() {
      return gamestatus.reverse(this.status);
    };

    TicTacToe.prototype.isDone = function() {
      return this.status === gamestatus.won.x || this.status === gamestatus.won.o || this.status === gamestatus.draw;
    };

    TicTacToe.prototype.isMatch = function(t1, t2, t3) {
      var _ref;
      return t1.status !== tilestatus.empty && (t1.status === (_ref = t2.status) && _ref === t3.status);
    };

    TicTacToe.prototype.setWin = function(status) {
      if (status === tilestatus.x) {
        return this.status = gamestatus.won.x;
      } else {
        return this.status = gamestatus.won.o;
      }
    };

    TicTacToe.prototype.checkForWin = function(x, y) {
      if (this.movesTaken === 9) {
        return this.status = gamestatus.draw;
      } else if (this.isMatch(this.board[0][0], this.board[1][0], this.board[2][0])) {
        return this.setWin(this.board[0][0].status);
      } else if (this.isMatch(this.board[0][1], this.board[1][1], this.board[2][1])) {
        return this.setWin(this.board[0][1].status);
      } else if (this.isMatch(this.board[0][2], this.board[1][2], this.board[2][2])) {
        return this.setWin(this.board[0][2].status);
      } else if (this.isMatch(this.board[0][0], this.board[0][1], this.board[0][2])) {
        return this.setWin(this.board[0][0].status);
      } else if (this.isMatch(this.board[1][0], this.board[1][1], this.board[1][2])) {
        return this.setWin(this.board[1][0].status);
      } else if (this.isMatch(this.board[2][0], this.board[2][1], this.board[2][2])) {
        return this.setWin(this.board[2][0].status);
      } else if (this.isMatch(this.board[0][0], this.board[1][1], this.board[2][2])) {
        return this.setWin(this.board[0][0].status);
      } else if (this.isMatch(this.board[2][0], this.board[1][1], this.board[0][2])) {
        return this.setWin(this.board[2][0].status);
      }
    };

    TicTacToe.prototype.movesTaken = 0;

    TicTacToe.prototype.setMove = function(x, y) {
      if (this.board[x][y].status !== tilestatus.empty) {
        return;
      }
      if (this.isDone()) {
        return;
      }
      this.movesTaken = this.movesTaken + 1;
      this.board[x][y].status = this.turn;
      if (this.turn === tilestatus.x) {
        this.turn = tilestatus.o;
      } else {
        this.turn = tilestatus.x;
      }
      this.checkForWin(x, y);
      return this.status;
    };

    return TicTacToe;

  })();

  window.TicTacToe = TicTacToe;

  window.gamestatus = gamestatus;

}).call(this);
