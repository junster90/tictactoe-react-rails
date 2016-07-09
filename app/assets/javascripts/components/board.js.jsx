class Board extends React.Component {
  _drawBoard(){
    return this.props.currentState.map(
      (cell, index) => {
        return <Cell marker={cell} placeMarker={this.props.placeMarker} id={index} key={index}/>
      }
    );
  }

  render(){
    return (
      <div className="board">
        {this._drawBoard()}
      </div>
    );
  }
}