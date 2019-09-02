# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end

Merit::Badge.create!(
  id: 1,
  name: "Monster killer 1",
  description: "Level 1 monster killer"
)

Merit::Badge.create!(
  id: 2,
  name: "Monster killer 2",
  description: "Level 2 monster killer"
)

Merit::Badge.create!(
  id: 3,
  name: "Monster killer 3",
  description: "Level 3 monster killer"
)

Merit::Badge.create!(
  id: 4,
  name: "Monster killer 4",
  description: "Level 4 monster killer"
)

Merit::Badge.create!(
  id: 5,
  name: "Monster killer 5",
  description: "Level 5 monster killer"
)

Merit::Badge.create!(
  id: 6,
  name: "Deaths 1",
  description: "Level 1 deaths"
)
