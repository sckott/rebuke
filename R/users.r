Client$methods(
  list(
    user = function(user) {
      get('users', user)
    },

    follow = function(user) {
      post('users', user, 'follow')
    },

    unfollow = function(user) {
      delete('users', user, 'follow')
    },

    followers = function(user) {
      get('users', user, 'followers')
    },

    following = function(user) {
      get('users', user, 'following')
    }
  )
)
