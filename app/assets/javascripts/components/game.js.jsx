class Game extends React.Component {
  constructor() {
    super();

    this.state = {
      gameover: null,
      player: null,
      computer: null,
      winner: null,
      playerTurn: null,
      board: null,
      message: null
    };
  }

  componentWillMount() {
    $.get('/new', (response) => {
      this.setState({...response});
    });
  }

  _placeMarker(key) {
    let board = this.state.board;
    const invalid = board[key] || this.state.gameover || !this.state.playerTurn
    if(invalid){
      return;
    }

    board[key] = this.state.playerMarker;

    this.setState({board: board, playerTurn: false});
    this._getComputerMove();
  }

  _getComputerMove(){
    if (!this.state.playerTurn){
      this.setState({message: "Computer's turn. Computer is thinking..."});

      $.get('/computer_move', {board: this.state.board}).success((response) => {
        console.log(response);
        this.setState({...response});
      });
    }
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