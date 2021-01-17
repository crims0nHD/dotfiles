const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#00001B", /* black   */
  [1] = "#64049F", /* red     */
  [2] = "#7A4DBB", /* green   */
  [3] = "#5E22CF", /* yellow  */
  [4] = "#544EE6", /* blue    */
  [5] = "#9C05A3", /* magenta */
  [6] = "#DC0FA5", /* cyan    */
  [7] = "#d197e2", /* white   */

  /* 8 bright colors */
  [8]  = "#92699e",  /* black   */
  [9]  = "#64049F",  /* red     */
  [10] = "#7A4DBB", /* green   */
  [11] = "#5E22CF", /* yellow  */
  [12] = "#544EE6", /* blue    */
  [13] = "#9C05A3", /* magenta */
  [14] = "#DC0FA5", /* cyan    */
  [15] = "#d197e2", /* white   */

  /* special colors */
  [256] = "#00001B", /* background */
  [257] = "#d197e2", /* foreground */
  [258] = "#d197e2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
