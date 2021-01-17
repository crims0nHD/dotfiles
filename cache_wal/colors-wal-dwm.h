static const char norm_fg[] = "#d197e2";
static const char norm_bg[] = "#00001B";
static const char norm_border[] = "#92699e";

static const char sel_fg[] = "#d197e2";
static const char sel_bg[] = "#7A4DBB";
static const char sel_border[] = "#d197e2";

static const char urg_fg[] = "#d197e2";
static const char urg_bg[] = "#64049F";
static const char urg_border[] = "#64049F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
