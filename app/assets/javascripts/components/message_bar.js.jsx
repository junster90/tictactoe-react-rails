class MessageBar extends React.Component {
  render() {
    return (
      <div className="message-bar">
        <p>{this.props.message}</p>
      </div>
    );
  }
}