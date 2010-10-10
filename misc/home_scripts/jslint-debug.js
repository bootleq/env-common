// Modified from original rhino.js

// rhino.js
// 2009-09-11
/*
Copyright (c) 2002 Douglas Crockford  (www.JSLint.com) Rhino Edition
*/

// This is the Rhino companion to fulljslint.js.

/*global JSLINT */
/*jslint rhino: true, strict: false */

load('/home/bootleq/scripts/fulljslint.js');
load('/home/bootleq/scripts/json2.js');

(function (a) {
  var e, i, key, input, options, default_options;

  if (!a[0]) {
    print("Usage: jslint.js file.js");
    quit(1);
  }
  input = readFile(a[0]);
  if (!input) {
    print("jslint: Couldn't open file '" + a[0] + "'.");
    quit(1);
  }

  // Accept arguments[1] (JSON string) as JSLint options.
  options = {};
  // default_options was modified from original rhino.js.
  //   added  : browser:true, devel:true, indent:2, predef:[window]
  //   removed: rhino:true
  default_options = {
    bitwise: true,
    eqeqeq: true,
    immed: true,
    newcap: true,
    nomen: true,
    onevar: true,
    plusplus: true,
    regexp: true,
    undef: true,
    white: true,
    browser: true,
    devel: true,
    indent: 2,
    predef: ['window']
  };

  if (a[1]) {
    options = JSON.parse(a[1]);
  }
  for (key in default_options) {
    if (typeof options[key] === 'undefined') {
      options[key] = default_options[key];
    }
  }

  if (!JSLINT(input, options)) {
    for (i = 0; i < JSLINT.errors.length; i += 1) {
      e = JSLINT.errors[i];
      if (e) {
        // Similar to format from closure-compiler, friendly to Vim's errorformat.
        print([
          a[0], '|', e.line, '| ', e.reason, '\n',
          ' ', (e.evidence || ''), '\n',
          ' ', (new Array(e.character).join(' ') + '^')
        ].join(''));
      }
    }
    quit(2);
  } else {
    quit();
  }
}(arguments));
