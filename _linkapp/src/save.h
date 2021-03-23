#pragma once
#ifndef H_SAVE
#define H_SAVE

#include <stdbool.h>
#include <stdlib.h>

typedef struct {

} s_settings;

extern bool b_unsavedChanges;
extern size_t saveChanges(s_settings *);

#endif // H_SAVE
