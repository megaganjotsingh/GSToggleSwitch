# ToggleSwitch

The ToggleSwitch library is a lightweight and easy-to-use solution for implementing customizable toggle switches in your iOS, MacOS and AppleVision projects. Designed to offer a visually appealing and interactive way to represent binary states (like on/off), this library is ideal for enhancing user interfaces with intuitive toggle controls.

Demo
  ---

![](https://github.com/megaganjotsingh/ToggleSwitch/blob/main/Gifs/sample.gif)

Easy to Use
  ---
  
  ### You can simply set all the properties in simple way

  ```swift
         toggleSwitch.set(
            properties: { prop in
                prop.width = 40
                prop.height = 20
                prop.cornerRadius = 10
                prop.onBackgroundColor = .green
                prop.thumbProperties.showThumbShadow = true
                prop.thumbProperties.backgroundColor = .white
            },
            tapOnSwitch: { [weak self] in
                guard let self = self else { return .off }
                return self.toggle1.currentState
            }
        )
  ```
  
  Collaboration
---

I tried to build an easy to use API, but I'm sure there are ways of improving and adding more features, If you think that we can do the ToggleSwitch more powerful please contribute with this project.
