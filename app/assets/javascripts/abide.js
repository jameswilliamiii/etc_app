$(document)
  .foundation({
    abide : {
      patterns: {
        password: /^.{8,128}$/,
        phone: /^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$/,
        zipcode: /^\d{5}$/
      }
    }
  });