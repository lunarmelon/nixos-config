/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"JetBrainsMono Nerd Font:size=10"};

/* Catppuccin Mocha colors */
static const char col_rosewater[] = "#f5e0dc";
static const char col_flamingo[] = "#f2cdcd";
static const char col_pink[] = "#f5c2e7";
static const char col_mauve[] = "#cba6f7";
static const char col_red[] = "#f38ba8";
static const char col_maroon[] = "#eba0ac";
static const char col_peach[] = "#fab387";
static const char col_yellow[] = "#f9e2af";
static const char col_green[] = "#a6e3a1";
static const char col_teal[] = "#94e2d5";
static const char col_sky[] = "#89dceb";
static const char col_sapphire[] = "#74c7ec";
static const char col_blue[] = "#89b4fa";
static const char col_lavender[] = "#b4befe";
static const char col_text[] = "#cdd6f4";
static const char col_subtext1[] = "#bac2de";
static const char col_subtext0[] = "#a6adc8";
static const char col_overlay2[] = "#9399b2";
static const char col_overlay1[] = "#7f849c";
static const char col_overlay0[] = "#6c7086";
static const char col_surface2[] = "#585b70";
static const char col_surface1[] = "#45475a";
static const char col_surface0[] = "#313244";
static const char col_base[] = "#1e1e2e";
static const char col_mantle[] = "#181825";
static const char col_crust[] = "#11111b";

static const char custom_color1[] = "#875fff";

static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {col_subtext1, col_crust},
    [SchemeSel] = {col_text, custom_color1},
    [SchemeOut] = {col_subtext1, "#00ffff"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 10;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
