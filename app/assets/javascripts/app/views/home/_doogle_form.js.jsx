/** @jsx React.DOM */

var DoogleForm = React.createClass({

  handleKeyPress: function (event) {
    if (this.props.errors) {
       jQuery(this.refs[event.target.id].getDOMNode()).removeClass('has-error');
     }
     this.props.handleKeyPress();
   },

  handleSubmit: function (event) {
    event.preventDefault();

    this.refs.value.getDOMNode().value = this.refs.value.getDOMNode().value.trim().toLowerCase();

    if (!this.refs.value.getDOMNode().value)
      return false;

    var formData = $( this.refs.form.getDOMNode() ).serialize();
    this.props.onButtonSubmit(formData, this.props.url);
    this.refs.value.getDOMNode().value = "";
  },

  render: function() {
    return (
      <form ref="form" action={this.props.url} accept-charset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
        <p><input id="value" type="text" autofocus="autofocus" ref="value" onKeyPress={ this.handleKeyPress } name="word[value]"/></p>
        <p><button type="submit">Doogle Search</button></p>
        <ValidationErrorList refs={this.refs} errors={this.props.errors} />
      </form>

    );
  }
});