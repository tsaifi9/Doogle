/** @jsx React.DOM */

var DoogleBox = React.createClass({
  render: function () {
    return (
      <div>
        <p>Doogle</p>
        <p><input id="word" type="text" autofucus="autofocus" ref="text" name="word[value]"/></p>
        <p><button type="submit">Doogle Search</button></p>
      </div>
    );
  }
});