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

Merit::Badge.create!(
  id: 7,
  name: "Deaths 2",
  description: "Level 2 deaths"
)

Merit::Badge.create!(
  id: 8,
  name: "Deaths 3",
  description: "Level 3 deaths"
)

Merit::Badge.create!(
  id: 9,
  name: "Deaths 4",
  description: "Level 4 deaths"
)

Merit::Badge.create!(
  id: 10,
  name: "Deaths 5",
  description: "Level 5 deaths"
)

Merit::Badge.create!(
  id: 11,
  name: "Coins 1",
  description: "Level 1 coins"
)

Merit::Badge.create!(
  id: 12,
  name: "Coins 2",
  description: "Level 2 coins"
)

Merit::Badge.create!(
  id: 13,
  name: "Coins 3",
  description: "Level 3 coins"
)

Merit::Badge.create!(
  id: 14,
  name: "Coins 4",
  description: "Level 4 coins"
)

Merit::Badge.create!(
  id: 15,
  name: "Coins 5",
  description: "Level 5 coins"
)
