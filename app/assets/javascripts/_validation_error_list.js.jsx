/** @jsx React.DOM */

var ValidationErrorList = React.createClass({

  componentWillUpdate: function(nextProps, nextState) {
    if (nextProps.errors) {
      $.each(nextProps.errors, function(key, messages) {
        jQuery(this.props.refs[key].getDOMNode()).addClass('has-error');
      }.bind(this));
    }
  },

  render: function() {
    var errs = <p></p>;
    if (this.props.errors) {
      $.each(this.props.errors, function(key, messages) {
        errs = messages.map(function(message) {
          return <p class='has-error'>{key} {message}</p>
        });
      });
    }

    return (
      <div>
        { errs }
      </div>
    );
  }
});