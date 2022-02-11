require 'ruby2d'

normal_animation_time = 130
# short_animation_time = 150
size_multiplayer = 3

character = Sprite.new(
  'main.png',
  width: 27 * size_multiplayer,
  height: 35 * size_multiplayer,
  animations: {
    stay: [
      {
        x: 140,
        y: 0,
        width: 24,
        time: 800
      },
      {
        x: 168,
        y: 0,
        width: 24,
        time: 100
      },
      {
        x: 140,
        y: 0,
        width: 24,
        time: 200
      },
      {
        x: 168,
        y: 0,
        width: 24,
        time: 100
      },
    ],
    run: [
      {
        x: 1,
        y: 0,
        width: 25,
        time: normal_animation_time
      },
      {
        x: 26,
        y: 0,
        width: 20,
        time: normal_animation_time
      },
      {
        x: 46,
        y: 0,
        width: 27,
        time: normal_animation_time
      },
      {
        x: 74,
        y: 0,
        width: 32,
        time: normal_animation_time
      },
      {
        x: 46,
        y: 0,
        width: 27,
        time: normal_animation_time
      },
      {
        x: 26,
        y: 0,
        width: 20,
        time: normal_animation_time
      },
      {
        x: 1,
        y: 0,
        width: 25,
        time: normal_animation_time
      },
      {
        x: 107,
        y: 0,
        width: 32,
        time: normal_animation_time
      },
    ]
  }
)

character.play animation: :stay, loop: true
animation = :stay

direction = nil

RIGHT_MOVEMENT_KEYS = %w[d right].freeze
LEFT_MOVEMENT_KEYS = %w[a left].freeze
UP_MOVEMENT_KEYS = %w[w up].freeze
DOWN_MOVEMENT_KEYS = %w[s down].freeze

on :key_up do |event|
  if (RIGHT_MOVEMENT_KEYS + LEFT_MOVEMENT_KEYS).include?(event.key)
    if direction == :right
      character.play animation: :stay, loop: true
    else
      character.play animation: :stay, loop: true, flip: :horizontal
    end
    animation = :stay
  end
end

move_speed = 4

on :key_held do |event|
  if RIGHT_MOVEMENT_KEYS.include?(event.key)
    character.x += move_speed
  elsif LEFT_MOVEMENT_KEYS.include?(event.key)
    character.x -= move_speed
  end

  if RIGHT_MOVEMENT_KEYS.include?(event.key)
    unless direction == :right && animation == :run
      character.play animation: :run, loop: true
      animation = :run
      direction = :right
    end
  elsif LEFT_MOVEMENT_KEYS.include?(event.key)
    unless direction == :left && animation == :run
      character.play animation: :run, loop: true, flip: :horizontal
      animation = :run
      direction = :left
    end
  end
end

on :key_held do |event|
  if DOWN_MOVEMENT_KEYS.include?(event.key)
    character.y += move_speed
  elsif UP_MOVEMENT_KEYS.include?(event.key)
    character.y -= move_speed
  end
end

show
