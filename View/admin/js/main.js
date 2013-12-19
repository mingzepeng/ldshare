$('.ui.dropdown')
  .dropdown()
;
$('.ui.checkbox')
  .checkbox()
;
$('.ui.form')
  .form({
    username: {
      identifier : 'name',
      rules: [
        {
          type   : 'empty',
          prompt : 'Please enter a username'
        }
      ]
    }

  })
;