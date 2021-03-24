#pragma once
#ifndef H_SAVE
#define H_SAVE

#include <stdbool.h>
#include <stdlib.h>

struct ssettingspair {
  char *name;
  bool state;
};

struct savesettings {
  size_t sspair_l;
  struct ssettingspair *settings;
};

extern int saveSettings(char *pathToConfig, struct savesettings *settings);

extern int getSettings(char *pathToConfig, struct savesettings *settings);

#endif // H_SAVE
