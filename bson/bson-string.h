/*
 * Copyright 2013 10gen Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#if !defined (BSON_INSIDE) && !defined (BSON_COMPILATION)
#error "Only <bson/bson.h> can be included directly."
#endif


#ifndef BSON_STRING_H
#define BSON_STRING_H


#include "bson-macros.h"
#include "bson-types.h"


BSON_BEGIN_DECLS


typedef struct
{
   bson_uint32_t len;
   char *str;
} bson_string_t;


bson_string_t *
bson_string_new (const char *str);


char *
bson_string_free (bson_string_t *string,
                  bson_bool_t    free_segment);


void
bson_string_append (bson_string_t *string,
                    const char    *str);


void
bson_string_append_c (bson_string_t *string,
                      char           str);


void
bson_string_append_unichar (bson_string_t  *string,
                            bson_unichar_t  unichar);


char *
bson_strdup (const char *str);


char *
bson_strdup_printf (const char *format,
                    ...)
   BSON_GNUC_PRINTF(1, 2);


char *
bson_strdupv_printf (const char *format,
                     va_list     args);


char *
bson_strndup (const char *str,
              size_t      n_bytes);


BSON_END_DECLS


#endif /* BSON_STRING_H */
