/** @jsx React.DOM */

var DoogleBox = React.createClass({
  getInitialState: function () {
    return JSON.parse(this.props.data);
   },

  handleKeyPress: function (event) {
     this.setState({ errors: {} });
   },

  handleWordSubmit: function(formData, postUrl) {
    $.ajax({
      data: formData,
      url: postUrl,
      type: "POST",
      dataType: "json",
      success: function (data) {
        this.setState({ definitions: data, errors: {} });
      }.bind(this),
      error: function (err) {
        this.setState({ errors: JSON.parse(err.responseText), definitions: [] });
      }.bind(this)
    });
  },

  render: function() {
    return (
      <div>
        <p>Doogle</p>
        <DoogleForm url={this.state.post_url} handleKeyPress = {this.handleKeyPress} errors={this.state.errors} onButtonSubmit={this.handleWordSubmit} />
        <DoogleDefinitionList definitions={this.state.definitions} />
      </div>
    );
  }
});