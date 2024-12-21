-- Usage: add calls to `require('user.log').info(some_value)`.
-- The output will be logged to ~/.cache/nvim/user.log and outputted inside
-- the editor as a message (`:messages`).
return require('plenary.log').new {
  plugin = 'user',
  level = 'info',
}
