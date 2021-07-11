The script adds an arrow in the form of a textdraw to the monitor
for each player who has
entered the server. It shows at a certain point

(without setting to the point {0.0, 0.0, 3.0}).

The arrow has two modes of operation, which can be changed by
changing
the #define ARROW_MODE at the very beginning of the script.

When #define ARROW_MODE 0, the camera mode will be enabled.

In camera mode, when the arrow is rotated,
 the player's camera
rotation is taken into account, relative to a point in space.

This mode is not full-fledged, since the update
 of the players 
camera rotation in SA-MP is updated approximately
 once per second.
Because of this, the arrow will update the rotation 
once per second.

At #define ARROW_MODE 1, the rotation mode will be enabled.

In turn mode, when the player or the transport 
in which the player
is sitting turns, the arrow will also turn, 
and the camera rotation will be ignored.
This is inconvenient when the 
player's camera does not look exactly forward,
but the arrow update
 occurs correctly.

#define ARROW_UPDATE - the refresh rate of the arrow.
The standard 
value at which the arrow is updated without bugs is 50.

Every 50 milliseconds, the arrow will be updated, regardless 
of the selected mode.

July 2021 ã.
Fanbumbot[ScDrift]
( https://github.com/fanbumbot )