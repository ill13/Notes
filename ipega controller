

The Ipega Bluetooth Controller is a cheap controller for nearly every bluetooth device. With it’s holder it is specifically designed for smartphones. The controller has different operating modes, with different behaviors on different platforms. In this tutorial I will show you how to use this controller and it’s mapping for LibGDX.
Operating modes

The iPega Bluetooth Game Controller has four different operating modes. Each mode has a different behavior and so different mappings.

    Keyboard (Home + A): All buttons and axes are mapped to button presses
    iCade (Home + B): The right analogstick is not used and (nearly) all other components are firing two Events on each press and release.
    On each state change a Pressed and Released event is fired.
    Example: If you press the A button, both events are fired with the buttoncode 36. If you release the A button, both events are fired with the buttoncode 46.
    Gamepad (Home + X): Most important mode. The analogsticks are recognized as axes and all buttons are used as expected.
    Unknown (Home + Y): I wasn’t able to get this mode working. When I tried to connect it in this mode, it wants to use a paring code. If you accept this pairing code, nothing happens.

Establish a connection

The first thing to do, is to pair the controller with your PC/Smartphone. Enable bluetooth and start your controller. Depending on the mode you want to use, you need to press different buttons. Keep the Home buttons pressed and press the button for the desired mode. After that a red light blinks and you could release the buttons. After a few seconds you see the controller on your screen.

    If you want to start the Gamepad Mode, press and hold HOME and X for a few seconds.

Add bluetooth device (Windows)
Add bluetooth device (Android)

    Depending on the mode, the icon might be a bit different.

Choose the Ipega controller and wait until it is connected. After that it is ready for use. If your not satisfied with the current mode, you need to disconnect the controller and pair it again in a different mode. All in all I would recomment the Gamepad Mode.
LibGDX Mapping (Android)

The following code snippet shows the LibGDX mapping for Android devices. All in all the buttons and axes are all straight forward, except for the L1 and R1 buttons. Those two are not only buttons, but they are also axes. Unfortunately they are not analog axes, but discrete axes with only two states. If the buttons is pressed, it is 1 and otherwise 0.

//Mapping for Ipega Gamepad Mode (Home + X)
public class IpegaAndroid {
  public static final int BUTTON_A = 96;
  public static final int BUTTON_B = 97;
  public static final int BUTTON_X = 99;
  public static final int BUTTON_Y = 100;
  public static final int BUTTON_SELECT = 109;
  public static final int BUTTON_START = 108;

  public static final int BUTTON_L1 = 104;
  public static final int BUTTON_L2 = 102;
  public static final int BUTTON_L3 = 106;
  public static final int BUTTON_R1 = 105;
  public static final int BUTTON_R2 = 103;
  public static final int BUTTON_R3 = 107;

  public static final int BUTTON_MEDIA_MINUS = 25;
  public static final int BUTTON_MEDIA_START = 88;
  public static final int BUTTON_MEDIA_PLAY = 85;
  public static final int BUTTON_MEDIA_END = 87;
  public static final int BUTTON_MEDIA_PLUS = 24;

  public static final int AXIS_LEFT_X = 0;
  public static final int AXIS_LEFT_Y = 1;
  public static final int AXIS_RIGHT_X = 2;
  public static final int AXIS_RIGHT_Y = 3;
  public static final int AXIS_L1 = 5;
  public static final int AXIS_R1 = 4;
  public static final int AXIS_DPAD_X = 6;
  public static final int AXIS_DPAD_Y = 7;
}

LibGDX Mapping (PC)

This mapping is very similar, but the Media Keys are not acccesible, because windows use them directly and redirects them to media applications, like VLC or Spotify.

//Mapping for Ipega Gamepad Mode (Home + X)
public class IpegaPC {
  public static final int BUTTON_A = 0;
  public static final int BUTTON_B = 1;
  public static final int BUTTON_X = 3;
  public static final int BUTTON_Y = 4;
  public static final int BUTTON_SELECT = 10;
  public static final int BUTTON_START = 11;

  public static final int BUTTON_L1 = 8;
  public static final int BUTTON_L2 = 6;
  public static final int BUTTON_L3 = 13;
  public static final int BUTTON_R1 = 9;
  public static final int BUTTON_R2 = 7;
  public static final int BUTTON_R3 = 14;

  public static final int AXIS_LEFT_X = 3;
  public static final int AXIS_LEFT_Y = 2;
  public static final int AXIS_RIGHT_X = 1;
  public static final int AXIS_RIGHT_Y = 0;

  public static final int POV = 0;
}
