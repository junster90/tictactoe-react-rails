class Game extends React.Component {
  constructor() {
    super();

    this.state = {
      gameover: null,
      player: null,
      computer: null,
      playerTurn: null,
      board: null,
      message: null
    };
  }

  componentDidMount() {
    this._newGame();
  }

  _newGame(){
    $.get('/new', (response) => {
      this.setState({...response});

      if(this.state.playerTurn == false){
        this._getComputerMove();
      }
    });
  }

  _placeMarker(key) {
    let board = this.state.board;
    const invalid = board[key] || !this.state.playerTurn
    if(invalid){
      return;
    }

    board[key] = this.state.player;

    this.setState({board: board, playerTurn: false});
    this._getComputerMove();
  }

  _getComputerMove() {
    this.setState({message: "Computer's turn. Computer is thinking..."});

    $.get('/computer_move', {id: this.state.id, board: this.state.board}).success((response) => {
      this.setState({...response});
    });
  }

  render() {
    if(!this.state.id){
      return <div>Loading...</div>
    }

    return (
      <div className="game">
        <Board currentState={this.state.board} placeMarker={this._placeMarker.bind(this)}/>
        <MessageBar message={this.state.message} />
      </div>
    );
  }
}