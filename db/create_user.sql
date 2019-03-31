insert into users (user_email, user_hash)
values ($(email), $(hash))
returning *