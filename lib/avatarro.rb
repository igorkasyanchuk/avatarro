require "avatarro/version"
require "avatarro/railtie"
require "base64"

module Avatarro
  GRADIENTS = [
    ["#ff9a9e", "#fad0c4", 45, '#444'],
    ["#a18cd1", "#fbc2eb", 90],
    ["#fad0c4", "#ffd1ff", 90],
    ["#ffecd2", "#fcb69f", 90],
    ["#ff8177", "#b12a5b", 90],
    ["#fbc2eb", "#a6c1ee", 90],
    ["#fdcbf1", "#e6dee9", 90, '#444'],
    ["#a1c4fd", "#c2e9fb", 120],
    ["#d4fc79", "#96e6a1", 120],
    ["#cfd9df", "#e2ebf0", 90, '#444'],
    ["#a6c0fe", "#f68084", 120],
    ["#fccb90", "#d57eeb", 120],
    ["#e0c3fc", "#8ec5fc", 120],
    ["#f093fb", "#f5576c", 120],
    ["#43e97b", "#38f9d7", 120],
    ["#30cfd0", "#330867", 90],
    ["#d299c2", "#fef9d7", 120],
    ["#16d9e3", "#46aef7", 120],
    ["#b8cbb8", "#cf6cc9", 90],
    ["#fff1eb", "#ace0f9", 90, '#444'],
    ["#0ba360", "#3cba92", 90],
    ["#9795f0", "#fbc8d4", 90],
    ["#93a5cf", "#e4efe9", 90],
    ["#ffafbd", "#ffc3a0", 45],
    ["#cc2b5e", "#753a88", 180],
    ["#ee9ca7", "#ffdde1", 180],
    ["#42275a", "#734b6d", 90],
    ["#bdc3c7", "#2c3e50", 90],
    ["#06beb6", "#48b1bf", 120],
    ["#eb3349", "#f45c43", 120],
    ["#56ab2f", "#a8e063", 90],
    ["#614385", "#516395", 120],
    ["#d66d75", "#e29587", 290],
    ["#000428", "#004e92", 90],
    ["#ddd6f3", "#faaca8", 90],
    ["#7b4397", "#dc2430", 190],
    ["#4568dc", "#b06ab3", 90],
    ["#4568dc", "#b06ab3", 90],
  ]


  def Avatarro.image(initials, args = {})
    "data:image/svg+xml;base64,#{Base64.encode64(svg(initials, args))}".html_safe
  end

  def Avatarro.svg(initials, args = {})
    template(initials, args)
  end

  private

  def Avatarro.index(initials)
    initials.chars.inject(0) {|sum, e| sum+= e.ord; sum}
  end

  def Avatarro.template(initials, args = {})
    data        = args[:random] ? GRADIENTS.sample : GRADIENTS[index(initials) % GRADIENTS.size]
    start       = args[:start].presence || data[0]
    finish      = args[:solid] ? data[0] : (args[:finish].presence || data[1])
    degree      = args[:degree].presence || data[2].presence || 90
    color       = args[:color].presence || data[3].presence || '#FFF'
    width       = args[:width].presence || 64
    height      = args[:height].presence || 64

    gradient_id = "gradient_#{Time.now.to_i}_#{rand(1_000_000)}"
    %{<?xml version="1.0" encoding="UTF-8"?>
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="#{width}" height="#{height}" viewBox="0 0 #{width} #{height}">
        <linearGradient id="#{gradient_id}" gradientTransform="rotate(#{degree})">
          <stop stop-color="#{start}" offset="0%" />
          <stop stop-color="#{finish}" offset="100%" />
        </linearGradient>
        <rect width="100%" height="100%" fill="url(##{gradient_id})" />
        <text fill="#{color}" font-family="Open Sans,Helvetica,Arial,sans-serif" font-size="#{1 + height / 2}" font-weight="500" x="50%" y="55%" dominant-baseline="middle" text-anchor="middle">
          #{initials}
        </text>
      </svg>
    }
  end

end
