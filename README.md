# Avatarro

Google-style avatar generator for your app. 

This gem generates SVG which can be used inside your HTML or img(src) to display google-style avatar with initials.

Sample:

[<img src="https://github.com/igorkasyanchuk/avatarro/blob/main/docs/avataro.png?raw=true"
/>](https://github.com/igorkasyanchuk/avatarro/blob/main/docs/avataro.png?raw=true)

## Usage

You can generate avatar using 2 methods, depending how you need to use it. Using `Avatarro.svg` method to embed svg inside HTML or `Avatarro.image` method to generate Base64 image use with image_tag.

```erb
  <%= image_tag Avatarro.image(current_user.full_name), size: '24x24' %>
  <%= image_tag Avatarro.image("Igor Kasyanchuk", solid: true), size: '24x24' %>
  <%= image_tag Avatarro.image("IK"), size: '32x32' %>
  <%= raw Avatarro.svg("IK") %>
```

It you need rounded avatars just add CSS to the img.

```erb
<%= image_tag Avatarro.image("IK"), size: '32x32', style: 'border-radius: 50%' %>
```

More samples:

```erb
<div class="card">
  <h3>Avatar Generator for the<br>APP</h3>
  <div class="people round">
    <%= image_tag Avatarro.image("OI"), size: '16x16' %>
    <%= image_tag Avatarro.image("JS"), size: '16x16' %>
    <%= image_tag Avatarro.image("MK"), size: '16x16' %>
    <%= image_tag Avatarro.image("ZP"), size: '16x16' %>
  </div>
</div>

<div class="card">
  <h3>Generates SVG for the html</h3>
  <div class="people round">
    <%= image_tag Avatarro.image("OI", solid: true), size: '24x24' %>
    <%= image_tag Avatarro.image("JS", solid: true), size: '24x24' %>
    <%= image_tag Avatarro.image("MK", solid: true), size: '24x24' %>
    <%= image_tag Avatarro.image("ZP", solid: true), size: '24x24' %>
    <%= image_tag Avatarro.image("😁", solid: true), size: '24x24' %>
    <%= image_tag Avatarro.image("😂", solid: true), size: '24x24' %>
  </div>
</div>

<div class="card">
  <h3>Or can be used as<br> img src="..."</h3>
  <div class="people">
    <%= image_tag Avatarro.image("ZO", random: true), size: '32x32' %>
    <%= image_tag Avatarro.image("AB", random: true), size: '32x32' %>
    <%= image_tag Avatarro.image("ФЯ", random: true), size: '32x32' %>
    <%= image_tag Avatarro.image("DA", random: true), size: '32x32' %>
  </div>
</div>

<div class="clear"></div>

<div class="card">
  <%= raw Avatarro.svg("IK") %>
  <%= raw Avatarro.svg("WS") %>
  <%= raw Avatarro.svg("AP") %>
  <hr>
  <%= image_tag Avatarro.image("WW") %>
  <%= image_tag Avatarro.image("OI", random: true) %>
  <%= image_tag Avatarro.image("ZA"), style: 'border-radius: 50%', size: '32x32' %>
  <%= image_tag Avatarro.image("OZ", random: true), style: 'border-radius: 50%', size: '16x16' %>
</div>


<div class="card">
  <%= image_tag Avatarro.image("WA", random: true, width: 300, height: 300) %>
</div>

<div class="card">
  <%= image_tag Avatarro.image("⚡", random: true, width: 300, height: 300) %>
</div>
```

## Configuration

Example of the possible options (see args hash):

```ruby
  def Avatarro.template(initials, args = {})
    data        = args[:random] ? GRADIENTS.sample : GRADIENTS[index(initials) % GRADIENTS.size]
    start       = args[:start].presence || data[0]
    finish      = args[:solid] ? data[0] : (args[:finish].presence || data[1])
    degree      = args[:degree].presence || data[2].presence || 90
    color       = args[:color].presence || data[3].presence || '#FFF'
    width       = args[:width].presence || 64
    height      = args[:height].presence || 64
```

For example:

```erb
  <%= image_tag Avatarro.image("WA", random: true, width: 300, height: 300, color: 'red') %>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'avatarro'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install avatarro
```

## Contributing
Contribution directions go here.

## TODO

- CI
- better graphics and more gradients
- radial gradient

## Credits

The idea of this gem came after reading an article: https://kukicola.io/posts/creating-google-like-letter-avatars-using-erb-generated-svgs/. We actually did something similar with HTML/CSS on our project too, but with SVG solution looks just better.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
