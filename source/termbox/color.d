module color;

/* Colors (see struct Cell's fg and bg fields). */
enum Color {
    default_ = cast(ushort) 0x00,
    black    = cast(ushort) 0x01,
    red      = cast(ushort) 0x02,
    green    = cast(ushort) 0x03,
    yellow   = cast(ushort) 0x04,
    blue     = cast(ushort) 0x05,
    magenta  = cast(ushort) 0x06,
    cyan     = cast(ushort) 0x07,
    white    = cast(ushort) 0x08
}

/* Attributes, it is possible to use multiple attributes by combining them
 * using bitwise OR ('|'). Although, colors cannot be combined. But you can
 * combine attributes and a single color. See also struct Cell's fg and bg
 * fields.
 */
enum Attribute {
    bold      = 0x0100,
    underline = 0x0200,
    reverse   = 0x0400
}
