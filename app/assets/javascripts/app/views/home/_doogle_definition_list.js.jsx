/** @jsx React.DOM */

var DoogleDefinitionList = React.createClass({
  render: function() {
    var definitions = this.props.definitions.map(function(definition) {
      return <p>{ definition }</p>
    });

    return (
      <div>
        { definitions }
      </div>
    )
  }
});