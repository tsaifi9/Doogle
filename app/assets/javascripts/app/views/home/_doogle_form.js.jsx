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

    this.refs.word.getDOMNode().value = this.refs.word.getDOMNode().value.trim().toLowerCase();

    if (!this.refs.word.getDOMNode().value)
      return false;

    var formData = $( this.refs.form.getDOMNode() ).serialize();
    this.props.onButtonSubmit(formData, this.props.url);
    this.refs.word.getDOMNode().value = "";
  },

  render: function() {
    return (
      <form ref="form" action={this.props.url} accept-charset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
        <p><input id="word" type="text" autofocus="autofocus" ref="word" onKeyPress={ this.handleKeyPress } name="word[word]"/></p>
        <p><button type="submit">Doogle Search</button></p>
        <ValidationErrorList refs={this.refs} errors={this.props.errors} />
      </form>

    );
  }
});