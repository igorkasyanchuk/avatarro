# Avatarro

Google-style avatar generator for your app. 

This gem generates SVG which can be used inside your HTML or img(src) to display google-style avatar with initials.

Sample:

[<img src="https://github.com/igorkasyanchuk/avatarro/blob/main/docs/avataro.png?raw=true"
/>](https://github.com/igorkasyanchuk/avatarro/blob/main/docs/avataro.png?raw=true)

## Usage

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

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
