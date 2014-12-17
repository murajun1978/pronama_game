#!ruby -Ks
require 'dxruby'
require_relative 'animation'

image = Image.load_tiles('pronama_chan.png', 3, 4)

pronama_chan = AnimeSprite.new
pronama_chan.x = 0
pronama_chan.y = 0
pronama_chan.animation_image = image
pronama_chan.add_animation   :advance,    10, [1, 2]
pronama_chan.add_animation   :retreat,    10, [10, 11]
pronama_chan.add_animation   :move_left,  10, [4, 5]
pronama_chan.add_animation   :move_right, 10, [7, 8]
pronama_chan.start_animation :advance

Window.loop do
  # 下矢印キーで前進する
  if Input.key_push?(K_DOWN)
    pronama_chan.start_animation(:advance)
    pronama_chan.y += 5 
  end

  # 上矢印キーで後退する
  if Input.key_push?(K_UP)
    pronama_chan.start_animation(:retreat)
    pronama_chan.y -= 5 
  end

  # 左矢印キーで左へ
  if Input.key_push?(K_LEFT)
    pronama_chan.start_animation(:move_left)
    pronama_chan.x -= 5 
  end

  # 右矢印キーで右へ
  if Input.key_push?(K_RIGHT)
    pronama_chan.start_animation(:move_right)
    pronama_chan.x += 5 
  end

  pronama_chan.update
  pronama_chan.draw

  # ESCで終了する
  break if Input.key_push?(K_ESCAPE)
end
