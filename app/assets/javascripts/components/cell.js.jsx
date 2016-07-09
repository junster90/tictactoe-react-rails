class Cell extends React.Component {
  render() {
    return (
      <div onClick={() => this.props.placeMarker(this.props.id)} className={`cell ${this.props.id} ${this.props.marker}`}></div>
    );
  }
}