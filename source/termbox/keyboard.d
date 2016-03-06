module keyboard;

// Key constants. See also struct Event's key field.
enum Key {
     
    /* These are a safe subset of terminfo keys, which exist on all popular
     * terminals. Termbox uses only them to stay truly portable.
     */
    f1             = cast(ushort) 0xffff-0,
    f2             = cast(ushort) 0xffff-1,
    f3             = cast(ushort) 0xffff-2,
    f4             = cast(ushort) 0xffff-3,
    f5             = cast(ushort) 0xffff-4,
    f6             = cast(ushort) 0xffff-5,
    f7             = cast(ushort) 0xffff-6,
    f8             = cast(ushort) 0xffff-7,
    f9             = cast(ushort) 0xffff-8,
    f10            = cast(ushort) 0xffff-9,
    f11            = cast(ushort) 0xffff-10,
    f12            = cast(ushort) 0xffff-11,
    insert         = cast(ushort) 0xffff-12,
    delete_        = cast(ushort) 0xffff-13,
    home           = cast(ushort) 0xffff-14,
    end            = cast(ushort) 0xffff-15,
    pgup           = cast(ushort) 0xffff-16,
    pgdn           = cast(ushort) 0xffff-17,
    arrowUp        = cast(ushort) 0xffff-18,
    arrowDown      = cast(ushort) 0xffff-19,
    arrowLeft      = cast(ushort) 0xffff-20,
    arrowRight     = cast(ushort) 0xffff-21,
    mouseLeft      = cast(ushort) 0xffff-22,
    mouseRight     = cast(ushort) 0xffff-23,
    mouseMiddle    = cast(ushort) 0xffff-24,
    mouseRelease   = cast(ushort) 0xffff-25,
    mouseWheelUp   = cast(ushort) 0xffff-26,
    mouseWheelDown = cast(ushort) 0xffff-27,

    /* These are all ASCII code points below SPACE character and a BACKSPACE key. */
    ctrl_tilde      = cast(ushort) 0x00,
    ctrl_2          = cast(ushort) 0x00, /* clash with 'ctrl_tilde' */
    ctrl_a          = cast(ushort) 0x01,
    ctrl_b          = cast(ushort) 0x02,
    ctrl_c          = cast(ushort) 0x03,
    ctrl_d          = cast(ushort) 0x04,
    ctrl_e          = cast(ushort) 0x05,
    ctrl_f          = cast(ushort) 0x06,
    ctrl_g          = cast(ushort) 0x07,
    backspace       = cast(ushort) 0x08,
    ctrl_h          = cast(ushort) 0x08, /* clash with 'ctrl_backspace' */
    tab             = cast(ushort) 0x09,
    ctrl_i          = cast(ushort) 0x09, /* clash with 'tab' */
    ctrl_j          = cast(ushort) 0x0a,
    ctrl_k          = cast(ushort) 0x0b,
    ctrl_l          = cast(ushort) 0x0c,
    enter           = cast(ushort) 0x0d,
    ctrl_m          = cast(ushort) 0x0d, /* clash with 'enter' */
    ctrl_n          = cast(ushort) 0x0e,
    ctrl_o          = cast(ushort) 0x0f,
    ctrl_p          = cast(ushort) 0x10,
    ctrl_q          = cast(ushort) 0x11,
    ctrl_r          = cast(ushort) 0x12,
    ctrl_s          = cast(ushort) 0x13,
    ctrl_t          = cast(ushort) 0x14,
    ctrl_u          = cast(ushort) 0x15,
    ctrl_v          = cast(ushort) 0x16,
    ctrl_w          = cast(ushort) 0x17,
    ctrl_x          = cast(ushort) 0x18,
    ctrl_y          = cast(ushort) 0x19,
    ctrl_z          = cast(ushort) 0x1a,
    esc             = cast(ushort) 0x1b,
    ctrl_lsqBracket = cast(ushort) 0x1b, /* clash with 'esc' */
    ctrl_3          = cast(ushort) 0x1b, /* clash with 'esc' */
    ctrl_4          = cast(ushort) 0x1c,
    ctrl_backslash  = cast(ushort) 0x1c, /* clash with 'ctrl_4' */
    ctrl_5          = cast(ushort) 0x1d,
    ctrl_rsqBracket = cast(ushort) 0x1d, /* clash with 'ctrl_5' */
    ctrl_6          = cast(ushort) 0x1e,
    ctrl_7          = cast(ushort) 0x1f,
    ctrl_slash      = cast(ushort) 0x1f, /* clash with 'ctrl_7' */
    ctrl_underscore = cast(ushort) 0x1f, /* clash with 'ctrl_7' */
    space           = cast(ushort) 0x20,
    backspace2      = cast(ushort) 0x7f,
    ctrl_8          = cast(ushort) 0x7f /* clash with 'backspace2' */
}

/* Currently there is only one modifier. See also struct Event's mod
 * field.
 */
enum Mod {
    alt = cast(ubyte) 0x01
}
