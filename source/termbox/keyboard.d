module keyboard;

// Key constants. See also struct Event's key field.
enum Key {
     
    /* These are a safe subset of terminfo keys, which exist on all popular
     * terminals. Termbox uses only them to stay truly portable.
     */
    f1             = 0xffff-0,
    f2             = 0xffff-1,
    f3             = 0xffff-2,
    f4             = 0xffff-3,
    f5             = 0xffff-4,
    f6             = 0xffff-5,
    f7             = 0xffff-6,
    f8             = 0xffff-7,
    f9             = 0xffff-8,
    f10            = 0xffff-9,
    f11            = 0xffff-10,
    f12            = 0xffff-11,
    insert         = 0xffff-12,
    delete_        = 0xffff-13,
    home           = 0xffff-14,
    end            = 0xffff-15,
    pgup           = 0xffff-16,
    pgdn           = 0xffff-17,
    arrowUp        = 0xffff-18,
    arrowDown      = 0xffff-19,
    arrowLeft      = 0xffff-20,
    arrowRight     = 0xffff-21,
    mouseLeft      = 0xffff-22,
    mouseRight     = 0xffff-23,
    mouseMiddle    = 0xffff-24,
    mouseRelease   = 0xffff-25,
    mouseWheelUp   = 0xffff-26,
    mouseWheelDown = 0xffff-27,

    /* These are all ASCII code points below SPACE character and a BACKSPACE key. */
    ctrl_tilde      = 0x00,
    ctrl_2          = 0x00, /* clash with 'ctrl_tilde' */
    ctrl_a          = 0x01,
    ctrl_b          = 0x02,
    ctrl_c          = 0x03,
    ctrl_d          = 0x04,
    ctrl_e          = 0x05,
    ctrl_f          = 0x06,
    ctrl_g          = 0x07,
    backspace       = 0x08,
    ctrl_h          = 0x08, /* clash with 'ctrl_backspace' */
    tab             = 0x09,
    ctrl_i          = 0x09, /* clash with 'tab' */
    ctrl_j          = 0x0a,
    ctrl_k          = 0x0b,
    ctrl_l          = 0x0c,
    enter           = 0x0d,
    ctrl_m          = 0x0d, /* clash with 'enter' */
    ctrl_n          = 0x0e,
    ctrl_o          = 0x0f,
    ctrl_p          = 0x10,
    ctrl_q          = 0x11,
    ctrl_r          = 0x12,
    ctrl_s          = 0x13,
    ctrl_t          = 0x14,
    ctrl_u          = 0x15,
    ctrl_v          = 0x16,
    ctrl_w          = 0x17,
    ctrl_x          = 0x18,
    ctrl_y          = 0x19,
    ctrl_z          = 0x1a,
    esc             = 0x1b,
    ctrl_lsqBracket = 0x1b, /* clash with 'esc' */
    ctrl_3          = 0x1b, /* clash with 'esc' */
    ctrl_4          = 0x1c,
    ctrl_backslash  = 0x1c, /* clash with 'ctrl_4' */
    ctrl_5          = 0x1d,
    ctrl_rsqBracket = 0x1d, /* clash with 'ctrl_5' */
    ctrl_6          = 0x1e,
    ctrl_7          = 0x1f,
    ctrl_slash      = 0x1f, /* clash with 'ctrl_7' */
    ctrl_underscore = 0x1f, /* clash with 'ctrl_7' */
    space           = 0x20,
    backspace2      = 0x7f,
    ctrl_8          = 0x7f /* clash with 'backspace2' */
}

/* Currently there is only one modifier. See also struct Event's mod
 * field.
 */
enum Mod {
    alt = 0x01
}
