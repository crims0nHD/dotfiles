#include "save.h"
#include <stdio.h>
#include <stdlib.h>

int saveSettings(char *pathToConfig, struct savesettings *settings) {
  FILE *fsave = fopen(pathToConfig, "w");
  if (fsave == NULL)
    return -1;

  for (size_t i = 0; i < settings->sspair_l; i++) {
    fprintf(fsave, settings->settings[i].name);
    fprintf(fsave, " = ");
    if (settings->settings[i].state) {
      fprintf(fsave, "TRUE\n");
    } else {
      fprintf(fsave, "FALSE\n");
    }
  }

  fclose(fsave);
  return 0;
}

int getSettings(char *pathToConfig, struct savesettings *settings) {}
