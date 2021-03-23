#include <curses.h>
#include <menu.h>
#include <stdio.h>
#include <stdlib.h>

#include "save.h"

const char *choices[] = {
    "Hello this is tech support",
    "Koniciwa",
    "Exit",
};

size_t iarray_l;
ITEM **iarray;
MENU *menu;

void startmenu() {
  initscr();            // create window
  raw();                // framebuffer magic
  keypad(stdscr, TRUE); // enable input things
  noecho();             // stop echoing input
}

void quitmenu() {
  unpost_menu(menu); //?
  free_menu(menu);

  for (size_t i = 0; i < iarray_l; i++) {
    free_item(iarray[i]);
  }

  free(iarray);
  endwin(); // close ncurses window
}

int main(int argc, char **argv) {
  startmenu();

  refresh();

  while (getch() != KEY_F(1))
    ;

  quitmenu(); // cleanup
  return 0;
}
