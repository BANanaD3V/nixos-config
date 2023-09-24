''
* {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: JetBrainsMono Nerd Font Mono;
    font-size: 13px;
    border-radius: 0px;
}

window#waybar {
    /* border-radius: 20px; */
    /* background-color: #11111b; */
    background-color: rgba(17, 17, 27, 0.95);
    border-radius: 0px;
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.2;
}

/*
window#waybar.empty {
    background-color: transparent;
}
window#waybar.solo {
    background-color: #FFFFFF;
}
*/

window#waybar.termite {
    background-color: #3F3F3F;
}

window#waybar.chromium {
    background-color: #000000;
    border: none;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    /* Avoid rounded borders under each button name */
    border: none;

}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
}

#workspaces {
    margin-bottom: 10px;
    margin-top: 10px;
    border-radius: 5px;
    /* padding: 0px; */
    background-color: #1e1e2e;
    padding-left: 7px;
    padding-right: 7px;
}
#workspaces button {
    color: #a6e3a1;
    padding: 5px;
}

#workspaces button.persistent {
    color: #cdd6f4;
}

#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.active {
    color: #f9e2af;
}

#workspaces button.urgent {
    color: #eb4d4b;
}

#mode {
    background-color: #64727D;
    border-bottom:3px solid #ffffff;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#custom-cava,
#keyboard-state,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#mpd {
    border-radius: 5px;
    padding: 0 10px;
    color: #ffffff;
}

#window {
    margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#clock {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 5px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 10px;
    margin-left: 0px;
    margin-right: 0px;

    /* margin-left: 10px; */
    /* margin-right: 10px; */

}

#battery {
    background-color: #ffffff;
    color: #000000;
}

#battery.charging, #battery.plugged {
    color: #ffffff;
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
    background-color: #000000;
}

#cpu {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 2px;
    padding-left: 10px;
    padding-right: 10px;
    margin-top: 10px;
    margin-bottom: 10px;
}

#memory {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 5px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 10px;
    margin-left: 0px;
    margin-right: 0px;
}

#disk {
    background-color: #964B00;
}

#backlight {
    background-color: #90b1b1;
}

#network {
    background-color: #2980b9;
}

#network.disconnected {
    background-color: #f53c3c;
}

#pulseaudio {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 5px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 10px;
    margin-left: 0px;
    margin-right: 0px;
    /* margin-left: 10px; */
    /* margin-right: 10px; */

}

#wireplumber {
    background-color: #fff0f5;
    color: #000000;
}

#wireplumber.muted {
    background-color: #f53c3c;
}

#custom-media {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 2px;
    padding-left: 10px;
    padding-right: 10px;
    min-width: 100px;
    margin: 10px;
    margin-right: 0px;
}
#custom-cava {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 5px;
    padding-left: 10px;
    padding-right: 10px;
    min-width: 100px;
    margin: 10px;
    margin-left: 0px;
    margin-right: 0px;
}

#custom-media.custom-spotify {
    background-color: #66cc99;
}

#custom-media.custom-vlc {
    background-color: #ffa000;
}

#temperature {
    background-color: #f0932b;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#tray {
    background-color: #1e1e2e;
    color: #cdd6f4;
    padding: 5px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 10px;
    margin-left: 0px;
    margin-right: 10px;

}

#tray > .passive {
    -gtk-icon-effect: dim;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    background-color: #eb4d4b;
}

#tray.empty {
    background-color: #FFF;
}

#idle_inhibitor {
    background-color: #2d3436;
}

#idle_inhibitor.activated {
    background-color: #ecf0f1;
    color: #2d3436;
}

#mpd {
    background-color: #66cc99;
    color: #2a5c45;
}

#mpd.disconnected {
    background-color: #f53c3c;
}

#mpd.stopped {
    background-color: #90b1b1;
}

#mpd.paused {
    background-color: #51a37a;
}

#language {
    background-color: #1e1e2e;
    color: #cdd6f4;
    /* margin: 0 5px; */
    border-radius: 5px;
    min-width: 16px;
    padding: 5px;
    padding-left: 10px;
    padding-right: 10px;
    margin: 10px;
    margin-left: 0px;
    margin-right: 0px;
    /* margin-left: 10px; */
    /* margin-right: 10px; */

}

#keyboard-state {
    background: #97e1ad;
    color: #000000;
    padding: 0 0px;
    margin: 0 5px;
    min-width: 16px;
    border-radius: 5px;
}

#keyboard-state > label {
    padding: 0 5px;
    border-radius: 5px;
}

#keyboard-state > label.locked {
    background: rgba(0, 0, 0, 0.2);
    border-radius: 5px;
}

#scratchpad {
    background: rgba(0, 0, 0, 0.2);
}

#scratchpad.empty {
	background-color: transparent;
}
''
