class Cell extends React.Component {
  render() {
    return (
      <div onClick={() => this.props.placeMarker(this.props.id)} className={this.props.marker}></div>
    );
  }
}