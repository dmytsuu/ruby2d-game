require 'ruby2d'

RIGHT_MOVEMENT_KEYS = %w[d right].freeze
LEFT_MOVEMENT_KEYS = %w[a left].freeze
UP_MOVEMENT_KEYS = %w[w up].freeze
DOWN_MOVEMENT_KEYS = %w[s down].freeze

ANIMATION_TIME = 130
CHARACTER_SIZE_MULTIPLAYER = 3

character = Sprite.new(
  'main.png',
  width: 27 * CHARACTER_SIZE_MULTIPLAYER,
  height: 35 * CHARACTER_SIZE_MULTIPLAYER,
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
        time: ANIMATION_TIME
      },
      {
        x: 26,
        y: 0,
        width: 20,
        time: ANIMATION_TIME
      },
      {
        x: 46,
        y: 0,
        width: 27,
        time: ANIMATION_TIME
      },
      {
        x: 74,
        y: 0,
        width: 32,
        time: ANIMATION_TIME
      },
      {
        x: 46,
        y: 0,
        width: 27,
        time: ANIMATION_TIME
      },
      {
        x: 26,
        y: 0,
        width: 20,
        time: ANIMATION_TIME
      },
      {
        x: 1,
        y: 0,
        width: 25,
        time: ANIMATION_TIME
      },
      {
        x: 107,
        y: 0,
        width: 32,
        time: ANIMATION_TIME
      },
    ]
  }
)

# defaults

character.play animation: :stay, loop: true
animation = :stay
direction = nil


on :key_up do |event|
  # play idle animation
  if (RIGHT_MOVEMENT_KEYS + LEFT_MOVEMENT_KEYS).include?(event.key)
    if direction == :right
      character.play animation: :stay, loop: true
    else
      character.play animation: :stay, loop: true, flip: :horizontal
    end
    animation = :stay
  end
end

MOVE_SPEED = 4

on :key_held do |event|
  # move horizontal
  if RIGHT_MOVEMENT_KEYS.include?(event.key)
    character.x += MOVE_SPEED
  elsif LEFT_MOVEMENT_KEYS.include?(event.key)
    character.x -= MOVE_SPEED
  end

  # play horizontal animation
  if RIGHT_MOVEMENT_KEYS.include?(event.key)
    unless direction == :right && animation == :run
      animation = :run
      direction = :right
      character.play animation: animation, loop: true
    end
  elsif LEFT_MOVEMENT_KEYS.include?(event.key)
    unless direction == :left && animation == :run
      animation = :run
      direction = :left
      character.play animation: animation, loop: true, flip: :horizontal
    end
  end
end

# move vertical

on :key_held do |event|
  if DOWN_MOVEMENT_KEYS.include?(event.key)
    character.y += MOVE_SPEED
  elsif UP_MOVEMENT_KEYS.include?(event.key)
    character.y -= MOVE_SPEED
  end
end

show
