#line 1 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\utilities.cc"
// Copyright (c) 2008, Google Inc.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//     * Neither the name of Google Inc. nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Author: Shinichiro Hamaji

#line 1 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\utilities.h"
// Copyright (c) 2008, Google Inc.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//     * Neither the name of Google Inc. nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Author: Shinichiro Hamaji
//
// Define utilties for glog internal usage.




















#line 54 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\utilities.h"

// printf macros for size_t, in the style of inttypes.h




#line 61 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\utilities.h"

// Use these macros after a % in a printf format string
// to get correct 32/64 bit behavior, like this:
// size_t size = records.size();
// printf("%"PRIuS"\n", size);







#line 1 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\base\\mutex.h"
// Copyright (c) 2007, Google Inc.
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
// 
//     * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//     * Neither the name of Google Inc. nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// ---
// Author: Craig Silverstein.
//
// A simple mutex wrapper, supporting locks and read-write locks.
// You should assume the locks are *not* re-entrant.
//
// To use: you should define the following macros in your configure.ac:
//   ACX_PTHREAD
//   AC_RWLOCK
// The latter is defined in ../autoconf.
//
// This class is meant to be internal-only and should be wrapped by an
// internal namespace.  Before you use this module, please give the
// name of your internal namespace for this module.  Or, if you want
// to expose it, you'll want to move it to the Google namespace.  We
// cannot put this class in global namespace because there can be some
// problems when we have multiple versions of Mutex in each shared object.
//
// NOTE: by default, we have #ifdef'ed out the TryLock() method.
//       This is for two reasons:
// 1) TryLock() under Windows is a bit annoying (it requires a
//    #define to be defined very early).
// 2) TryLock() is broken for NO_THREADS mode, at least in NDEBUG
//    mode.
// If you need TryLock(), and either these two caveats警告 are not a
// problem for you, or you're willing to work around them, then
// feel free to #define GMUTEX_TRYLOCK, or to remove the #ifdefs
// in the code below.
//
// CYGWIN NOTE: Cygwin support for rwlock seems to be buggy:
//    http://www.cygwin.com/ml/cygwin/2008-12/msg00017.html
// Because of that, we might as well use windows locks for
// cygwin.  They seem to be more reliable可靠的 than the cygwin pthreads layer.
//
// TRICKY IMPLEMENTATION NOTE:
// This class is designed to be safe to use during
// dynamic-initialization -- that is, by global constructors that are
// run before main() starts.  The issue in this case is that
// dynamic-initialization happens in an unpredictable不可预知的 order, and it
// could be that someone else's dynamic initializer could call a
// function that tries to acquire this mutex -- but that all happens
// before this mutex's constructor has run.  (This can happen even if
// the mutex and the function that uses the mutex are in the same .cc
// file.)  Basically, because Mutex does non-trivial work in its
// constructor, it's not, in the naive implementation, safe to use
// before dynamic initialization has run on it.
//
// The solution used here is to pair the actual mutex primitive with a
// bool that is set to true when the mutex is dynamically initialized.
// (Before that it's false.)  Then we modify all mutex routines to
// look at the bool, and not try to lock/unlock until the bool makes
// it to true (which happens after the Mutex constructor has run.)
//
// This works because before main() starts -- particularly, during
// dynamic initialization -- there are no threads, so a) it's ok that
// the mutex operations are a no-op, since we don't need locking then
// anyway; and b) we can be quite confident our bool won't change
// state between a call to Lock() and a call to Unlock() (that would
// require a global constructor in one translation unit to call Lock()
// and another global constructor in another translation unit to call
// Unlock() later, which is pretty perverse).
//
// That said, it's tricky, and can conceivably令人信服地 fail; it's safest to
// avoid trying to acquire a mutex in a global constructor, if you
// can.  One way it can fail is that a really smart compiler might
// initialize the bool to true at static-initialization time (too
// early) rather than at dynamic-initialization time.  To discourage
// that, we set is_safe_ to true in code (not the constructor
// colon-initializer) and set it to true via a function that always
// evaluates to true, but that the compiler can't know always
// evaluates to true.  This should be good enough.




#line 1 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\config.h"
/* src/config.h.in.  Generated from configure.ac by autoheader.  */

/* Namespace for Google classes */


/* Define if you have the `dladdr' function */


/* Define to 1 if you have the <dlfcn.h> header file. */


/* Define to 1 if you have the <execinfo.h> header file. */


/* Define to 1 if you have the <inttypes.h> header file. */


/* Define to 1 if you have the <libunwind.h> header file. */


/* define if you have google gflags library */


/* define if you have libunwind */


/* Define to 1 if you have the <memory.h> header file. */


/* define if the compiler implements namespaces */


/* Define if you have POSIX threads libraries and header files. */


/* define if the compiler implements pthread_rwlock_* */


/* Define if you have the `sigaltstack' function */


/* Define to 1 if you have the <stdint.h> header file. */


/* Define to 1 if you have the <stdlib.h> header file. */


/* Define to 1 if you have the <strings.h> header file. */


/* Define to 1 if you have the <string.h> header file. */


/* Define to 1 if you have the <syscall.h> header file. */


/* Define to 1 if you have the <sys/stat.h> header file. */


/* Define to 1 if you have the <sys/syscall.h> header file. */


/* Define to 1 if you have the <sys/types.h> header file. */


/* Define to 1 if you have the <ucontext.h> header file. */


/* Define to 1 if you have the <unistd.h> header file. */


/* define if the compiler supports using expression for operator */


/* define if your compiler has __attribute__ */


/* define if your compiler has __builtin_expect */


/* define if your compiler has __sync_val_compare_and_swap */


/* Name of package */


/* Define to the address where bug reports for this package should be sent. */


/* Define to the full name of this package. */


/* Define to the full name and version of this package. */


/* Define to the one symbol short name of this package. */


/* Define to the version of this package. */


/* How to access the PC from a struct ucontext */


/* Define to necessary symbol if this constant uses a non-standard name on
   your system. */


/* The size of `void *', as computed by sizeof. */


/* Define to 1 if you have the ANSI C header files. */


/* the namespace where STL code like vector<> is defined */


/* Version number of package */


/* Stops putting the code inside the Google namespace */


/* Puts following code inside the Google namespace */


/* Always the empty-string on non-windows systems. On windows, should be
   "__declspec(dllexport)". This way, when we compile the dll, we export our
   functions/classes. It's safe to define this here because config.h is only
   used internally, to compile the DLL, and every DLL source file #includes
   "config.h" before anything else. */




#line 137 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\config.h"
#line 106 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\base\\mutex.h"



#line 110 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\base\\mutex.h"


#line 113 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\base\\mutex.h"








// To avoid macro definition of ERROR.


#line 125 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\base\\mutex.h"
// To avoid macro definition of min/max.


#line 129 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\base\\mutex.h"
#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"

/*++ BUILD Version: 0001    Increment this if a change has global effects

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:


    windows.h

Abstract:

    Master include file for Windows applications.

--*/





#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"
/*

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    sdkddkver.h

Abstract:

    Master include file for versioning windows SDK/DDK.

*/




#pragma once

//
// _WIN32_WINNT version constants
//






//
// _WIN32_IE_ version constants
//













//
// IE <-> OS version mapping
//
// NT4 supports IE versions 2.0 -> 6.0 SP1







// Win98 supports IE versions 4.01 -> 6.0 SP1

// Win98SE supports IE versions 5.0 -> 6.0 SP1

// WinME supports IE versions 5.5 -> 6.0 SP1

// Win2k supports IE versions 5.01 -> 6.0 SP1













//
// NTDDI version constants
//















//
// masks for version macros
//





//
// macros to extract various version fields from the NTDDI version
//



































#line 141 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"


//
// if versions aren't already defined, default to most current
//






#line 153 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



// set NTDDI_VERSION based on _WIN32_WINNT



#line 161 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"
#line 162 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



// set WINVER based on _WIN32_WINNT



#line 170 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"
#line 171 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



// set _WIN32_IE based on _WIN32_WINNT


#line 178 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"

#line 180 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"

#line 182 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"

#line 184 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"

#line 186 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"


#line 189 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"
#line 190 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"

//
// Sanity check for compatible versions
//




#line 199 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



#line 203 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



#line 207 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



#line 211 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



#line 215 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"



#line 219 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"

#line 221 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"


#line 224 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\sdkddkver.h"


#line 22 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"





#pragma once
#line 29 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"

/*  If defined, the following flags inhibit definition
 *     of the indicated items.
 *
 *  NOGDICAPMASKS     - CC_*, LC_*, PC_*, CP_*, TC_*, RC_
 *  NOVIRTUALKEYCODES - VK_*
 *  NOWINMESSAGES     - WM_*, EM_*, LB_*, CB_*
 *  NOWINSTYLES       - WS_*, CS_*, ES_*, LBS_*, SBS_*, CBS_*
 *  NOSYSMETRICS      - SM_*
 *  NOMENUS           - MF_*
 *  NOICONS           - IDI_*
 *  NOKEYSTATES       - MK_*
 *  NOSYSCOMMANDS     - SC_*
 *  NORASTEROPS       - Binary and Tertiary raster ops
 *  NOSHOWWINDOW      - SW_*
 *  OEMRESOURCE       - OEM Resource values
 *  NOATOM            - Atom Manager routines
 *  NOCLIPBOARD       - Clipboard routines
 *  NOCOLOR           - Screen colors
 *  NOCTLMGR          - Control and Dialog routines
 *  NODRAWTEXT        - DrawText() and DT_*
 *  NOGDI             - All GDI defines and routines
 *  NOKERNEL          - All KERNEL defines and routines
 *  NOUSER            - All USER defines and routines
 *  NONLS             - All NLS defines and routines
 *  NOMB              - MB_* and MessageBox()
 *  NOMEMMGR          - GMEM_*, LMEM_*, GHND, LHND, associated routines
 *  NOMETAFILE        - typedef METAFILEPICT
 *  NOMINMAX          - Macros min(a,b) and max(a,b)
 *  NOMSG             - typedef MSG and associated routines
 *  NOOPENFILE        - OpenFile(), OemToAnsi, AnsiToOem, and OF_*
 *  NOSCROLL          - SB_* and scrolling routines
 *  NOSERVICE         - All Service Controller routines, SERVICE_ equates, etc.
 *  NOSOUND           - Sound driver routines
 *  NOTEXTMETRIC      - typedef TEXTMETRIC and associated routines
 *  NOWH              - SetWindowsHook and WH_*
 *  NOWINOFFSETS      - GWL_*, GCL_*, associated routines
 *  NOCOMM            - COMM driver routines
 *  NOKANJI           - Kanji support stuff.
 *  NOHELP            - Help engine interface.
 *  NOPROFILER        - Profiler interface.
 *  NODEFERWINDOWPOS  - DeferWindowPos routines
 *  NOMCX             - Modem Configuration Extensions
 */





#line 79 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"




















#line 100 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"



#line 104 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"



#line 108 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"



#line 112 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"



#line 116 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"





#line 122 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"




#line 127 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#line 128 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"







#line 136 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#line 137 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"



#pragma warning(disable:4514)

#pragma warning(disable:4103)
#line 144 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"

#pragma warning(push)
#line 147 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#pragma warning(disable:4001)
#pragma warning(disable:4201)
#pragma warning(disable:4214)
#line 151 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"
/***
*excpt.h - defines exception values, types and routines
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file contains the definitions and prototypes for the compiler-
*       dependent intrinsics, support functions and keywords which implement
*       the structured exception handling extensions.
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
/***
*crtdefs.h - definitions/declarations common to all CRT
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file has mostly defines used by the entire CRT.
*
*       [Public]
*
****/

/* Lack of pragma once is deliberate */

/* Define _CRTIMP */ 





#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"














#line 38 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



#line 42 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Note on use of "deprecate":
 * Various places in this header and other headers use __declspec(deprecate) or macros that have the term DEPRECATE in them.
 * We use deprecate here ONLY to signal the compiler to emit a warning about these items. The use of deprecate
 * should NOT be taken to imply that any standard committee has deprecated these functions from the relevant standards.
 * In fact, these functions are NOT deprecated from the standard.
 *
 * Full details can be found in our documentation by searching for "Security Enhancements in the CRT".
*/











    

#line 65 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 67 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"
/***
*sal.h - markers for documenting the semantics of APIs
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       sal.h provides a set of annotations to describe how a function uses its
*       parameters - the assumptions it makes about them, and the guarantees it makes
*       upon finishing.
*
*       [Public]
*
****/

#pragma once
/*==========================================================================

   The macros are defined in 3 layers:

   _In_\_Out_ Layer:
   ----------------
   This layer provides the highest abstraction and its macros should be used
   in most cases. Its macros start with _In_, _Out_ or _Inout_. For the
   typical case they provide the most concise annotations.

   _Pre_\_Post_ Layer:
   ------------------
   The macros of this layer only should be used when there is no suitable macro
   in the _In_\_Out_ layer. Its macros start with _Pre_, _Post_, _Ret_,
   _Deref_pre_ _Deref_post_ and _Deref_ret_. This layer provides the most
   flexibility for annotations.

   Implementation Abstraction Layer:
   --------------------------------
   Macros from this layer should never be used directly. The layer only exists
   to hide the implementation of the annotation macros.


   Annotation Syntax:
   |--------------|----------|----------------|-----------------------------|
   |   Usage      | Nullness | ZeroTerminated |  Extent                     |
   |--------------|----------|----------------|-----------------------------|
   | _In_         | <>       | <>             | <>                          |
   | _Out_        | opt_     | z_             | [byte]cap_[c_|x_]( size )   |
   | _Inout_      |          |                | [byte]count_[c_|x_]( size ) |
   | _Deref_out_  |          |                | ptrdiff_cap_( ptr )         |
   |--------------|          |                | ptrdiff_count_( ptr )       |
   | _Ret_        |          |                |                             |
   | _Deref_ret_  |          |                |                             |
   |--------------|          |                |                             |
   | _Pre_        |          |                |                             |
   | _Post_       |          |                |                             |
   | _Deref_pre_  |          |                |                             |
   | _Deref_post_ |          |                |                             |
   |--------------|----------|----------------|-----------------------------|

   Usage:
   -----
   _In_, _Out_, _Inout_, _Pre_, _Post_, _Deref_pre_, _Deref_post_ are for
   formal parameters.
   _Ret_, _Deref_ret_ must be used for return values.

   Nullness:
   --------
   If the pointer can be NULL the annotation contains _opt. If the macro
   does not contain '_opt' the pointer may not be NULL.

   String Type:
   -----------
   _z: NullTerminated string
   for _In_ parameters the buffer must have the specified stringtype before the call
   for _Out_ parameters the buffer must have the specified stringtype after the call
   for _Inout_ parameters both conditions apply

   Extent Syntax:
   |------|---------------|---------------|
   | Unit | Writ\Readable | Argument Type |
   |------|---------------|---------------|
   |  <>  | cap_          | <>            |
   | byte | count_        | c_            |
   |      |               | x_            |
   |------|---------------|---------------|

   'cap' (capacity) describes the writable size of the buffer and is typically used
   with _Out_. The default unit is elements. Use 'bytecap' if the size is given in bytes
   'count' describes the readable size of the buffer and is typically used with _In_.
   The default unit is elements. Use 'bytecount' if the size is given in bytes.
   
   Argument syntax for cap_, bytecap_, count_, bytecount_:
   (<parameter>|return)[+n]  e.g. cch, return, cb+2
   
   If the buffer size is a constant expression use the c_ postfix.
   E.g. cap_c_(20), count_c_(MAX_PATH), bytecount_c_(16)

   If the buffer size is given by a limiting pointer use the ptrdiff_ versions
   of the macros.

   If the buffer size is neither a parameter nor a constant expression use the x_
   postfix. e.g. bytecount_x_(num*size) x_ annotations accept any arbitrary string.
   No analysis can be done for x_ annotations but they at least tell the tool that
   the buffer has some sort of extent description. x_ annotations might be supported
   by future compiler versions.

============================================================================*/



// choose attribute or __declspec implementation


#line 112 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"




#line 117 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"




#line 122 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"
#line 123 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"

















// safeguard for MIDL and RC builds



#line 145 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"



#line 149 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"

//============================================================================
//   _In_\_Out_ Layer:
//============================================================================

// 'in' parameters --------------------------

// input pointer parameter
// e.g. void SetPoint( _In_ const POINT* pPT );



// nullterminated 'in' parameters.
// e.g. void CopyStr( _In_z_ const char* szFrom, _Out_z_cap_(cchTo) char* szTo, size_t cchTo );



// 'input' buffers with given size

// e.g. void SetCharRange( _In_count_(cch) const char* rgch, size_t cch )
// valid buffer extent described by another parameter





// valid buffer extent described by a constant extression





// nullterminated  'input' buffers with given size

// e.g. void SetCharRange( _In_count_(cch) const char* rgch, size_t cch )
// nullterminated valid buffer extent described by another parameter





// nullterminated valid buffer extent described by a constant extression





// buffer capacity is described by another pointer
// e.g. void Foo( _In_ptrdiff_count_(pchMax) const char* pch, const char* pchMax ) { while pch < pchMax ) pch++; }



// 'x' version for complex expressions that are not supported by the current compiler version
// e.g. void Set3ColMatrix( _In_count_x_(3*cRows) const Elem* matrix, int cRows );





// 'out' parameters --------------------------

// output pointer parameter
// e.g. void GetPoint( _Out_ POINT* pPT );



// 'out' with buffer size
// e.g. void GetIndeces( _Out_cap_(cIndeces) int* rgIndeces, size_t cIndices );
// buffer capacity is described by another parameter





// buffer capacity is described by a constant expression





// buffer capacity is described by another parameter multiplied by a constant expression





// buffer capacity is described by another pointer
// e.g. void Foo( _Out_ptrdiff_cap_(pchMax) char* pch, const char* pchMax ) { while pch < pchMax ) pch++; }



// buffer capacity is described by a complex expression





// a zero terminated string is filled into a buffer of given capacity
// e.g. void CopyStr( _In_z_ const char* szFrom, _Out_z_cap_(cchTo) char* szTo, size_t cchTo );
// buffer capacity is described by another parameter





// buffer capacity is described by a constant expression





// buffer capacity is described by a complex expression





// a zero terminated string is filled into a buffer of given capacity
// e.g. size_t CopyCharRange( _In_count_(cchFrom) const char* rgchFrom, size_t cchFrom, _Out_cap_post_count_(cchTo,return)) char* rgchTo, size_t cchTo );





// a zero terminated string is filled into a buffer of given capacity
// e.g. size_t CopyStr( _In_z_ const char* szFrom, _Out_z_cap_post_count_(cchTo,return+1) char* szTo, size_t cchTo );





// only use with dereferenced arguments e.g. '*pcch' 










// e.g. GetString( _Out_z_capcount_(*pLen+1) char* sz, size_t* pLen );





// inout parameters ----------------------------

// inout pointer parameter
// e.g. void ModifyPoint( _Inout_ POINT* pPT );



// string buffers
// e.g. void toupper( _Inout_z_ char* sz );



// 'inout' buffers with initialized elements before and after the call
// e.g. void ModifyIndices( _Inout_count_(cIndices) int* rgIndeces, size_t cIndices );










// nullterminated 'inout' buffers with initialized elements before and after the call
// e.g. void ModifyIndices( _Inout_count_(cIndices) int* rgIndeces, size_t cIndices );


















// e.g. void AppendToLPSTR( _In_ LPCSTR szFrom, _Inout_cap_(cchTo) LPSTR* szTo, size_t cchTo );















// inout string buffers with writable size
// e.g. void AppendStr( _In_z_ const char* szFrom, _Inout_z_cap_(cchTo) char* szTo, size_t cchTo );















// return values -------------------------------

// returning pointers to valid objects



// More _Ret_ annotations are defined below

// Pointer to pointers -------------------------

// e.g.  HRESULT HrCreatePoint( _Deref_out_opt_ POINT** ppPT );





// e.g.  void CloneString( _In_z_ const wchar_t* wzFrom, _Deref_out_z_ wchar_t** pWzTo );





// More _Deref_ annotations are defined below

// Other annotations

// Check the return value of a function e.g. _Check_return_ ErrorCode Foo();


// e.g. MyPrintF( _Printf_format_string_ const wchar_t* wzFormat, ... );




// <expr> indicates whether post conditions apply


// annotations to express 'boundedness' of integral value parameter








// annotations to express upper and lower bounds of integral value parameter







//============================================================================
//   _Pre_\_Post_ Layer:
//============================================================================

//
// _Pre_ annotation ---
//
// describing conditions that must be met before the call of the function

// e.g. int strlen( _Pre_z_ const char* sz );
// buffer is a zero terminated string



// e.g. void FreeMemory( _Pre_bytecap_(cb) _Post_invalid_ void* pv, size_t cb );
// buffer capacity described by another parameter





// buffer capacity described by a constant expression





// buffer capacity is described by another parameter multiplied by a constant expression



// buffer capacity described by size of other buffer, only used by dangerous legacy APIs
// e.g. int strcpy(_Pre_cap_for_(src) char* dst, const char* src);



// buffer capacity described by a complex condition





// buffer capacity described by the difference to another pointer parameter



// e.g. void AppendStr( _Pre_z_ const char* szFrom, _Pre_z_cap_(cchTo) _Post_z_ char* szTo, size_t cchTo );















// known capacity and valid but unknown readable extent















// e.g. void AppendCharRange( _Pre_count_(cchFrom) const char* rgFrom, size_t cchFrom, _Out_z_cap_(cchTo) char* szTo, size_t cchTo );
// Valid buffer extent described by another parameter





// Valid buffer extent described by a constant expression





// Valid buffer extent described by a complex expression





// Valid buffer extent described by the difference to another pointer parameter



// valid size unknown or indicated by type (e.g.:LPSTR)





// used with allocated but not yet initialized objects




// restrict access rights


//
// _Post_ annotations ---
//
// describing conditions that hold after the function call

// void CopyStr( _In_z_ const char* szFrom, _Pre_cap_(cch) _Post_z_ char* szFrom, size_t cchFrom );
// buffer will be a zero-terminated string after the call


// char * strncpy(_Out_cap_(_Count) _Post_maybez_ char * _Dest, _In_z_ const char * _Source, _In_ size_t _Count)
// buffer maybe zero-terminated after the call


// e.g. SIZE_T HeapSize( _In_ HANDLE hHeap, DWORD dwFlags, _Pre_notnull_ _Post_bytecap_(return) LPCVOID lpMem );



// e.g. int strlen( _In_z_ _Post_count_(return+1) const char* sz );







// e.g. size_t CopyStr( _In_z_ const char* szFrom, _Pre_cap_(cch) _Post_z_count_(return+1) char* szFrom, size_t cchFrom );







// e.g. void free( _Post_invalid_ void* pv );



// e.g. void ThrowExceptionIfNull( _Post_notnull_ const void* pv );


//
// _Ret_ annotations
//
// describing conditions that hold for return values after the call

// e.g. _Ret_z_ CString::operator const wchar_t*() const throw();



// e.g. _Ret_opt_bytecap_(cb) void* AllocateMemory( size_t cb );
// Buffer capacity is described by another parameter





// Buffer capacity is described by a constant expression





// Buffer capacity is described by a complex condition





// return value is nullterminated and capacity is given by another parameter





// e.g. _Ret_opt_bytecount_(cb) void* AllocateZeroInitializedMemory( size_t cb );
// Valid Buffer extent is described by another parameter





// Valid Buffer extent is described by a constant expression





// Valid Buffer extent is described by a complex expression





// return value is nullterminated and length is given by another parameter





// e.g. _Ret_opt_valid_ LPSTR void* CloneSTR( _Pre_valid_ LPSTR src );



// used with allocated but not yet initialized objects




//
// _Deref_pre_ ---
//
// describing conditions for array elements of dereferenced pointer parameters that must be met before the call

// e.g. void SaveStringArray( _In_count_(cStrings) _Deref_pre_z_ const wchar_t* const rgpwch[] );



// e.g. void FillInArrayOfStr32( _In_count_(cStrings) _Deref_pre_cap_c_(32) _Deref_post_z_ wchar_t* const rgpwch[] );
// buffer capacity is described by another parameter





// buffer capacity is described by a constant expression





// buffer capacity is described by a complex condition





// convenience macros for nullterminated buffers with given capacity















// known capacity and valid but unknown readable extent















// e.g. void SaveMatrix( _In_count_(n) _Deref_pre_count_(n) const Elem** matrix, size_t n ); 
// valid buffer extent is described by another parameter





// valid buffer extent is described by a constant expression





// valid buffer extent is described by a complex expression





// e.g. void PrintStringArray( _In_count_(cElems) _Deref_pre_valid_ LPCSTR rgStr[], size_t cElems );








// restrict access rights



//
// _Deref_post_ ---
//
// describing conditions for array elements or dereferenced pointer parameters that hold after the call

// e.g. void CloneString( _In_z_ const Wchar_t* wzIn _Out_ _Deref_post_z_ wchar_t** pWzOut );



// e.g. HRESULT HrAllocateMemory( size_t cb, _Out_ _Deref_post_bytecap_(cb) void** ppv );
// buffer capacity is described by another parameter





// buffer capacity is described by a constant expression





// buffer capacity is described by a complex expression





// convenience macros for nullterminated buffers with given capacity















// known capacity and valid but unknown readable extent




                                                




                                                





// e.g. HRESULT HrAllocateZeroInitializedMemory( size_t cb, _Out_ _Deref_post_bytecount_(cb) void** ppv );
// valid buffer extent is described by another parameter





// buffer capacity is described by a constant expression





// buffer capacity is described by a complex expression





// e.g. void GetStrings( _Out_count_(cElems) _Deref_post_valid_ LPSTR const rgStr[], size_t cElems );







//
// _Deref_ret_ ---
//




//
// special _Deref_ ---
//


// Convenience macros for more concise annotations

//
// _Pre_post ---
//
// describing conditions that hold before and after the function call




















//
// _Deref_<both> ---
//
// short version for _Deref_pre_<ann> _Deref_post_<ann>
// describing conditions for array elements or dereferenced pointer parameters that hold before and after the call










































//
// _Deref_<miscellaneous>
//
// used with references to arrays







//============================================================================
//   Implementation Layer:
//============================================================================



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"


#pragma once








#line 13 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"
#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"





typedef __w64 unsigned int   size_t;
#line 21 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"
















#line 40 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"


namespace vc_attributes
{
#line 45 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

enum YesNoMaybe
{
	// Choose values that we can detect as invalid if they are or'd together
	No = 0x0fff0001,
	Maybe = 0x0fff0010,
	Yes = 0x0fff0100
};

typedef enum YesNoMaybe YesNoMaybe;

enum AccessType
{
	NoAccess = 0,
	Read = 1,
	Write = 2,
	ReadWrite = 3
};

typedef enum AccessType AccessType;



[repeatable]
[source_annotation_attribute( Parameter )]
struct PreAttribute
{

	PreAttribute();
#line 75 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

	unsigned int Deref;
	YesNoMaybe Valid;
	YesNoMaybe Null;
	YesNoMaybe Tainted;
	AccessType Access;
	size_t ValidElementsConst;
	size_t ValidBytesConst;
	const wchar_t* ValidElements;
	const wchar_t* ValidBytes;
	const wchar_t* ValidElementsLength;
	const wchar_t* ValidBytesLength;
	size_t WritableElementsConst;
	size_t WritableBytesConst;
	const wchar_t* WritableElements;
	const wchar_t* WritableBytes;
	const wchar_t* WritableElementsLength;
	const wchar_t* WritableBytesLength;
	size_t ElementSizeConst;
	const wchar_t* ElementSize;
	YesNoMaybe NullTerminated;
	const wchar_t* Condition;
};

[repeatable]
[source_annotation_attribute( Parameter|ReturnValue )]
struct PostAttribute
{

	PostAttribute();
#line 106 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

	unsigned int Deref;
	YesNoMaybe Valid;
	YesNoMaybe Null;
	YesNoMaybe Tainted;
	AccessType Access;
	size_t ValidElementsConst;
	size_t ValidBytesConst;
	const wchar_t* ValidElements;
	const wchar_t* ValidBytes;
	const wchar_t* ValidElementsLength;
	const wchar_t* ValidBytesLength;
	size_t WritableElementsConst;
	size_t WritableBytesConst;
	const wchar_t* WritableElements;
	const wchar_t* WritableBytes;
	const wchar_t* WritableElementsLength;
	const wchar_t* WritableBytesLength;
	size_t ElementSizeConst;
	const wchar_t* ElementSize;
	YesNoMaybe NullTerminated;
	YesNoMaybe MustCheck;
	const wchar_t* Condition;
};

[source_annotation_attribute( Parameter )]
struct FormatStringAttribute
{

	FormatStringAttribute();
#line 137 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

	const wchar_t* Style;
	const wchar_t* UnformattedAlternative;
};

[repeatable]
[source_annotation_attribute( ReturnValue )]
struct InvalidCheckAttribute
{

	InvalidCheckAttribute();
#line 149 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

	long Value;
};

[source_annotation_attribute( Method )]
struct SuccessAttribute
{

	SuccessAttribute();
#line 159 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

	const wchar_t* Condition;
};

[repeatable]
[source_annotation_attribute( Parameter )]
struct PreBoundAttribute
{

	PreBoundAttribute();
#line 170 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"
	unsigned int Deref;
};

[repeatable]
[source_annotation_attribute( Parameter|ReturnValue )]
struct PostBoundAttribute
{

	PostBoundAttribute();
#line 180 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"
	unsigned int Deref;
};

[repeatable]
[source_annotation_attribute( Parameter )]
struct PreRangeAttribute
{

	PreRangeAttribute();
#line 190 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"
	unsigned int Deref;
	const char* MinVal;
	const char* MaxVal;
};

[repeatable]
[source_annotation_attribute( Parameter|ReturnValue )]
struct PostRangeAttribute
{

	PostRangeAttribute();
#line 202 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"
	unsigned int Deref;
	const char* MinVal;
	const char* MaxVal;
};

#line 208 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"


};  // namespace vc_attributes
#line 212 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"






















typedef ::vc_attributes::YesNoMaybe SA_YesNoMaybe;
const ::vc_attributes::YesNoMaybe SA_Yes = ::vc_attributes::Yes;
const ::vc_attributes::YesNoMaybe SA_No = ::vc_attributes::No;
const ::vc_attributes::YesNoMaybe SA_Maybe = ::vc_attributes::Maybe;

typedef ::vc_attributes::AccessType SA_AccessType;
const ::vc_attributes::AccessType SA_NoAccess = ::vc_attributes::NoAccess;
const ::vc_attributes::AccessType SA_Read = ::vc_attributes::Read;
const ::vc_attributes::AccessType SA_Write = ::vc_attributes::Write;
const ::vc_attributes::AccessType SA_ReadWrite = ::vc_attributes::ReadWrite;


typedef ::vc_attributes::PreAttribute          SA_Pre;
typedef ::vc_attributes::PostAttribute         SA_Post;
typedef ::vc_attributes::FormatStringAttribute SA_FormatString;
typedef ::vc_attributes::InvalidCheckAttribute SA_InvalidCheck; /*???*/
typedef ::vc_attributes::SuccessAttribute      SA_Success;
typedef ::vc_attributes::PreBoundAttribute     SA_PreBound;
typedef ::vc_attributes::PostBoundAttribute    SA_PostBound;
typedef ::vc_attributes::PreRangeAttribute     SA_PreRange;
typedef ::vc_attributes::PostRangeAttribute    SA_PostRange;
#line 256 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"















#line 272 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

#line 274 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"















// Windows SDK Update Vista Beta2 (June 2006): __analysis_assume defined by specstrings.h



// #define __analysis_assume(expr) 
#line 295 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"


#line 298 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\codeanalysis\\sourceannotations.h"

#line 933 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"













































































































































































































































































































































#line 1267 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"

// This section contains the deprecated annotations

/* 
 -------------------------------------------------------------------------------
 Introduction

 sal.h provides a set of annotations to describe how a function uses its
 parameters - the assumptions it makes about them, and the guarantees it makes
 upon finishing.

 Annotations may be placed before either a function parameter's type or its return
 type, and describe the function's behavior regarding the parameter or return value.
 There are two classes of annotations: buffer annotations and advanced annotations.
 Buffer annotations describe how functions use their pointer parameters, and
 advanced annotations either describe complex/unusual buffer behavior, or provide
 additional information about a parameter that is not otherwise expressible.

 -------------------------------------------------------------------------------
 Buffer Annotations

 The most important annotations in sal.h provide a consistent way to annotate
 buffer parameters or return values for a function. Each of these annotations describes
 a single buffer (which could be a string, a fixed-length or variable-length array,
 or just a pointer) that the function interacts with: where it is, how large it is,
 how much is initialized, and what the function does with it.

 The appropriate macro for a given buffer can be constructed using the table below.
 Just pick the appropriate values from each category, and combine them together
 with a leading underscore. Some combinations of values do not make sense as buffer
 annotations. Only meaningful annotations can be added to your code; for a list of
 these, see the buffer annotation definitions section.

 Only a single buffer annotation should be used for each parameter.

 |------------|------------|---------|--------|----------|----------|---------------|
 |   Level    |   Usage    |  Size   | Output | NullTerm | Optional |  Parameters   |
 |------------|------------|---------|--------|----------|----------|---------------|
 | <>         | <>         | <>      | <>     | _z       | <>       | <>            |
 | _deref     | _in        | _ecount | _full  | _nz      | _opt     | (size)        |
 | _deref_opt | _out       | _bcount | _part  |          |          | (size,length) |
 |            | _inout     |         |        |          |          |               |
 |            |            |         |        |          |          |               |
 |------------|------------|---------|--------|----------|----------|---------------|

 Level: Describes the buffer pointer's level of indirection from the parameter or
          return value 'p'.

 <>         : p is the buffer pointer.
 _deref     : *p is the buffer pointer. p must not be NULL.
 _deref_opt : *p may be the buffer pointer. p may be NULL, in which case the rest of
                the annotation is ignored.

 Usage: Describes how the function uses the buffer.

 <>     : The buffer is not accessed. If used on the return value or with _deref, the
            function will provide the buffer, and it will be uninitialized at exit.
            Otherwise, the caller must provide the buffer. This should only be used
            for alloc and free functions.
 _in    : The function will only read from the buffer. The caller must provide the
            buffer and initialize it. Cannot be used with _deref.
 _out   : The function will only write to the buffer. If used on the return value or
            with _deref, the function will provide the buffer and initialize it.
            Otherwise, the caller must provide the buffer, and the function will
            initialize it.
 _inout : The function may freely read from and write to the buffer. The caller must
            provide the buffer and initialize it. If used with _deref, the buffer may
            be reallocated by the function.

 Size: Describes the total size of the buffer. This may be less than the space actually
         allocated for the buffer, in which case it describes the accessible amount.

 <>      : No buffer size is given. If the type specifies the buffer size (such as
             with LPSTR and LPWSTR), that amount is used. Otherwise, the buffer is one
             element long. Must be used with _in, _out, or _inout.
 _ecount : The buffer size is an explicit element count.
 _bcount : The buffer size is an explicit byte count.

 Output: Describes how much of the buffer will be initialized by the function. For
           _inout buffers, this also describes how much is initialized at entry. Omit this
           category for _in buffers; they must be fully initialized by the caller.

 <>    : The type specifies how much is initialized. For instance, a function initializing
           an LPWSTR must NULL-terminate the string.
 _full : The function initializes the entire buffer.
 _part : The function initializes part of the buffer, and explicitly indicates how much.

 NullTerm: States if the present of a '\0' marks the end of valid elements in the buffer.
 _z    : A '\0' indicated the end of the buffer
 _nz	 : The buffer may not be null terminated and a '\0' does not indicate the end of the
          buffer.
 Optional: Describes if the buffer itself is optional.

 <>   : The pointer to the buffer must not be NULL.
 _opt : The pointer to the buffer might be NULL. It will be checked before being dereferenced.

 Parameters: Gives explicit counts for the size and length of the buffer.

 <>            : There is no explicit count. Use when neither _ecount nor _bcount is used.
 (size)        : Only the buffer's total size is given. Use with _ecount or _bcount but not _part.
 (size,length) : The buffer's total size and initialized length are given. Use with _ecount_part
                   and _bcount_part.

 -------------------------------------------------------------------------------
 Buffer Annotation Examples

 LWSTDAPI_(BOOL) StrToIntExA(
     LPCSTR pszString,                    -- No annotation required, const implies __in.
     DWORD dwFlags,
     __out int *piRet                     -- A pointer whose dereference will be filled in.
 );

 void MyPaintingFunction(
     __in HWND hwndControl,               -- An initialized read-only parameter.
     __in_opt HDC hdcOptional,            -- An initialized read-only parameter that might be NULL.
     __inout IPropertyStore *ppsStore     -- An initialized parameter that may be freely used
                                          --   and modified.
 );

 LWSTDAPI_(BOOL) PathCompactPathExA(
     __out_ecount(cchMax) LPSTR pszOut,   -- A string buffer with cch elements that will
                                          --   be NULL terminated on exit.
     LPCSTR pszSrc,                       -- No annotation required, const implies __in.
     UINT cchMax,
     DWORD dwFlags
 );

 HRESULT SHLocalAllocBytes(
     size_t cb,
     __deref_bcount(cb) T **ppv           -- A pointer whose dereference will be set to an
                                          --   uninitialized buffer with cb bytes.
 );

 __inout_bcount_full(cb) : A buffer with cb elements that is fully initialized at
     entry and exit, and may be written to by this function.

 __out_ecount_part(count, *countOut) : A buffer with count elements that will be
     partially initialized by this function. The function indicates how much it
     initialized by setting *countOut.

 -------------------------------------------------------------------------------
 Advanced Annotations

 Advanced annotations describe behavior that is not expressible with the regular
 buffer macros. These may be used either to annotate buffer parameters that involve
 complex or conditional behavior, or to enrich existing annotations with additional
 information.

 __success(expr) f :
     <expr> indicates whether function f succeeded or not. If <expr> is true at exit,
     all the function's guarantees (as given by other annotations) must hold. If <expr>
     is false at exit, the caller should not expect any of the function's guarantees
     to hold. If not used, the function must always satisfy its guarantees. Added
     automatically to functions that indicate success in standard ways, such as by
     returning an HRESULT.

 __nullterminated p :
     Pointer p is a buffer that may be read or written up to and including the first
     NULL character or pointer. May be used on typedefs, which marks valid (properly
     initialized) instances of that type as being NULL-terminated.

 __nullnullterminated p :
     Pointer p is a buffer that may be read or written up to and including the first
     sequence of two NULL characters or pointers. May be used on typedefs, which marks
     valid instances of that type as being double-NULL terminated.

 __reserved v :
     Value v must be 0/NULL, reserved for future use.

 __checkReturn v :
     Return value v must not be ignored by callers of this function.

 __typefix(ctype) v :
     Value v should be treated as an instance of ctype, rather than its declared type.

 __override f :
     Specify C#-style 'override' behaviour for overriding virtual methods.

 __callback f :
     Function f can be used as a function pointer.

 __format_string p :
     Pointer p is a string that contains % markers in the style of printf.

 __blocksOn(resource) f :
     Function f blocks on the resource 'resource'.

 __fallthrough :
     Annotates switch statement labels where fall-through is desired, to distinguish
     from forgotten break statements.

 -------------------------------------------------------------------------------
 Advanced Annotation Examples

 __success(return == TRUE) LWSTDAPI_(BOOL) 
 PathCanonicalizeA(__out_ecount(MAX_PATH) LPSTR pszBuf, LPCSTR pszPath) :
    pszBuf is only guaranteed to be NULL-terminated when TRUE is returned.

 typedef __nullterminated WCHAR* LPWSTR : Initialized LPWSTRs are NULL-terminated strings.

 __out_ecount(cch) __typefix(LPWSTR) void *psz : psz is a buffer parameter which will be
     a NULL-terminated WCHAR string at exit, and which initially contains cch WCHARs.

 -------------------------------------------------------------------------------
*/






#line 1479 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"
extern "C" {




#line 1485 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"


/*
 -------------------------------------------------------------------------------
 Helper Macro Definitions

 These express behavior common to many of the high-level annotations.
 DO NOT USE THESE IN YOUR CODE.
 -------------------------------------------------------------------------------
*/

/*
The helper annotations are only understood by the compiler version used by various
defect detection tools. When the regular compiler is running, they are defined into
nothing, and do not affect the compiled code.
*/












































































































































































































#line 1706 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#line 1740 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"

/* 
-------------------------------------------------------------------------------
Buffer Annotation Definitions

Any of these may be used to directly annotate functions, but only one should
be used for each parameter. To determine which annotation to use for a given
buffer, use the table in the buffer annotations section.
-------------------------------------------------------------------------------
*/

































































































































































































/*
-------------------------------------------------------------------------------
Advanced Annotation Definitions

Any of these may be used to directly annotate functions, and may be used in
combination with each other or with regular buffer macros. For an explanation
of each annotation, see the advanced annotations section.
-------------------------------------------------------------------------------
*/















    
    
#line 1970 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"






#line 1977 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"
#line 1978 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"


}
#line 1982 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\sal.h"



#line 69 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"










#line 80 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"






#line 87 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"





#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"
/***
*crtassem.h - Libraries Assembly information
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file has information about Libraries Assembly version.
*
*       [Public]
*
****/

#pragma once



#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"


  
#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"


  

#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"
    
  #line 29 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"
#line 30 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"




#line 35 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"

#line 37 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"
#line 38 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"



#line 42 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtassem.h"
#line 93 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"











#line 105 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#pragma comment(linker,"/manifestdependency:\"type='win32' "            \
        "name='" "Microsoft.VC90" ".DebugCRT' "         \
        "version='" "9.0.21022.8" "' "                          \
        "processorArchitecture='x86' "                                  \
        "publicKeyToken='" "1fc8b3b9a1e18e3b" "'\"")






#line 121 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 123 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"





































#line 161 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 163 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"





#pragma pack(push,8)
#line 170 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"
/***
*vadefs.h - defines helper macros for stdarg.h
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This is a helper file for stdarg.h
*
*       [Public]
*
****/


#pragma once
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"






#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"



/*
 * Currently, all MS C compilers for Win32 platforms default to 8 byte
 * alignment.
 */


#pragma pack(push,8)
#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"


extern "C" {
#line 38 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"








#line 47 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"





typedef __w64 unsigned int   uintptr_t;
#line 54 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"

#line 56 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"





typedef char *  va_list;
#line 63 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"

#line 65 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"





#line 71 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"











#line 83 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"


#line 86 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"













#line 100 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"












































#line 145 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"


}
#line 149 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"


#pragma pack(pop)
#line 153 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"

#line 155 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"
#line 172 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


extern "C" {
#line 176 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* preprocessor string helpers */



#line 182 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 187 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 192 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"







#line 200 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


/* Define _CRTIMP_NOIA64 */



#line 207 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 209 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 210 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRTIMP2 */






#line 219 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 220 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRTIMP_ALTERNATIVE */








#line 231 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


#line 234 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 235 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _MRTIMP */



#line 241 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _MRTIMP2 */







#line 251 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 253 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"







#line 261 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 262 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 267 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 269 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 270 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 275 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 277 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 278 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


 

#line 283 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
  
 #line 285 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 286 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"










#line 297 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 298 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"






#line 305 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 306 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* define a specific constant for mixed mode */






/* Define __STDC_SECURE_LIB__ */


/* Retain__GOT_SECURE_LIB__ for back-compat */


/* Default value for __STDC_WANT_SECURE_LIB__ is 1 */


#line 324 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Turn off warnings if __STDC_WANT_SECURE_LIB__ is 0 */


#line 329 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* See note on use of deprecate at the top of this file */




#line 336 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRT_INSECURE_DEPRECATE */
/* See note on use of deprecate at the top of this file */


#line 342 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"






#line 349 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 350 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRT_INSECURE_DEPRECATE_MEMORY */
/* See note on use of deprecate at the top of this file */


#line 356 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"






#line 363 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 364 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRT_INSECURE_DEPRECATE_GLOBALS */
/* See note on use of deprecate at the top of this file */



#line 371 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 372 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 377 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


#line 380 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 382 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 383 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 384 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRT_MANAGED_HEAP_DEPRECATE */
/* See note on use of deprecate at the top of this file */


#line 390 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"










#line 401 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 403 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 404 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 405 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Change the __FILL_BUFFER_PATTERN to 0xFE to fix security function buffer overrun detection bug */


/* obsolete stuff */

/* Define _CRT_OBSOLETE */
/* See note on use of deprecate at the top of this file */


#line 416 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"






#line 423 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 424 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


/* jit64 instrinsic stuff */




#line 432 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 434 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 435 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define overload switches */

 
  
 



#line 445 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 446 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


 
  /* _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT is ignored if _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES is set to 0 */
  
 



#line 456 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 457 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


 
  
   
  

#line 465 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
 



#line 470 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 471 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRT_NONSTDC_DEPRECATE */
/* See note on use of deprecate at the top of this file */


#line 477 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 482 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 484 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 485 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"












typedef size_t rsize_t;

#line 500 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 501 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"





typedef __w64 int            intptr_t;
#line 508 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 510 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"














typedef __w64 int            ptrdiff_t;
#line 526 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 528 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"







typedef unsigned short wint_t;
typedef unsigned short wctype_t;

#line 539 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



















/* errcode is deprecated in favor or errno_t, which is part of the standard proposal */

__declspec(deprecated("This name was supported during some Whidbey pre-releases. Instead, use the standard name errno_t.")) typedef int errcode;


#line 564 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

typedef int errno_t;
#line 567 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


typedef __w64 long __time32_t;   /* 32-bit time value */

#line 572 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


typedef __int64 __time64_t;     /* 64-bit time value */

#line 577 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"





typedef __time64_t time_t;      /* time value */
#line 584 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 586 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"







#line 594 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 595 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 600 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 602 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 603 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 608 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 610 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 611 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define _CRTNOALIAS, _CRTRESTRICT */




#line 618 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 619 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 624 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



#line 628 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"











#line 640 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* Define __cdecl for non-Microsoft compilers */


#line 645 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




#line 650 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 652 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 653 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"




/* _TRUNCATE */


#line 661 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

/* helper macros for cpp overloads */
































































































































































#line 824 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 825 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"









































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 1891 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"















































































































































#line 2035 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
#line 2036 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct * pthreadlocinfo;
typedef struct threadmbcinfostruct * pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct
{
    pthreadlocinfo locinfo;
    pthreadmbcinfo mbcinfo;
} _locale_tstruct, *_locale_t;


typedef struct tagLC_ID {
        unsigned short wLanguage;
        unsigned short wCountry;
        unsigned short wCodePage;
} LC_ID, *LPLC_ID;

#line 2057 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


typedef struct threadlocaleinfostruct {
        int refcount;
        unsigned int lc_codepage;
        unsigned int lc_collate_cp;
        unsigned long lc_handle[6]; /* LCID */
        LC_ID lc_id[6];
        struct {
            char *locale;
            wchar_t *wlocale;
            int *refcount;
            int *wrefcount;
        } lc_category[6];
        int lc_clike;
        int mb_cur_max;
        int * lconv_intl_refcount;
        int * lconv_num_refcount;
        int * lconv_mon_refcount;
        struct lconv * lconv;
        int * ctype1_refcount;
        unsigned short * ctype1;
        const unsigned short * pctype;
        const unsigned char * pclmap;
        const unsigned char * pcumap;
        struct __lc_time_data * lc_time_curr;
} threadlocinfo;

#line 2086 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


}
#line 2090 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



#line 2094 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 2096 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



#line 2100 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 2102 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



#line 2106 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 2108 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"






#line 2115 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"



#line 2119 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"


#pragma pack(pop)
#line 2123 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 2125 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"

#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"


/*
 * Currently, all MS C compilers for Win32 platforms default to 8 byte
 * alignment.
 */
#pragma pack(push,8)
#line 31 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"


extern "C" {
#line 35 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"

/*
 * Exception disposition return values.
 */
typedef enum _EXCEPTION_DISPOSITION {
    ExceptionContinueExecution,
    ExceptionContinueSearch,
    ExceptionNestedException,
    ExceptionCollidedUnwind
} EXCEPTION_DISPOSITION;


/*
 * Prototype for SEH support function.
 */



/*
 * Declarations to keep MS C 8 (386/486) compiler happy
 */
struct _EXCEPTION_RECORD;
struct _CONTEXT;

EXCEPTION_DISPOSITION __cdecl _except_handler (
    [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] struct _EXCEPTION_RECORD *_ExceptionRecord,
    [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void * _EstablisherFrame,
    [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] struct _CONTEXT *_ContextRecord,
    [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _DispatcherContext
    );





























#line 95 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"


/*
 * Keywords and intrinsics for SEH
 */










unsigned long __cdecl _exception_code(void);
void *        __cdecl _exception_info(void);
int           __cdecl _abnormal_termination(void);

#line 115 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"


/*
 * Legal values for expression in except().
 */








}
#line 130 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"


#pragma pack(pop)
#line 134 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"

#line 136 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\excpt.h"
#line 152 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdarg.h"
/***
*stdarg.h - defines ANSI-style macros for variable argument functions
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file defines ANSI-style macros for accessing arguments
*       of functions which take a variable number of arguments.
*       [ANSI]
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdarg.h"






#line 25 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdarg.h"








#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdarg.h"
#line 153 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#line 154 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
/****************************************************************************
*                                                                           *
* windef.h -- Basic Windows Type Definitions                                *
*                                                                           *
* Copyright (c) Microsoft Corporation. All rights reserved.                 *
*                                                                           *
****************************************************************************/




#pragma once




#line 18 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
#line 19 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

// Win32 defines _WIN32 automatically,
// but Macintosh doesn't, so if we are using
// Win32 Functions, we must do it here












extern "C" {
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"





/*
 * BASETYPES is defined in ntdef.h if these types are already defined
 */



typedef unsigned long ULONG;
typedef ULONG *PULONG;
typedef unsigned short USHORT;
typedef USHORT *PUSHORT;
typedef unsigned char UCHAR;
typedef UCHAR *PUCHAR;
typedef char *PSZ;
#line 56 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"








#line 65 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
#line 66 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



#line 70 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



#line 74 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



#line 78 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



#line 82 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



#line 86 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"











#line 98 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"






#line 105 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



#line 109 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
#line 110 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"


























#line 137 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"





#line 143 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"







#line 151 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

typedef unsigned long       DWORD;
typedef int                 BOOL;
typedef unsigned char       BYTE;
typedef unsigned short      WORD;
typedef float               FLOAT;
typedef FLOAT               *PFLOAT;
typedef BOOL            *PBOOL;
typedef BOOL             *LPBOOL;
typedef BYTE            *PBYTE;
typedef BYTE             *LPBYTE;
typedef int             *PINT;
typedef int              *LPINT;
typedef WORD            *PWORD;
typedef WORD             *LPWORD;
typedef long             *LPLONG;
typedef DWORD           *PDWORD;
typedef DWORD            *LPDWORD;
typedef void             *LPVOID;
typedef const void       *LPCVOID;

typedef int                 INT;
typedef unsigned int        UINT;
typedef unsigned int        *PUINT;


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
/*++ BUILD Version: 0091     Increment this if a change has global effects

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    winnt.h

Abstract:

    This module defines the 32-Bit Windows types and constants that are
    defined by NT, but exposed through the Win32 API.

Revision History:

--*/





extern "C" {
#line 24 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
/***
*ctype.h - character conversion macros and ctype macros
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       Defines macros for character classification/conversion.
*       [ANSI/System V]
*
*       [Public]
*
****/


#pragma once
#line 17 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
/***
*crtdefs.h - definitions/declarations common to all CRT
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file has mostly defines used by the entire CRT.
*
*       [Public]
*
****/

/* Lack of pragma once is deliberate */

/* Define _CRTIMP */ 






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


extern "C" {
#line 26 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"



#line 30 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"








#line 39 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 41 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 42 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

__declspec(dllimport) const unsigned short * __cdecl __pctype_func(void);

__declspec(dllimport) extern const unsigned short *_pctype;


#line 49 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 50 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 51 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"





__declspec(dllimport) extern const unsigned short _wctype[];
#line 58 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

__declspec(dllimport) const wctype_t * __cdecl __pwctype_func(void);

__declspec(dllimport) extern const wctype_t *_pwctype;


#line 65 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 66 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 67 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


#line 70 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"




/* set bit masks for the possible character types */





                                /* vertical tab or form feed */









/* character classification function prototypes */



[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isctype([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Type);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isctype_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Type, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl isalpha([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isalpha_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl isupper([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isupper_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl islower([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _islower_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl isdigit([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isdigit_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl isxdigit([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isxdigit_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl isspace([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isspace_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl ispunct([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _ispunct_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl isalnum([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isalnum_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl isprint([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isprint_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl isgraph([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isgraph_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iscntrl([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iscntrl_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl toupper([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl tolower([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl _tolower([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _tolower_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)]  __declspec(dllimport) int __cdecl _toupper([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _toupper_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl __isascii([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl __toascii([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl __iscsymf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl __iscsym([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);

#line 130 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"



/* wide function prototypes, also declared in wchar.h  */

/* character classification function prototypes */

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswalpha([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswalpha_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswupper([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswupper_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswlower([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswlower_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswdigit([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswdigit_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswxdigit([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswxdigit_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswspace([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswspace_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswpunct([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswpunct_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswalnum([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswalnum_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswprint([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswprint_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswgraph([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswgraph_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswcntrl([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswcntrl_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswascii([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl isleadbyte([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _isleadbyte_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl towupper([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl _towupper_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl towlower([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl _towlower_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale); 
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl iswctype([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wctype_t _Type);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswctype_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wctype_t _Type, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl __iswcsymf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswcsymf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl __iswcsym([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _iswcsym_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "iswctype" " instead. See online help for details.")) __declspec(dllimport) int __cdecl is_wctype([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wctype_t _Type);


#line 179 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

/* the character classification macro definitions */



/*
 * Maximum number of bytes in multi-byte character in the current locale
 * (also defined in stdlib.h).
 */




#line 193 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 195 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

/* No data exports in pure code */
__declspec(dllimport) extern int __mb_cur_max;


#line 201 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
__declspec(dllimport) int __cdecl ___mb_cur_max_func(void);
__declspec(dllimport) int __cdecl ___mb_cur_max_l_func(_locale_t);
#line 204 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

/* Introduced to detect error when character testing functions are called
 * with illegal input of integer.
 */

__declspec(dllimport) int __cdecl _chvalidator([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mask);



#line 214 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"












































#line 259 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


__declspec(dllimport) int __cdecl _chvalidator_l([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mask);



#line 266 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


















































#line 317 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


























#line 344 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 346 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

/* MS C version 2.0 extended ctype macros */











#line 360 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"




/* Non-ANSI names for compatibility */











#line 377 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 379 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


}
#line 383 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 385 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 26 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"


/*************************************************************************
* See specstrings_strict.h for documentation of all user visible macros.
*************************************************************************/

#pragma once
#line 9 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"




#line 14 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"


extern "C" {
#line 18 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"

/* version specific fixes to bring sal.h upto date */


/* Missing from RTM sal.h */









#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"







#line 41 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"










































































/* Must protect redfinitions of macros to workaround rc.exe issues. */





#line 122 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"
#line 123 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"

/************************************************************************
 New extensions to sal.h follow here.
*************************************************************************/



























#line 155 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"







/* Internal defintions */
















#line 180 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"



































/* integer related macros */













/* Pentraion review macros */



















/* useful PFD related macros */


/* Windows Internal */





/* declare stub functions for macros */
 
 




}
#line 267 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"
#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_adt.h"
#pragma once
/*************************************************************************
* DEFINITIONS OF NEW TYPES 
*************************************************************************/










#line 16 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_adt.h"
typedef     char* ValidCompNameA;
typedef     unsigned short* ValidCompNameW;
typedef     const unsigned short* ConstValidCompNameW;
typedef      unsigned short* SAL_ValidCompNameT;
typedef     const  unsigned short* SAL_ConstValidCompNameT;


#line 24 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_adt.h"

/*************************************************************************
* DEFINITIONS OF INLINE FUNCTIONS FOR CASTING TO THE NEW TYPES : USER
*************************************************************************/











#line 40 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_adt.h"


#line 43 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_adt.h"


#line 268 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"





















/**************************************************************************
* This include should always be the last thing in this file. 
* Must avoid redfinitions of macros to workaround rc.exe issues. 
***************************************************************************/

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_strict.h"
/************************************************************************* 
*  This file documents all the macros approved for use in windows source
*  code. It includes some experimental macros which should only be used by
*  experts.
*
*  DO NOT include this file directly.  This file is include after
*  specstrings.h. So we can undefine every possible old definition including
*  private internal macros people should not be using, as well as macros from
*  sal.h.  Macros are redefined here in a way to cause syntax errors when used
*  incorrectly during a normal build when specstrings.h is included and
*  __SPECSTRINGS_STRICT_LEVEL is defined.
*
*  There are several levels of strictness, each level includes the behavior of
*  all previous levels.
*
*  0 - Disable strict checking 
*  1 - Break on unapproved macros and misuse of statement 
*      macros such as __fallthrough (default)
*  2 - Deprecated some old macros that should not be used
*  3 - Use VS 2005 Source Annotation to make sure every macro 
*      is used in the right context. For example placing __in on a return 
*      parameter will result in an error.
************************************************************************/


#line 27 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_strict.h"
/************************************************************************
*  Introduction
*
*  specstrings.h provides a set of annotations to describe how a function uses
*  its parameters - the assumptions it makes about them, and the guarantees it
*  makes upon finishing.
* 
*  Annotations must be placed before a function parameter's type or its return
*  type. There are two basic classes of common annotations buffer annotations
*  and advanced annotations.  Buffer annotations describe how functions use
*  their pointer parameters, and advanced annotations either describe
*  complex/unusual buffer behavior, or provide additional information about a
*  parameter that is not otherwise expressible.
* 
*  Buffer Annotations
* 
*  The most important annotations in SpecStrings.h provide a consistent way to
*  annotate buffer parameters or return values for a function. Each of these
*  annotations describes a single buffer (which could be a string, a
*  fixed-length or variable-length array, or just a pointer) that the function
*  interacts with: where it is, how large it is, how much is initialized, and
*  what the function does with it.
* 
*  The appropriate macro for a given buffer can be constructed using the table
*  below.  Just pick the appropriate values from each category, and combine
*  them together with a leading underscore. Some combinations of values do not
*  make sense as buffer annotations. Only meaningful annotations can be added
*  to your code; for a list of these, see the buffer annotation definitions
*  section.
* 
*  Only a single buffer annotation should be used for each parameter.
* 
*  |------------|------------|---------|--------|----------|---------------|
*  |   Level    |   Usage    |  Size   | Output | Optional |  Parameters   |
*  |------------|------------|---------|--------|----------|---------------|
*  | <>         | <>         | <>      | <>     | <>       | <>            |
*  | _deref     | _in        | _ecount | _full  | _opt     | (size)        |
*  | _deref_opt | _out       | _bcount | _part  |          | (size,length) |
*  |            | _inout     |         |        |          |               |
*  |            |            |         |        |          |               |
*  |------------|------------|---------|--------|----------|---------------|
*
*  Note: "<>" represents the empty string.
* 
*  Level: Describes the buffer pointer's level of indirection from the
*  parameter or return value 'p'.
* 
*  <>         : p is the buffer pointer.
*  _deref     : *p is the buffer pointer. p must not be NULL.
*  _deref_opt : *p may be the buffer pointer. p may be NULL, in which case the 
*               rest of the annotation is ignored.
* 
*  Usage: Describes how the function uses the buffer.
* 
*  <> : The buffer is not accessed. If used on the return value or with
*  _deref, the function will provide the buffer, and it will be uninitialized
*  at exit.  Otherwise, the caller must provide the buffer. This should only
*  be used for alloc and free functions.
*
*  _in : The function will only read from the buffer. The caller must provide
*  the buffer and initialize it.
*
*  _out : The function will only write to the buffer. If used on the return
*  value or with _deref, the function will provide the buffer and initialize
*  it.  Otherwise, the caller must provide the buffer, and the function will
*  initialize it.
*
*  _inout : The function may freely read from and write to the buffer. The
*  caller must provide the buffer and initialize it. If used with _deref, the
*  buffer may be reallocated by the function.
*
*  Size: Describes the total size of the buffer. This may be less than the
*  space actually allocated for the buffer, in which case it describes the
*  accessible amount.
* 
*  <> : No buffer size is given. If the type specifies the buffer size (such
*  as with LPSTR and LPWSTR), that amount is used. Otherwise, the buffer is
*  one element long. Must be used with _in, _out, or _inout.
*
*  _ecount : The buffer size is an explicit element count.
*
*  _bcount : The buffer size is an explicit byte count.
* 
*  Output: Describes how much of the buffer will be initialized by the
*  function. For _inout buffers, this also describes how much is initialized
*  at entry. Omit this category for _in buffers; they must be fully
*  initialized by the caller.
* 
*  <> : The type specifies how much is initialized. For instance, a function
*  initializing an LPWSTR must NULL-terminate the string.
*
*  _full : The function initializes the entire buffer.
*
*  _part : The function initializes part of the buffer, and explicitly
*  indicates how much.
* 
*  Optional: Describes if the buffer itself is optional.
* 
*  <>   : The pointer to the buffer must not be NULL.
*
*  _opt : The pointer to the buffer might be NULL. It will be checked before
*  being dereferenced.
* 
*  Parameters: Gives explicit counts for the size and length of the buffer.
* 
*  <> : There is no explicit count. Use when neither _ecount nor _bcount is
*  used.
*
*  (size) : Only the buffer's total size is given. Use with _ecount or _bcount
*  but not _part.
*
*  (size,length) : The buffer's total size and initialized length are
*  given. Use with _ecount_part and _bcount_part.
* 
*  ----------------------------------------------------------------------------
*  Buffer Annotation Examples
* 
*  LWSTDAPI_(BOOL) StrToIntExA(
*      LPCSTR pszString,  //  No annotation required, const implies __in.
*      DWORD dwFlags,
*      __out int *piRet   // A pointer whose dereference will be filled in.
*  );
* 
*  void MyPaintingFunction(
*      __in HWND hwndControl,     //  An initialized read-only parameter.
*      __in_opt HDC hdcOptional,  //  An initialized read-only parameter that 
*                                 //  might be NULL.
*      __inout IPropertyStore *ppsStore // An initialized parameter that 
*                                       // may be freely used and modified.
*  );
* 
*  LWSTDAPI_(BOOL) PathCompactPathExA(
*      __out_ecount(cchMax) LPSTR pszOut, //  A string buffer with cch elements
*                                         //  that will be '\0' terminated 
*                                         //  on exit.
*      LPCSTR pszSrc,                     //  No annotation required, 
*                                         //  const implies __in.
*      UINT cchMax,                              
*      DWORD dwFlags
*  );
* 
*  HRESULT SHLocalAllocBytes(
*      size_t cb,
*      __deref_bcount(cb) T **ppv //  A pointer whose dereference will be set
*                                 //  to an uninitialized buffer with cb bytes.
*  );
* 
*  __inout_bcount_full(cb) : A buffer with cb elements that is fully
*  initialized at entry and exit, and may be written to by this function.
* 
*  __out_ecount_part(count, *countOut) : A buffer with count elements that
*  will be partially initialized by this function. The function indicates how
*  much it initialized by setting *countOut.
* 
************************************************************************/

#pragma once
#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_undef.h"

























































































































































































































































































































































































#line 185 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_strict.h"










































































































































































































/************************************************************************
*  Advanced Annotations
* 
*  Advanced annotations describe behavior that is not expressible with the
*  regular buffer macros. These may be used either to annotate buffer
*  parameters that involve complex or conditional behavior, or to enrich
*  existing annotations with additional information.
* 
*  __success(expr) T f() : <expr> indicates whether function f succeeded or
*  not. If <expr> is true at exit, all the function's guarantees (as given
*  by other annotations) must hold. If <expr> is false at exit, the caller
*  should not expect any of the function's guarantees to hold. If not used,
*  the function must always satisfy its guarantees. Added automatically to
*  functions that indicate success in standard ways, such as by returning an
*  HRESULT.
* 
*  __out_awcount(expr, size) T *p : Pointer p is a buffer whose size may be
*  given in either bytes or elements. If <expr> is true, this acts like
*  __out_bcount. If <expr> is false, this acts like __out_ecount. This
*  should only be used to annotate old APIs.
* 
*  __in_awcount(expr, size) T* p : Pointer p is a buffer whose size may be given
*  in either bytes or elements. If <expr> is true, this acts like
*  __in_bcount. If <expr> is false, this acts like __in_ecount. This should
*  only be used to annotate old APIs.
* 
*  __nullterminated T* p : Pointer p is a buffer that may be read or written
*  up to and including the first '\0' character or pointer. May be used on
*  typedefs, which marks valid (properly initialized) instances of that type
*  as being null-terminated.
* 
*  __nullnullterminated T* p : Pointer p is a buffer that may be read or
*  written up to and including the first sequence of two '\0' characters or
*  pointers. May be used on typedefs, which marks valid instances of that
*  type as being double-null terminated.
* 
*  __reserved T v : Value v must be 0/NULL, reserved for future use.
* 
*  __checkReturn T f(); : Return value of f must not be ignored by callers
*  of this function.
* 
*  __typefix(ctype) T v : Value v should be treated as an instance of ctype,
*  rather than its declared type when considering validity.
* 
*  __override T f(); : Specify C#-style 'override' behaviour for overriding
*  virtual methods.
* 
*  __callback T f(); : Function f can be used as a function pointer.
* 
*  __format_string T p : Pointer p is a string that contains % markers in
*  the style of printf.
* 
*  __blocksOn(resource) f(); : Function f blocks on the resource 'resource'.
* 
*  __fallthrough : Annotates switch statement labels where fall-through is
*  desired, to distinguish from forgotten break statements.
* 
*  __range(low_bnd, up_bnd) int f(): The return from the function "f" must
*  be in the inclusive numeric range [low_bnd, up_bnd].
*
*  __in_range(low_bnd, up_bnd) int i : Precondition that integer i must be
*  in the inclusive numeric range [low_bnd, up_bnd].
* 
*  __out_range(low_bnd, up_bnd) int i : Postcondition that integer i must be
*  in the inclusive numeric range [low_bnd, up_bnd].
* 
*  __deref_in_range(low_bnd, up_bnd) int* pi : Precondition that integer *pi
*  must be in the inclusive numeric range [low_bnd, up_bnd].
*
*  __deref_out_range(low_bnd, up_bnd) int* pi : Postcondition that integer
*  *pi must be in the inclusive numeric range [low_bnd, up_bnd].
*
*  The first argument of a range macro may also be a C relational operator
*  (<,>,!=, ==, <=, >=).
*  
*  __range(rel_op, j) int f(): Postcondition that "f() rel_op j" must be
*  true.  Note that j may be a expression known only at runtime.
*
*  __in_range(rel_op, j) int i : Precondition that "i rel_op j" must be
*  true.  Note that j may be a expression known only at runtime.
* 
*  __out_range(rel_op, j) int i : Postcondition that integer "i rel_op j"
*  must be true.  Note that j may be a expression known only at runtime.
* 
*  __deref_in_range(rel_op, j) int *pi : Precondition that "*pi rel_op j"
*  must be true.  Note that j may be a expression known only at runtime.
*
*  __deref_out_range(rel_op, j) int *pi : Postcondition that "*pi rel_op j"
*  must be true.  Note that j may be a expression known only at runtime.
*
*  __in_bound int i : Precondition that integer i must be bound, but the
*  exact range can't be specified at compile time.  __in_range should be
*  used if the range can be explicitly stated.
*
*  __out_bound int i : Postcondition that integer i must be bound, but the
*  exact range can't be specified at compile time.  __out_range should be
*  used if the range can be explicitly stated.
* 
*  __deref_out_bound int pi : Postcondition that integer *pi must be bound,
*  but the exact range can't be specified at compile time.
*  __deref_out_range should be used if the range can be explicitly stated.
* 
*  __assume_bound(expr); : Assume that the expression is bound to some known
*  range. This can be used to suppress integer overflow warnings on integral
*  expressions that are known to be bound due to reasons not explicit in the
*  code. Use as a statement in the body of a function.
* 
*  __allocator void f(): Function allocates memory using an integral size
*  argument
*
*  ----------------------------------------------------------------------------
*  Advanced Annotation Examples
* 
*  __success(return == TRUE) LWSTDAPI_(BOOL) 
*  PathCanonicalizeA(__out_ecount(MAX_PATH) LPSTR pszBuf, LPCSTR pszPath);
*  //  pszBuf is only guaranteed to be null-terminated when TRUE is returned.
* 
*  // Initialized LPWSTRs are null-terminated strings.
*  typedef __nullterminated WCHAR* LPWSTR;
* 
*  __out_ecount(cch) __typefix(LPWSTR) void *psz;
*  // psz is a buffer parameter which will be a null-terminated WCHAR string 
*  // at exit, and which initially contains cch WCHARs.
* 
************************************************************************/

























/*************************************************************************** 
* Expert Macros
***************************************************************************/




/*************************************************************************** 
* Macros to classify fields of structures.
*                          Structure Annotations
*
*   The buffer annotations are a convenient way of describing
*   relationships between buffers and their size on a function by
*   function basis. Very often struct or class data members have similar
*   invariants, which can be expressed directly on the type.
*
*   Similar to our buffer annotations we can summarize all the various
*   structure annotations by one choosing an element from each column of
*   this table to build a composite annotation.
*
*           +--------------------------------------------------+
*           | Selector |  Units  |    Size/Init     | Optional |
*           |----------+---------+------------------+----------|
*           | __field  | _ecount | (size)           | empty    |
*           |----------+---------+------------------+----------|
*           | __struct | _bcount | _full(size)      | _opt     |
*           |----------+---------+------------------+----------|
*           |          | _xcount | _part(size,init) |          |
*           +--------------------------------------------------+
*
*   Note that empty represents the empty string. Sometime arguments need
*   to be "floated" to the left to give us a valid annotation name. For
*   example the naive combination __field_ecount(size)_opt is actually
*   written as __field_ecount_opt(size). Not all possible combinations
*   are currently supported or sensible. See specstrings_strict.h for
*   the currently supported set. Those that are supported are documented
*   below.
*
*Summary of Elements
*
*   Selector
*
*                __field
*                        The annotation should only be placed in front
*                        of data members of structures and classes. The
*                        data members are pointers to a block of data.
*                        The annotations describe properties about the
*                        size of the block of data. This can be used for
*
*                __struct
*                        The annotation should only be placed at the
*                        beginning of the definition of a structure or
*                        class. These annotations are used when a struct
*                        or class is used as a "header" that is
*                        allocated inline with a block of data and there
*                        is no apparent field that represents the tail
*                        end of the structure.
*
*   Units
*
*                _ecount
*                        All size and initialization values are in terms
*                        of elements of the appropriate type
*
*                _bcount
*                        All size and initialization values are in terms
*                        of raw byte sizes.
*
*                _xcount
*                        The size or initialization values cannot be
*                        properly expressed as a simple byte or element
*                        count, and instead a place holder is used to
*                        document the relationship.
*
*   Size/Init
*           All the size/init expressions can contain references to
*           other fields in the struct or class.
*
*                (size)
*                        The size of the buffer is determined by the
*                        expression size. Unless, the type of the buffer
*                        provides more information nothing is know about
*                        how much of this data is initialized. For
*                        example, if the data member happens to be a
*                        string type such as LPSTR. It is assumed that
*                        the data is initialized to the first '\0'.
*
*                _full(size)
*                        The size of the buffer is determined by the
*                        expression size and all the data in the buffer
*                        is guaranteed to be initialized.
*
*                _part(size,init)
*                        The size of the buffer is determined by the
*                        expression size and all the data in the buffer
*                        is guaranteed to be initialized up to init
*                        elements or bytes.
*
*   Optional
*
*                empty
*                        The pointer to the block of memory is never
*                        NULL
*
*                _opt
*                        The pointer to the block of memory is may be
*                        NULL
*
*     
*   // Basic Usage of Struct Annotations                         
*   #include <stdio.h>                                           
*   #include <stdlib.h>                                          
*   struct buf_s {                                               
*    int sz;                                                     
*    __field_bcount_full(sz)                                     
*    char *buf;                                                  
*   };                                                           
*   void InitBuf(__out struct *buf_s b,int sz) {                 
*        b->buf = calloc(sz,sizeof(char));                       
*        b->sz = sz;                                             
*   }                                                            
*   void WriteBuf(__in FILE *fp,__in struct *buf_s b) {          
*     fwrite(b->buf,b->sz,sizeof(char),fp);                      
*   }                                                            
*   void ReadBuf(__in FILE *fp,__inout struct *buf_s b) {        
*     fread(b->buf,b->sz,sizeof(char),fp);                       
*   }                                                            
*                                                                 
*                                                                 
*                                                                 
*   // Inline Allocated Buffer                                   
*   struct buf_s {                                               
*    int sz;                                                     
*    __field_bcount(sz)                                          
*    char buf[1];                                                
*   };                                                           
*   void WriteBuf(__in FILE *fp,__in struct *buf_s b) {          
*     fwrite(&(b->buf),b->sz,sizeof(char),fp);                   
*   }                                                            
*   void ReadBuf(__in FILE *fp,__inout struct *buf_s b) {        
*     fread(&(b->buf),b->sz,sizeof(char),fp);                    
*   }                                                            
*                                                                 
*                                                                 
*                                                                 
*   // Embedded Header Structure                                 
*   __struct_bcount(sz)                                          
*   struct buf_s {                                               
*    int sz;                                                     
*   };                                                           
*   void WriteBuf(__in FILE *fp,__in struct *buf_s b) {          
*     fwrite(&b,b->sz,sizeof(char),fp);                          
*   }                                                            
*   void ReadBuf(__in FILE *fp,__inout struct *buf_s b) {        
*     fread(&b,b->sz,sizeof(char),fp);                           
*   }                                                            
*
*
****************************************************************************/





















/*************************************************************************** 
* Macros to classify the entrypoints and indicate their category.
*
* Pre-defined control point categories include: RPC, KERNEL, GDI.
*
* Pre-defined control point macros include:
*  __rpc_entry, __kernel_entry, __gdi_entry.
***************************************************************************/





/*************************************************************************** 
* Macros to track untrusted data and their validation. The list of untrusted
* sources include:
*
* FILE                     - File reading stream or API
* NETWORK                  - Socket readers
* INTERNET                 - WinInet and WinHttp readers
* USER_REGISTRY            - HKCU portions of the registry
* USER_MODE                - Parameters to kernel entry points
* RPC                      - Parameters to RPC entry points 
* DRIVER                   - Device driver 
***************************************************************************/





/************************************************************************** 
* Macros to tag file parsing code. Predefined formats include:
*  PNG                     - Portable Network Graphics
*  JPEG                    - Joint Photographic Experts Group
*  BMP                     - Bitmap
*  RC_BMP                  - Resource bitmap
*  WMF                     - Windows Metafile
*  EMF                     - Windows Enhanced Metafile
*  GIF                     - Graphics Interchange Format
*  MIME_TYPE               - MIME type from header tokens
*  MAIL_MONIKER            - MAIL information refered by URL moniker
*  HTML                    - HyperText Markup Language
*  WMPHOTO                 - Windows media photo
*  OE_VCARD                - Outlook Express virtual card
*  OE_CONTACT              - Outlook Express contact
*  MIDI                    - Musical Instrument Digital Interface
*  LDIF                    - LDAP Data Interchange Format
*  AVI                     - Audio Visual Interchange
*  ACM                     - Audio Compression Manager
**************************************************************************/






/*************************************************************************** 
* Macros to track the code content in the file. The type of code
* contents currently tracked:
*
* NDIS_DRIVER                   - NDIS Device driver 
***************************************************************************/


/*************************************************************************** 
* Macros to track the code content in the class. The type of code
* contents currently tracked:
*
* DCOM                          - Class implementing DCOM
***************************************************************************/


/*************************************************************************
* Macros to tag encoded function pointers
**************************************************************************/








/************************************************************************* 
* __analysis_assume(expr) : Expert macro use only when directed. Use this to
* tell static analysis tools like PREfix and PREfast about a non-coded
* assumption that you wish the tools to assume. The assumption will be
* understood by those tools. By default there is no dynamic checking or
* static checking of the assumption in any build.
*
* To obtain dynamic checking wrap this macro in your local version of a debug
* assert.
* Please do not put function calls in the expression because this is not
* supported by all tools:
*  __analysis_assume(GetObject () != NULL); // DO NOT DO THIS
*
*************************************************************************/



/************************************************************************* 
* __analysis_hint(hint_sym) : Expert macro use only when
* directed. Use this to influence certain analysis heuristics
* used by the tools. These hints do not describe the semantics
* of functions but simply direct the tools to act in a certain
* way.
*
* Current hints that are supported are:
*
* INLINE   - inline this function during analysis overrides any
*            default heuristics 
* NOINLINE - do not inline this function during analysis overrides 
*            and default heuristics
*************************************************************************/


/************************************************************************* 
* Macros to encode abstract properties of values. Used by SALadt.h
*************************************************************************/








/************************************************************************* 
* Macros used by Prefast for Drivers 
* 
*  __possibly_notnulltermiated :
*
*  Used for return values of parameters or functions that do not
*  guarantee nullterimination in all cases.
*
*************************************************************************/


/************************************************************************* 
* Advanced macros
* 
*  __volatile 
* The __volatile annotation identifies a global variable or
* structure field that: 
*   1) is not declared volatile; 
*   2) is accessed concurrently by multiple threads.
*
* The __deref_volatile annotation identifies a global variable
* or structure field that stores a pointer to some data that:
*   1) is not declared volatile; 
*   2) is accessed concurrently by multiple threads.
*
* Prefast uses these annotations to find patterns of code that
* may result in unexpected re-fetching of the global variable
* into a local variable.
*
* We also provide two complimentary annotations __nonvolatile
* and __deref_nonvolatile that could be used to suppress Prefast
*
* re-fetching warnings on variables that are known either:
*   1) not to be in danger of being re-fetched or,
*   2) not to lead to incorrect results if they are re-fetched
*
*************************************************************************/





/************************************************************************* 
* Macros deprecated with strict level greater then 1.
**************************************************************************/


























































#line 948 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_strict.h"
/* Define soon to be deprecated macros to nops. */

























































/************************************************************************* 
* Definitions to force a compile error when macros are used improperly.
* Relies on VS 2005 source annotations.
*************************************************************************/







/**************************************************************************
*  This should go away. It's only for __success which we should split into.
*  __success and __typdecl_sucess
***************************************************************************/











































#line 1065 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_strict.h"
#line 1066 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings_strict.h"




#line 295 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"
#line 296 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"
#line 297 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\specstrings.h"



#line 29 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 35 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"









#line 45 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 49 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#line 55 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


#line 58 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// TYPE_ALIGNMENT will return the alignment requirements of a given type for
// the current platform.
//




#line 68 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 72 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"














#line 87 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 91 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// C_ASSERT() can be used to perform many compile-time assertions:
//            type sizes, field offsets, etc.
//
// An assertion failure results in error C2118: negative subscript.
//





#line 104 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    basetsd.h

Abstract:

    Type definitions for the basic sized types.

Author:

Revision History:

--*/












#line 31 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
 


#line 35 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
  
   
  

#line 40 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
  typedef unsigned long POINTER_64_INT;
 #line 42 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
 
#line 44 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"



#line 48 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

#line 50 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

//
// A compiler with support for __sptr and __uptr is in qualification.  To
// participate in qualification, remove the "0 &&" term below and also
// enable warning 4826 in warning.w
// 




#line 61 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"


#line 64 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"





#pragma once
#line 71 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"


extern "C" {
#line 75 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

typedef signed char         INT8, *PINT8;
typedef signed short        INT16, *PINT16;
typedef signed int          INT32, *PINT32;
typedef signed __int64      INT64, *PINT64;
typedef unsigned char       UINT8, *PUINT8;
typedef unsigned short      UINT16, *PUINT16;
typedef unsigned int        UINT32, *PUINT32;
typedef unsigned __int64    UINT64, *PUINT64;

//
// The following types are guaranteed to be signed and 32 bits wide.
//

typedef signed int LONG32, *PLONG32;

//
// The following types are guaranteed to be unsigned and 32 bits wide.
//

typedef unsigned int ULONG32, *PULONG32;
typedef unsigned int DWORD32, *PDWORD32;







#line 105 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

//
// The INT_PTR is guaranteed to be the same size as a pointer.  Its
// size with change with pointer size (32/64).  It should be used
// anywhere that a pointer is cast to an integer type. UINT_PTR is
// the unsigned variation.
//
// __int3264 is intrinsic to 64b MIDL but not to old MIDL or to C compiler.
//








#line 123 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
// old midl and C++ compiler










#line 135 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
    typedef __w64 int INT_PTR, *PINT_PTR;
    typedef __w64 unsigned int UINT_PTR, *PUINT_PTR;

    typedef __w64 long LONG_PTR, *PLONG_PTR;
    typedef __w64 unsigned long ULONG_PTR, *PULONG_PTR;

    

#line 144 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"
#line 145 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

//
// HALF_PTR is half the size of a pointer it intended for use with
// within structures which contain a pointer and two small fields.
// UHALF_PTR is the unsigned variation.
//























































































































































































typedef unsigned short UHALF_PTR, *PUHALF_PTR;
typedef short HALF_PTR, *PHALF_PTR;
typedef __w64 long SHANDLE_PTR;
typedef __w64 unsigned long HANDLE_PTR;

















__inline
void * __ptr64
PtrToPtr64(
    const void *p
    )
{
    return((void * __ptr64) (unsigned __int64) (ULONG_PTR)p );
}

__inline
void *
Ptr64ToPtr(
    const void * __ptr64 p
    )
{
    return((void *) (ULONG_PTR) (unsigned __int64) p);
}

__inline
void * __ptr64
HandleToHandle64(
    const void *h
    )
{
    return((void * __ptr64)(__int64)(LONG_PTR)h );
}

__inline
void *
Handle64ToHandle(
    const void * __ptr64 h
    )
{
    return((void *) (ULONG_PTR) (unsigned __int64) h );
}
#line 391 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"






#line 398 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"


















//
// SIZE_T used for counts or ranges which need to span the range of
// of a pointer.  SSIZE_T is the signed variation.
//

typedef ULONG_PTR SIZE_T, *PSIZE_T;
typedef LONG_PTR SSIZE_T, *PSSIZE_T;









































#line 465 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

//
// Add Windows flavor DWORD_PTR types
//

typedef ULONG_PTR DWORD_PTR, *PDWORD_PTR;

//
// The following types are guaranteed to be signed and 64 bits wide.
//

typedef __int64 LONG64, *PLONG64;


//
// The following types are guaranteed to be unsigned and 64 bits wide.
//

typedef unsigned __int64 ULONG64, *PULONG64;
typedef unsigned __int64 DWORD64, *PDWORD64;

//
// Thread affinity.
//

typedef ULONG_PTR KAFFINITY;
typedef KAFFINITY *PKAFFINITY;


}
#line 496 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

#line 498 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\basetsd.h"

#line 106 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 113 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 120 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 121 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 128 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 129 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 136 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 137 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 144 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 145 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 149 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 156 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 157 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 164 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 165 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 172 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 173 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 180 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 181 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"




#line 186 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 188 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 189 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 196 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 197 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"






#line 204 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 205 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"








#line 214 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 215 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"














#line 230 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Void
//

typedef void *PVOID;
typedef void * __ptr64 PVOID64;







#line 245 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#line 251 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Define API decoration for direct importing system DLL references.
//












#line 268 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


//
// Basics
//



typedef char CHAR;
typedef short SHORT;
typedef long LONG;

typedef int INT;
#line 282 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 283 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// UNICODE (Wide Character) types
//


typedef wchar_t WCHAR;    // wc,   16-bit UNICODE character



#line 294 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef WCHAR *PWCHAR, *LPWCH, *PWCH;
typedef const WCHAR *LPCWCH, *PCWCH;
typedef  WCHAR *NWPSTR, *LPWSTR, *PWSTR;
typedef  PWSTR *PZPWSTR;
typedef  const PWSTR *PCZPWSTR;
typedef  WCHAR  *LPUWSTR, *PUWSTR;
typedef  const WCHAR *LPCWSTR, *PCWSTR;
typedef  PCWSTR *PZPCWSTR;
typedef  const WCHAR  *LPCUWSTR, *PCUWSTR;




typedef const WCHAR *LPCWCHAR, *PCWCHAR;
typedef const WCHAR  *LPCUWCHAR, *PCUWCHAR;

//
//  UCS (Universal Character Set) types
//

typedef unsigned long UCSCHAR;

//
//  Even pre-Unicode agreement, UCS values are always in the
//  range U+00000000 to U+7FFFFFFF, so we'll pick an obvious
//  value.





//
//  We'll assume here that the ISO-10646 / Unicode agreement
//  not to assign code points after U+0010FFFF holds so that
//  we do not have to have separate "UCSCHAR" and "UNICODECHAR"
//  types.
//



typedef UCSCHAR *PUCSCHAR;
typedef const UCSCHAR *PCUCSCHAR;

typedef UCSCHAR *PUCSSTR;
typedef UCSCHAR  *PUUCSSTR;

typedef const UCSCHAR *PCUCSSTR;
typedef const UCSCHAR  *PCUUCSSTR;

typedef UCSCHAR  *PUUCSCHAR;
typedef const UCSCHAR  *PCUUCSCHAR;

#line 348 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


//
// ANSI (Multi-byte Character) types
//
typedef CHAR *PCHAR, *LPCH, *PCH;
typedef const CHAR *LPCCH, *PCCH;

typedef  CHAR *NPSTR, *LPSTR, *PSTR;
typedef  PSTR *PZPSTR;
typedef  const PSTR *PCZPSTR;
typedef  const CHAR *LPCSTR, *PCSTR;
typedef  PCSTR *PZPCSTR;

//
// Neutral ANSI/UNICODE types and macros
//



typedef WCHAR TCHAR, *PTCHAR;
typedef WCHAR TBYTE , *PTBYTE ;

#line 372 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef LPWCH LPTCH, PTCH;
typedef LPWSTR PTSTR, LPTSTR;
typedef LPCWSTR PCTSTR, LPCTSTR;
typedef LPUWSTR PUTSTR, LPUTSTR;
typedef LPCUWSTR PCUTSTR, LPCUTSTR;
typedef LPWSTR LP;















#line 395 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



typedef SHORT *PSHORT;  
typedef LONG *PLONG;    


typedef void *HANDLE;




#line 408 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
typedef HANDLE *PHANDLE;

//
// Flag (bit) fields
//

typedef BYTE   FCHAR;
typedef WORD   FSHORT;
typedef DWORD  FLONG;

// Component Object Model defines, and macros






typedef  long HRESULT;
#line 427 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 428 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


    


#line 434 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



// Win32 doesn't support __export





#line 444 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"













#line 458 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"














// The 'V' versions allow Variable Argument lists.













typedef char CCHAR;          
typedef DWORD LCID;         
typedef PDWORD PLCID;       
typedef WORD   LANGID;      






//
// _M_IX86 included so that EM CONTEXT structure compiles with
// x86 programs. *** TBD should this be for all architectures?
//

//
// 16 byte aligned type for 128 bit floats
//

//
// For we define a 128 bit structure and use __declspec(align(16)) pragma to
// align to 128 bits.
//



#line 513 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
typedef struct _FLOAT128 {
    __int64 LowPart;
    __int64 HighPart;
} FLOAT128;

typedef FLOAT128 *PFLOAT128;


//
// __int64 is only supported by 2.0 and later midl.
// __midl is set by the 2.0 midl and not by 1.0 midl.
//



typedef __int64 LONGLONG;
typedef unsigned __int64 ULONGLONG;


















#line 549 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef LONGLONG *PLONGLONG;
typedef ULONGLONG *PULONGLONG;

// Update Sequence Number

typedef LONGLONG USN;



#line 560 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
typedef union _LARGE_INTEGER {
    struct {
        DWORD LowPart;
        LONG HighPart;
    };
    struct {
        DWORD LowPart;
        LONG HighPart;
    } u;
#line 570 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
    LONGLONG QuadPart;
} LARGE_INTEGER;

typedef LARGE_INTEGER *PLARGE_INTEGER;



#line 578 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
typedef union _ULARGE_INTEGER {
    struct {
        DWORD LowPart;
        DWORD HighPart;
    };
    struct {
        DWORD LowPart;
        DWORD HighPart;
    } u;
#line 588 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
    ULONGLONG QuadPart;
} ULARGE_INTEGER;

typedef ULARGE_INTEGER *PULARGE_INTEGER;

// end_ntminiport end_ntndis end_ntminitape


//
// Locally Unique Identifier
//

typedef struct _LUID {
    DWORD LowPart;
    LONG HighPart;
} LUID, *PLUID;


typedef ULONGLONG  DWORDLONG;
typedef DWORDLONG *PDWORDLONG;


//
// Define operations to logically shift an int64 by 0..31 bits and to multiply
// 32-bits by 32-bits to form a 64-bit product.
//























#line 640 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// The x86 C compiler understands inline assembler. Therefore, inline functions
// that employ inline assembler are used for shifts of 0..31.  The multiplies
// rely on the compiler recognizing the cast of the multiplicand to int64 to
// generate the optimal code inline.
//





ULONGLONG
__stdcall
Int64ShllMod32 (
    ULONGLONG Value,
    DWORD ShiftCount
    );

LONGLONG
__stdcall
Int64ShraMod32 (
    LONGLONG Value,
    DWORD ShiftCount
    );

ULONGLONG
__stdcall
Int64ShrlMod32 (
    ULONGLONG Value,
    DWORD ShiftCount
    );


#pragma warning(push)
#line 676 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#pragma warning(disable:4035 4793)               

__inline ULONGLONG
__stdcall
Int64ShllMod32 (
    ULONGLONG Value,
    DWORD ShiftCount
    )
{
    __asm    {
        mov     ecx, ShiftCount
        mov     eax, dword ptr [Value]
        mov     edx, dword ptr [Value+4]
        shld    edx, eax, cl
        shl     eax, cl
    }
}

__inline LONGLONG
__stdcall
Int64ShraMod32 (
    LONGLONG Value,
    DWORD ShiftCount
    )
{
    __asm {
        mov     ecx, ShiftCount
        mov     eax, dword ptr [Value]
        mov     edx, dword ptr [Value+4]
        shrd    eax, edx, cl
        sar     edx, cl
    }
}

__inline ULONGLONG
__stdcall
Int64ShrlMod32 (
    ULONGLONG Value,
    DWORD ShiftCount
    )
{
    __asm    {
        mov     ecx, ShiftCount
        mov     eax, dword ptr [Value]
        mov     edx, dword ptr [Value+4]
        shrd    eax, edx, cl
        shr     edx, cl
    }
}


#pragma warning(pop)


#line 731 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#line 737 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Define rotate intrinsics.
//


extern "C" {
#line 745 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"









































#line 787 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"









unsigned int
__cdecl
_rotl (
     unsigned int Value,
     int Shift
    );

unsigned __int64
__cdecl
_rotl64 (
     unsigned __int64 Value,
     int Shift
    );


unsigned int
__cdecl
_rotr (
     unsigned int Value,
     int Shift
    );

unsigned __int64
__cdecl
_rotr64 (
     unsigned __int64 Value,
     int Shift
    );

#pragma intrinsic(_rotl)
#pragma intrinsic(_rotl64)
#pragma intrinsic(_rotr)
#pragma intrinsic(_rotr64)

#line 831 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


}
#line 835 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





typedef BYTE  BOOLEAN;           
typedef BOOLEAN *PBOOLEAN;       
//
//  Doubly linked list structure.  Can be used as either a list head, or
//  as link words.
//

typedef struct _LIST_ENTRY {
   struct _LIST_ENTRY *Flink;
   struct _LIST_ENTRY *Blink;
} LIST_ENTRY, *PLIST_ENTRY, * PRLIST_ENTRY;

//
//  Singly linked list structure. Can be used as either a list head, or
//  as link words.
//

typedef struct _SINGLE_LIST_ENTRY {
    struct _SINGLE_LIST_ENTRY *Next;
} SINGLE_LIST_ENTRY, *PSINGLE_LIST_ENTRY;

//
// These are needed for portable debugger support.
//

typedef struct LIST_ENTRY32 {
    DWORD Flink;
    DWORD Blink;
} LIST_ENTRY32;
typedef LIST_ENTRY32 *PLIST_ENTRY32;

typedef struct LIST_ENTRY64 {
    ULONGLONG Flink;
    ULONGLONG Blink;
} LIST_ENTRY64;
typedef LIST_ENTRY64 *PLIST_ENTRY64;


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
//+---------------------------------------------------------------------------
//
//  Microsoft Windows
//  Copyright (c) Microsoft Corporation.  All rights reserved.
//
//  File:       guiddef.h
//
//  Contents:   GUID definition
//
//----------------------------------------------------------------------------










#line 22 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
typedef struct _GUID {
    unsigned long  Data1;
    unsigned short Data2;
    unsigned short Data3;
    unsigned char  Data4[ 8 ];
} GUID;
#line 29 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"




































#line 67 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"








typedef GUID *LPGUID;
#line 77 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"



typedef const GUID *LPCGUID;
#line 82 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"




typedef GUID IID;
typedef IID *LPIID;


typedef GUID CLSID;
typedef CLSID *LPCLSID;


typedef GUID FMTID;
typedef FMTID *LPFMTID;







#line 104 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"







#line 112 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 113 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"







#line 121 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 122 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"







#line 130 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 131 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"







#line 139 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 140 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"

#line 142 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
/***
*string.h - declarations for string manipulation functions
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file contains the function declarations for the string
*       manipulation functions.
*       [ANSI/System V]
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdefs.h"
/***
*crtdefs.h - definitions/declarations common to all CRT
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file has mostly defines used by the entire CRT.
*
*       [Public]
*
****/

/* Lack of pragma once is deliberate */

/* Define _CRTIMP */ 






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"


extern "C" {
#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"




#line 32 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

/* Define NULL pointer value */








/* For backwards compatibility */


/* Function prototypes */


__declspec(dllimport) void *  __cdecl _memccpy( [SA_Pre(Null=SA_Maybe,WritableBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] void * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const void *  __cdecl memchr( [SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf , [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _memicmp([SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf1, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _memicmp_l([SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf1, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] int     __cdecl memcmp([SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf1, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
         void *  __cdecl memcpy([SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_Size")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);

__declspec(dllimport) errno_t  __cdecl memcpy_s([SA_Pre(Null=SA_Maybe,WritableBytes="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_MaxCount")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _DstSize, [SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 57 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
        void *  __cdecl memset([SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_Size")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);


/* Non-ANSI names for compatibility */
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_memccpy" ". See online help for details.")) __declspec(dllimport) void * __cdecl memccpy([SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] void * _Dst, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_memicmp" ". See online help for details.")) __declspec(dllimport) int __cdecl memicmp([SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf1, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Buf2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
#line 64 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

#line 66 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

 __declspec(dllimport) errno_t __cdecl _strset_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strset_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value) { return _strset_s(_Dest, _Size, _Value); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))  char * __cdecl _strset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value);

 __declspec(dllimport) errno_t __cdecl strcpy_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src);
#line 73 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl strcpy_s([SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source) { return strcpy_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strcpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))  char * __cdecl strcpy([SA_Pre(Null=SA_No,WritableElementsLength="_Source")] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source);

 __declspec(dllimport) errno_t __cdecl strcat_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src);
#line 78 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl strcat_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source) { return strcat_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strcat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))  char * __cdecl strcat([SA_Pre(Null=SA_No,WritableElementsLength="_Source")] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] int     __cdecl strcmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] size_t  __cdecl strlen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t  __cdecl strnlen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);

[returnvalue:SA_Post(MustCheck=SA_Yes)] static __inline size_t  __cdecl strnlen_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount)
{
    return (_Str==0) ? 0 : strnlen(_Str, _MaxCount);
}
#line 89 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

 __declspec(dllimport) errno_t __cdecl memmove_s([SA_Pre(Null=SA_Maybe,WritableBytes="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_MaxCount")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _DstSize, [SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 92 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"



#line 96 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
__declspec(dllimport)  void *  __cdecl memmove([SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_Size")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
#line 98 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"




#line 103 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) char *  __cdecl _strdup([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src);



#line 109 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const char *  __cdecl strchr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _stricmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strcmpi([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _stricmp_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str2, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl strcoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const  char * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strcoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str2, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _stricoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _stricoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str2, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strncoll  ([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strncoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strnicoll ([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strnicoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t  __cdecl strcspn([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char * _Control);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "_strerror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char *  __cdecl _strerror([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _ErrMsg);
 __declspec(dllimport) errno_t __cdecl _strerror_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _ErrMsg);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strerror_s(char (&_Buffer)[_Size], [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _ErrorMessage) { return _strerror_s(_Buffer, _Size, _ErrorMessage); } }
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "strerror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char *  __cdecl strerror([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int);

 __declspec(dllimport) errno_t __cdecl strerror_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ErrNum);
#line 130 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl strerror_s(char (&_Buffer)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ErrorMessage) { return strerror_s(_Buffer, _Size, _ErrorMessage); } }
 __declspec(dllimport) errno_t __cdecl _strlwr_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strlwr_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_String)[_Size]) { return _strlwr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strlwr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _strlwr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_String);
 __declspec(dllimport) errno_t __cdecl _strlwr_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strlwr_s_l([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_String)[_Size], [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale) { return _strlwr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strlwr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _strlwr_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_String, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

 __declspec(dllimport) errno_t __cdecl strncat_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 140 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl strncat_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count) { return strncat_s(_Dest, _Size, _Source, _Count); } }
#pragma warning(push)
#pragma warning(disable:6059)
/* prefast noise VSW 489802 */
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strncat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl strncat([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count);
#pragma warning(pop)


#line 149 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl strncmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
#line 151 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strnicmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _strnicmp_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

 __declspec(dllimport) errno_t __cdecl strncpy_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 156 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl strncpy_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count) { return strncpy_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "strncpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl strncpy([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count);
 __declspec(dllimport) errno_t __cdecl _strnset_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strnset_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count) { return _strnset_s(_Dest, _Size, _Val, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strnset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _strnset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const char *  __cdecl strpbrk([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Control);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const char *  __cdecl strrchr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch);
__declspec(dllimport) char *  __cdecl _strrev([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t  __cdecl strspn([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Control);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const char *  __cdecl strstr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _SubStr);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "strtok_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char *  __cdecl strtok([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Delim);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) char *  __cdecl strtok_s([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Delim, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _Context);
#line 170 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
 __declspec(dllimport) errno_t __cdecl _strupr_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strupr_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_String)[_Size]) { return _strupr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strupr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _strupr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_String);
 __declspec(dllimport) errno_t __cdecl _strupr_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _strupr_s_l([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_String)[_Size], _locale_t _Locale) { return _strupr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_strupr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _strupr_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_String, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
 __declspec(dllimport) size_t  __cdecl strxfrm ([SA_Pre(Null=SA_Maybe,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] char * _Dst, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
 __declspec(dllimport) size_t  __cdecl _strxfrm_l([SA_Pre(Null=SA_Maybe,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] char * _Dst, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);


extern "C++" {


[returnvalue:SA_Post(MustCheck=SA_Yes)] inline char * __cdecl strchr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch)
	{ return (char*)strchr((const char*)_Str, _Ch); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline char * __cdecl strpbrk([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Control)
	{ return (char*)strpbrk((const char*)_Str, _Control); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline char * __cdecl strrchr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch)
	{ return (char*)strrchr((const char*)_Str, _Ch); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline char * __cdecl strstr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _SubStr)
	{ return (char*)strstr((const char*)_Str, _SubStr); }
#line 192 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"


[returnvalue:SA_Post(MustCheck=SA_Yes)] inline void * __cdecl memchr([SA_Pre(Null=SA_Maybe,ValidBytes="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Pv, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
	{ return (void*)memchr((const void*)_Pv, _C, _N); }
#line 197 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
}
#line 199 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"






#line 206 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strdup" ". See online help for details.")) __declspec(dllimport) char * __cdecl strdup([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src);



#line 212 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

/* prototypes for oldnames.lib functions */
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strcmpi" ". See online help for details.")) __declspec(dllimport) int __cdecl strcmpi([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_stricmp" ". See online help for details.")) __declspec(dllimport) int __cdecl stricmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str2);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strlwr" ". See online help for details.")) __declspec(dllimport) char * __cdecl strlwr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strnicmp" ". See online help for details.")) __declspec(dllimport) int __cdecl strnicmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strnset" ". See online help for details.")) __declspec(dllimport) char * __cdecl strnset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strrev" ". See online help for details.")) __declspec(dllimport) char * __cdecl strrev([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strset" ". See online help for details."))         char * __cdecl strset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_strupr" ". See online help for details.")) __declspec(dllimport) char * __cdecl strupr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Str);

#line 224 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"




/* wide function prototypes, also declared in wchar.h  */




#line 234 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wcsdup([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str);



#line 240 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"


 __declspec(dllimport) errno_t __cdecl wcscat_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src);
#line 244 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcscat_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source) { return wcscat_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcscat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcscat([SA_Pre(Null=SA_No,WritableElementsLength="_Source")] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const wchar_t * __cdecl wcschr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, wchar_t _Ch);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl wcscmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2);

 __declspec(dllimport) errno_t __cdecl wcscpy_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src);
#line 251 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcscpy_s(wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source) { return wcscpy_s(_Dest, _Size, _Source); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcscpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcscpy([SA_Pre(Null=SA_No,WritableElementsLength="_Source")] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl wcscspn([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Control);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl wcslen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl wcsnlen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);

[returnvalue:SA_Post(MustCheck=SA_Yes)] static __inline size_t __cdecl wcsnlen_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount)
{
    return (_Src == 0) ? 0 : wcsnlen(_Src, _MaxCount);
}
#line 262 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

 __declspec(dllimport) errno_t __cdecl wcsncat_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 265 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcsncat_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count) { return wcsncat_s(_Dest, _Size, _Source, _Count); } }
#pragma warning(push)
#pragma warning(disable:6059)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcsncat_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsncat([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count);
#pragma warning(pop)
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl wcsncmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);

 __declspec(dllimport) errno_t __cdecl wcsncpy_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 274 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcsncpy_s(wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count) { return wcsncpy_s(_Dest, _Size, _Source, _Count); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcsncpy_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsncpy([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const wchar_t * __cdecl wcspbrk([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Control);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const wchar_t * __cdecl wcsrchr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl wcsspn([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Control);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) const wchar_t * __cdecl wcsstr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _SubStr);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "wcstok_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcstok([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Delim);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl wcstok_s([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Delim, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _Context);
#line 284 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcserror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcserror([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ErrNum);
 __declspec(dllimport) errno_t __cdecl _wcserror_s([SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ErrNum);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcserror_s(wchar_t (&_Buffer)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Error) { return _wcserror_s(_Buffer, _Size, _Error); } }
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "__wcserror_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl __wcserror([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str);
 __declspec(dllimport) errno_t __cdecl __wcserror_s([SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buffer, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ErrMsg);
extern "C++" { template <size_t _Size> inline errno_t __cdecl __wcserror_s(wchar_t (&_Buffer)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ErrorMessage) { return __wcserror_s(_Buffer, _Size, _ErrorMessage); } }

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsicmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsicmp_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsnicmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsnicmp_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
 __declspec(dllimport) errno_t __cdecl _wcsnset_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcsnset_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Dst)[_Size], wchar_t _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount) { return _wcsnset_s(_Dst, _Size, _Val, _MaxCount); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsnset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsnset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Str, wchar_t _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
__declspec(dllimport) wchar_t * __cdecl _wcsrev([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str);
 __declspec(dllimport) errno_t __cdecl _wcsset_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Value);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcsset_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Str)[_Size], wchar_t _Val) { return _wcsset_s(_Str, _Size, _Val); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsset_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Str, wchar_t _Val);

 __declspec(dllimport) errno_t __cdecl _wcslwr_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcslwr_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_String)[_Size]) { return _wcslwr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcslwr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcslwr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_String);
 __declspec(dllimport) errno_t __cdecl _wcslwr_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcslwr_s_l([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_String)[_Size], [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale) { return _wcslwr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcslwr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcslwr_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_String, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
 __declspec(dllimport) errno_t __cdecl _wcsupr_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcsupr_s([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_String)[_Size]) { return _wcsupr_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsupr_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsupr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_String);
 __declspec(dllimport) errno_t __cdecl _wcsupr_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcsupr_s_l([SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_String)[_Size], [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale) { return _wcsupr_s_l(_String, _Size, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcsupr_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wcsupr_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_String, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
 __declspec(dllimport) size_t __cdecl wcsxfrm([SA_Pre(Null=SA_Maybe,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] wchar_t * _Dst, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
 __declspec(dllimport) size_t __cdecl _wcsxfrm_l([SA_Pre(Null=SA_Maybe,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] wchar_t * _Dst, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl wcscoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcscoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsicoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsicoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str2, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsncoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsncoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsnicoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wcsnicoll_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);




extern "C++" {
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline wchar_t * __cdecl wcschr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_Str, wchar_t _Ch)
        {return ((wchar_t *)wcschr((const wchar_t *)_Str, _Ch)); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline wchar_t * __cdecl wcspbrk([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Control)
        {return ((wchar_t *)wcspbrk((const wchar_t *)_Str, _Control)); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline wchar_t * __cdecl wcsrchr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch)
        {return ((wchar_t *)wcsrchr((const wchar_t *)_Str, _Ch)); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] inline wchar_t * __cdecl wcsstr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_Str, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_SubStr)
        {return ((wchar_t *)wcsstr((const wchar_t *)_Str, _SubStr)); }
}
#line 340 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
#line 341 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"






#line 348 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsdup" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsdup([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str);



#line 354 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

/* old names */


/* prototypes for oldnames.lib functions */
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsicmp" ". See online help for details.")) __declspec(dllimport) int __cdecl wcsicmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsnicmp" ". See online help for details.")) __declspec(dllimport) int __cdecl wcsnicmp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsnset" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsnset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsrev" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsrev([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsset" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsset([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, wchar_t _Val);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcslwr" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcslwr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsupr" ". See online help for details.")) __declspec(dllimport) wchar_t * __cdecl wcsupr([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_wcsicoll" ". See online help for details.")) __declspec(dllimport) int __cdecl wcsicoll([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str1, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str2);

#line 369 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"


#line 372 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"



}
#line 377 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

#line 379 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
#line 147 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"

// Faster (but makes code fatter) inline version...use sparingly

__inline int InlineIsEqualGUID(const GUID & rguid1, const GUID & rguid2)
{
   return (
      ((unsigned long *) &rguid1)[0] == ((unsigned long *) &rguid2)[0] &&
      ((unsigned long *) &rguid1)[1] == ((unsigned long *) &rguid2)[1] &&
      ((unsigned long *) &rguid1)[2] == ((unsigned long *) &rguid2)[2] &&
      ((unsigned long *) &rguid1)[3] == ((unsigned long *) &rguid2)[3]);
}

__inline int IsEqualGUID(const GUID & rguid1, const GUID & rguid2)
{
    return !memcmp(&rguid1, &rguid2, sizeof(GUID));
}











#line 175 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"






// Same type, different name







// A couple of C++ helpers


__inline int operator==(const GUID & guidOne, const GUID & guidOther)
{
    return IsEqualGUID(guidOne,guidOther);
}

__inline int operator!=(const GUID & guidOne, const GUID & guidOther)
{
    return !(guidOne == guidOther);
}
#line 202 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 203 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 204 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 205 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"
#line 206 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\guiddef.h"

#line 879 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"




typedef struct  _OBJECTID {     // size is 20
    GUID Lineage;
    DWORD Uniquifier;
} OBJECTID;
#line 888 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"










//
// Calculate the byte offset of a field in a structure of type type.
//



//
// Calculate the size of a field in a structure of type type, without
// knowing or stating the type of the field.
//


//
// Calculate the size of a structure of type type up through and
// including a field.
//



//
//  RTL_CONTAINS_FIELD usage:
//
//      if (RTL_CONTAINS_FIELD(pBlock, pBlock->cbSize, dwMumble)) { // safe to use pBlock->dwMumble
//



//
// Return the number of elements in a statically sized array.
//   DWORD Buffer[100];
//   RTL_NUMBER_OF(Buffer) == 100
// This is also popularly known as: NUMBER_OF, ARRSIZE, _countof, NELEM, etc.
//



//
// RtlpNumberOf is a function that takes a reference to an array of N Ts.
//
// typedef T array_of_T[N];
// typedef array_of_T &reference_to_array_of_T;
//
// RtlpNumberOf returns a pointer to an array of N chars.
// We could return a reference instead of a pointer but older compilers do not accept that.
//
// typedef char array_of_char[N];
// typedef array_of_char *pointer_to_array_of_char;
//
// sizeof(array_of_char) == N
// sizeof(*pointer_to_array_of_char) == N
//
// pointer_to_array_of_char RtlpNumberOf(reference_to_array_of_T);
//
// We never even call RtlpNumberOf, we just take the size of dereferencing its return type.
// We do not even implement RtlpNumberOf, we just decare it.
//
// Attempts to pass pointers instead of arrays to this macro result in compile time errors.
// That is the point.
//
extern "C++" // templates cannot be declared to have 'C' linkage
template <typename T, size_t N>
char (*RtlpNumberOf(  T (&)[N] ))[N];



//
// This does not work with:
//
// void Foo()
// {
//    struct { int x; } y[2];
//    RTL_NUMBER_OF_V2(y); // illegal use of anonymous local type in template instantiation
// }
//
// You must instead do:
//
// struct Foo1 { int x; };
//
// void Foo()
// {
//    Foo1 y[2];
//    RTL_NUMBER_OF_V2(y); // ok
// }
//
// OR
//
// void Foo()
// {
//    struct { int x; } y[2];
//    RTL_NUMBER_OF_V1(y); // ok
// }
//
// OR
//
// void Foo()
// {
//    struct { int x; } y[2];
//    _ARRAYSIZE(y); // ok
// }
//



#line 1007 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#line 1013 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// ARRAYSIZE is more readable version of RTL_NUMBER_OF_V2, and uses
// it regardless of ENABLE_RTL_NUMBER_OF_V2
//
// _ARRAYSIZE is a version useful for anonymous types
//



//
// An expression that yields the type of a field in a struct.
//


// RTL_ to avoid collisions in the global namespace.
//
// Given typedef struct _FOO { BYTE Bar[123]; } FOO;
// RTL_NUMBER_OF_FIELD(FOO, Bar) == 123
//


//
// eg:
// typedef struct FOO {
//   DWORD Integer;
//   PVOID Pointer;
// } FOO;
//
// RTL_PADDING_BETWEEN_FIELDS(FOO, Integer, Pointer) == 0 for Win32, 4 for Win64
//





// RTL_ to avoid collisions in the global namespace.




#line 1055 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


// like sizeof
// usually this would be * CHAR_BIT, but we don't necessarily have #include <limits.h>




//
// Calculate the address of the base of the structure given its type, and an
// address of a field within the structure.
//

























//
// Product types
// This list grows with each OS release.
//
// There is no ordering of values to ensure callers
// do an equality test i.e. greater-than and less-than
// comparisons are not useful.
//
// NOTE: Values in this list should never be deleted.
//       When a product-type 'X' gets dropped from a
//       OS release onwards, the value of 'X' continues
//       to be used in the mapping table of GetProductInfo.
//

































//
//  Language IDs.
//
//  The following two combinations of primary language ID and
//  sublanguage ID have special semantics:
//
//    Primary Language ID   Sublanguage ID      Result
//    -------------------   ---------------     ------------------------
//    LANG_NEUTRAL          SUBLANG_NEUTRAL     Language neutral
//    LANG_NEUTRAL          SUBLANG_DEFAULT     User default language
//    LANG_NEUTRAL          SUBLANG_SYS_DEFAULT System default language
//    LANG_INVARIANT        SUBLANG_NEUTRAL     Invariant locale
//

//
//  Primary language IDs.
//



































































































































//
//  Sublanguage IDs.
//
//  The name immediately following SUBLANG_ dictates which primary
//  language ID that sublanguage ID can be combined with to form a
//  valid language ID.
//




































































































































































































































//
//  Sorting IDs.
//


























// end_r_winnt

//
//  A language ID is a 16 bit value which is the combination of a
//  primary language ID and a secondary language ID.  The bits are
//  allocated as follows:
//
//       +-----------------------+-------------------------+
//       |     Sublanguage ID    |   Primary Language ID   |
//       +-----------------------+-------------------------+
//        15                   10 9                       0   bit
//
//
//  Language ID creation/extraction macros:
//
//    MAKELANGID    - construct language id from a primary language id and
//                    a sublanguage id.
//    PRIMARYLANGID - extract primary language id from a language id.
//    SUBLANGID     - extract sublanguage id from a language id.
//






//
//  A locale ID is a 32 bit value which is the combination of a
//  language ID, a sort ID, and a reserved area.  The bits are
//  allocated as follows:
//
//       +-------------+---------+-------------------------+
//       |   Reserved  | Sort ID |      Language ID        |
//       +-------------+---------+-------------------------+
//        31         20 19     16 15                      0   bit
//
//
//  Locale ID creation/extraction macros:
//
//    MAKELCID            - construct the locale id from a language id and a sort id.
//    MAKESORTLCID        - construct the locale id from a language id, sort id, and sort version.
//    LANGIDFROMLCID      - extract the language id from a locale id.
//    SORTIDFROMLCID      - extract the sort id from a locale id.
//    SORTVERSIONFROMLCID - extract the sort version from a locale id.
//












// 8 characters for language
// 8 characters for region
// 64 characters for suffix (script)
// 2 characters for '-' separators
// 2 characters for prefix like "i-" or "x-"
// 1 null termination


//
//  Default System and User IDs for language and locale.
//







//
//  Other special IDs for language and locale.
//















// begin_ntminiport begin_ntndis begin_ntminitape

//
// Macros used to eliminate compiler warning generated when formal
// parameters or local variables are not declared.
//
// Use DBG_UNREFERENCED_PARAMETER() when a parameter is not yet
// referenced but will be once the module is completely developed.
//
// Use DBG_UNREFERENCED_LOCAL_VARIABLE() when a local variable is not yet
// referenced but will be once the module is completely developed.
//
// Use UNREFERENCED_PARAMETER() if a parameter will never be referenced.
//
// DBG_UNREFERENCED_PARAMETER and DBG_UNREFERENCED_LOCAL_VARIABLE will
// eventually be made into a null macro to help determine whether there
// is unfinished work.
//































#line 1693 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Macro used to eliminate compiler warning 4715 within a switch statement
// when all possible cases have already been accounted for.
//
// switch (a & 3) {
//     case 0: return 1;
//     case 1: return Foo();
//     case 2: return Bar();
//     case 3: return 1;
//     DEFAULT_UNREACHABLE;
//












#line 1718 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


/*lint -save -e767 */  












































#line 1766 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
/*lint -restore */  
#line 1768 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"




typedef ULONG_PTR KSPIN_LOCK;
typedef KSPIN_LOCK *PKSPIN_LOCK;










































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































//
// Disable these two pragmas that evaluate to "sti" "cli" on x86 so that driver
// writers to not leave them inadvertantly in their code.
//





#pragma warning(push)
#line 3043 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#pragma warning(disable:4164)   
                                // build with /Od don't get weird errors !

#pragma function(_enable)
#pragma function(_disable)
#line 3049 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


#pragma warning(pop)


#line 3055 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 3057 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 3058 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// end_ntddk end_nthal



extern "C" {
#line 3065 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


//
// [pfx_parse] - guard against PREfix intrinsic error
//



//
// Define bit test intrinsics.
//








BOOLEAN
_bittest (
     LONG const *Base,
     LONG Offset
    );

BOOLEAN
_bittestandcomplement (
     LONG *Base,
     LONG Offset
    );

BOOLEAN
_bittestandset (
     LONG *Base,
     LONG Offset
    );

BOOLEAN
_bittestandreset (
     LONG *Base,
     LONG Offset
    );

BOOLEAN
_interlockedbittestandset (
     LONG volatile *Base,
     LONG Offset
    );

BOOLEAN
_interlockedbittestandreset (
     LONG volatile *Base,
     LONG Offset
    );

#pragma intrinsic(_bittest)
#pragma intrinsic(_bittestandcomplement)
#pragma intrinsic(_bittestandset)
#pragma intrinsic(_bittestandreset)
#pragma intrinsic(_interlockedbittestandset)
#pragma intrinsic(_interlockedbittestandreset)

//
// Define bit scan intrinsics.
//




BOOLEAN
_BitScanForward (
     DWORD *Index,
     DWORD Mask
    );

BOOLEAN
_BitScanReverse (
     DWORD *Index,
     DWORD Mask
    );

#pragma intrinsic(_BitScanForward)
#pragma intrinsic(_BitScanReverse)





































#line 3186 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// [pfx_parse] - guard against PREfix intrinsic error
//





SHORT
_InterlockedCompareExchange16 (
     SHORT volatile *Destination,
     SHORT ExChange,
     SHORT Comperand
    );

#pragma intrinsic(_InterlockedCompareExchange16)

#line 3205 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


#pragma warning(push)
#pragma warning(disable:4035 4793)

__forceinline
BOOLEAN
InterlockedBitTestAndComplement (
     LONG volatile *Base,
     LONG Bit
    )
{
    __asm {
           mov eax, Bit
           mov ecx, Base
           lock btc [ecx], eax
           setc al
    };
}
#pragma warning(pop)
#line 3226 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// [pfx_parse]
// guard against __readfsbyte parsing error
//


//
// Define FS referencing intrinsics
//

BYTE 
__readfsbyte (
     DWORD Offset
    );
 
WORD  
__readfsword (
     DWORD Offset
    );
 
DWORD
__readfsdword (
     DWORD Offset
    );
 
void
__writefsbyte (
     DWORD Offset,
     BYTE  Data
    );
 
void
__writefsword (
     DWORD Offset,
     WORD   Data
    );
 
void
__writefsdword (
     DWORD Offset,
     DWORD Data
    );

#pragma intrinsic(__readfsbyte)
#pragma intrinsic(__readfsword)
#pragma intrinsic(__readfsdword)
#pragma intrinsic(__writefsbyte)
#pragma intrinsic(__writefsword)
#pragma intrinsic(__writefsdword)

#line 3278 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





void
__incfsbyte (
    DWORD Offset
    );
 
void
__addfsbyte (
    DWORD Offset,
    BYTE  Value
    );
 
void
__incfsword (
    DWORD Offset
    );
 
void
__addfsword (
    DWORD Offset,
    WORD   Value
    );
 
void
__incfsdword (
    DWORD Offset
    );
 
void
__addfsdword (
    DWORD Offset,
    DWORD Value
    );
 







#line 3324 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 3326 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 3328 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



void
_mm_pause (
    void
    );

#pragma intrinsic(_mm_pause)









#line 3347 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


}
#line 3351 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 3353 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#pragma warning( push )
#pragma warning( disable : 4793 )
__forceinline
void
MemoryBarrier (
    void
    )
{
    LONG Barrier;
    __asm {
        xchg Barrier, eax
    }
}
#pragma warning( pop )

#line 3374 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
//
// Prefetch is not supported on all x86 procssors.
//




//
// PreFetchCacheLine level defines.
//




//
// Define function to read the value of a performance counter.
//





DWORD64
__readpmc (
     DWORD Counter
    );

#pragma intrinsic(__readpmc)

















#line 3420 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Define function to read the value of the time stamp counter
//





DWORD64
__rdtsc (
    void
    );

#pragma intrinsic(__rdtsc)














#line 3450 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// end_ntddk
// begin_wdm





void
__int2c (
    void
    );

#pragma intrinsic(__int2c)


















#line 3483 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 3485 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// end_wdm 



__inline PVOID GetFiberData( void )    { return *(PVOID *) (ULONG_PTR) __readfsdword (0x10);}
__inline PVOID GetCurrentFiber( void ) { return (PVOID) (ULONG_PTR) __readfsdword (0x10);}


















#line 3511 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// begin_ntddk
#line 3514 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
// end_ntddk

//
// The following values specify the type of failing access when the status is 
// STATUS_ACCESS_VIOLATION and the first parameter in the execpetion record.
//





// begin_wx86
// begin_ntddk                                                                  

//
//  Define the size of the 80387 save area, which is in the context frame.
//



//
// The following flags control the contents of the CONTEXT structure.
//






// end_wx86















// begin_wx86

#line 3562 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



typedef struct _FLOATING_SAVE_AREA {
    DWORD   ControlWord;
    DWORD   StatusWord;
    DWORD   TagWord;
    DWORD   ErrorOffset;
    DWORD   ErrorSelector;
    DWORD   DataOffset;
    DWORD   DataSelector;
    BYTE    RegisterArea[80];
    DWORD   Cr0NpxState;
} FLOATING_SAVE_AREA;

typedef FLOATING_SAVE_AREA *PFLOATING_SAVE_AREA;

//
// Context Frame
//
//  This frame has a several purposes: 1) it is used as an argument to
//  NtContinue, 2) is is used to constuct a call frame for APC delivery,
//  and 3) it is used in the user level thread creation routines.
//
//  The layout of the record conforms to a standard call frame.
//

typedef struct _CONTEXT {

    //
    // The flags values within this flag control the contents of
    // a CONTEXT record.
    //
    // If the context record is used as an input parameter, then
    // for each portion of the context record controlled by a flag
    // whose value is set, it is assumed that that portion of the
    // context record contains valid context. If the context record
    // is being used to modify a threads context, then only that
    // portion of the threads context will be modified.
    //
    // If the context record is used as an IN OUT parameter to capture
    // the context of a thread, then only those portions of the thread's
    // context corresponding to set flags will be returned.
    //
    // The context record is never used as an OUT only parameter.
    //

    DWORD ContextFlags;

    //
    // This section is specified/returned if CONTEXT_DEBUG_REGISTERS is
    // set in ContextFlags.  Note that CONTEXT_DEBUG_REGISTERS is NOT
    // included in CONTEXT_FULL.
    //

    DWORD   Dr0;
    DWORD   Dr1;
    DWORD   Dr2;
    DWORD   Dr3;
    DWORD   Dr6;
    DWORD   Dr7;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_FLOATING_POINT.
    //

    FLOATING_SAVE_AREA FloatSave;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_SEGMENTS.
    //

    DWORD   SegGs;
    DWORD   SegFs;
    DWORD   SegEs;
    DWORD   SegDs;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_INTEGER.
    //

    DWORD   Edi;
    DWORD   Esi;
    DWORD   Ebx;
    DWORD   Edx;
    DWORD   Ecx;
    DWORD   Eax;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_CONTROL.
    //

    DWORD   Ebp;
    DWORD   Eip;
    DWORD   SegCs;              // MUST BE SANITIZED
    DWORD   EFlags;             // MUST BE SANITIZED
    DWORD   Esp;
    DWORD   SegSs;

    //
    // This section is specified/returned if the ContextFlags word
    // contains the flag CONTEXT_EXTENDED_REGISTERS.
    // The format and contexts are processor specific
    //

    BYTE    ExtendedRegisters[512];

} CONTEXT;



typedef CONTEXT *PCONTEXT;

// begin_ntminiport
#line 3681 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





typedef struct _LDT_ENTRY {
    WORD    LimitLow;
    WORD    BaseLow;
    union {
        struct {
            BYTE    BaseMid;
            BYTE    Flags1;     // Declare as bytes to avoid alignment
            BYTE    Flags2;     // Problems.
            BYTE    BaseHi;
        } Bytes;
        struct {
            DWORD   BaseMid : 8;
            DWORD   Type : 5;
            DWORD   Dpl : 2;
            DWORD   Pres : 1;
            DWORD   LimitHi : 4;
            DWORD   Sys : 1;
            DWORD   Reserved_0 : 1;
            DWORD   Default_Big : 1;
            DWORD   Granularity : 1;
            DWORD   BaseHi : 8;
        } Bits;
    } HighWord;
} LDT_ENTRY, *PLDT_ENTRY;

#line 3712 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 4774 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



























































































































































#line 4930 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


































































































































































































































































































































































































































































#line 5381 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
//  Define the size of the 80387 save area, which is in the context frame.
//





typedef struct _WOW64_FLOATING_SAVE_AREA {
    DWORD   ControlWord;
    DWORD   StatusWord;
    DWORD   TagWord;
    DWORD   ErrorOffset;
    DWORD   ErrorSelector;
    DWORD   DataOffset;
    DWORD   DataSelector;
    BYTE    RegisterArea[80];
    DWORD   Cr0NpxState;
} WOW64_FLOATING_SAVE_AREA;

typedef WOW64_FLOATING_SAVE_AREA *PWOW64_FLOATING_SAVE_AREA;

//
// Context Frame
//
//  This frame has a several purposes: 1) it is used as an argument to
//  NtContinue, 2) is is used to constuct a call frame for APC delivery,
//  and 3) it is used in the user level thread creation routines.
//
//  The layout of the record conforms to a standard call frame.
//

typedef struct _WOW64_CONTEXT {

    //
    // The flags values within this flag control the contents of
    // a CONTEXT record.
    //
    // If the context record is used as an input parameter, then
    // for each portion of the context record controlled by a flag
    // whose value is set, it is assumed that that portion of the
    // context record contains valid context. If the context record
    // is being used to modify a threads context, then only that
    // portion of the threads context will be modified.
    //
    // If the context record is used as an IN OUT parameter to capture
    // the context of a thread, then only those portions of the thread's
    // context corresponding to set flags will be returned.
    //
    // The context record is never used as an OUT only parameter.
    //

    DWORD ContextFlags;

    //
    // This section is specified/returned if CONTEXT_DEBUG_REGISTERS is
    // set in ContextFlags.  Note that CONTEXT_DEBUG_REGISTERS is NOT
    // included in CONTEXT_FULL.
    //

    DWORD   Dr0;
    DWORD   Dr1;
    DWORD   Dr2;
    DWORD   Dr3;
    DWORD   Dr6;
    DWORD   Dr7;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_FLOATING_POINT.
    //

    WOW64_FLOATING_SAVE_AREA FloatSave;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_SEGMENTS.
    //

    DWORD   SegGs;
    DWORD   SegFs;
    DWORD   SegEs;
    DWORD   SegDs;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_INTEGER.
    //

    DWORD   Edi;
    DWORD   Esi;
    DWORD   Ebx;
    DWORD   Edx;
    DWORD   Ecx;
    DWORD   Eax;

    //
    // This section is specified/returned if the
    // ContextFlags word contians the flag CONTEXT_CONTROL.
    //

    DWORD   Ebp;
    DWORD   Eip;
    DWORD   SegCs;              // MUST BE SANITIZED
    DWORD   EFlags;             // MUST BE SANITIZED
    DWORD   Esp;
    DWORD   SegSs;

    //
    // This section is specified/returned if the ContextFlags word
    // contains the flag CONTEXT_EXTENDED_REGISTERS.
    // The format and contexts are processor specific
    //

    BYTE    ExtendedRegisters[512];

} WOW64_CONTEXT;

typedef WOW64_CONTEXT *PWOW64_CONTEXT;




//
// Exception record definition.
//

typedef struct _EXCEPTION_RECORD {
    DWORD    ExceptionCode;
    DWORD ExceptionFlags;
    struct _EXCEPTION_RECORD *ExceptionRecord;
    PVOID ExceptionAddress;
    DWORD NumberParameters;
    ULONG_PTR ExceptionInformation[15];
    } EXCEPTION_RECORD;

typedef EXCEPTION_RECORD *PEXCEPTION_RECORD;

typedef struct _EXCEPTION_RECORD32 {
    DWORD    ExceptionCode;
    DWORD ExceptionFlags;
    DWORD ExceptionRecord;
    DWORD ExceptionAddress;
    DWORD NumberParameters;
    DWORD ExceptionInformation[15];
} EXCEPTION_RECORD32, *PEXCEPTION_RECORD32;

typedef struct _EXCEPTION_RECORD64 {
    DWORD    ExceptionCode;
    DWORD ExceptionFlags;
    DWORD64 ExceptionRecord;
    DWORD64 ExceptionAddress;
    DWORD NumberParameters;
    DWORD __unusedAlignment;
    DWORD64 ExceptionInformation[15];
} EXCEPTION_RECORD64, *PEXCEPTION_RECORD64;

//
// Typedef for pointer returned by exception_info()
//

typedef struct _EXCEPTION_POINTERS {
    PEXCEPTION_RECORD ExceptionRecord;
    PCONTEXT ContextRecord;
} EXCEPTION_POINTERS, *PEXCEPTION_POINTERS;
typedef PVOID PACCESS_TOKEN;            
typedef PVOID PSECURITY_DESCRIPTOR;     
typedef PVOID PSID;     
////////////////////////////////////////////////////////////////////////
//                                                                    //
//                             ACCESS MASK                            //
//                                                                    //
////////////////////////////////////////////////////////////////////////

//
//  Define the access mask as a longword sized structure divided up as
//  follows:
//
//       3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//       1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//      +---------------+---------------+-------------------------------+
//      |G|G|G|G|Res'd|A| StandardRights|         SpecificRights        |
//      |R|W|E|A|     |S|               |                               |
//      +-+-------------+---------------+-------------------------------+
//
//      typedef struct _ACCESS_MASK {
//          WORD   SpecificRights;
//          BYTE  StandardRights;
//          BYTE  AccessSystemAcl : 1;
//          BYTE  Reserved : 3;
//          BYTE  GenericAll : 1;
//          BYTE  GenericExecute : 1;
//          BYTE  GenericWrite : 1;
//          BYTE  GenericRead : 1;
//      } ACCESS_MASK;
//      typedef ACCESS_MASK *PACCESS_MASK;
//
//  but to make life simple for programmer's we'll allow them to specify
//  a desired access mask by simply OR'ing together mulitple single rights
//  and treat an access mask as a DWORD.  For example
//
//      DesiredAccess = DELETE | READ_CONTROL
//
//  So we'll declare ACCESS_MASK as DWORD
//

// begin_wdm
typedef DWORD ACCESS_MASK;
typedef ACCESS_MASK *PACCESS_MASK;

////////////////////////////////////////////////////////////////////////
//                                                                    //
//                             ACCESS TYPES                           //
//                                                                    //
////////////////////////////////////////////////////////////////////////


// begin_wdm
//
//  The following are masks for the predefined standard access types
//

















//
// AccessSystemAcl access type
//



//
// MaximumAllowed access type
//



//
//  These are the generic rights.
//







//
//  Define the generic mapping array.  This is used to denote the
//  mapping of each generic access right to a specific access mask.
//

typedef struct _GENERIC_MAPPING {
    ACCESS_MASK GenericRead;
    ACCESS_MASK GenericWrite;
    ACCESS_MASK GenericExecute;
    ACCESS_MASK GenericAll;
} GENERIC_MAPPING;
typedef GENERIC_MAPPING *PGENERIC_MAPPING;



////////////////////////////////////////////////////////////////////////
//                                                                    //
//                        LUID_AND_ATTRIBUTES                         //
//                                                                    //
////////////////////////////////////////////////////////////////////////
//
//


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pshpack4.h

Abstract:

    This file turns 4 byte packing of structures on.  (That is, it disables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.  For Microsoft
    compatible compilers, this files uses the push option to the pack pragma
    so that the poppack.h include file can restore the previous packing
    reliably.

    The file poppack.h is the complement to this file.

--*/



#pragma warning(disable:4103)

#pragma pack(push,4)


#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"
#line 34 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"

#line 5667 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _LUID_AND_ATTRIBUTES {
    LUID Luid;
    DWORD Attributes;
    } LUID_AND_ATTRIBUTES, * PLUID_AND_ATTRIBUTES;
typedef LUID_AND_ATTRIBUTES LUID_AND_ATTRIBUTES_ARRAY[1];
typedef LUID_AND_ATTRIBUTES_ARRAY *PLUID_AND_ATTRIBUTES_ARRAY;

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    poppack.h

Abstract:

    This file turns packing of structures off.  (That is, it enables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.

    poppack.h is the complement to pshpack?.h.  An inclusion of poppack.h
    MUST ALWAYS be preceded by an inclusion of one of pshpack?.h, in one-to-one
    correspondence.

    For Microsoft compatible compilers, this file uses the pop option
    to the pack pragma so that it can restore the previous saved by the
    pshpack?.h include file.

--*/



#pragma warning(disable:4103)

#pragma pack(pop)


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"


#line 36 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"

#line 5676 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


////////////////////////////////////////////////////////////////////////
//                                                                    //
//              Security Id     (SID)                                 //
//                                                                    //
////////////////////////////////////////////////////////////////////////
//
//
// Pictorially the structure of an SID is as follows:
//
//         1   1   1   1   1   1
//         5   4   3   2   1   0   9   8   7   6   5   4   3   2   1   0
//      +---------------------------------------------------------------+
//      |      SubAuthorityCount        |Reserved1 (SBZ)|   Revision    |
//      +---------------------------------------------------------------+
//      |                   IdentifierAuthority[0]                      |
//      +---------------------------------------------------------------+
//      |                   IdentifierAuthority[1]                      |
//      +---------------------------------------------------------------+
//      |                   IdentifierAuthority[2]                      |
//      +---------------------------------------------------------------+
//      |                                                               |
//      +- -  -  -  -  -  -  -  SubAuthority[]  -  -  -  -  -  -  -  - -+
//      |                                                               |
//      +---------------------------------------------------------------+
//
//


// begin_ntifs



typedef struct _SID_IDENTIFIER_AUTHORITY {
    BYTE  Value[6];
} SID_IDENTIFIER_AUTHORITY, *PSID_IDENTIFIER_AUTHORITY;
#line 5714 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"




typedef struct _SID {
   BYTE  Revision;
   BYTE  SubAuthorityCount;
   SID_IDENTIFIER_AUTHORITY IdentifierAuthority;



   DWORD SubAuthority[1];
#line 5727 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
} SID, *PISID;
#line 5729 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





                                                // in a future release.



#line 5739 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


typedef enum _SID_NAME_USE {
    SidTypeUser = 1,
    SidTypeGroup,
    SidTypeDomain,
    SidTypeAlias,
    SidTypeWellKnownGroup,
    SidTypeDeletedAccount,
    SidTypeInvalid,
    SidTypeUnknown,
    SidTypeComputer,
    SidTypeLabel
} SID_NAME_USE, *PSID_NAME_USE;

typedef struct _SID_AND_ATTRIBUTES {
    PSID Sid;
    DWORD Attributes;
    } SID_AND_ATTRIBUTES, * PSID_AND_ATTRIBUTES;

typedef SID_AND_ATTRIBUTES SID_AND_ATTRIBUTES_ARRAY[1];
typedef SID_AND_ATTRIBUTES_ARRAY *PSID_AND_ATTRIBUTES_ARRAY;


typedef ULONG_PTR SID_HASH_ENTRY, *PSID_HASH_ENTRY;

typedef struct _SID_AND_ATTRIBUTES_HASH {
    DWORD SidCount;
    PSID_AND_ATTRIBUTES SidAttr;
    SID_HASH_ENTRY Hash[32];
} SID_AND_ATTRIBUTES_HASH, *PSID_AND_ATTRIBUTES_HASH;


/////////////////////////////////////////////////////////////////////////////
//                                                                         //
// Universal well-known SIDs                                               //
//                                                                         //
//     Null SID                     S-1-0-0                                //
//     World                        S-1-1-0                                //
//     Local                        S-1-2-0                                //
//     Creator Owner ID             S-1-3-0                                //
//     Creator Group ID             S-1-3-1                                //
//     Creator Owner Server ID      S-1-3-2                                //
//     Creator Group Server ID      S-1-3-3                                //
//                                                                         //
//     (Non-unique IDs)             S-1-4                                  //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////





















///////////////////////////////////////////////////////////////////////////////
//                                                                           //
// NT well-known SIDs                                                        //
//                                                                           //
//     NT Authority            S-1-5                                         //
//     Dialup                  S-1-5-1                                       //
//                                                                           //
//     Network                 S-1-5-2                                       //
//     Batch                   S-1-5-3                                       //
//     Interactive             S-1-5-4                                       //
//     (Logon IDs)             S-1-5-5-X-Y                                   //
//     Service                 S-1-5-6                                       //
//     AnonymousLogon          S-1-5-7       (aka null logon session)        //
//     Proxy                   S-1-5-8                                       //
//     Enterprise DC (EDC)     S-1-5-9       (aka domain controller account) //
//     Self                    S-1-5-10      (self RID)                      //
//     Authenticated User      S-1-5-11      (Authenticated user somewhere)  //
//     Restricted Code         S-1-5-12      (Running restricted code)       //
//     Terminal Server         S-1-5-13      (Running on Terminal Server)    //
//     Remote Logon            S-1-5-14      (Remote Interactive Logon)      //
//     This Organization       S-1-5-15                                      //
//                                                                           //
//     IUser                   S-1-5-17
//     Local System            S-1-5-18                                      //
//     Local Service           S-1-5-19                                      //
//     Network Service         S-1-5-20                                      //
//                                                                           //
//     (NT non-unique IDs)     S-1-5-0x15-... (NT Domain Sids)               //
//                                                                           //
//     (Built-in domain)       S-1-5-0x20                                    //
//                                                                           //
//     (Security Package IDs)  S-1-5-0x40                                    //
//     NTLM Authentication     S-1-5-0x40-10                                 //
//     SChannel Authentication S-1-5-0x40-14                                 //
//     Digest Authentication   S-1-5-0x40-21                                 //
//                                                                           //
//     Other Organization      S-1-5-1000    (>=1000 can not be filtered)    //
//                                                                           //
//                                                                           //
// NOTE: the relative identifier values (RIDs) determine which security      //
//       boundaries the SID is allowed to cross.  Before adding new RIDs,    //
//       a determination needs to be made regarding which range they should  //
//       be added to in order to ensure proper "SID filtering"               //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////





















































/////////////////////////////////////////////////////////////////////////////
//                                                                         //
// well-known domain relative sub-authority values (RIDs)...               //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////

// Well-known users ...










// well-known groups ...















// well-known aliases ...





































//
// SECURITY_MANDATORY_MAXIMUM_USER_RID is the highest RID that
// can be set by a usermode caller.
//







//
// Well known SID definitions for lookup.
//

typedef enum {

    WinNullSid                                  = 0,
    WinWorldSid                                 = 1,
    WinLocalSid                                 = 2,
    WinCreatorOwnerSid                          = 3,
    WinCreatorGroupSid                          = 4,
    WinCreatorOwnerServerSid                    = 5,
    WinCreatorGroupServerSid                    = 6,
    WinNtAuthoritySid                           = 7,
    WinDialupSid                                = 8,
    WinNetworkSid                               = 9,
    WinBatchSid                                 = 10,
    WinInteractiveSid                           = 11,
    WinServiceSid                               = 12,
    WinAnonymousSid                             = 13,
    WinProxySid                                 = 14,
    WinEnterpriseControllersSid                 = 15,
    WinSelfSid                                  = 16,
    WinAuthenticatedUserSid                     = 17,
    WinRestrictedCodeSid                        = 18,
    WinTerminalServerSid                        = 19,
    WinRemoteLogonIdSid                         = 20,
    WinLogonIdsSid                              = 21,
    WinLocalSystemSid                           = 22,
    WinLocalServiceSid                          = 23,
    WinNetworkServiceSid                        = 24,
    WinBuiltinDomainSid                         = 25,
    WinBuiltinAdministratorsSid                 = 26,
    WinBuiltinUsersSid                          = 27,
    WinBuiltinGuestsSid                         = 28,
    WinBuiltinPowerUsersSid                     = 29,
    WinBuiltinAccountOperatorsSid               = 30,
    WinBuiltinSystemOperatorsSid                = 31,
    WinBuiltinPrintOperatorsSid                 = 32,
    WinBuiltinBackupOperatorsSid                = 33,
    WinBuiltinReplicatorSid                     = 34,
    WinBuiltinPreWindows2000CompatibleAccessSid = 35,
    WinBuiltinRemoteDesktopUsersSid             = 36,
    WinBuiltinNetworkConfigurationOperatorsSid  = 37,
    WinAccountAdministratorSid                  = 38,
    WinAccountGuestSid                          = 39,
    WinAccountKrbtgtSid                         = 40,
    WinAccountDomainAdminsSid                   = 41,
    WinAccountDomainUsersSid                    = 42,
    WinAccountDomainGuestsSid                   = 43,
    WinAccountComputersSid                      = 44,
    WinAccountControllersSid                    = 45,
    WinAccountCertAdminsSid                     = 46,
    WinAccountSchemaAdminsSid                   = 47,
    WinAccountEnterpriseAdminsSid               = 48,
    WinAccountPolicyAdminsSid                   = 49,
    WinAccountRasAndIasServersSid               = 50,
    WinNTLMAuthenticationSid                    = 51,
    WinDigestAuthenticationSid                  = 52,
    WinSChannelAuthenticationSid                = 53,
    WinThisOrganizationSid                      = 54,
    WinOtherOrganizationSid                     = 55,
    WinBuiltinIncomingForestTrustBuildersSid    = 56,
    WinBuiltinPerfMonitoringUsersSid            = 57,
    WinBuiltinPerfLoggingUsersSid               = 58,
    WinBuiltinAuthorizationAccessSid            = 59,
    WinBuiltinTerminalServerLicenseServersSid   = 60,
    WinBuiltinDCOMUsersSid                      = 61,
    WinBuiltinIUsersSid                         = 62,
    WinIUserSid                                 = 63,
    WinBuiltinCryptoOperatorsSid                = 64,
    WinUntrustedLabelSid                        = 65,
    WinLowLabelSid                              = 66,
    WinMediumLabelSid                           = 67,
    WinHighLabelSid                             = 68,
    WinSystemLabelSid                           = 69,
    WinWriteRestrictedCodeSid                   = 70,
    WinCreatorOwnerRightsSid                    = 71,
    WinCacheablePrincipalsGroupSid              = 72,
    WinNonCacheablePrincipalsGroupSid           = 73,
    WinEnterpriseReadonlyControllersSid         = 74,
    WinAccountReadonlyControllersSid            = 75,
    WinBuiltinEventLogReadersGroup              = 76,

} WELL_KNOWN_SID_TYPE;

//
// Allocate the System Luid.  The first 1000 LUIDs are reserved.
// Use #999 here (0x3e7 = 999)
//







// end_ntifs

////////////////////////////////////////////////////////////////////////
//                                                                    //
//                          User and Group related SID attributes     //
//                                                                    //
////////////////////////////////////////////////////////////////////////

//
// Group attributes
//





















//
// User attributes
//

// (None yet defined.)




////////////////////////////////////////////////////////////////////////
//                                                                    //
//                         ACL  and  ACE                              //
//                                                                    //
////////////////////////////////////////////////////////////////////////

//
//  Define an ACL and the ACE format.  The structure of an ACL header
//  followed by one or more ACEs.  Pictorally the structure of an ACL header
//  is as follows:
//
//       3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//       1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//      +-------------------------------+---------------+---------------+
//      |            AclSize            |      Sbz1     |  AclRevision  |
//      +-------------------------------+---------------+---------------+
//      |              Sbz2             |           AceCount            |
//      +-------------------------------+-------------------------------+
//
//  The current AclRevision is defined to be ACL_REVISION.
//
//  AclSize is the size, in bytes, allocated for the ACL.  This includes
//  the ACL header, ACES, and remaining free space in the buffer.
//
//  AceCount is the number of ACES in the ACL.
//

// begin_wdm
// This is the *current* ACL revision




// This is the history of ACL revisions.  Add a new one whenever
// ACL_REVISION is updated








typedef struct _ACL {
    BYTE  AclRevision;
    BYTE  Sbz1;
    WORD   AclSize;
    WORD   AceCount;
    WORD   Sbz2;
} ACL;
typedef ACL *PACL;

// end_wdm
// begin_ntifs

//
//  The structure of an ACE is a common ace header followed by ace type
//  specific data.  Pictorally the structure of the common ace header is
//  as follows:
//
//       3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//       1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//      +---------------+-------+-------+---------------+---------------+
//      |            AceSize            |    AceFlags   |     AceType   |
//      +---------------+-------+-------+---------------+---------------+
//
//  AceType denotes the type of the ace, there are some predefined ace
//  types
//
//  AceSize is the size, in bytes, of ace.
//
//  AceFlags are the Ace flags for audit and inheritance, defined shortly.

typedef struct _ACE_HEADER {
    BYTE  AceType;
    BYTE  AceFlags;
    WORD   AceSize;
} ACE_HEADER;
typedef ACE_HEADER *PACE_HEADER;

//
//  The following are the predefined ace types that go into the AceType
//  field of an Ace header.
//


































//
//  The following are the inherit flags that go into the AceFlags field
//  of an Ace header.
//









//  The following are the currently defined ACE flags that go into the
//  AceFlags field of an ACE header.  Each ACE type has its own set of
//  AceFlags.
//
//  SUCCESSFUL_ACCESS_ACE_FLAG - used only with system audit and alarm ACE
//  types to indicate that a message is generated for successful accesses.
//
//  FAILED_ACCESS_ACE_FLAG - used only with system audit and alarm ACE types
//  to indicate that a message is generated for failed accesses.
//

//
//  SYSTEM_AUDIT and SYSTEM_ALARM AceFlags
//
//  These control the signaling of audit and alarms for success or failure.
//





//
//  We'll define the structure of the predefined ACE types.  Pictorally
//  the structure of the predefined ACE's is as follows:
//
//       3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//       1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//      +---------------+-------+-------+---------------+---------------+
//      |    AceFlags   | Resd  |Inherit|    AceSize    |     AceType   |
//      +---------------+-------+-------+---------------+---------------+
//      |                              Mask                             |
//      +---------------------------------------------------------------+
//      |                                                               |
//      +                                                               +
//      |                                                               |
//      +                              Sid                              +
//      |                                                               |
//      +                                                               +
//      |                                                               |
//      +---------------------------------------------------------------+
//
//  Mask is the access mask associated with the ACE.  This is either the
//  access allowed, access denied, audit, or alarm mask.
//
//  Sid is the Sid associated with the ACE.
//

//  The following are the four predefined ACE types.

//  Examine the AceType field in the Header to determine
//  which structure is appropriate to use for casting.


typedef struct _ACCESS_ALLOWED_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} ACCESS_ALLOWED_ACE;

typedef ACCESS_ALLOWED_ACE *PACCESS_ALLOWED_ACE;

typedef struct _ACCESS_DENIED_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} ACCESS_DENIED_ACE;
typedef ACCESS_DENIED_ACE *PACCESS_DENIED_ACE;

typedef struct _SYSTEM_AUDIT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} SYSTEM_AUDIT_ACE;
typedef SYSTEM_AUDIT_ACE *PSYSTEM_AUDIT_ACE;

typedef struct _SYSTEM_ALARM_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} SYSTEM_ALARM_ACE;
typedef SYSTEM_ALARM_ACE *PSYSTEM_ALARM_ACE;

typedef struct _SYSTEM_MANDATORY_LABEL_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
} SYSTEM_MANDATORY_LABEL_ACE, *PSYSTEM_MANDATORY_LABEL_ACE;








// end_ntifs


typedef struct _ACCESS_ALLOWED_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} ACCESS_ALLOWED_OBJECT_ACE, *PACCESS_ALLOWED_OBJECT_ACE;

typedef struct _ACCESS_DENIED_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} ACCESS_DENIED_OBJECT_ACE, *PACCESS_DENIED_OBJECT_ACE;

typedef struct _SYSTEM_AUDIT_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} SYSTEM_AUDIT_OBJECT_ACE, *PSYSTEM_AUDIT_OBJECT_ACE;

typedef struct _SYSTEM_ALARM_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
} SYSTEM_ALARM_OBJECT_ACE, *PSYSTEM_ALARM_OBJECT_ACE;

//
// Callback ace support in post Win2000.
// Resource managers can put their own data after Sidstart + Length of the sid
//

typedef struct _ACCESS_ALLOWED_CALLBACK_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
    // Opaque resouce manager specific data
} ACCESS_ALLOWED_CALLBACK_ACE, *PACCESS_ALLOWED_CALLBACK_ACE;

typedef struct _ACCESS_DENIED_CALLBACK_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
    // Opaque resouce manager specific data
} ACCESS_DENIED_CALLBACK_ACE, *PACCESS_DENIED_CALLBACK_ACE;

typedef struct _SYSTEM_AUDIT_CALLBACK_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
    // Opaque resouce manager specific data
} SYSTEM_AUDIT_CALLBACK_ACE, *PSYSTEM_AUDIT_CALLBACK_ACE;

typedef struct _SYSTEM_ALARM_CALLBACK_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD SidStart;
    // Opaque resouce manager specific data
} SYSTEM_ALARM_CALLBACK_ACE, *PSYSTEM_ALARM_CALLBACK_ACE;

typedef struct _ACCESS_ALLOWED_CALLBACK_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
    // Opaque resouce manager specific data
} ACCESS_ALLOWED_CALLBACK_OBJECT_ACE, *PACCESS_ALLOWED_CALLBACK_OBJECT_ACE;

typedef struct _ACCESS_DENIED_CALLBACK_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
    // Opaque resouce manager specific data
} ACCESS_DENIED_CALLBACK_OBJECT_ACE, *PACCESS_DENIED_CALLBACK_OBJECT_ACE;

typedef struct _SYSTEM_AUDIT_CALLBACK_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
    // Opaque resouce manager specific data
} SYSTEM_AUDIT_CALLBACK_OBJECT_ACE, *PSYSTEM_AUDIT_CALLBACK_OBJECT_ACE;

typedef struct _SYSTEM_ALARM_CALLBACK_OBJECT_ACE {
    ACE_HEADER Header;
    ACCESS_MASK Mask;
    DWORD Flags;
    GUID ObjectType;
    GUID InheritedObjectType;
    DWORD SidStart;
    // Opaque resouce manager specific data
} SYSTEM_ALARM_CALLBACK_OBJECT_ACE, *PSYSTEM_ALARM_CALLBACK_OBJECT_ACE;

//
// Currently define Flags for "OBJECT" ACE types.
//





//
//  The following declarations are used for setting and querying information
//  about and ACL.  First are the various information classes available to
//  the user.
//

typedef enum _ACL_INFORMATION_CLASS {
    AclRevisionInformation = 1,
    AclSizeInformation
} ACL_INFORMATION_CLASS;

//
//  This record is returned/sent if the user is requesting/setting the
//  AclRevisionInformation
//

typedef struct _ACL_REVISION_INFORMATION {
    DWORD AclRevision;
} ACL_REVISION_INFORMATION;
typedef ACL_REVISION_INFORMATION *PACL_REVISION_INFORMATION;

//
//  This record is returned if the user is requesting AclSizeInformation
//

typedef struct _ACL_SIZE_INFORMATION {
    DWORD AceCount;
    DWORD AclBytesInUse;
    DWORD AclBytesFree;
} ACL_SIZE_INFORMATION;
typedef ACL_SIZE_INFORMATION *PACL_SIZE_INFORMATION;


////////////////////////////////////////////////////////////////////////
//                                                                    //
//                             SECURITY_DESCRIPTOR                    //
//                                                                    //
////////////////////////////////////////////////////////////////////////
//
//  Define the Security Descriptor and related data types.
//  This is an opaque data structure.
//

// begin_wdm
//
// Current security descriptor revision value
//




// end_wdm
// begin_ntifs




typedef WORD   SECURITY_DESCRIPTOR_CONTROL, *PSECURITY_DESCRIPTOR_CONTROL;
















//
//  Where:
//
//      SE_OWNER_DEFAULTED - This boolean flag, when set, indicates that the
//          SID pointed to by the Owner field was provided by a
//          defaulting mechanism rather than explicitly provided by the
//          original provider of the security descriptor.  This may
//          affect the treatment of the SID with respect to inheritence
//          of an owner.
//
//      SE_GROUP_DEFAULTED - This boolean flag, when set, indicates that the
//          SID in the Group field was provided by a defaulting mechanism
//          rather than explicitly provided by the original provider of
//          the security descriptor.  This may affect the treatment of
//          the SID with respect to inheritence of a primary group.
//
//      SE_DACL_PRESENT - This boolean flag, when set, indicates that the
//          security descriptor contains a discretionary ACL.  If this
//          flag is set and the Dacl field of the SECURITY_DESCRIPTOR is
//          null, then a null ACL is explicitly being specified.
//
//      SE_DACL_DEFAULTED - This boolean flag, when set, indicates that the
//          ACL pointed to by the Dacl field was provided by a defaulting
//          mechanism rather than explicitly provided by the original
//          provider of the security descriptor.  This may affect the
//          treatment of the ACL with respect to inheritence of an ACL.
//          This flag is ignored if the DaclPresent flag is not set.
//
//      SE_SACL_PRESENT - This boolean flag, when set,  indicates that the
//          security descriptor contains a system ACL pointed to by the
//          Sacl field.  If this flag is set and the Sacl field of the
//          SECURITY_DESCRIPTOR is null, then an empty (but present)
//          ACL is being specified.
//
//      SE_SACL_DEFAULTED - This boolean flag, when set, indicates that the
//          ACL pointed to by the Sacl field was provided by a defaulting
//          mechanism rather than explicitly provided by the original
//          provider of the security descriptor.  This may affect the
//          treatment of the ACL with respect to inheritence of an ACL.
//          This flag is ignored if the SaclPresent flag is not set.
//
//      SE_SELF_RELATIVE - This boolean flag, when set, indicates that the
//          security descriptor is in self-relative form.  In this form,
//          all fields of the security descriptor are contiguous in memory
//          and all pointer fields are expressed as offsets from the
//          beginning of the security descriptor.  This form is useful
//          for treating security descriptors as opaque data structures
//          for transmission in communication protocol or for storage on
//          secondary media.
//
//
//
// Pictorially the structure of a security descriptor is as follows:
//
//       3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//       1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//      +---------------------------------------------------------------+
//      |            Control            |Reserved1 (SBZ)|   Revision    |
//      +---------------------------------------------------------------+
//      |                            Owner                              |
//      +---------------------------------------------------------------+
//      |                            Group                              |
//      +---------------------------------------------------------------+
//      |                            Sacl                               |
//      +---------------------------------------------------------------+
//      |                            Dacl                               |
//      +---------------------------------------------------------------+
//
// In general, this data structure should be treated opaquely to ensure future
// compatibility.
//
//

typedef struct _SECURITY_DESCRIPTOR_RELATIVE {
    BYTE  Revision;
    BYTE  Sbz1;
    SECURITY_DESCRIPTOR_CONTROL Control;
    DWORD Owner;
    DWORD Group;
    DWORD Sacl;
    DWORD Dacl;
    } SECURITY_DESCRIPTOR_RELATIVE, *PISECURITY_DESCRIPTOR_RELATIVE;

typedef struct _SECURITY_DESCRIPTOR {
   BYTE  Revision;
   BYTE  Sbz1;
   SECURITY_DESCRIPTOR_CONTROL Control;
   PSID Owner;
   PSID Group;
   PACL Sacl;
   PACL Dacl;

   } SECURITY_DESCRIPTOR, *PISECURITY_DESCRIPTOR;

// end_ntifs

// Where:
//
//     Revision - Contains the revision level of the security
//         descriptor.  This allows this structure to be passed between
//         systems or stored on disk even though it is expected to
//         change in the future.
//
//     Control - A set of flags which qualify the meaning of the
//         security descriptor or individual fields of the security
//         descriptor.
//
//     Owner - is a pointer to an SID representing an object's owner.
//         If this field is null, then no owner SID is present in the
//         security descriptor.  If the security descriptor is in
//         self-relative form, then this field contains an offset to
//         the SID, rather than a pointer.
//
//     Group - is a pointer to an SID representing an object's primary
//         group.  If this field is null, then no primary group SID is
//         present in the security descriptor.  If the security descriptor
//         is in self-relative form, then this field contains an offset to
//         the SID, rather than a pointer.
//
//     Sacl - is a pointer to a system ACL.  This field value is only
//         valid if the DaclPresent control flag is set.  If the
//         SaclPresent flag is set and this field is null, then a null
//         ACL  is specified.  If the security descriptor is in
//         self-relative form, then this field contains an offset to
//         the ACL, rather than a pointer.
//
//     Dacl - is a pointer to a discretionary ACL.  This field value is
//         only valid if the DaclPresent control flag is set.  If the
//         DaclPresent flag is set and this field is null, then a null
//         ACL (unconditionally granting access) is specified.  If the
//         security descriptor is in self-relative form, then this field
//         contains an offset to the ACL, rather than a pointer.
//




////////////////////////////////////////////////////////////////////////
//                                                                    //
//               Object Type list for AccessCheckByType               //
//                                                                    //
////////////////////////////////////////////////////////////////////////

typedef struct _OBJECT_TYPE_LIST {
    WORD   Level;
    WORD   Sbz;
    GUID *ObjectType;
} OBJECT_TYPE_LIST, *POBJECT_TYPE_LIST;

//
// DS values for Level
//







//
// Parameters to NtAccessCheckByTypeAndAditAlarm
//

typedef enum _AUDIT_EVENT_TYPE {
    AuditEventObjectAccess,
    AuditEventDirectoryServiceAccess
} AUDIT_EVENT_TYPE, *PAUDIT_EVENT_TYPE;



//
// DS values for Source and ObjectTypeName
//







////////////////////////////////////////////////////////////////////////
//                                                                    //
//               Privilege Related Data Structures                    //
//                                                                    //
////////////////////////////////////////////////////////////////////////

// end_ntifs
// begin_wdm
//
// Privilege attributes
//












//
// Privilege Set Control flags
//



//
//  Privilege Set - This is defined for a privilege set of one.
//                  If more than one privilege is needed, then this structure
//                  will need to be allocated with more space.
//
//  Note: don't change this structure without fixing the INITIAL_PRIVILEGE_SET
//  structure (defined in se.h)
//

typedef struct _PRIVILEGE_SET {
    DWORD PrivilegeCount;
    DWORD Control;
    LUID_AND_ATTRIBUTES Privilege[1];
    } PRIVILEGE_SET, * PPRIVILEGE_SET;


////////////////////////////////////////////////////////////////////////
//                                                                    //
//               NT Defined Privileges                                //
//                                                                    //
////////////////////////////////////////////////////////////////////////







































////////////////////////////////////////////////////////////////////
//                                                                //
//           Security Quality Of Service                          //
//                                                                //
//                                                                //
////////////////////////////////////////////////////////////////////

// begin_wdm
//
// Impersonation Level
//
// Impersonation level is represented by a pair of bits in Windows.
// If a new impersonation level is added or lowest value is changed from
// 0 to something else, fix the Windows CreateFile call.
//

typedef enum _SECURITY_IMPERSONATION_LEVEL {
    SecurityAnonymous,
    SecurityIdentification,
    SecurityImpersonation,
    SecurityDelegation
    } SECURITY_IMPERSONATION_LEVEL, * PSECURITY_IMPERSONATION_LEVEL;






////////////////////////////////////////////////////////////////////
//                                                                //
//           Token Object Definitions                             //
//                                                                //
//                                                                //
////////////////////////////////////////////////////////////////////


//
// Token Specific Access Rights.
//


























#line 6881 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"












//
//
// Token Types
//

typedef enum _TOKEN_TYPE {
    TokenPrimary = 1,
    TokenImpersonation
    } TOKEN_TYPE;
typedef TOKEN_TYPE *PTOKEN_TYPE;

//
// Token elevation values describe the relative strength of a given token.
// A full token is a token with all groups and privileges to which the principal
// is authorized.  A limited token is one with some groups or privileges removed.
//

typedef enum _TOKEN_ELEVATION_TYPE {
    TokenElevationTypeDefault = 1,
    TokenElevationTypeFull,
    TokenElevationTypeLimited,
} TOKEN_ELEVATION_TYPE, *PTOKEN_ELEVATION_TYPE;

//
// Token Information Classes.
//


typedef enum _TOKEN_INFORMATION_CLASS {
    TokenUser = 1,
    TokenGroups,
    TokenPrivileges,
    TokenOwner,
    TokenPrimaryGroup,
    TokenDefaultDacl,
    TokenSource,
    TokenType,
    TokenImpersonationLevel,
    TokenStatistics,
    TokenRestrictedSids,
    TokenSessionId,
    TokenGroupsAndPrivileges,
    TokenSessionReference,
    TokenSandBoxInert,
    TokenAuditPolicy,
    TokenOrigin,
    TokenElevationType,
    TokenLinkedToken,
    TokenElevation,
    TokenHasRestrictions,
    TokenAccessInformation,
    TokenVirtualizationAllowed,
    TokenVirtualizationEnabled,
    TokenIntegrityLevel,
    TokenUIAccess,
    TokenMandatoryPolicy,
    TokenLogonSid,
    MaxTokenInfoClass  // MaxTokenInfoClass should always be the last enum
} TOKEN_INFORMATION_CLASS, *PTOKEN_INFORMATION_CLASS;

//
// Token information class structures
//


typedef struct _TOKEN_USER {
    SID_AND_ATTRIBUTES User;
} TOKEN_USER, *PTOKEN_USER;

typedef struct _TOKEN_GROUPS {
    DWORD GroupCount;
    SID_AND_ATTRIBUTES Groups[1];
} TOKEN_GROUPS, *PTOKEN_GROUPS;


typedef struct _TOKEN_PRIVILEGES {
    DWORD PrivilegeCount;
    LUID_AND_ATTRIBUTES Privileges[1];
} TOKEN_PRIVILEGES, *PTOKEN_PRIVILEGES;


typedef struct _TOKEN_OWNER {
    PSID Owner;
} TOKEN_OWNER, *PTOKEN_OWNER;


typedef struct _TOKEN_PRIMARY_GROUP {
    PSID PrimaryGroup;
} TOKEN_PRIMARY_GROUP, *PTOKEN_PRIMARY_GROUP;


typedef struct _TOKEN_DEFAULT_DACL {
    PACL DefaultDacl;
} TOKEN_DEFAULT_DACL, *PTOKEN_DEFAULT_DACL;

typedef struct _TOKEN_GROUPS_AND_PRIVILEGES {
    DWORD SidCount;
    DWORD SidLength;
    PSID_AND_ATTRIBUTES Sids;
    DWORD RestrictedSidCount;
    DWORD RestrictedSidLength;
    PSID_AND_ATTRIBUTES RestrictedSids;
    DWORD PrivilegeCount;
    DWORD PrivilegeLength;
    PLUID_AND_ATTRIBUTES Privileges;
    LUID AuthenticationId;
} TOKEN_GROUPS_AND_PRIVILEGES, *PTOKEN_GROUPS_AND_PRIVILEGES;

typedef struct _TOKEN_LINKED_TOKEN {
    HANDLE LinkedToken;
} TOKEN_LINKED_TOKEN, *PTOKEN_LINKED_TOKEN;

typedef struct _TOKEN_ELEVATION {
    DWORD TokenIsElevated;
} TOKEN_ELEVATION, *PTOKEN_ELEVATION;

typedef struct _TOKEN_MANDATORY_LABEL {
    SID_AND_ATTRIBUTES Label;
} TOKEN_MANDATORY_LABEL, *PTOKEN_MANDATORY_LABEL;








typedef struct _TOKEN_MANDATORY_POLICY {
    DWORD Policy;
} TOKEN_MANDATORY_POLICY, *PTOKEN_MANDATORY_POLICY;

typedef struct _TOKEN_ACCESS_INFORMATION {
    PSID_AND_ATTRIBUTES_HASH SidHash;
    PSID_AND_ATTRIBUTES_HASH RestrictedSidHash;
    PTOKEN_PRIVILEGES Privileges;
    LUID AuthenticationId;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    TOKEN_MANDATORY_POLICY MandatoryPolicy;
    DWORD Flags;
} TOKEN_ACCESS_INFORMATION, *PTOKEN_ACCESS_INFORMATION;

//
// Valid bits for each TOKEN_AUDIT_POLICY policy mask field.
//



typedef struct _TOKEN_AUDIT_POLICY {
    BYTE  PerUserPolicy[(((50)) >> 1) + 1];
} TOKEN_AUDIT_POLICY, *PTOKEN_AUDIT_POLICY;



typedef struct _TOKEN_SOURCE {
    CHAR SourceName[8];
    LUID SourceIdentifier;
} TOKEN_SOURCE, *PTOKEN_SOURCE;


typedef struct _TOKEN_STATISTICS {
    LUID TokenId;
    LUID AuthenticationId;
    LARGE_INTEGER ExpirationTime;
    TOKEN_TYPE TokenType;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    DWORD DynamicCharged;
    DWORD DynamicAvailable;
    DWORD GroupCount;
    DWORD PrivilegeCount;
    LUID ModifiedId;
} TOKEN_STATISTICS, *PTOKEN_STATISTICS;



typedef struct _TOKEN_CONTROL {
    LUID TokenId;
    LUID AuthenticationId;
    LUID ModifiedId;
    TOKEN_SOURCE TokenSource;
} TOKEN_CONTROL, *PTOKEN_CONTROL;

typedef struct _TOKEN_ORIGIN {
    LUID OriginatingLogonSession ;
} TOKEN_ORIGIN, * PTOKEN_ORIGIN ;

typedef enum _MANDATORY_LEVEL {
    MandatoryLevelUntrusted = 0,
    MandatoryLevelLow,
    MandatoryLevelMedium,
    MandatoryLevelHigh,
    MandatoryLevelSystem,
    MandatoryLevelSecureProcess,
    MandatoryLevelCount
} MANDATORY_LEVEL, *PMANDATORY_LEVEL;

//
// Security Tracking Mode
//




typedef BOOLEAN SECURITY_CONTEXT_TRACKING_MODE,
                    * PSECURITY_CONTEXT_TRACKING_MODE;



//
// Quality Of Service
//

typedef struct _SECURITY_QUALITY_OF_SERVICE {
    DWORD Length;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    SECURITY_CONTEXT_TRACKING_MODE ContextTrackingMode;
    BOOLEAN EffectiveOnly;
    } SECURITY_QUALITY_OF_SERVICE, * PSECURITY_QUALITY_OF_SERVICE;


//
// Used to represent information related to a thread impersonation
//

typedef struct _SE_IMPERSONATION_STATE {
    PACCESS_TOKEN Token;
    BOOLEAN CopyOnOpen;
    BOOLEAN EffectiveOnly;
    SECURITY_IMPERSONATION_LEVEL Level;
} SE_IMPERSONATION_STATE, *PSE_IMPERSONATION_STATE;






typedef DWORD SECURITY_INFORMATION, *PSECURITY_INFORMATION;































#line 7162 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#line 7168 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 7172 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"










// begin_wdm








#line 7192 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"








typedef struct _JOB_SET_ARRAY {
    HANDLE JobHandle;   // Handle to job object to insert
    DWORD MemberLevel;  // Level of this job in the set. Must be > 0. Can be sparse.
    DWORD Flags;        // Unused. Must be zero
} JOB_SET_ARRAY, *PJOB_SET_ARRAY;




typedef struct _NT_TIB {
    struct _EXCEPTION_REGISTRATION_RECORD *ExceptionList;
    PVOID StackBase;
    PVOID StackLimit;
    PVOID SubSystemTib;
    union {
        PVOID FiberData;
        DWORD Version;
    };
    PVOID ArbitraryUserPointer;
    struct _NT_TIB *Self;
} NT_TIB;
typedef NT_TIB *PNT_TIB;

//
// 32 and 64 bit specific version for wow64 and the debugger
//
typedef struct _NT_TIB32 {
    DWORD ExceptionList;
    DWORD StackBase;
    DWORD StackLimit;
    DWORD SubSystemTib;
    union {
        DWORD FiberData;
        DWORD Version;
    };
    DWORD ArbitraryUserPointer;
    DWORD Self;
} NT_TIB32, *PNT_TIB32;

typedef struct _NT_TIB64 {
    DWORD64 ExceptionList;
    DWORD64 StackBase;
    DWORD64 StackLimit;
    DWORD64 SubSystemTib;
    union {
        DWORD64 FiberData;
        DWORD Version;
    };
    DWORD64 ArbitraryUserPointer;
    DWORD64 Self;
} NT_TIB64, *PNT_TIB64;









typedef struct _QUOTA_LIMITS {
    SIZE_T PagedPoolLimit;
    SIZE_T NonPagedPoolLimit;
    SIZE_T MinimumWorkingSetSize;
    SIZE_T MaximumWorkingSetSize;
    SIZE_T PagefileLimit;
    LARGE_INTEGER TimeLimit;
} QUOTA_LIMITS, *PQUOTA_LIMITS;










typedef enum _PS_RATE_PHASE {
    PsRateOneSecond = 0,
    PsRateTwoSecond,
    PsRateThreeSecond,
    PsRateMaxPhase
} PS_RATE_PHASE;

typedef union _RATE_QUOTA_LIMIT {
    DWORD RateData;
    struct {
        DWORD RatePhase     : 4;
        DWORD RatePercent   : 28;
    };
} RATE_QUOTA_LIMIT, *PRATE_QUOTA_LIMIT;



#line 7296 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _QUOTA_LIMITS_EX {
    SIZE_T PagedPoolLimit;
    SIZE_T NonPagedPoolLimit;
    SIZE_T MinimumWorkingSetSize;
    SIZE_T MaximumWorkingSetSize;
    SIZE_T PagefileLimit;               // Limit expressed in pages
    LARGE_INTEGER TimeLimit;
    SIZE_T WorkingSetLimit;             // Limit expressed in pages
    SIZE_T Reserved2;
    SIZE_T Reserved3;
    SIZE_T Reserved4;
    DWORD  Flags;
    RATE_QUOTA_LIMIT CpuRateLimit;
} QUOTA_LIMITS_EX, *PQUOTA_LIMITS_EX;

typedef struct _IO_COUNTERS {
    ULONGLONG  ReadOperationCount;
    ULONGLONG  WriteOperationCount;
    ULONGLONG  OtherOperationCount;
    ULONGLONG ReadTransferCount;
    ULONGLONG WriteTransferCount;
    ULONGLONG OtherTransferCount;
} IO_COUNTERS;
typedef IO_COUNTERS *PIO_COUNTERS;


typedef struct _JOBOBJECT_BASIC_ACCOUNTING_INFORMATION {
    LARGE_INTEGER TotalUserTime;
    LARGE_INTEGER TotalKernelTime;
    LARGE_INTEGER ThisPeriodTotalUserTime;
    LARGE_INTEGER ThisPeriodTotalKernelTime;
    DWORD TotalPageFaultCount;
    DWORD TotalProcesses;
    DWORD ActiveProcesses;
    DWORD TotalTerminatedProcesses;
} JOBOBJECT_BASIC_ACCOUNTING_INFORMATION, *PJOBOBJECT_BASIC_ACCOUNTING_INFORMATION;

typedef struct _JOBOBJECT_BASIC_LIMIT_INFORMATION {
    LARGE_INTEGER PerProcessUserTimeLimit;
    LARGE_INTEGER PerJobUserTimeLimit;
    DWORD LimitFlags;
    SIZE_T MinimumWorkingSetSize;
    SIZE_T MaximumWorkingSetSize;
    DWORD ActiveProcessLimit;
    ULONG_PTR Affinity;
    DWORD PriorityClass;
    DWORD SchedulingClass;
} JOBOBJECT_BASIC_LIMIT_INFORMATION, *PJOBOBJECT_BASIC_LIMIT_INFORMATION;

typedef struct _JOBOBJECT_EXTENDED_LIMIT_INFORMATION {
    JOBOBJECT_BASIC_LIMIT_INFORMATION BasicLimitInformation;
    IO_COUNTERS IoInfo;
    SIZE_T ProcessMemoryLimit;
    SIZE_T JobMemoryLimit;
    SIZE_T PeakProcessMemoryUsed;
    SIZE_T PeakJobMemoryUsed;
} JOBOBJECT_EXTENDED_LIMIT_INFORMATION, *PJOBOBJECT_EXTENDED_LIMIT_INFORMATION;

typedef struct _JOBOBJECT_BASIC_PROCESS_ID_LIST {
    DWORD NumberOfAssignedProcesses;
    DWORD NumberOfProcessIdsInList;
    ULONG_PTR ProcessIdList[1];
} JOBOBJECT_BASIC_PROCESS_ID_LIST, *PJOBOBJECT_BASIC_PROCESS_ID_LIST;

typedef struct _JOBOBJECT_BASIC_UI_RESTRICTIONS {
    DWORD UIRestrictionsClass;
} JOBOBJECT_BASIC_UI_RESTRICTIONS, *PJOBOBJECT_BASIC_UI_RESTRICTIONS;

typedef struct _JOBOBJECT_SECURITY_LIMIT_INFORMATION {
    DWORD SecurityLimitFlags ;
    HANDLE JobToken ;
    PTOKEN_GROUPS SidsToDisable ;
    PTOKEN_PRIVILEGES PrivilegesToDelete ;
    PTOKEN_GROUPS RestrictedSids ;
} JOBOBJECT_SECURITY_LIMIT_INFORMATION, *PJOBOBJECT_SECURITY_LIMIT_INFORMATION ;

typedef struct _JOBOBJECT_END_OF_JOB_TIME_INFORMATION {
    DWORD EndOfJobTimeAction;
} JOBOBJECT_END_OF_JOB_TIME_INFORMATION, *PJOBOBJECT_END_OF_JOB_TIME_INFORMATION;

typedef struct _JOBOBJECT_ASSOCIATE_COMPLETION_PORT {
    PVOID CompletionKey;
    HANDLE CompletionPort;
} JOBOBJECT_ASSOCIATE_COMPLETION_PORT, *PJOBOBJECT_ASSOCIATE_COMPLETION_PORT;

typedef struct _JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION {
    JOBOBJECT_BASIC_ACCOUNTING_INFORMATION BasicInfo;
    IO_COUNTERS IoInfo;
} JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION, *PJOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION;

typedef struct _JOBOBJECT_JOBSET_INFORMATION {
    DWORD MemberLevel;
} JOBOBJECT_JOBSET_INFORMATION, *PJOBOBJECT_JOBSET_INFORMATION;




//
// Completion Port Messages for job objects
//
// These values are returned via the lpNumberOfBytesTransferred parameter
//











//
// Basic Limits
//









//
// Extended Limits
//




















//
// UI restrictions for jobs
//























typedef enum _JOBOBJECTINFOCLASS {
    JobObjectBasicAccountingInformation = 1,
    JobObjectBasicLimitInformation,
    JobObjectBasicProcessIdList,
    JobObjectBasicUIRestrictions,
    JobObjectSecurityLimitInformation,
    JobObjectEndOfJobTimeInformation,
    JobObjectAssociateCompletionPortInformation,
    JobObjectBasicAndIoAccountingInformation,
    JobObjectExtendedLimitInformation,
    JobObjectJobSetInformation,
    MaxJobObjectInfoClass
    } JOBOBJECTINFOCLASS;
//








//
// Timer Specific Access Rights.
//











typedef enum _LOGICAL_PROCESSOR_RELATIONSHIP {
    RelationProcessorCore,
    RelationNumaNode,
    RelationCache,
    RelationProcessorPackage
} LOGICAL_PROCESSOR_RELATIONSHIP;



typedef enum _PROCESSOR_CACHE_TYPE {
    CacheUnified,
    CacheInstruction,
    CacheData,
    CacheTrace
} PROCESSOR_CACHE_TYPE;



typedef struct _CACHE_DESCRIPTOR {
    BYTE   Level;
    BYTE   Associativity;
    WORD   LineSize;
    DWORD  Size;
    PROCESSOR_CACHE_TYPE Type;
} CACHE_DESCRIPTOR, *PCACHE_DESCRIPTOR;

typedef struct _SYSTEM_LOGICAL_PROCESSOR_INFORMATION {
    ULONG_PTR   ProcessorMask;
    LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
    union {
        struct {
            BYTE  Flags;
        } ProcessorCore;
        struct {
            DWORD NodeNumber;
        } NumaNode;
        CACHE_DESCRIPTOR Cache;
        ULONGLONG  Reserved[2];
    };
} SYSTEM_LOGICAL_PROCESSOR_INFORMATION, *PSYSTEM_LOGICAL_PROCESSOR_INFORMATION;


























































typedef struct _MEMORY_BASIC_INFORMATION {
    PVOID BaseAddress;
    PVOID AllocationBase;
    DWORD AllocationProtect;
    SIZE_T RegionSize;
    DWORD State;
    DWORD Protect;
    DWORD Type;
} MEMORY_BASIC_INFORMATION, *PMEMORY_BASIC_INFORMATION;

typedef struct _MEMORY_BASIC_INFORMATION32 {
    DWORD BaseAddress;
    DWORD AllocationBase;
    DWORD AllocationProtect;
    DWORD RegionSize;
    DWORD State;
    DWORD Protect;
    DWORD Type;
} MEMORY_BASIC_INFORMATION32, *PMEMORY_BASIC_INFORMATION32;

typedef struct __declspec(align(16)) _MEMORY_BASIC_INFORMATION64 {
    ULONGLONG BaseAddress;
    ULONGLONG AllocationBase;
    DWORD     AllocationProtect;
    DWORD     __alignment1;
    ULONGLONG RegionSize;
    DWORD     State;
    DWORD     Protect;
    DWORD     Type;
    DWORD     __alignment2;
} MEMORY_BASIC_INFORMATION64, *PMEMORY_BASIC_INFORMATION64;

























































//
// Define access rights to files and directories
//

//
// The FILE_READ_DATA and FILE_WRITE_DATA constants are also defined in
// devioctl.h as FILE_READ_ACCESS and FILE_WRITE_ACCESS. The values for these
// constants *MUST* always be in sync.
// The values are redefined in devioctl.h because they must be available to
// both DOS and NT.
//

































































































//
// Define the file notification information structure
//

typedef struct _FILE_NOTIFY_INFORMATION {
    DWORD NextEntryOffset;
    DWORD Action;
    DWORD FileNameLength;
    WCHAR FileName[1];
} FILE_NOTIFY_INFORMATION, *PFILE_NOTIFY_INFORMATION;


//
// Define segement buffer structure for scatter/gather read/write.
//

typedef union _FILE_SEGMENT_ELEMENT {
    PVOID64 Buffer;
    ULONGLONG Alignment;
}FILE_SEGMENT_ELEMENT, *PFILE_SEGMENT_ELEMENT;

//
// The reparse GUID structure is used by all 3rd party layered drivers to
// store data in a reparse point. For non-Microsoft tags, The GUID field
// cannot be GUID_NULL.
// The constraints on reparse tags are defined below.
// Microsoft tags can also be used with this format of the reparse point buffer.
//

typedef struct _REPARSE_GUID_DATA_BUFFER {
    DWORD  ReparseTag;
    WORD   ReparseDataLength;
    WORD   Reserved;
    GUID   ReparseGuid;
    struct {
        BYTE   DataBuffer[1];
    } GenericReparseBuffer;
} REPARSE_GUID_DATA_BUFFER, *PREPARSE_GUID_DATA_BUFFER;





//
// Maximum allowed size of the reparse data.
//



//
// Predefined reparse tags.
// These tags need to avoid conflicting with IO_REMOUNT defined in ntos\inc\io.h
//




//
// The value of the following constant needs to satisfy the following conditions:
//  (1) Be at least as large as the largest of the reserved tags.
//  (2) Be strictly smaller than all the tags in use.
//



//
// The reparse tags are a DWORD. The 32 bits are laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +-+-+-+-+-----------------------+-------------------------------+
//  |M|R|N|R|     Reserved bits     |       Reparse Tag Value       |
//  +-+-+-+-+-----------------------+-------------------------------+
//
// M is the Microsoft bit. When set to 1, it denotes a tag owned by Microsoft.
//   All ISVs must use a tag with a 0 in this position.
//   Note: If a Microsoft tag is used by non-Microsoft software, the
//   behavior is not defined.
//
// R is reserved.  Must be zero for non-Microsoft tags.
//
// N is name surrogate. When set to 1, the file represents another named
//   entity in the system.
//
// The M and N bits are OR-able.
// The following macros check for the M and N bit values:
//

//
// Macro to determine whether a reparse point tag corresponds to a tag
// owned by Microsoft.
//





//
// Macro to determine whether a reparse point tag is a name surrogate
//












//
// I/O Completion Specific Access Rights.
//




//
// Object Manager Symbolic Link Specific Access Rights.
//




//
// =========================================
// Define GUIDs which represent well-known power schemes
// =========================================
//

//
// Maximum Power Savings - indicates that very aggressive power savings measures will be used to help
//                         stretch battery life.
//
// {a1841308-3541-4fab-bc81-f71556f20b4a}
//
extern "C" const GUID  GUID_MAX_POWER_SAVINGS;

//
// No Power Savings - indicates that almost no power savings measures will be used.
//
// {8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}
//
extern "C" const GUID  GUID_MIN_POWER_SAVINGS;

//
// Typical Power Savings - indicates that fairly aggressive power savings measures will be used.
//
// {381b4222-f694-41f0-9685-ff5bb260df2e}
//
extern "C" const GUID  GUID_TYPICAL_POWER_SAVINGS;

//
// This is a special GUID that represents "no subgroup" of settings.  That is, it indicates
// that settings that are in the root of the power policy hierarchy as opposed to settings
// that are buried under a subgroup of settings.  This should be used when querying for
// power settings that may not fall into a subgroup.
//
extern "C" const GUID  NO_SUBGROUP_GUID;

//
// This is a special GUID that represents "every power scheme".  That is, it indicates
// that any write to this power scheme should be reflected to every scheme present.
// This allows users to write a single setting once and have it apply to all schemes.  They
// can then apply custom settings to specific power schemes that they care about.
//
extern "C" const GUID  ALL_POWERSCHEMES_GUID;

//
// This is a special GUID that represents a 'personality' that each power scheme will have.
// In other words, each power scheme will have this key indicating "I'm most like *this* base
// power scheme."  This individual setting will have one of three settings:
// GUID_MAX_POWER_SAVINGS
// GUID_MIN_POWER_SAVINGS
// GUID_TYPICAL_POWER_SAVINGS
//
// This allows several features:
// 1. Drivers and applications can register for notification of this GUID.  So when this power
//    scheme is activiated, this GUID's setting will be sent across the system and drivers/applications
//    can see "GUID_MAX_POWER_SAVINGS" which will tell them in a generic fashion "get real aggressive
//    about conserving power".
// 2. UserB may install a driver or application which creates power settings, and UserB may modify
//    those power settings.  Now UserA logs in.  How does he see those settings?  They simply don't
//    exist in his private power key.  Well they do exist over in the system power key.  When we
//    enumerate all the power settings in this system power key and don't find a corresponding entry
//    in the user's private power key, then we can go look at this "personality" key in the users
//    power scheme.  We can then go get a default value for the power setting, depending on which
//    "personality" power scheme is being operated on.  Here's an example:
//    A. UserB installs an application that creates a power setting Seetting1
//    B. UserB changes Setting1 to have a value of 50 because that's one of the possible settings
//       available for setting1.
//    C. UserB logs out
//    D. UserA logs in and his active power scheme is some custom scheme that was derived from
//       the GUID_TYPICAL_POWER_SAVINGS.  But remember that UserA has no setting1 in his 
//       private power key.
//    E. When activating UserA's selected power scheme, all power settings in the system power key will
//       be enumerated (including Setting1).
//    F. The power manager will see that UserA has no Setting1 power setting in his private power scheme.
//    G. The power manager will query UserA's power scheme for its personality and retrieve
//       GUID_TYPICAL_POWER_SAVINGS.
//    H. The power manager then looks in Setting1 in the system power key and looks in its set of default
//       values for the corresponding value for GUID_TYPICAL_POWER_SAVINGS power schemes.
//    I. This derived power setting is applied.
extern "C" const GUID  GUID_POWERSCHEME_PERSONALITY;

//
// Define a special GUID which will be used to define the active power scheme.
// User will register for this power setting GUID, and when the active power
// scheme changes, they'll get a callback where the payload is the GUID
// representing the active powerscheme.
// ( 31F9F286-5084-42FE-B720-2B0264993763 }
//
extern "C" const GUID  GUID_ACTIVE_POWERSCHEME;

//
// =========================================
// Define GUIDs which represent well-known power settings
// =========================================
//

// Video settings
// --------------
//
// Specifies the subgroup which will contain all of the video
// settings for a single policy.
//
extern "C" const GUID  GUID_VIDEO_SUBGROUP;

//
// Specifies (in seconds) how long we wait after the last user input has been
// recieved before we power off the video.
//
extern "C" const GUID  GUID_VIDEO_POWERDOWN_TIMEOUT;

//
// Specifies if the operating system should use adaptive timers (based on
// previous behavior) to power down the video,
//
extern "C" const GUID  GUID_VIDEO_ADAPTIVE_POWERDOWN;

//
// Specifies if the monitor is currently being powered or not.
// 02731015-4510-4526-99E6-E5A17EBD1AEA
//
extern "C" const GUID  GUID_MONITOR_POWER_ON;



// Harddisk settings
// -----------------
//
// Specifies the subgroup which will contain all of the harddisk
// settings for a single policy.
//
extern "C" const GUID  GUID_DISK_SUBGROUP;

//
// Specifies (in seconds) how long we wait after the last disk access
// before we power off the disk.
//
extern "C" const GUID  GUID_DISK_POWERDOWN_TIMEOUT;

//
// Specifies if the operating system should use adaptive timers (based on
// previous behavior) to power down the disk,
//
extern "C" const GUID  GUID_DISK_ADAPTIVE_POWERDOWN;




// System sleep settings
// ---------------------
//
// Specifies the subgroup which will contain all of the sleep
// settings for a single policy.
// { 238C9FA8-0AAD-41ED-83F4-97BE242C8F20 }
//
extern "C" const GUID  GUID_SLEEP_SUBGROUP;

//
// Specifies an idle treshold percentage (0-100). The system must be this idle
// over a period of time in order to idle to sleep.
//
extern "C" const GUID  GUID_SLEEP_IDLE_THRESHOLD;
                                  
//
// Specifies (in seconds) how long we wait after the system is deemed
// "idle" before moving to standby (S1, S2 or S3).
//
extern "C" const GUID  GUID_STANDBY_TIMEOUT;

//
// Specifies (in seconds) how long we wait after the system is deemed
// "idle" before moving to hibernate (S4).
//
extern "C" const GUID  GUID_HIBERNATE_TIMEOUT;

//
// Specifies whether or not Fast S4 should be enabled if the system supports it
// 94AC6D29-73CE-41A6-809F-6363BA21B47E
//
extern "C" const GUID  GUID_HIBERNATE_FASTS4_POLICY;

//
// Define a GUID for controlling the criticality of sleep state transitions.
// Critical sleep transitions do not query applications, services or drivers
// before transitioning the platform to a sleep state.
//
// {B7A27025-E569-46c2-A504-2B96CAD225A1}
//
extern "C" const GUID  GUID_CRITICAL_POWER_TRANSITION;

//
// Specifies if the system is entering or exiting 'away mode'.
// 98A7F580-01F7-48AA-9C0F-44352C29E5C0
//
extern "C" const GUID  GUID_SYSTEM_AWAYMODE;

// Specify whether away mode is allowed 
//
// {25DFA149-5DD1-4736-B5AB-E8A37B5B8187}
//
extern "C" const GUID  GUID_ALLOW_AWAYMODE;

//
// Defines a guid for enabling/disabling standby (S1-S3) states. This does not
// affect hibernation (S4).
//
// {abfc2519-3608-4c2a-94ea-171b0ed546ab}
//
extern "C" const GUID  GUID_ALLOW_STANDBY_STATES;

//
// Defines a guid for enabling/disabling the ability to wake via RTC.
//
// {BD3B718A-0680-4D9D-8AB2-E1D2B4AC806D}
//
extern "C" const GUID  GUID_ALLOW_RTC_WAKE;

// System button actions
// ---------------------
//
//
// Specifies the subgroup which will contain all of the system button
// settings for a single policy.
//
extern "C" const GUID  GUID_SYSTEM_BUTTON_SUBGROUP;

// Specifies (in a POWER_ACTION_POLICY structure) the appropriate action to
// take when the system power button is pressed.
//
extern "C" const GUID  GUID_POWERBUTTON_ACTION;
extern "C" const GUID  GUID_POWERBUTTON_ACTION_FLAGS;

//
// Specifies (in a POWER_ACTION_POLICY structure) the appropriate action to
// take when the system sleep button is pressed.
//
extern "C" const GUID  GUID_SLEEPBUTTON_ACTION;
extern "C" const GUID  GUID_SLEEPBUTTON_ACTION_FLAGS;

//
// Specifies (in a POWER_ACTION_POLICY structure) the appropriate action to
// take when the system sleep button is pressed.
// { A7066653-8D6C-40A8-910E-A1F54B84C7E5 }
//
extern "C" const GUID  GUID_USERINTERFACEBUTTON_ACTION;

//
// Specifies (in a POWER_ACTION_POLICY structure) the appropriate action to
// take when the system lid is closed.
//
extern "C" const GUID  GUID_LIDCLOSE_ACTION;
extern "C" const GUID  GUID_LIDCLOSE_ACTION_FLAGS;
extern "C" const GUID  GUID_LIDOPEN_POWERSTATE;


// Battery Discharge Settings
// --------------------------
//
// Specifies the subgroup which will contain all of the battery discharge
// settings for a single policy.
//
extern "C" const GUID  GUID_BATTERY_SUBGROUP;

//
// 4 battery discharge alarm settings.
//
// GUID_BATTERY_DISCHARGE_ACTION_x - This is the action to take.  It is a value
//                                   of type POWER_ACTION
// GUID_BATTERY_DISCHARGE_LEVEL_x  - This is the battery level (%)
// GUID_BATTERY_DISCHARGE_FLAGS_x  - Flags defined below:
//                                   POWER_ACTION_POLICY->EventCode flags
//                                   BATTERY_DISCHARGE_FLAGS_EVENTCODE_MASK
//                                   BATTERY_DISCHARGE_FLAGS_ENABLE
extern "C" const GUID  GUID_BATTERY_DISCHARGE_ACTION_0;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_LEVEL_0;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_FLAGS_0;

extern "C" const GUID  GUID_BATTERY_DISCHARGE_ACTION_1;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_LEVEL_1;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_FLAGS_1;

extern "C" const GUID  GUID_BATTERY_DISCHARGE_ACTION_2;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_LEVEL_2;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_FLAGS_2;

extern "C" const GUID  GUID_BATTERY_DISCHARGE_ACTION_3;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_LEVEL_3;
extern "C" const GUID  GUID_BATTERY_DISCHARGE_FLAGS_3;

// Processor power settings
// ------------------------
//

// Specifies the subgroup which will contain all of the processor
// settings for a single policy.
//
extern "C" const GUID  GUID_PROCESSOR_SETTINGS_SUBGROUP;


extern "C" const GUID  GUID_PROCESSOR_THROTTLE_POLICY;

//
// Specifies a percentage (between 0 and 100) that the processor frequency
// should never go above.  For example, if this value is set to 80, then
// the processor frequency will never be throttled above 80 percent of its 
// maximum frequency by the system.
// 
extern "C" const GUID  GUID_PROCESSOR_THROTTLE_MAXIMUM;

//
// Specifies a percentage (between 0 and 100) that the processor frequency
// should not drop below.  For example, if this value is set to 50, then the
// processor frequency will never be throttled below 50 percent of its
// maximum frequency by the system.
//
extern "C" const GUID  GUID_PROCESSOR_THROTTLE_MINIMUM;

//
// Specifies processor power settings for CState policy data
// {68F262A7-F621-4069-B9A5-4874169BE23C}
//
extern "C" const GUID  GUID_PROCESSOR_IDLESTATE_POLICY;

//
// Specifies processor power settings for PerfState policy data
// {BBDC3814-18E9-4463-8A55-D197327C45C0}
//
extern "C" const GUID  GUID_PROCESSOR_PERFSTATE_POLICY;

//
// Specifies active vs passive cooling.  Although not directly related to
// processor settings, it is the processor that gets throttled if we're doing
// passive cooling, so it is fairly strongly related.
// {94D3A615-A899-4AC5-AE2B-E4D8F634367F}
//
extern "C" const GUID  GUID_SYSTEM_COOLING_POLICY;



// Lock Console on Wake
// --------------------
//

// Specifies the behavior of the system when we wake from standby or
// hibernate.  If this is set, then we will cause the console to lock
// after we resume.
//
extern "C" const GUID  GUID_LOCK_CONSOLE_ON_WAKE;



// AC/DC power source
// ------------------
//

// Specifies the power source for the system.  consumers may register for
// notification when the power source changes and will be notified with
// one of 3 values:
// 0 - Indicates the system is being powered by an AC power source.
// 1 - Indicates the system is being powered by a DC power source.
// 2 - Indicates the system is being powered by a short-term DC power
//     source.  For example, this would be the case if the system is
//     being powed by a short-term battery supply in a backing UPS
//     system.  When this value is recieved, the consumer should make
//     preparations for either a system hibernate or system shutdown.
//
// { 5D3E9A59-E9D5-4B00-A6BD-FF34FF516548 }
extern "C" const GUID  GUID_ACDC_POWER_SOURCE;

// Lid state changes
// -----------------
//
// Specifies the current state of the lid (open or closed). The callback won't
// be called at all until a lid device is found and its current state is known.
//
// Values:
//
// 0 - closed
// 1 - opened
//
// { BA3E0F4D-B817-4094-A2D1-D56379E6A0F3 }
//

extern "C" const GUID  GUID_LIDSWITCH_STATE_CHANGE;

// Battery life remaining
// ----------------------
//

// Specifies the percentage of battery life remaining.  The consumer
// may register for notification in order to track battery life in
// a fine-grained manner.
//
// Once registered, the consumer can expect to be notified as the battery
// life percentage changes.
// 
// The consumer will recieve a value between 0 and 100 (inclusive) which
// indicates percent battery life remaining.
//
// { A7AD8041-B45A-4CAE-87A3-EECBB468A9E1 }
extern "C" const GUID  GUID_BATTERY_PERCENTAGE_REMAINING;


// Notification to listeners that the system is fairly busy and won't be moving
// into an idle state any time soon.  This can be used as a hint to listeners
// that now might be a good time to do background tasks.
//
extern "C" const GUID  GUID_IDLE_BACKGROUND_TASK;

// Notification to listeners that the system is fairly busy and won't be moving
// into an idle state any time soon.  This can be used as a hint to listeners
// that now might be a good time to do background tasks.
//
// { CF23F240-2A54-48D8-B114-DE1518FF052E }
extern "C" const GUID  GUID_BACKGROUND_TASK_NOTIFICATION;

// Define a GUID that will represent the action of a direct experience button
// on the platform.  Users will register for this DPPE setting and recieve
// notification when the h/w button is pressed.
//
// { 1A689231-7399-4E9A-8F99-B71F999DB3FA }
//
extern "C" const GUID  GUID_APPLAUNCH_BUTTON;

// PCI Express power settings
// ------------------------
//

// Specifies the subgroup which will contain all of the PCI Express
// settings for a single policy.
// 
// {501a4d13-42af-4429-9fd1-a8218c268e20}
// 
extern "C" const GUID  GUID_PCIEXPRESS_SETTINGS_SUBGROUP;

// Specifies the PCI Express ASPM power policy.
//
// {ee12f906-d277-404b-b6da-e5fa1a576df5}
//
extern "C" const GUID  GUID_PCIEXPRESS_ASPM_POLICY;


typedef enum _SYSTEM_POWER_STATE {
    PowerSystemUnspecified = 0,
    PowerSystemWorking     = 1,
    PowerSystemSleeping1   = 2,
    PowerSystemSleeping2   = 3,
    PowerSystemSleeping3   = 4,
    PowerSystemHibernate   = 5,
    PowerSystemShutdown    = 6,
    PowerSystemMaximum     = 7
} SYSTEM_POWER_STATE, *PSYSTEM_POWER_STATE;



typedef enum {
    PowerActionNone = 0,
    PowerActionReserved,
    PowerActionSleep,
    PowerActionHibernate,
    PowerActionShutdown,
    PowerActionShutdownReset,
    PowerActionShutdownOff,
    PowerActionWarmEject
} POWER_ACTION, *PPOWER_ACTION;

typedef enum _DEVICE_POWER_STATE {
    PowerDeviceUnspecified = 0,
    PowerDeviceD0,
    PowerDeviceD1,
    PowerDeviceD2,
    PowerDeviceD3,
    PowerDeviceMaximum
} DEVICE_POWER_STATE, *PDEVICE_POWER_STATE;









typedef DWORD EXECUTION_STATE;

typedef enum {
    LT_DONT_CARE,
    LT_LOWEST_LATENCY
} LATENCY_TIME;

// end_ntminiport 



//-----------------------------------------------------------------------------
// Device Power Information
// Accessable via CM_Get_DevInst_Registry_Property_Ex(CM_DRP_DEVICE_POWER_DATA)
//-----------------------------------------------------------------------------











typedef struct CM_Power_Data_s {
    DWORD               PD_Size;
    DEVICE_POWER_STATE  PD_MostRecentPowerState;
    DWORD               PD_Capabilities;
    DWORD               PD_D1Latency;
    DWORD               PD_D2Latency;
    DWORD               PD_D3Latency;
    DEVICE_POWER_STATE  PD_PowerStateMapping[7];
    SYSTEM_POWER_STATE  PD_DeepestSystemWake;
} CM_POWER_DATA, *PCM_POWER_DATA;

#line 8447 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// begin_wdm

typedef enum {
    SystemPowerPolicyAc,
    SystemPowerPolicyDc,
    VerifySystemPolicyAc,
    VerifySystemPolicyDc,
    SystemPowerCapabilities,
    SystemBatteryState,
    SystemPowerStateHandler,
    ProcessorStateHandler,
    SystemPowerPolicyCurrent,
    AdministratorPowerPolicy,
    SystemReserveHiberFile,
    ProcessorInformation,
    SystemPowerInformation,
    ProcessorStateHandler2,
    LastWakeTime,                                   // Compare with KeQueryInterruptTime()
    LastSleepTime,                                  // Compare with KeQueryInterruptTime()
    SystemExecutionState,
    SystemPowerStateNotifyHandler,
    ProcessorPowerPolicyAc,
    ProcessorPowerPolicyDc,
    VerifyProcessorPowerPolicyAc,
    VerifyProcessorPowerPolicyDc,
    ProcessorPowerPolicyCurrent,
    SystemPowerStateLogging,
    SystemPowerLoggingEntry,
    SetPowerSettingValue,
    NotifyUserPowerSetting,
    GetPowerTransitionVetoes,
    SetPowerTransitionVeto,
    SystemVideoState,
    TraceApplicationPowerMessage,
    TraceApplicationPowerMessageEnd,
    ProcessorPerfStates,
    ProcessorIdleStates,
    ProcessorThrottleStates,
    SystemWakeSource,
    SystemHiberFileInformation,
    TraceServicePowerMessage,
    ProcessorLoad,
    PowerShutdownNotification
} POWER_INFORMATION_LEVEL;

//
// Power Transition Vetos
//



//#define PO_TRANSITION_VETO_TYPE_DRIVER  0x00000004



    
typedef struct _PO_TRANSITION_VETO_REASON {
    DWORD ResourceId;
    DWORD ModuleNameOffset;
} PO_TRANSITION_VETO_REASON, *PPO_TRANSITION_VETO_REASON;

typedef struct _PO_TRANSITION_VETO_WINDOW {
    HANDLE Handle;
} PO_TRANSITION_VETO_WINDOW, *PPO_TRANSITION_VETO_WINDOW;

typedef struct _PO_TRANSITION_VETO_SERVICE {
    DWORD ServiceNameOffset;
} PO_TRANSITION_VETO_SERVICE, *PPO_TRANSITION_VETO_SERVICE;

/*

typedef struct _PO_TRANSITION_VETO_DRIVER {
    DWORD InstancePathOffset;
    DWORD DriverNameOffset;
} PO_TRANSITION_VETO_DRIVER, *PPO_TRANSITION_VETO_DRIVER;

*/

typedef struct _PO_TRANSITION_VETO {
    DWORD Type;
    PO_TRANSITION_VETO_REASON Reason;
    DWORD ProcessId;    

    union {
        PO_TRANSITION_VETO_WINDOW Window;
        PO_TRANSITION_VETO_SERVICE Service;
        //PO_TRANSITION_VETO_DRIVER Driver;
    };
} PO_TRANSITION_VETO, *PPO_TRANSITION_VETO;

typedef struct _PO_TRANSITION_VETOES {
    DWORD Count;
    PO_TRANSITION_VETO Vetoes[1];
} PO_TRANSITION_VETOES, *PPO_TRANSITION_VETOES;

//
// Power Setting definitions
//

typedef enum {
    PoAc,
    PoDc,
    PoHot,
    PoConditionMaximum
} SYSTEM_POWER_CONDITION;

typedef struct {
    
    //
    // Version of this structure.  Currently should be set to
    // POWER_SETTING_VALUE_VERSION.
    //
    DWORD       Version;
    
    
    //
    // GUID representing the power setting being applied.
    //
    GUID        Guid;
    
    
    //
    // What power state should this setting be applied to?  E.g.
    // AC, DC, thermal, ...
    //
    SYSTEM_POWER_CONDITION PowerCondition;
    
    //
    // Length (in bytes) of the 'Data' member.
    //
    DWORD       DataLength;
    
    //
    // Data which contains the actual setting value.
    // 
    BYTE    Data[1];
} SET_POWER_SETTING_VALUE, *PSET_POWER_SETTING_VALUE;



typedef struct {
    GUID Guid;
} NOTIFY_USER_POWER_SETTING, *PNOTIFY_USER_POWER_SETTING;

//
// Package definition for an experience button device notification.  When
// someone registers for GUID_EXPERIENCE_BUTTON, this is the definition of
// the setting data they'll get.
//
typedef struct _APPLICATIONLAUNCH_SETTING_VALUE {

    //
    // System time when the most recent button press ocurred.  Note that this is
    // specified in 100ns internvals since January 1, 1601.
    //    
    LARGE_INTEGER       ActivationTime;
    
    //
    // Reserved for internal use.
    //
    DWORD               Flags;

    //
    // which instance of this device was pressed?
    //
    DWORD               ButtonInstanceID;


} APPLICATIONLAUNCH_SETTING_VALUE, *PAPPLICATIONLAUNCH_SETTING_VALUE;

//
// define platform roles
//

typedef enum {
    PlatformRoleUnspecified = 0,
    PlatformRoleDesktop,
    PlatformRoleMobile,
    PlatformRoleWorkstation,
    PlatformRoleEnterpriseServer,
    PlatformRoleSOHOServer,
    PlatformRoleAppliancePC,
    PlatformRolePerformanceServer,
    PlatformRoleMaximum
} POWER_PLATFORM_ROLE;

//
// Wake source tracking
//

typedef enum {
    DeviceWakeSourceType,
    FixedWakeSourceType
} PO_WAKE_SOURCE_TYPE, *PPO_WAKE_SOURCE_TYPE;

typedef enum {
    FixedWakeSourcePowerButton,
    FixedWakeSourceSleepButton,
    FixedWakeSourceRtc
} PO_FIXED_WAKE_SOURCE_TYPE, *PPO_FIXED_WAKE_SOURCE_TYPE;

typedef struct _PO_WAKE_SOURCE_HEADER {
    PO_WAKE_SOURCE_TYPE Type;
    DWORD Size;
} PO_WAKE_SOURCE_HEADER, *PPO_WAKE_SOURCE_HEADER;

typedef struct _PO_WAKE_SOURCE_DEVICE {
    PO_WAKE_SOURCE_HEADER Header;
    WCHAR InstancePath[1];
} PO_WAKE_SOURCE_DEVICE, *PPO_WAKE_SOURCE_DEVICE;

typedef struct _PO_WAKE_SOURCE_FIXED {
    PO_WAKE_SOURCE_HEADER Header;
    PO_FIXED_WAKE_SOURCE_TYPE FixedWakeSourceType;
} PO_WAKE_SOURCE_FIXED, *PPO_WAKE_SOURCE_FIXED;

typedef struct _PO_WAKE_SOURCE_INFO {
    DWORD Count;
    DWORD Offsets[1];
} PO_WAKE_SOURCE_INFO, *PPO_WAKE_SOURCE_INFO;

typedef struct _PO_WAKE_SOURCE_HISTORY {
    DWORD Count;
    DWORD Offsets[1];
} PO_WAKE_SOURCE_HISTORY, *PPO_WAKE_SOURCE_HISTORY;

//
// System power manager capabilities
//


typedef struct {
    DWORD       Granularity;
    DWORD       Capacity;
} BATTERY_REPORTING_SCALE, *PBATTERY_REPORTING_SCALE;
#line 8684 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//

typedef struct {
    BOOLEAN Enabled;
    BYTE  PercentBusy[32];
} PPM_SIMULATED_PROCESSOR_LOAD, *PPPM_SIMULATED_PROCESSOR_LOAD;

typedef struct {
    DWORD   Frequency;
    DWORD   Flags;
    DWORD   PercentFrequency;
} PPM_WMI_LEGACY_PERFSTATE, *PPPM_WMI_LEGACY_PERFSTATE;

typedef struct {
    DWORD Latency;
    DWORD Power;
    DWORD TimeCheck;
    BYTE  PromotePercent;
    BYTE  DemotePercent;
    BYTE  StateType;
    BYTE  Reserved;
    DWORD StateFlags;
    DWORD Context;
    DWORD IdleHandler;
    DWORD Reserved1;            // reserved for future use
} PPM_WMI_IDLE_STATE, *PPPM_WMI_IDLE_STATE;

typedef struct {
    DWORD Type;
    DWORD Count;
    DWORD TargetState;          // current idle state
    DWORD OldState;             // previous idle state
    DWORD64 TargetProcessors;
    PPM_WMI_IDLE_STATE State[1];
} PPM_WMI_IDLE_STATES, *PPPM_WMI_IDLE_STATES;

typedef struct {
    DWORD Frequency;            // in Mhz
    DWORD Power;                // in milliwatts
    BYTE  PercentFrequency;
    BYTE  IncreaseLevel;        // goto higher state
    BYTE  DecreaseLevel;        // goto lower state
    BYTE  Type;                 // performance or throttle
    DWORD IncreaseTime;         // in tick counts
    DWORD DecreaseTime;         // in tick counts
    DWORD64 Control;            // control value
    DWORD64 Status;             // control value
    DWORD HitCount;
    DWORD Reserved1;            // reserved for future use
    DWORD64 Reserved2;
    DWORD64 Reserved3;
} PPM_WMI_PERF_STATE, *PPPM_WMI_PERF_STATE;

typedef struct {
    DWORD Count;
    DWORD MaxFrequency;
    DWORD CurrentState;         // current state
    DWORD MaxPerfState;         // fastest state considering policy restrictions
    DWORD MinPerfState;         // slowest state considering policy restrictions
    DWORD LowestPerfState;      // slowest perf state, fixed, aka the "knee"
    DWORD ThermalConstraint;
    BYTE  BusyAdjThreshold;
    BYTE  PolicyType;           // domain coordination
    BYTE  Type;
    BYTE  Reserved;
    DWORD TimerInterval;
    DWORD64 TargetProcessors;   // domain affinity
    DWORD PStateHandler;
    DWORD PStateContext;
    DWORD TStateHandler;
    DWORD TStateContext;
    DWORD FeedbackHandler;
    DWORD Reserved1;
    DWORD64 Reserved2;
    PPM_WMI_PERF_STATE State[1];
} PPM_WMI_PERF_STATES, *PPPM_WMI_PERF_STATES;

//
// Accounting info.
//



typedef struct {
    DWORD IdleTransitions;
    DWORD FailedTransitions;
    DWORD InvalidBucketIndex;
    DWORD64 TotalTime;
    DWORD IdleTimeBuckets[6];
} PPM_IDLE_STATE_ACCOUNTING, *PPPM_IDLE_STATE_ACCOUNTING;

typedef struct {
    DWORD StateCount;
    DWORD TotalTransitions;
    DWORD ResetCount;
    DWORD64 StartTime;
    PPM_IDLE_STATE_ACCOUNTING State[1];
} PPM_IDLE_ACCOUNTING, *PPPM_IDLE_ACCOUNTING;

//
// Definitions of coordination types for _PSD, _TSD, and _CSD BIOS objects from
// the Acpi 3.0 specification
//





//
// Definition of Microsoft PPM coordination types.
//





//
// Processor Power Management WMI interface.
//

// {A5B32DDD-7F39-4abc-B892-900E43B59EBB}
extern "C" const GUID  PPM_PERFSTATE_CHANGE_GUID;
#line 8808 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {995e6b7f-d653-497a-b978-36a30c29bf01}
extern "C" const GUID  PPM_PERFSTATE_DOMAIN_CHANGE_GUID;
#line 8812 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {4838fe4f-f71c-4e51-9ecc-8430a7ac4c6c}
extern "C" const GUID  PPM_IDLESTATE_CHANGE_GUID;
#line 8816 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {5708cc20-7d40-4bf4-b4aa-2b01338d0126}
extern "C" const GUID  PPM_PERFSTATES_DATA_GUID;
#line 8820 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {ba138e10-e250-4ad7-8616-cf1a7ad410e7}
extern "C" const GUID  PPM_IDLESTATES_DATA_GUID;
#line 8824 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {e2a26f78-ae07-4ee0-a30f-ce354f5a94cd}
extern "C" const GUID  PPM_IDLE_ACCOUNTING_GUID;
#line 8828 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {a852c2c8-1a4c-423b-8c2c-f30d82931a88}
extern "C" const GUID  PPM_THERMALCONSTRAINT_GUID;
#line 8832 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {7fd18652-0cfe-40d2-b0a1-0b066a87759e}
extern "C" const GUID  PPM_PERFMON_PERFSTATE_GUID;
#line 8836 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// {48f377b8-6880-4c7b-8bdc-380176c6654d}
extern "C" const GUID  PPM_THERMAL_POLICY_CHANGE_GUID;
#line 8840 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


typedef struct {
    DWORD State;
    DWORD Status;
    DWORD Latency;
    DWORD Speed;
    DWORD Processor;
} PPM_PERFSTATE_EVENT, *PPPM_PERFSTATE_EVENT;

typedef struct {
    DWORD State;
    DWORD Latency;
    DWORD Speed;
    DWORD64 Processors;
} PPM_PERFSTATE_DOMAIN_EVENT, *PPPM_PERFSTATE_DOMAIN_EVENT;

typedef struct {
    DWORD NewState;
    DWORD OldState;
    DWORD64 Processors;
} PPM_IDLESTATE_EVENT, *PPPM_IDLESTATE_EVENT;

typedef struct {
    DWORD ThermalConstraint;
    DWORD64 Processors;
} PPM_THERMALCHANGE_EVENT, *PPPM_THERMALCHANGE_EVENT;

#pragma warning(push)
#pragma warning(disable:4121)

typedef struct {
    BYTE  Mode;
    DWORD64 Processors;
} PPM_THERMAL_POLICY_EVENT, *PPPM_THERMAL_POLICY_EVENT;

#pragma warning(pop)
       
// Power Policy Management interfaces
//

typedef struct {
    POWER_ACTION    Action;
    DWORD           Flags;
    DWORD           EventCode;
} POWER_ACTION_POLICY, *PPOWER_ACTION_POLICY;

// POWER_ACTION_POLICY->Flags:








// POWER_ACTION_POLICY->EventCode flags







// Note: for battery alarm EventCodes, the ID of the battery alarm << 16 is ORed
// into the flags.  For example: DISCHARGE_POLICY_LOW << 16

//
// The GUID_BATTERY_DISCHARGE_FLAGS_x power settings use a subset of EventCode
// flags.  The POWER_FORCE_TRIGGER_RESET flag doesn't make sense for a battery
// alarm so it is overloaded for other purposes (gerneral enable/disable).



// system battery drain policies
typedef struct {
    BOOLEAN                 Enable;
    BYTE                    Spare[3];
    DWORD                   BatteryLevel;
    POWER_ACTION_POLICY     PowerPolicy;
    SYSTEM_POWER_STATE      MinSystemState;
} SYSTEM_POWER_LEVEL, *PSYSTEM_POWER_LEVEL;

// Discharge policy constants





// system power policies
typedef struct _SYSTEM_POWER_POLICY {
    DWORD                   Revision;       // 1

    // events
    POWER_ACTION_POLICY     PowerButton;
    POWER_ACTION_POLICY     SleepButton;
    POWER_ACTION_POLICY     LidClose;
    SYSTEM_POWER_STATE      LidOpenWake;
    DWORD                   Reserved;

    // "system idle" detection
    POWER_ACTION_POLICY     Idle;
    DWORD                   IdleTimeout;
    BYTE                    IdleSensitivity;

    BYTE                    DynamicThrottle;
    BYTE                    Spare2[2];

    // meaning of power action "sleep"
    SYSTEM_POWER_STATE      MinSleep;
    SYSTEM_POWER_STATE      MaxSleep;
    SYSTEM_POWER_STATE      ReducedLatencySleep;
    DWORD                   WinLogonFlags;

    DWORD                   Spare3;

    // parameters for dozing
    //
    DWORD                   DozeS4Timeout;

    // battery policies
    DWORD                   BroadcastCapacityResolution;
    SYSTEM_POWER_LEVEL      DischargePolicy[4];

    // video policies
    DWORD                   VideoTimeout;
    BOOLEAN                 VideoDimDisplay;
    DWORD                   VideoReserved[3];

    // hard disk policies
    DWORD                   SpindownTimeout;

    // processor policies
    BOOLEAN                 OptimizeForPower;
    BYTE                    FanThrottleTolerance;
    BYTE                    ForcedThrottle;
    BYTE                    MinThrottle;
    POWER_ACTION_POLICY     OverThrottled;

} SYSTEM_POWER_POLICY, *PSYSTEM_POWER_POLICY;


// processor power policy state

//
// Processor Idle State Policy.
//



typedef struct {
    DWORD TimeCheck;
    BYTE  DemotePercent;
    BYTE  PromotePercent;
    BYTE  Spare[2];
} PROCESSOR_IDLESTATE_INFO, *PPROCESSOR_IDLESTATE_INFO;

typedef struct {
    WORD   Revision;
    union {
        WORD   AsWORD  ;
        struct {
            WORD   AllowScaling : 1;
            WORD   Disabled : 1;
            WORD   Reserved : 14;
        };
    } Flags;

    DWORD PolicyCount;
    PROCESSOR_IDLESTATE_INFO Policy[0x3];
} PROCESSOR_IDLESTATE_POLICY, *PPROCESSOR_IDLESTATE_POLICY;

//
// Legacy Processor Policy.  This is only provided to allow legacy 
// applications to compile.  New applications must use 
// PROCESSOR_IDLESTATE_POLICY.
//








typedef struct _PROCESSOR_POWER_POLICY_INFO {

    // Time based information (will be converted to kernel units)
    DWORD                   TimeCheck;                      // in US
    DWORD                   DemoteLimit;                    // in US
    DWORD                   PromoteLimit;                   // in US

    // Percentage based information
    BYTE                    DemotePercent;
    BYTE                    PromotePercent;
    BYTE                    Spare[2];

    // Flags
    DWORD                   AllowDemotion:1;
    DWORD                   AllowPromotion:1;
    DWORD                   Reserved:30;

} PROCESSOR_POWER_POLICY_INFO, *PPROCESSOR_POWER_POLICY_INFO;

// processor power policy
typedef struct _PROCESSOR_POWER_POLICY {
    DWORD                       Revision;       // 1

    // Dynamic Throttling Policy
    BYTE                        DynamicThrottle;
    BYTE                        Spare[3];

    // Flags
    DWORD                       DisableCStates:1;
    DWORD                       Reserved:31;

    // System policy information
    // The Array is last, in case it needs to be grown and the structure
    // revision incremented.
    DWORD                       PolicyCount;
    PROCESSOR_POWER_POLICY_INFO Policy[3];

} PROCESSOR_POWER_POLICY, *PPROCESSOR_POWER_POLICY;

//
// Processor Perf State Policy.
//






typedef struct {
    DWORD Revision;
    BYTE  MaxThrottle;
    BYTE  MinThrottle;
    BYTE  BusyAdjThreshold;
    union {
        BYTE  Spare;
        union {
            BYTE  AsBYTE ;
            struct {
                BYTE  NoDomainAccounting : 1;
                BYTE  IncreasePolicy: 2;
                BYTE  DecreasePolicy: 2;
                BYTE  Reserved : 3;
            };
        } Flags;
    };
    
    DWORD TimeCheck;
    DWORD IncreaseTime;
    DWORD DecreaseTime;
    DWORD IncreasePercent;
    DWORD DecreasePercent;
} PROCESSOR_PERFSTATE_POLICY, *PPROCESSOR_PERFSTATE_POLICY;

// administrator power policy overrides
typedef struct _ADMINISTRATOR_POWER_POLICY {

    // meaning of power action "sleep"
    SYSTEM_POWER_STATE      MinSleep;
    SYSTEM_POWER_STATE      MaxSleep;

    // video policies
    DWORD                   MinVideoTimeout;
    DWORD                   MaxVideoTimeout;

    // disk policies
    DWORD                   MinSpindownTimeout;
    DWORD                   MaxSpindownTimeout;
} ADMINISTRATOR_POWER_POLICY, *PADMINISTRATOR_POWER_POLICY;




typedef struct {
    // Misc supported system features
    BOOLEAN             PowerButtonPresent;
    BOOLEAN             SleepButtonPresent;
    BOOLEAN             LidPresent;
    BOOLEAN             SystemS1;
    BOOLEAN             SystemS2;
    BOOLEAN             SystemS3;
    BOOLEAN             SystemS4;           // hibernate
    BOOLEAN             SystemS5;           // off
    BOOLEAN             HiberFilePresent;
    BOOLEAN             FullWake;
    BOOLEAN             VideoDimPresent;
    BOOLEAN             ApmPresent;
    BOOLEAN             UpsPresent;

    // Processors
    BOOLEAN             ThermalControl;
    BOOLEAN             ProcessorThrottle;
    BYTE                ProcessorMinThrottle;
    



#line 9142 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
    BYTE                ProcessorMaxThrottle;
    BOOLEAN             FastSystemS4;
    BYTE                spare2[3];
#line 9146 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

    // Disk
    BOOLEAN             DiskSpinDown;
    BYTE                spare3[8];

    // System Battery
    BOOLEAN             SystemBatteriesPresent;
    BOOLEAN             BatteriesAreShortTerm;
    BATTERY_REPORTING_SCALE BatteryScale[3];

    // Wake
    SYSTEM_POWER_STATE  AcOnLineWake;
    SYSTEM_POWER_STATE  SoftLidWake;
    SYSTEM_POWER_STATE  RtcWake;
    SYSTEM_POWER_STATE  MinDeviceWakeState; // note this may change on driver load
    SYSTEM_POWER_STATE  DefaultLowLatencyWake;
} SYSTEM_POWER_CAPABILITIES, *PSYSTEM_POWER_CAPABILITIES;

typedef struct {
    BOOLEAN             AcOnLine;
    BOOLEAN             BatteryPresent;
    BOOLEAN             Charging;
    BOOLEAN             Discharging;
    BOOLEAN             Spare1[4];

    DWORD               MaxCapacity;
    DWORD               RemainingCapacity;
    DWORD               Rate;
    DWORD               EstimatedTime;

    DWORD               DefaultAlert1;
    DWORD               DefaultAlert2;
} SYSTEM_BATTERY_STATE, *PSYSTEM_BATTERY_STATE;



//
// Image Format
//




#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pshpack4.h

Abstract:

    This file turns 4 byte packing of structures on.  (That is, it disables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.  For Microsoft
    compatible compilers, this files uses the push option to the pack pragma
    so that the poppack.h include file can restore the previous packing
    reliably.

    The file poppack.h is the complement to this file.

--*/



#pragma warning(disable:4103)

#pragma pack(push,4)


#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"
#line 34 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack4.h"

#line 9190 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"







#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pshpack2.h

Abstract:

    This file turns 2 byte packing of structures on.  (That is, it disables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.  For Microsoft
    compatible compilers, this files uses the push option to the pack pragma
    so that the poppack.h include file can restore the previous packing
    reliably.

    The file poppack.h is the complement to this file.

--*/



#pragma warning(disable:4103)

#pragma pack(push,2)


#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"
#line 34 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"

#line 9198 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"









#line 9208 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _IMAGE_DOS_HEADER {      // DOS .EXE header
    WORD   e_magic;                     // Magic number
    WORD   e_cblp;                      // Bytes on last page of file
    WORD   e_cp;                        // Pages in file
    WORD   e_crlc;                      // Relocations
    WORD   e_cparhdr;                   // Size of header in paragraphs
    WORD   e_minalloc;                  // Minimum extra paragraphs needed
    WORD   e_maxalloc;                  // Maximum extra paragraphs needed
    WORD   e_ss;                        // Initial (relative) SS value
    WORD   e_sp;                        // Initial SP value
    WORD   e_csum;                      // Checksum
    WORD   e_ip;                        // Initial IP value
    WORD   e_cs;                        // Initial (relative) CS value
    WORD   e_lfarlc;                    // File address of relocation table
    WORD   e_ovno;                      // Overlay number
    WORD   e_res[4];                    // Reserved words
    WORD   e_oemid;                     // OEM identifier (for e_oeminfo)
    WORD   e_oeminfo;                   // OEM information; e_oemid specific
    WORD   e_res2[10];                  // Reserved words
    LONG   e_lfanew;                    // File address of new exe header
  } IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;

typedef struct _IMAGE_OS2_HEADER {      // OS/2 .EXE header
    WORD   ne_magic;                    // Magic number
    CHAR   ne_ver;                      // Version number
    CHAR   ne_rev;                      // Revision number
    WORD   ne_enttab;                   // Offset of Entry Table
    WORD   ne_cbenttab;                 // Number of bytes in Entry Table
    LONG   ne_crc;                      // Checksum of whole file
    WORD   ne_flags;                    // Flag word
    WORD   ne_autodata;                 // Automatic data segment number
    WORD   ne_heap;                     // Initial heap allocation
    WORD   ne_stack;                    // Initial stack allocation
    LONG   ne_csip;                     // Initial CS:IP setting
    LONG   ne_sssp;                     // Initial SS:SP setting
    WORD   ne_cseg;                     // Count of file segments
    WORD   ne_cmod;                     // Entries in Module Reference Table
    WORD   ne_cbnrestab;                // Size of non-resident name table
    WORD   ne_segtab;                   // Offset of Segment Table
    WORD   ne_rsrctab;                  // Offset of Resource Table
    WORD   ne_restab;                   // Offset of resident name table
    WORD   ne_modtab;                   // Offset of Module Reference Table
    WORD   ne_imptab;                   // Offset of Imported Names Table
    LONG   ne_nrestab;                  // Offset of Non-resident Names Table
    WORD   ne_cmovent;                  // Count of movable entries
    WORD   ne_align;                    // Segment alignment shift count
    WORD   ne_cres;                     // Count of resource segments
    BYTE   ne_exetyp;                   // Target Operating system
    BYTE   ne_flagsothers;              // Other .EXE flags
    WORD   ne_pretthunks;               // offset to return thunks
    WORD   ne_psegrefbytes;             // offset to segment ref. bytes
    WORD   ne_swaparea;                 // Minimum code swap area size
    WORD   ne_expver;                   // Expected Windows version number
  } IMAGE_OS2_HEADER, *PIMAGE_OS2_HEADER;

typedef struct _IMAGE_VXD_HEADER {      // Windows VXD header
    WORD   e32_magic;                   // Magic number
    BYTE   e32_border;                  // The byte ordering for the VXD
    BYTE   e32_worder;                  // The word ordering for the VXD
    DWORD  e32_level;                   // The EXE format level for now = 0
    WORD   e32_cpu;                     // The CPU type
    WORD   e32_os;                      // The OS type
    DWORD  e32_ver;                     // Module version
    DWORD  e32_mflags;                  // Module flags
    DWORD  e32_mpages;                  // Module # pages
    DWORD  e32_startobj;                // Object # for instruction pointer
    DWORD  e32_eip;                     // Extended instruction pointer
    DWORD  e32_stackobj;                // Object # for stack pointer
    DWORD  e32_esp;                     // Extended stack pointer
    DWORD  e32_pagesize;                // VXD page size
    DWORD  e32_lastpagesize;            // Last page size in VXD
    DWORD  e32_fixupsize;               // Fixup section size
    DWORD  e32_fixupsum;                // Fixup section checksum
    DWORD  e32_ldrsize;                 // Loader section size
    DWORD  e32_ldrsum;                  // Loader section checksum
    DWORD  e32_objtab;                  // Object table offset
    DWORD  e32_objcnt;                  // Number of objects in module
    DWORD  e32_objmap;                  // Object page map offset
    DWORD  e32_itermap;                 // Object iterated data map offset
    DWORD  e32_rsrctab;                 // Offset of Resource Table
    DWORD  e32_rsrccnt;                 // Number of resource entries
    DWORD  e32_restab;                  // Offset of resident name table
    DWORD  e32_enttab;                  // Offset of Entry Table
    DWORD  e32_dirtab;                  // Offset of Module Directive Table
    DWORD  e32_dircnt;                  // Number of module directives
    DWORD  e32_fpagetab;                // Offset of Fixup Page Table
    DWORD  e32_frectab;                 // Offset of Fixup Record Table
    DWORD  e32_impmod;                  // Offset of Import Module Name Table
    DWORD  e32_impmodcnt;               // Number of entries in Import Module Name Table
    DWORD  e32_impproc;                 // Offset of Import Procedure Name Table
    DWORD  e32_pagesum;                 // Offset of Per-Page Checksum Table
    DWORD  e32_datapage;                // Offset of Enumerated Data Pages
    DWORD  e32_preload;                 // Number of preload pages
    DWORD  e32_nrestab;                 // Offset of Non-resident Names Table
    DWORD  e32_cbnrestab;               // Size of Non-resident Name Table
    DWORD  e32_nressum;                 // Non-resident Name Table Checksum
    DWORD  e32_autodata;                // Object # for automatic data object
    DWORD  e32_debuginfo;               // Offset of the debugging information
    DWORD  e32_debuglen;                // The length of the debugging info. in bytes
    DWORD  e32_instpreload;             // Number of instance pages in preload section of VXD file
    DWORD  e32_instdemand;              // Number of instance pages in demand load section of VXD file
    DWORD  e32_heapsize;                // Size of heap - for 16-bit apps
    BYTE   e32_res3[12];                // Reserved words
    DWORD  e32_winresoff;
    DWORD  e32_winreslen;
    WORD   e32_devid;                   // Device ID for VxD
    WORD   e32_ddkver;                  // DDK version for VxD
  } IMAGE_VXD_HEADER, *PIMAGE_VXD_HEADER;


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    poppack.h

Abstract:

    This file turns packing of structures off.  (That is, it enables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.

    poppack.h is the complement to pshpack?.h.  An inclusion of poppack.h
    MUST ALWAYS be preceded by an inclusion of one of pshpack?.h, in one-to-one
    correspondence.

    For Microsoft compatible compilers, this file uses the pop option
    to the pack pragma so that it can restore the previous saved by the
    pshpack?.h include file.

--*/



#pragma warning(disable:4103)

#pragma pack(pop)


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"


#line 36 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"

#line 9320 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 9321 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// File header format.
//

typedef struct _IMAGE_FILE_HEADER {
    WORD    Machine;
    WORD    NumberOfSections;
    DWORD   TimeDateStamp;
    DWORD   PointerToSymbolTable;
    DWORD   NumberOfSymbols;
    WORD    SizeOfOptionalHeader;
    WORD    Characteristics;
} IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;

















































//
// Directory format.
//

typedef struct _IMAGE_DATA_DIRECTORY {
    DWORD   VirtualAddress;
    DWORD   Size;
} IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;



//
// Optional header format.
//

typedef struct _IMAGE_OPTIONAL_HEADER {
    //
    // Standard fields.
    //

    WORD    Magic;
    BYTE    MajorLinkerVersion;
    BYTE    MinorLinkerVersion;
    DWORD   SizeOfCode;
    DWORD   SizeOfInitializedData;
    DWORD   SizeOfUninitializedData;
    DWORD   AddressOfEntryPoint;
    DWORD   BaseOfCode;
    DWORD   BaseOfData;

    //
    // NT additional fields.
    //

    DWORD   ImageBase;
    DWORD   SectionAlignment;
    DWORD   FileAlignment;
    WORD    MajorOperatingSystemVersion;
    WORD    MinorOperatingSystemVersion;
    WORD    MajorImageVersion;
    WORD    MinorImageVersion;
    WORD    MajorSubsystemVersion;
    WORD    MinorSubsystemVersion;
    DWORD   Win32VersionValue;
    DWORD   SizeOfImage;
    DWORD   SizeOfHeaders;
    DWORD   CheckSum;
    WORD    Subsystem;
    WORD    DllCharacteristics;
    DWORD   SizeOfStackReserve;
    DWORD   SizeOfStackCommit;
    DWORD   SizeOfHeapReserve;
    DWORD   SizeOfHeapCommit;
    DWORD   LoaderFlags;
    DWORD   NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[16];
} IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;

typedef struct _IMAGE_ROM_OPTIONAL_HEADER {
    WORD   Magic;
    BYTE   MajorLinkerVersion;
    BYTE   MinorLinkerVersion;
    DWORD  SizeOfCode;
    DWORD  SizeOfInitializedData;
    DWORD  SizeOfUninitializedData;
    DWORD  AddressOfEntryPoint;
    DWORD  BaseOfCode;
    DWORD  BaseOfData;
    DWORD  BaseOfBss;
    DWORD  GprMask;
    DWORD  CprMask[4];
    DWORD  GpValue;
} IMAGE_ROM_OPTIONAL_HEADER, *PIMAGE_ROM_OPTIONAL_HEADER;

typedef struct _IMAGE_OPTIONAL_HEADER64 {
    WORD        Magic;
    BYTE        MajorLinkerVersion;
    BYTE        MinorLinkerVersion;
    DWORD       SizeOfCode;
    DWORD       SizeOfInitializedData;
    DWORD       SizeOfUninitializedData;
    DWORD       AddressOfEntryPoint;
    DWORD       BaseOfCode;
    ULONGLONG   ImageBase;
    DWORD       SectionAlignment;
    DWORD       FileAlignment;
    WORD        MajorOperatingSystemVersion;
    WORD        MinorOperatingSystemVersion;
    WORD        MajorImageVersion;
    WORD        MinorImageVersion;
    WORD        MajorSubsystemVersion;
    WORD        MinorSubsystemVersion;
    DWORD       Win32VersionValue;
    DWORD       SizeOfImage;
    DWORD       SizeOfHeaders;
    DWORD       CheckSum;
    WORD        Subsystem;
    WORD        DllCharacteristics;
    ULONGLONG   SizeOfStackReserve;
    ULONGLONG   SizeOfStackCommit;
    ULONGLONG   SizeOfHeapReserve;
    ULONGLONG   SizeOfHeapCommit;
    DWORD       LoaderFlags;
    DWORD       NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[16];
} IMAGE_OPTIONAL_HEADER64, *PIMAGE_OPTIONAL_HEADER64;










typedef IMAGE_OPTIONAL_HEADER32             IMAGE_OPTIONAL_HEADER;
typedef PIMAGE_OPTIONAL_HEADER32            PIMAGE_OPTIONAL_HEADER;

#line 9504 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _IMAGE_NT_HEADERS64 {
    DWORD Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER64 OptionalHeader;
} IMAGE_NT_HEADERS64, *PIMAGE_NT_HEADERS64;

typedef struct _IMAGE_NT_HEADERS {
    DWORD Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER32 OptionalHeader;
} IMAGE_NT_HEADERS32, *PIMAGE_NT_HEADERS32;

typedef struct _IMAGE_ROM_HEADERS {
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_ROM_OPTIONAL_HEADER OptionalHeader;
} IMAGE_ROM_HEADERS, *PIMAGE_ROM_HEADERS;





typedef IMAGE_NT_HEADERS32                  IMAGE_NT_HEADERS;
typedef PIMAGE_NT_HEADERS32                 PIMAGE_NT_HEADERS;
#line 9529 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// IMAGE_FIRST_SECTION doesn't need 32/64 versions since the file header is the same either way.







// Subsystem Values
















// DllCharacteristics Entries

//      IMAGE_LIBRARY_PROCESS_INIT            0x0001     // Reserved.
//      IMAGE_LIBRARY_PROCESS_TERM            0x0002     // Reserved.
//      IMAGE_LIBRARY_THREAD_INIT             0x0004     // Reserved.
//      IMAGE_LIBRARY_THREAD_TERM             0x0008     // Reserved.






//                                            0x1000     // Reserved.

//                                            0x4000     // Reserved.


// Directory Entries








//      IMAGE_DIRECTORY_ENTRY_COPYRIGHT       7   // (X86 usage)









//
// Non-COFF Object file header
//

typedef struct ANON_OBJECT_HEADER {
    WORD    Sig1;            // Must be IMAGE_FILE_MACHINE_UNKNOWN
    WORD    Sig2;            // Must be 0xffff
    WORD    Version;         // >= 1 (implies the CLSID field is present)
    WORD    Machine;
    DWORD   TimeDateStamp;
    CLSID   ClassID;         // Used to invoke CoCreateInstance
    DWORD   SizeOfData;      // Size of data that follows the header
} ANON_OBJECT_HEADER;

typedef struct ANON_OBJECT_HEADER_V2 {
    WORD    Sig1;            // Must be IMAGE_FILE_MACHINE_UNKNOWN
    WORD    Sig2;            // Must be 0xffff
    WORD    Version;         // >= 2 (implies the Flags field is present - otherwise V1)
    WORD    Machine;
    DWORD   TimeDateStamp;
    CLSID   ClassID;         // Used to invoke CoCreateInstance
    DWORD   SizeOfData;      // Size of data that follows the header
    DWORD   Flags;           // 0x1 -> contains metadata
    DWORD   MetaDataSize;    // Size of CLR metadata
    DWORD   MetaDataOffset;  // Offset of CLR metadata
} ANON_OBJECT_HEADER_V2;
//
// Section header format.
//



typedef struct _IMAGE_SECTION_HEADER {
    BYTE    Name[8];
    union {
            DWORD   PhysicalAddress;
            DWORD   VirtualSize;
    } Misc;
    DWORD   VirtualAddress;
    DWORD   SizeOfRawData;
    DWORD   PointerToRawData;
    DWORD   PointerToRelocations;
    DWORD   PointerToLinenumbers;
    WORD    NumberOfRelocations;
    WORD    NumberOfLinenumbers;
    DWORD   Characteristics;
} IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;



//
// Section characteristics.
//
//      IMAGE_SCN_TYPE_REG                   0x00000000  // Reserved.
//      IMAGE_SCN_TYPE_DSECT                 0x00000001  // Reserved.
//      IMAGE_SCN_TYPE_NOLOAD                0x00000002  // Reserved.
//      IMAGE_SCN_TYPE_GROUP                 0x00000004  // Reserved.

//      IMAGE_SCN_TYPE_COPY                  0x00000010  // Reserved.







//      IMAGE_SCN_TYPE_OVER                  0x00000400  // Reserved.


//                                           0x00002000  // Reserved.
//      IMAGE_SCN_MEM_PROTECTED - Obsolete   0x00004000



//      IMAGE_SCN_MEM_SYSHEAP  - Obsolete    0x00010000



















// Unused                                    0x00F00000











//
// TLS Chaacteristic Flags
//



#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pshpack2.h

Abstract:

    This file turns 2 byte packing of structures on.  (That is, it disables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.  For Microsoft
    compatible compilers, this files uses the push option to the pack pragma
    so that the poppack.h include file can restore the previous packing
    reliably.

    The file poppack.h is the complement to this file.

--*/



#pragma warning(disable:4103)

#pragma pack(push,2)


#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"
#line 34 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"

#line 9704 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 9705 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Symbol format.
//

typedef struct _IMAGE_SYMBOL {
    union {
        BYTE    ShortName[8];
        struct {
            DWORD   Short;     // if 0, use LongName
            DWORD   Long;      // offset into string table
        } Name;
        DWORD   LongName[2];    // PBYTE [2]
    } N;
    DWORD   Value;
    SHORT   SectionNumber;
    WORD    Type;
    BYTE    StorageClass;
    BYTE    NumberOfAuxSymbols;
} IMAGE_SYMBOL;
typedef IMAGE_SYMBOL  *PIMAGE_SYMBOL;




//
// Section values.
//
// Symbols have a section number of the section in which they are
// defined. Otherwise, section numbers have the following meanings:
//






//
// Type (fundamental) values.
//


















//
// Type (derived) values.
//






//
// Storage classes.
//



























// new





// type packing constants







// MACROS

// Basic Type of  x


// Is x a pointer?


#line 9825 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// Is x a function?


#line 9830 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// Is x an array?



#line 9836 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// Is x a structure, union, or enumeration TAG?


#line 9841 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 9845 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


#line 9848 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Auxiliary entry format.
//

typedef union _IMAGE_AUX_SYMBOL {
    struct {
        DWORD    TagIndex;                      // struct, union, or enum tag index
        union {
            struct {
                WORD    Linenumber;             // declaration line number
                WORD    Size;                   // size of struct, union, or enum
            } LnSz;
           DWORD    TotalSize;
        } Misc;
        union {
            struct {                            // if ISFCN, tag, or .bb
                DWORD    PointerToLinenumber;
                DWORD    PointerToNextFunction;
            } Function;
            struct {                            // if ISARY, up to 4 dimen.
                WORD     Dimension[4];
            } Array;
        } FcnAry;
        WORD    TvIndex;                        // tv index
    } Sym;
    struct {
        BYTE    Name[18];
    } File;
    struct {
        DWORD   Length;                         // section length
        WORD    NumberOfRelocations;            // number of relocation entries
        WORD    NumberOfLinenumbers;            // number of line numbers
        DWORD   CheckSum;                       // checksum for communal
        SHORT   Number;                         // section number to associate with
        BYTE    Selection;                      // communal selection type
    } Section;
} IMAGE_AUX_SYMBOL;
typedef IMAGE_AUX_SYMBOL  *PIMAGE_AUX_SYMBOL;

typedef enum IMAGE_AUX_SYMBOL_TYPE {
    IMAGE_AUX_SYMBOL_TYPE_TOKEN_DEF = 1,
} IMAGE_AUX_SYMBOL_TYPE;

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pshpack2.h

Abstract:

    This file turns 2 byte packing of structures on.  (That is, it disables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.  For Microsoft
    compatible compilers, this files uses the push option to the pack pragma
    so that the poppack.h include file can restore the previous packing
    reliably.

    The file poppack.h is the complement to this file.

--*/



#pragma warning(disable:4103)

#pragma pack(push,2)


#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"
#line 34 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack2.h"

#line 9893 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct IMAGE_AUX_SYMBOL_TOKEN_DEF {
    BYTE  bAuxType;                  // IMAGE_AUX_SYMBOL_TYPE
    BYTE  bReserved;                 // Must be 0
    DWORD SymbolTableIndex;
    BYTE  rgbReserved[12];           // Must be 0
} IMAGE_AUX_SYMBOL_TOKEN_DEF;

typedef IMAGE_AUX_SYMBOL_TOKEN_DEF  *PIMAGE_AUX_SYMBOL_TOKEN_DEF;

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    poppack.h

Abstract:

    This file turns packing of structures off.  (That is, it enables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.

    poppack.h is the complement to pshpack?.h.  An inclusion of poppack.h
    MUST ALWAYS be preceded by an inclusion of one of pshpack?.h, in one-to-one
    correspondence.

    For Microsoft compatible compilers, this file uses the pop option
    to the pack pragma so that it can restore the previous saved by the
    pshpack?.h include file.

--*/



#pragma warning(disable:4103)

#pragma pack(pop)


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"


#line 36 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"

#line 9904 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Communal selection types.
//













//
// Relocation format.
//

typedef struct _IMAGE_RELOCATION {
    union {
        DWORD   VirtualAddress;
        DWORD   RelocCount;             // Set to the real count when IMAGE_SCN_LNK_NRELOC_OVFL is set
    };
    DWORD   SymbolTableIndex;
    WORD    Type;
} IMAGE_RELOCATION;
typedef IMAGE_RELOCATION  *PIMAGE_RELOCATION;

//
// I386 relocation types.
//












//
// MIPS relocation types.
//

















//
// Alpha Relocation types.
//

























//
// IBM PowerPC relocation types.
//



























// Flag bits in IMAGE_RELOCATION.TYPE






//
// Hitachi SH3 relocation types.
//




















                                                //  instruction in longwords
                                                //  if not NOMODE, insert the
                                                //  inverse of the low bit at
                                                //  bit 32 to select PTA/PTB

































//
// x64 relocations
//


















//
// IA64 relocation types.
//















//















//
// CEF relocation types.
//








//
// clr relocation types.
//
































































































































//
// Line number format.
//

typedef struct _IMAGE_LINENUMBER {
    union {
        DWORD   SymbolTableIndex;               // Symbol table index of function name if Linenumber is 0.
        DWORD   VirtualAddress;                 // Virtual address of line number.
    } Type;
    WORD    Linenumber;                         // Line number.
} IMAGE_LINENUMBER;
typedef IMAGE_LINENUMBER  *PIMAGE_LINENUMBER;


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    poppack.h

Abstract:

    This file turns packing of structures off.  (That is, it enables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.

    poppack.h is the complement to pshpack?.h.  An inclusion of poppack.h
    MUST ALWAYS be preceded by an inclusion of one of pshpack?.h, in one-to-one
    correspondence.

    For Microsoft compatible compilers, this file uses the pop option
    to the pack pragma so that it can restore the previous saved by the
    pshpack?.h include file.

--*/



#pragma warning(disable:4103)

#pragma pack(pop)


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"


#line 36 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"

#line 10307 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#line 10308 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Based relocation format.
//

typedef struct _IMAGE_BASE_RELOCATION {
    DWORD   VirtualAddress;
    DWORD   SizeOfBlock;
//  WORD    TypeOffset[1];
} IMAGE_BASE_RELOCATION;
typedef IMAGE_BASE_RELOCATION  * PIMAGE_BASE_RELOCATION;

//
// Based relocation types.
//












//
// Archive format.
//








typedef struct _IMAGE_ARCHIVE_MEMBER_HEADER {
    BYTE     Name[16];                          // File member name - `/' terminated.
    BYTE     Date[12];                          // File member date - decimal.
    BYTE     UserID[6];                         // File member user id - decimal.
    BYTE     GroupID[6];                        // File member group id - decimal.
    BYTE     Mode[8];                           // File member mode - octal.
    BYTE     Size[10];                          // File member size - decimal.
    BYTE     EndHeader[2];                      // String to end header.
} IMAGE_ARCHIVE_MEMBER_HEADER, *PIMAGE_ARCHIVE_MEMBER_HEADER;



//
// DLL support.
//

//
// Export Format
//

typedef struct _IMAGE_EXPORT_DIRECTORY {
    DWORD   Characteristics;
    DWORD   TimeDateStamp;
    WORD    MajorVersion;
    WORD    MinorVersion;
    DWORD   Name;
    DWORD   Base;
    DWORD   NumberOfFunctions;
    DWORD   NumberOfNames;
    DWORD   AddressOfFunctions;     // RVA from base of image
    DWORD   AddressOfNames;         // RVA from base of image
    DWORD   AddressOfNameOrdinals;  // RVA from base of image
} IMAGE_EXPORT_DIRECTORY, *PIMAGE_EXPORT_DIRECTORY;

//
// Import Format
//

typedef struct _IMAGE_IMPORT_BY_NAME {
    WORD    Hint;
    BYTE    Name[1];
} IMAGE_IMPORT_BY_NAME, *PIMAGE_IMPORT_BY_NAME;

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack8.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pshpack8.h

Abstract:

    This file turns 8 byte packing of structures on.  (That is, it disables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.  For Microsoft
    compatible compilers, this files uses the push option to the pack pragma
    so that the poppack.h include file can restore the previous packing
    reliably.

    The file poppack.h is the complement to this file.

--*/



#pragma warning(disable:4103)

#pragma pack(push,8)


#line 30 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack8.h"


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack8.h"
#line 34 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\pshpack8.h"

#line 10390 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _IMAGE_THUNK_DATA64 {
    union {
        ULONGLONG ForwarderString;  // PBYTE 
        ULONGLONG Function;         // PDWORD
        ULONGLONG Ordinal;
        ULONGLONG AddressOfData;    // PIMAGE_IMPORT_BY_NAME
    } u1;
} IMAGE_THUNK_DATA64;
typedef IMAGE_THUNK_DATA64 * PIMAGE_THUNK_DATA64;

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    poppack.h

Abstract:

    This file turns packing of structures off.  (That is, it enables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.

    poppack.h is the complement to pshpack?.h.  An inclusion of poppack.h
    MUST ALWAYS be preceded by an inclusion of one of pshpack?.h, in one-to-one
    correspondence.

    For Microsoft compatible compilers, this file uses the pop option
    to the pack pragma so that it can restore the previous saved by the
    pshpack?.h include file.

--*/



#pragma warning(disable:4103)

#pragma pack(pop)


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"


#line 36 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"

#line 10402 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _IMAGE_THUNK_DATA32 {
    union {
        DWORD ForwarderString;      // PBYTE 
        DWORD Function;             // PDWORD
        DWORD Ordinal;
        DWORD AddressOfData;        // PIMAGE_IMPORT_BY_NAME
    } u1;
} IMAGE_THUNK_DATA32;
typedef IMAGE_THUNK_DATA32 * PIMAGE_THUNK_DATA32;








//
// Thread Local Storage
//

typedef void
(__stdcall *PIMAGE_TLS_CALLBACK) (
    PVOID DllHandle,
    DWORD Reason,
    PVOID Reserved
    );

typedef struct _IMAGE_TLS_DIRECTORY64 {
    ULONGLONG   StartAddressOfRawData;
    ULONGLONG   EndAddressOfRawData;
    ULONGLONG   AddressOfIndex;         // PDWORD
    ULONGLONG   AddressOfCallBacks;     // PIMAGE_TLS_CALLBACK *;
    DWORD   SizeOfZeroFill;
    DWORD   Characteristics;
} IMAGE_TLS_DIRECTORY64;
typedef IMAGE_TLS_DIRECTORY64 * PIMAGE_TLS_DIRECTORY64;

typedef struct _IMAGE_TLS_DIRECTORY32 {
    DWORD   StartAddressOfRawData;
    DWORD   EndAddressOfRawData;
    DWORD   AddressOfIndex;             // PDWORD
    DWORD   AddressOfCallBacks;         // PIMAGE_TLS_CALLBACK *
    DWORD   SizeOfZeroFill;
    DWORD   Characteristics;
} IMAGE_TLS_DIRECTORY32;
typedef IMAGE_TLS_DIRECTORY32 * PIMAGE_TLS_DIRECTORY32;












typedef IMAGE_THUNK_DATA32              IMAGE_THUNK_DATA;
typedef PIMAGE_THUNK_DATA32             PIMAGE_THUNK_DATA;

typedef IMAGE_TLS_DIRECTORY32           IMAGE_TLS_DIRECTORY;
typedef PIMAGE_TLS_DIRECTORY32          PIMAGE_TLS_DIRECTORY;
#line 10468 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _IMAGE_IMPORT_DESCRIPTOR {
    union {
        DWORD   Characteristics;            // 0 for terminating null import descriptor
        DWORD   OriginalFirstThunk;         // RVA to original unbound IAT (PIMAGE_THUNK_DATA)
    };
    DWORD   TimeDateStamp;                  // 0 if not bound,
                                            // -1 if bound, and real date\time stamp
                                            //     in IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT (new BIND)
                                            // O.W. date/time stamp of DLL bound to (Old BIND)

    DWORD   ForwarderChain;                 // -1 if no forwarders
    DWORD   Name;
    DWORD   FirstThunk;                     // RVA to IAT (if bound this IAT has actual addresses)
} IMAGE_IMPORT_DESCRIPTOR;
typedef IMAGE_IMPORT_DESCRIPTOR  *PIMAGE_IMPORT_DESCRIPTOR;

//
// New format import descriptors pointed to by DataDirectory[ IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT ]
//

typedef struct _IMAGE_BOUND_IMPORT_DESCRIPTOR {
    DWORD   TimeDateStamp;
    WORD    OffsetModuleName;
    WORD    NumberOfModuleForwarderRefs;
// Array of zero or more IMAGE_BOUND_FORWARDER_REF follows
} IMAGE_BOUND_IMPORT_DESCRIPTOR,  *PIMAGE_BOUND_IMPORT_DESCRIPTOR;

typedef struct _IMAGE_BOUND_FORWARDER_REF {
    DWORD   TimeDateStamp;
    WORD    OffsetModuleName;
    WORD    Reserved;
} IMAGE_BOUND_FORWARDER_REF, *PIMAGE_BOUND_FORWARDER_REF;

//
// Resource Format.
//

//
// Resource directory consists of two counts, following by a variable length
// array of directory entries.  The first count is the number of entries at
// beginning of the array that have actual names associated with each entry.
// The entries are in ascending order, case insensitive strings.  The second
// count is the number of entries that immediately follow the named entries.
// This second count identifies the number of entries that have 16-bit integer
// Ids as their name.  These entries are also sorted in ascending order.
//
// This structure allows fast lookup by either name or number, but for any
// given resource entry only one form of lookup is supported, not both.
// This is consistant with the syntax of the .RC file and the .RES file.
//

typedef struct _IMAGE_RESOURCE_DIRECTORY {
    DWORD   Characteristics;
    DWORD   TimeDateStamp;
    WORD    MajorVersion;
    WORD    MinorVersion;
    WORD    NumberOfNamedEntries;
    WORD    NumberOfIdEntries;
//  IMAGE_RESOURCE_DIRECTORY_ENTRY DirectoryEntries[];
} IMAGE_RESOURCE_DIRECTORY, *PIMAGE_RESOURCE_DIRECTORY;



//
// Each directory contains the 32-bit Name of the entry and an offset,
// relative to the beginning of the resource directory of the data associated
// with this directory entry.  If the name of the entry is an actual text
// string instead of an integer Id, then the high order bit of the name field
// is set to one and the low order 31-bits are an offset, relative to the
// beginning of the resource directory of the string, which is of type
// IMAGE_RESOURCE_DIRECTORY_STRING.  Otherwise the high bit is clear and the
// low-order 16-bits are the integer Id that identify this resource directory
// entry. If the directory entry is yet another resource directory (i.e. a
// subdirectory), then the high order bit of the offset field will be
// set to indicate this.  Otherwise the high bit is clear and the offset
// field points to a resource data entry.
//

typedef struct _IMAGE_RESOURCE_DIRECTORY_ENTRY {
    union {
        struct {
            DWORD NameOffset:31;
            DWORD NameIsString:1;
        };
        DWORD   Name;
        WORD    Id;
    };
    union {
        DWORD   OffsetToData;
        struct {
            DWORD   OffsetToDirectory:31;
            DWORD   DataIsDirectory:1;
        };
    };
} IMAGE_RESOURCE_DIRECTORY_ENTRY, *PIMAGE_RESOURCE_DIRECTORY_ENTRY;

//
// For resource directory entries that have actual string names, the Name
// field of the directory entry points to an object of the following type.
// All of these string objects are stored together after the last resource
// directory entry and before the first resource data object.  This minimizes
// the impact of these variable length objects on the alignment of the fixed
// size directory entry objects.
//

typedef struct _IMAGE_RESOURCE_DIRECTORY_STRING {
    WORD    Length;
    CHAR    NameString[ 1 ];
} IMAGE_RESOURCE_DIRECTORY_STRING, *PIMAGE_RESOURCE_DIRECTORY_STRING;


typedef struct _IMAGE_RESOURCE_DIR_STRING_U {
    WORD    Length;
    WCHAR   NameString[ 1 ];
} IMAGE_RESOURCE_DIR_STRING_U, *PIMAGE_RESOURCE_DIR_STRING_U;


//
// Each resource data entry describes a leaf node in the resource directory
// tree.  It contains an offset, relative to the beginning of the resource
// directory of the data for the resource, a size field that gives the number
// of bytes of data at that offset, a CodePage that should be used when
// decoding code point values within the resource data.  Typically for new
// applications the code page would be the unicode code page.
//

typedef struct _IMAGE_RESOURCE_DATA_ENTRY {
    DWORD   OffsetToData;
    DWORD   Size;
    DWORD   CodePage;
    DWORD   Reserved;
} IMAGE_RESOURCE_DATA_ENTRY, *PIMAGE_RESOURCE_DATA_ENTRY;

//
// Load Configuration Directory Entry
//

typedef struct {
    DWORD   Size;
    DWORD   TimeDateStamp;
    WORD    MajorVersion;
    WORD    MinorVersion;
    DWORD   GlobalFlagsClear;
    DWORD   GlobalFlagsSet;
    DWORD   CriticalSectionDefaultTimeout;
    DWORD   DeCommitFreeBlockThreshold;
    DWORD   DeCommitTotalFreeThreshold;
    DWORD   LockPrefixTable;            // VA
    DWORD   MaximumAllocationSize;
    DWORD   VirtualMemoryThreshold;
    DWORD   ProcessHeapFlags;
    DWORD   ProcessAffinityMask;
    WORD    CSDVersion;
    WORD    Reserved1;
    DWORD   EditList;                   // VA
    DWORD   SecurityCookie;             // VA
    DWORD   SEHandlerTable;             // VA
    DWORD   SEHandlerCount;
} IMAGE_LOAD_CONFIG_DIRECTORY32, *PIMAGE_LOAD_CONFIG_DIRECTORY32;

typedef struct {
    DWORD      Size;
    DWORD      TimeDateStamp;
    WORD       MajorVersion;
    WORD       MinorVersion;
    DWORD      GlobalFlagsClear;
    DWORD      GlobalFlagsSet;
    DWORD      CriticalSectionDefaultTimeout;
    ULONGLONG  DeCommitFreeBlockThreshold;
    ULONGLONG  DeCommitTotalFreeThreshold;
    ULONGLONG  LockPrefixTable;         // VA
    ULONGLONG  MaximumAllocationSize;
    ULONGLONG  VirtualMemoryThreshold;
    ULONGLONG  ProcessAffinityMask;
    DWORD      ProcessHeapFlags;
    WORD       CSDVersion;
    WORD       Reserved1;
    ULONGLONG  EditList;                // VA
    ULONGLONG  SecurityCookie;          // VA
    ULONGLONG  SEHandlerTable;          // VA
    ULONGLONG  SEHandlerCount;
} IMAGE_LOAD_CONFIG_DIRECTORY64, *PIMAGE_LOAD_CONFIG_DIRECTORY64;





typedef IMAGE_LOAD_CONFIG_DIRECTORY32     IMAGE_LOAD_CONFIG_DIRECTORY;
typedef PIMAGE_LOAD_CONFIG_DIRECTORY32    PIMAGE_LOAD_CONFIG_DIRECTORY;
#line 10659 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// WIN CE Exception table format
//

//
// Function table entry format.  Function table is pointed to by the
// IMAGE_DIRECTORY_ENTRY_EXCEPTION directory entry.
//

typedef struct _IMAGE_CE_RUNTIME_FUNCTION_ENTRY {
    DWORD FuncStart;
    DWORD PrologLen : 8;
    DWORD FuncLen : 22;
    DWORD ThirtyTwoBit : 1;
    DWORD ExceptionFlag : 1;
} IMAGE_CE_RUNTIME_FUNCTION_ENTRY, * PIMAGE_CE_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY {
    ULONGLONG BeginAddress;
    ULONGLONG EndAddress;
    ULONGLONG ExceptionHandler;
    ULONGLONG HandlerData;
    ULONGLONG PrologEndAddress;
} IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY, *PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY {
    DWORD BeginAddress;
    DWORD EndAddress;
    DWORD ExceptionHandler;
    DWORD HandlerData;
    DWORD PrologEndAddress;
} IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY, *PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY;

typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY {
    DWORD BeginAddress;
    DWORD EndAddress;
    DWORD UnwindInfoAddress;
} _IMAGE_RUNTIME_FUNCTION_ENTRY, *_PIMAGE_RUNTIME_FUNCTION_ENTRY;

typedef  _IMAGE_RUNTIME_FUNCTION_ENTRY  IMAGE_IA64_RUNTIME_FUNCTION_ENTRY;
typedef _PIMAGE_RUNTIME_FUNCTION_ENTRY PIMAGE_IA64_RUNTIME_FUNCTION_ENTRY;








#line 10710 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"




#line 10715 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef  _IMAGE_RUNTIME_FUNCTION_ENTRY  IMAGE_RUNTIME_FUNCTION_ENTRY;
typedef _PIMAGE_RUNTIME_FUNCTION_ENTRY PIMAGE_RUNTIME_FUNCTION_ENTRY;

#line 10720 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Debug Format
//

typedef struct _IMAGE_DEBUG_DIRECTORY {
    DWORD   Characteristics;
    DWORD   TimeDateStamp;
    WORD    MajorVersion;
    WORD    MinorVersion;
    DWORD   Type;
    DWORD   SizeOfData;
    DWORD   AddressOfRawData;
    DWORD   PointerToRawData;
} IMAGE_DEBUG_DIRECTORY, *PIMAGE_DEBUG_DIRECTORY;















typedef struct _IMAGE_COFF_SYMBOLS_HEADER {
    DWORD   NumberOfSymbols;
    DWORD   LvaToFirstSymbol;
    DWORD   NumberOfLinenumbers;
    DWORD   LvaToFirstLinenumber;
    DWORD   RvaToFirstByteOfCode;
    DWORD   RvaToLastByteOfCode;
    DWORD   RvaToFirstByteOfData;
    DWORD   RvaToLastByteOfData;
} IMAGE_COFF_SYMBOLS_HEADER, *PIMAGE_COFF_SYMBOLS_HEADER;






typedef struct _FPO_DATA {
    DWORD       ulOffStart;             // offset 1st byte of function code
    DWORD       cbProcSize;             // # bytes in function
    DWORD       cdwLocals;              // # bytes in locals/4
    WORD        cdwParams;              // # bytes in params/4
    WORD        cbProlog : 8;           // # bytes in prolog
    WORD        cbRegs   : 3;           // # regs saved
    WORD        fHasSEH  : 1;           // TRUE if SEH in func
    WORD        fUseBP   : 1;           // TRUE if EBP has been allocated
    WORD        reserved : 1;           // reserved for future use
    WORD        cbFrame  : 2;           // frame type
} FPO_DATA, *PFPO_DATA;





typedef struct _IMAGE_DEBUG_MISC {
    DWORD       DataType;               // type of misc data, see defines
    DWORD       Length;                 // total length of record, rounded to four
                                        // byte multiple.
    BOOLEAN     Unicode;                // TRUE if data is unicode string
    BYTE        Reserved[ 3 ];
    BYTE        Data[ 1 ];              // Actual data
} IMAGE_DEBUG_MISC, *PIMAGE_DEBUG_MISC;


//
// Function table extracted from MIPS/ALPHA/IA64 images.  Does not contain
// information needed only for runtime support.  Just those fields for
// each entry needed by a debugger.
//

typedef struct _IMAGE_FUNCTION_ENTRY {
    DWORD   StartingAddress;
    DWORD   EndingAddress;
    DWORD   EndOfPrologue;
} IMAGE_FUNCTION_ENTRY, *PIMAGE_FUNCTION_ENTRY;

typedef struct _IMAGE_FUNCTION_ENTRY64 {
    ULONGLONG   StartingAddress;
    ULONGLONG   EndingAddress;
    union {
        ULONGLONG   EndOfPrologue;
        ULONGLONG   UnwindInfoAddress;
    };
} IMAGE_FUNCTION_ENTRY64, *PIMAGE_FUNCTION_ENTRY64;

//
// Debugging information can be stripped from an image file and placed
// in a separate .DBG file, whose file name part is the same as the
// image file name part (e.g. symbols for CMD.EXE could be stripped
// and placed in CMD.DBG).  This is indicated by the IMAGE_FILE_DEBUG_STRIPPED
// flag in the Characteristics field of the file header.  The beginning of
// the .DBG file contains the following structure which captures certain
// information from the image file.  This allows a debug to proceed even if
// the original image file is not accessable.  This header is followed by
// zero of more IMAGE_SECTION_HEADER structures, followed by zero or more
// IMAGE_DEBUG_DIRECTORY structures.  The latter structures and those in
// the image file contain file offsets relative to the beginning of the
// .DBG file.
//
// If symbols have been stripped from an image, the IMAGE_DEBUG_MISC structure
// is left in the image file, but not mapped.  This allows a debugger to
// compute the name of the .DBG file, from the name of the image in the
// IMAGE_DEBUG_MISC structure.
//

typedef struct _IMAGE_SEPARATE_DEBUG_HEADER {
    WORD        Signature;
    WORD        Flags;
    WORD        Machine;
    WORD        Characteristics;
    DWORD       TimeDateStamp;
    DWORD       CheckSum;
    DWORD       ImageBase;
    DWORD       SizeOfImage;
    DWORD       NumberOfSections;
    DWORD       ExportedNamesSize;
    DWORD       DebugDirectorySize;
    DWORD       SectionAlignment;
    DWORD       Reserved[2];
} IMAGE_SEPARATE_DEBUG_HEADER, *PIMAGE_SEPARATE_DEBUG_HEADER;

typedef struct _NON_PAGED_DEBUG_INFO {
    WORD        Signature;
    WORD        Flags;
    DWORD       Size;
    WORD        Machine;
    WORD        Characteristics;
    DWORD       TimeDateStamp;
    DWORD       CheckSum;
    DWORD       SizeOfImage;
    ULONGLONG   ImageBase;
    //DebugDirectorySize
    //IMAGE_DEBUG_DIRECTORY
} NON_PAGED_DEBUG_INFO, *PNON_PAGED_DEBUG_INFO;







#line 10871 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



                                                // old checksum didn't match.

//
//  The .arch section is made up of headers, each describing an amask position/value
//  pointing to an array of IMAGE_ARCHITECTURE_ENTRY's.  Each "array" (both the header
//  and entry arrays) are terminiated by a quadword of 0xffffffffL.
//
//  NOTE: There may be quadwords of 0 sprinkled around and must be skipped.
//

typedef struct _ImageArchitectureHeader {
    unsigned int AmaskValue: 1;                 // 1 -> code section depends on mask bit
                                                // 0 -> new instruction depends on mask bit
    int :7;                                     // MBZ
    unsigned int AmaskShift: 8;                 // Amask bit in question for this fixup
    int :16;                                    // MBZ
    DWORD FirstEntryRVA;                        // RVA into .arch section to array of ARCHITECTURE_ENTRY's
} IMAGE_ARCHITECTURE_HEADER, *PIMAGE_ARCHITECTURE_HEADER;

typedef struct _ImageArchitectureEntry {
    DWORD FixupInstRVA;                         // RVA of instruction to fixup
    DWORD NewInst;                              // fixup instruction (see alphaops.h)
} IMAGE_ARCHITECTURE_ENTRY, *PIMAGE_ARCHITECTURE_ENTRY;

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    poppack.h

Abstract:

    This file turns packing of structures off.  (That is, it enables
    automatic alignment of structure fields.)  An include file is needed
    because various compilers do this in different ways.

    poppack.h is the complement to pshpack?.h.  An inclusion of poppack.h
    MUST ALWAYS be preceded by an inclusion of one of pshpack?.h, in one-to-one
    correspondence.

    For Microsoft compatible compilers, this file uses the pop option
    to the pack pragma so that it can restore the previous saved by the
    pshpack?.h include file.

--*/



#pragma warning(disable:4103)

#pragma pack(pop)


#line 33 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"


#line 36 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"
#line 37 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\poppack.h"

#line 10899 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

// The following structure defines the new import object.  Note the values of the first two fields,
// which must be set as stated in order to differentiate old and new import members.
// Following this structure, the linker emits two null-terminated strings used to recreate the
// import at the time of use.  The first string is the import's name, the second is the dll's name.



typedef struct IMPORT_OBJECT_HEADER {
    WORD    Sig1;                       // Must be IMAGE_FILE_MACHINE_UNKNOWN
    WORD    Sig2;                       // Must be IMPORT_OBJECT_HDR_SIG2.
    WORD    Version;
    WORD    Machine;
    DWORD   TimeDateStamp;              // Time/date stamp
    DWORD   SizeOfData;                 // particularly useful for incremental links

    union {
        WORD    Ordinal;                // if grf & IMPORT_OBJECT_ORDINAL
        WORD    Hint;
    };

    WORD    Type : 2;                   // IMPORT_TYPE
    WORD    NameType : 3;               // IMPORT_NAME_TYPE
    WORD    Reserved : 11;              // Reserved. Must be zero.
} IMPORT_OBJECT_HEADER;

typedef enum IMPORT_OBJECT_TYPE
{
    IMPORT_OBJECT_CODE = 0,
    IMPORT_OBJECT_DATA = 1,
    IMPORT_OBJECT_CONST = 2,
} IMPORT_OBJECT_TYPE;

typedef enum IMPORT_OBJECT_NAME_TYPE
{
    IMPORT_OBJECT_ORDINAL = 0,          // Import by ordinal
    IMPORT_OBJECT_NAME = 1,             // Import name == public symbol name.
    IMPORT_OBJECT_NAME_NO_PREFIX = 2,   // Import name == public symbol name skipping leading ?, @, or optionally _.
    IMPORT_OBJECT_NAME_UNDECORATE = 3,  // Import name == public symbol name skipping leading ?, @, or optionally _
                                        // and truncating at first @
} IMPORT_OBJECT_NAME_TYPE;





typedef enum ReplacesCorHdrNumericDefines
{
// COM+ Header entry point flags.
    COMIMAGE_FLAGS_ILONLY               =0x00000001,
    COMIMAGE_FLAGS_32BITREQUIRED        =0x00000002,
    COMIMAGE_FLAGS_IL_LIBRARY           =0x00000004,
    COMIMAGE_FLAGS_STRONGNAMESIGNED     =0x00000008,
    COMIMAGE_FLAGS_TRACKDEBUGDATA       =0x00010000,

// Version flags for image.
    COR_VERSION_MAJOR_V2                =2,
    COR_VERSION_MAJOR                   =COR_VERSION_MAJOR_V2,
    COR_VERSION_MINOR                   =0,
    COR_DELETED_NAME_LENGTH             =8,
    COR_VTABLEGAP_NAME_LENGTH           =8,

// Maximum size of a NativeType descriptor.
    NATIVE_TYPE_MAX_CB                  =1,
    COR_ILMETHOD_SECT_SMALL_MAX_DATASIZE=0xFF,

// #defines for the MIH FLAGS
    IMAGE_COR_MIH_METHODRVA             =0x01,
    IMAGE_COR_MIH_EHRVA                 =0x02,
    IMAGE_COR_MIH_BASICBLOCK            =0x08,

// V-table constants
    COR_VTABLE_32BIT                    =0x01,          // V-table slots are 32-bits in size.
    COR_VTABLE_64BIT                    =0x02,          // V-table slots are 64-bits in size.
    COR_VTABLE_FROM_UNMANAGED           =0x04,          // If set, transition from unmanaged.
    COR_VTABLE_FROM_UNMANAGED_RETAIN_APPDOMAIN  =0x08,  // If set, transition from unmanaged with keeping the current appdomain.
    COR_VTABLE_CALL_MOST_DERIVED        =0x10,          // Call most derived method described by

// EATJ constants
    IMAGE_COR_EATJ_THUNK_SIZE           =32,            // Size of a jump thunk reserved range.

// Max name lengths
    //@todo: Change to unlimited name lengths.
    MAX_CLASS_NAME                      =1024,
    MAX_PACKAGE_NAME                    =1024,
} ReplacesCorHdrNumericDefines;

// CLR 2.0 header structure.
typedef struct IMAGE_COR20_HEADER
{
    // Header versioning
    DWORD                   cb;
    WORD                    MajorRuntimeVersion;
    WORD                    MinorRuntimeVersion;

    // Symbol table and startup information
    IMAGE_DATA_DIRECTORY    MetaData;
    DWORD                   Flags;
    DWORD                   EntryPointToken;

    // Binding information
    IMAGE_DATA_DIRECTORY    Resources;
    IMAGE_DATA_DIRECTORY    StrongNameSignature;

    // Regular fixup and binding information
    IMAGE_DATA_DIRECTORY    CodeManagerTable;
    IMAGE_DATA_DIRECTORY    VTableFixups;
    IMAGE_DATA_DIRECTORY    ExportAddressTableJumps;

    // Precompiled image info (internal use only - set to zero)
    IMAGE_DATA_DIRECTORY    ManagedNativeHeader;

} IMAGE_COR20_HEADER, *PIMAGE_COR20_HEADER;

#line 11014 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// End Image Format
//

//
// for move macros
//






#line 11029 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
























#line 11054 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





#line 11060 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



























#line 11088 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef union _SLIST_HEADER {
    ULONGLONG Alignment;
    struct {
        SINGLE_LIST_ENTRY Next;
        WORD   Depth;
        WORD   Sequence;
    };
} SLIST_HEADER, *PSLIST_HEADER;

#line 11099 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 11101 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


__declspec(dllimport)
void
__stdcall
RtlInitializeSListHead (
     PSLIST_HEADER ListHead
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
RtlFirstEntrySList (
     const SLIST_HEADER *ListHead
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
RtlInterlockedPopEntrySList (
     PSLIST_HEADER ListHead
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
RtlInterlockedPushEntrySList (
     PSLIST_HEADER ListHead,
     PSINGLE_LIST_ENTRY ListEntry
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
RtlInterlockedFlushSList (
     PSLIST_HEADER ListHead
    );

__declspec(dllimport)
WORD  
__stdcall
RtlQueryDepthSList (
     PSLIST_HEADER ListHead
    );

// begin_ntddk




//
// Run once
//



//
// Run once flags
//





//
// The context stored in the run once structure must leave the following number
// of low order bits unused.
//



typedef union _RTL_RUN_ONCE {       
    PVOID Ptr;                      
} RTL_RUN_ONCE, *PRTL_RUN_ONCE;     

typedef
DWORD /* LOGICAL */
(__stdcall *PRTL_RUN_ONCE_INIT_FN) (
     PRTL_RUN_ONCE RunOnce,
     PVOID Parameter,
     PVOID *Context
    );

#line 11185 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



void
//FORCEINLINE
RtlRunOnceInitialize (
     PRTL_RUN_ONCE RunOnce
    );

#line 11195 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

DWORD   
RtlRunOnceExecuteOnce (
     PRTL_RUN_ONCE RunOnce,
      PRTL_RUN_ONCE_INIT_FN InitFn,
     PVOID Parameter,
     PVOID *Context
    );

DWORD   
RtlRunOnceBeginInitialize (
     PRTL_RUN_ONCE RunOnce,
     DWORD Flags,
     PVOID *Context
    );

DWORD   
RtlRunOnceComplete (
     PRTL_RUN_ONCE RunOnce,
     DWORD Flags,
     PVOID Context
    );
















__forceinline
DWORD
HEAP_MAKE_TAG_FLAGS (
     DWORD TagBase,
     DWORD Tag
    )

{
    __pragma(warning(push)) __pragma(warning(disable : 4548)) do {__noop(TagBase);} while((0,0) __pragma(warning(pop)) );
    return ((DWORD)((TagBase) + ((Tag) << 18)));
}
#line 11245 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


__declspec(dllimport)
WORD  
__stdcall
RtlCaptureStackBackTrace(
     DWORD FramesToSkip,
     DWORD FramesToCapture,
     PVOID *BackTrace,
     PDWORD BackTraceHash
   );
#line 11257 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


__declspec(dllimport)
void
__stdcall
RtlCaptureContext (
     PCONTEXT ContextRecord
    );
#line 11266 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"





















































#line 11320 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


__declspec(dllimport)
SIZE_T
__stdcall
RtlCompareMemory (
    const void *Source1,
    const void *Source2,
    SIZE_T Length
    );

#line 11332 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"










__forceinline
PVOID
RtlSecureZeroMemory(
     PVOID ptr,
     SIZE_T cnt
    )
{
    volatile char *vptr = (volatile char *)ptr;





#line 11356 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

    while (cnt) {
        *vptr = 0;
        vptr++;
        cnt--;
    }

#line 11364 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

    return ptr;
}

#line 11369 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



















typedef struct _MESSAGE_RESOURCE_ENTRY {
    WORD   Length;
    WORD   Flags;
    BYTE  Text[ 1 ];
} MESSAGE_RESOURCE_ENTRY, *PMESSAGE_RESOURCE_ENTRY;



typedef struct _MESSAGE_RESOURCE_BLOCK {
    DWORD LowId;
    DWORD HighId;
    DWORD OffsetToEntries;
} MESSAGE_RESOURCE_BLOCK, *PMESSAGE_RESOURCE_BLOCK;

typedef struct _MESSAGE_RESOURCE_DATA {
    DWORD NumberOfBlocks;
    MESSAGE_RESOURCE_BLOCK Blocks[ 1 ];
} MESSAGE_RESOURCE_DATA, *PMESSAGE_RESOURCE_DATA;

typedef struct _OSVERSIONINFOA {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    CHAR   szCSDVersion[ 128 ];     // Maintenance string for PSS usage
} OSVERSIONINFOA, *POSVERSIONINFOA, *LPOSVERSIONINFOA;

typedef struct _OSVERSIONINFOW {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    WCHAR  szCSDVersion[ 128 ];     // Maintenance string for PSS usage
} OSVERSIONINFOW, *POSVERSIONINFOW, *LPOSVERSIONINFOW, RTL_OSVERSIONINFOW, *PRTL_OSVERSIONINFOW;

typedef OSVERSIONINFOW OSVERSIONINFO;
typedef POSVERSIONINFOW POSVERSIONINFO;
typedef LPOSVERSIONINFOW LPOSVERSIONINFO;




#line 11433 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

typedef struct _OSVERSIONINFOEXA {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    CHAR   szCSDVersion[ 128 ];     // Maintenance string for PSS usage
    WORD   wServicePackMajor;
    WORD   wServicePackMinor;
    WORD   wSuiteMask;
    BYTE  wProductType;
    BYTE  wReserved;
} OSVERSIONINFOEXA, *POSVERSIONINFOEXA, *LPOSVERSIONINFOEXA;
typedef struct _OSVERSIONINFOEXW {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    WCHAR  szCSDVersion[ 128 ];     // Maintenance string for PSS usage
    WORD   wServicePackMajor;
    WORD   wServicePackMinor;
    WORD   wSuiteMask;
    BYTE  wProductType;
    BYTE  wReserved;
} OSVERSIONINFOEXW, *POSVERSIONINFOEXW, *LPOSVERSIONINFOEXW, RTL_OSVERSIONINFOEXW, *PRTL_OSVERSIONINFOEXW;

typedef OSVERSIONINFOEXW OSVERSIONINFOEX;
typedef POSVERSIONINFOEXW POSVERSIONINFOEX;
typedef LPOSVERSIONINFOEXW LPOSVERSIONINFOEX;




#line 11469 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// RtlVerifyVersionInfo() conditions
//












//
// RtlVerifyVersionInfo() type mask bits
//










//
// RtlVerifyVersionInfo() os product type values
//





//
// dwPlatformId defines:
//






//
//
// VerifyVersionInfo() macro to set the condition mask
//
// For documentation sakes here's the old version of the macro that got
// changed to call an API
// #define VER_SET_CONDITION(_m_,_t_,_c_)  _m_=(_m_|(_c_<<(1<<_t_)))
//





__declspec(dllimport)
ULONGLONG
__stdcall
VerSetConditionMask(
          ULONGLONG   ConditionMask,
          DWORD   TypeMask,
          BYTE    Condition
        );
#line 11537 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//



__declspec(dllimport)
BOOLEAN
__stdcall
RtlGetProductInfo(
      DWORD  OSMajorVersion,
      DWORD  OSMinorVersion,
      DWORD  SpMajorVersion,
      DWORD  SpMinorVersion,
     PDWORD ReturnedProductType
    );

#line 11554 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


typedef struct _RTL_CRITICAL_SECTION_DEBUG {
    WORD   Type;
    WORD   CreatorBackTraceIndex;
    struct _RTL_CRITICAL_SECTION *CriticalSection;
    LIST_ENTRY ProcessLocksList;
    DWORD EntryCount;
    DWORD ContentionCount;
    DWORD Flags;
    WORD   CreatorBackTraceIndexHigh;
    WORD   SpareWORD  ;
} RTL_CRITICAL_SECTION_DEBUG, *PRTL_CRITICAL_SECTION_DEBUG, RTL_RESOURCE_DEBUG, *PRTL_RESOURCE_DEBUG;




//
// These flags define the upper byte of the critical section SpinCount field
//






//
// These flags define possible values stored in the Flags field of a critsec debuginfo.
//


#pragma pack(push, 8)

typedef struct _RTL_CRITICAL_SECTION {
    PRTL_CRITICAL_SECTION_DEBUG DebugInfo;

    //
    //  The following three fields control entering and exiting the critical
    //  section for the resource
    //

    LONG LockCount;
    LONG RecursionCount;
    HANDLE OwningThread;        // from the thread's ClientId->UniqueThread
    HANDLE LockSemaphore;
    ULONG_PTR SpinCount;        // force size on 64-bit systems when packed
} RTL_CRITICAL_SECTION, *PRTL_CRITICAL_SECTION;

#pragma pack(pop)

typedef struct _RTL_SRWLOCK {                            
        PVOID Ptr;                                       
} RTL_SRWLOCK, *PRTL_SRWLOCK;                            

typedef struct _RTL_CONDITION_VARIABLE {                    
        PVOID Ptr;                                       
} RTL_CONDITION_VARIABLE, *PRTL_CONDITION_VARIABLE;      


typedef LONG (__stdcall *PVECTORED_EXCEPTION_HANDLER)(
    struct _EXCEPTION_POINTERS *ExceptionInfo
    );

typedef enum _HEAP_INFORMATION_CLASS {

    HeapCompatibilityInformation,
    HeapEnableTerminationOnCorruption


} HEAP_INFORMATION_CLASS;













typedef void (__stdcall * WAITORTIMERCALLBACKFUNC) (PVOID, BOOLEAN );   
typedef void (__stdcall * WORKERCALLBACKFUNC) (PVOID );                 
typedef void (__stdcall * APC_CALLBACK_FUNCTION) (DWORD   , PVOID, PVOID); 
typedef
void
(__stdcall *PFLS_CALLBACK_FUNCTION) (
     PVOID lpFlsData
    );



typedef enum _ACTIVATION_CONTEXT_INFO_CLASS {
    ActivationContextBasicInformation                       = 1,
    ActivationContextDetailedInformation                    = 2,
    AssemblyDetailedInformationInActivationContext          = 3,
    FileInformationInAssemblyOfAssemblyInActivationContext  = 4,
    RunlevelInformationInActivationContext                  = 5,
    MaxActivationContextInfoClass,

    //
    // compatibility with old names
    //
    AssemblyDetailedInformationInActivationContxt           = 3,
    FileInformationInAssemblyOfAssemblyInActivationContxt   = 4
} ACTIVATION_CONTEXT_INFO_CLASS;




typedef struct _ACTIVATION_CONTEXT_QUERY_INDEX {
    DWORD ulAssemblyIndex;
    DWORD ulFileIndexInAssembly;
} ACTIVATION_CONTEXT_QUERY_INDEX, * PACTIVATION_CONTEXT_QUERY_INDEX;

typedef const struct _ACTIVATION_CONTEXT_QUERY_INDEX * PCACTIVATION_CONTEXT_QUERY_INDEX;







typedef struct _ASSEMBLY_FILE_DETAILED_INFORMATION {
    DWORD ulFlags;
    DWORD ulFilenameLength;
    DWORD ulPathLength;

    PCWSTR lpFileName;
    PCWSTR lpFilePath;
} ASSEMBLY_FILE_DETAILED_INFORMATION, *PASSEMBLY_FILE_DETAILED_INFORMATION;
typedef const ASSEMBLY_FILE_DETAILED_INFORMATION *PCASSEMBLY_FILE_DETAILED_INFORMATION;

//
// compatibility with old names
// The new names use "file" consistently.
//





typedef struct _ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION {
    DWORD ulFlags;
    DWORD ulEncodedAssemblyIdentityLength;      // in bytes
    DWORD ulManifestPathType;                   // ACTIVATION_CONTEXT_PATH_TYPE_*
    DWORD ulManifestPathLength;                 // in bytes
    LARGE_INTEGER liManifestLastWriteTime;      // FILETIME
    DWORD ulPolicyPathType;                     // ACTIVATION_CONTEXT_PATH_TYPE_*
    DWORD ulPolicyPathLength;                   // in bytes
    LARGE_INTEGER liPolicyLastWriteTime;        // FILETIME
    DWORD ulMetadataSatelliteRosterIndex;

    DWORD ulManifestVersionMajor;               // 1
    DWORD ulManifestVersionMinor;               // 0
    DWORD ulPolicyVersionMajor;                 // 0
    DWORD ulPolicyVersionMinor;                 // 0
    DWORD ulAssemblyDirectoryNameLength;        // in bytes

    PCWSTR lpAssemblyEncodedAssemblyIdentity;
    PCWSTR lpAssemblyManifestPath;
    PCWSTR lpAssemblyPolicyPath;
    PCWSTR lpAssemblyDirectoryName;

    DWORD  ulFileCount;
} ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION, * PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION;

typedef const struct _ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION * PCACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION ;

typedef enum
{
    ACTCTX_RUN_LEVEL_UNSPECIFIED = 0,
    ACTCTX_RUN_LEVEL_AS_INVOKER,
    ACTCTX_RUN_LEVEL_HIGHEST_AVAILABLE,
    ACTCTX_RUN_LEVEL_REQUIRE_ADMIN,
    ACTCTX_RUN_LEVEL_NUMBERS
} ACTCTX_REQUESTED_RUN_LEVEL;

typedef struct _ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION {
    DWORD ulFlags;
    ACTCTX_REQUESTED_RUN_LEVEL  RunLevel;
    DWORD UiAccess;
} ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION, * PACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION;

typedef const struct _ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION * PCACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION ;

typedef struct _ACTIVATION_CONTEXT_DETAILED_INFORMATION {
    DWORD dwFlags;
    DWORD ulFormatVersion;
    DWORD ulAssemblyCount;
    DWORD ulRootManifestPathType;
    DWORD ulRootManifestPathChars;
    DWORD ulRootConfigurationPathType;
    DWORD ulRootConfigurationPathChars;
    DWORD ulAppDirPathType;
    DWORD ulAppDirPathChars;
    PCWSTR lpRootManifestPath;
    PCWSTR lpRootConfigurationPath;
    PCWSTR lpAppDirPath;
} ACTIVATION_CONTEXT_DETAILED_INFORMATION, *PACTIVATION_CONTEXT_DETAILED_INFORMATION;

typedef const struct _ACTIVATION_CONTEXT_DETAILED_INFORMATION *PCACTIVATION_CONTEXT_DETAILED_INFORMATION;






//
// Defines for the READ flags for Eventlogging
//





//
// The types of events that can be logged.
//







//
// Defines for the WRITE flags used by Auditing for paired events
// These are not implemented in Product 1
//







//
// Structure that defines the header of the Eventlog record. This is the
// fixed-sized portion before all the variable-length strings, binary
// data and pad bytes.
//
// TimeGenerated is the time it was generated at the client.
// TimeWritten is the time it was put into the log at the server end.
//

typedef struct _EVENTLOGRECORD {
    DWORD  Length;        // Length of full record
    DWORD  Reserved;      // Used by the service
    DWORD  RecordNumber;  // Absolute record number
    DWORD  TimeGenerated; // Seconds since 1-1-1970
    DWORD  TimeWritten;   // Seconds since 1-1-1970
    DWORD  EventID;
    WORD   EventType;
    WORD   NumStrings;
    WORD   EventCategory;
    WORD   ReservedFlags; // For use with paired events (auditing)
    DWORD  ClosingRecordNumber; // For use with paired events (auditing)
    DWORD  StringOffset;  // Offset from beginning of record
    DWORD  UserSidLength;
    DWORD  UserSidOffset;
    DWORD  DataLength;
    DWORD  DataOffset;    // Offset from beginning of record
    //
    // Then follow:
    //
    // WCHAR SourceName[]
    // WCHAR Computername[]
    // SID   UserSid
    // WCHAR Strings[]
    // BYTE  Data[]
    // CHAR  Pad[]
    // DWORD Length;
    //
} EVENTLOGRECORD, *PEVENTLOGRECORD;

//SS: start of changes to support clustering
//SS: ideally the



#pragma warning(push)
#line 11839 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
#pragma warning(disable : 4200)
typedef struct _EVENTSFORLOGFILE{
    DWORD           ulSize;
    WCHAR           szLogicalLogFile[256];        //name of the logical file-security/application/system
    DWORD           ulNumRecords;
    EVENTLOGRECORD  pEventLogRecords[];
}EVENTSFORLOGFILE, *PEVENTSFORLOGFILE;

typedef struct _PACKEDEVENTINFO{
    DWORD               ulSize;  //total size of the structure
    DWORD               ulNumEventsForLogFile; //number of EventsForLogFile structure that follow
    DWORD               ulOffsets[];           //the offsets from the start of this structure to the EVENTSFORLOGFILE structure
}PACKEDEVENTINFO, *PPACKEDEVENTINFO;


#pragma warning(pop)


#line 11858 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
//SS: end of changes to support clustering
//

// begin_wdm 
//
// Registry Specific Access Rights.
//







































//
// Open/Create Options
//




                                                    // when system is rebooted


                                                    // when system is rebooted


                                                    // symbolic link


                                                    // special access rules
                                                    // privilege required











//
// Key creation/open disposition
//




//
// hive format to be used by Reg(Nt)SaveKeyEx
//




//
// Key restore & hive load flags
//












//
// Unload Flags
//


//
// Notify filter values
//











 
// end_wdm 

//
//
// Predefined Value Types.
//




                                            // (with environment variable references)












// end_wdm

// begin_wdm
//
// Service Types (Bit Mask)
//





















//
// Start Type
//







//
// Error control type
//





//
//
// Define the registry driver node enumerations
//

typedef enum _CM_SERVICE_NODE_TYPE {
    DriverType               = 0x00000001,
    FileSystemType           = 0x00000002,
    Win32ServiceOwnProcess   = 0x00000010,
    Win32ServiceShareProcess = 0x00000020,
    AdapterType              = 0x00000004,
    RecognizerType           = 0x00000008
} SERVICE_NODE_TYPE;

typedef enum _CM_SERVICE_LOAD_TYPE {
    BootLoad    = 0x00000000,
    SystemLoad  = 0x00000001,
    AutoLoad    = 0x00000002,
    DemandLoad  = 0x00000003,
    DisableLoad = 0x00000004
} SERVICE_LOAD_TYPE;

typedef enum _CM_ERROR_CONTROL_TYPE {
    IgnoreError   = 0x00000000,
    NormalError   = 0x00000001,
    SevereError   = 0x00000002,
    CriticalError = 0x00000003
} SERVICE_ERROR_TYPE;



//
// IOCTL_TAPE_ERASE definitions
//




typedef struct _TAPE_ERASE {
    DWORD Type;
    BOOLEAN Immediate;
} TAPE_ERASE, *PTAPE_ERASE;

//
// IOCTL_TAPE_PREPARE definitions
//








typedef struct _TAPE_PREPARE {
    DWORD Operation;
    BOOLEAN Immediate;
} TAPE_PREPARE, *PTAPE_PREPARE;

//
// IOCTL_TAPE_WRITE_MARKS definitions
//






typedef struct _TAPE_WRITE_MARKS {
    DWORD Type;
    DWORD Count;
    BOOLEAN Immediate;
} TAPE_WRITE_MARKS, *PTAPE_WRITE_MARKS;

//
// IOCTL_TAPE_GET_POSITION definitions
//





typedef struct _TAPE_GET_POSITION {
    DWORD Type;
    DWORD Partition;
    LARGE_INTEGER Offset;
} TAPE_GET_POSITION, *PTAPE_GET_POSITION;

//
// IOCTL_TAPE_SET_POSITION definitions
//












typedef struct _TAPE_SET_POSITION {
    DWORD Method;
    DWORD Partition;
    LARGE_INTEGER Offset;
    BOOLEAN Immediate;
} TAPE_SET_POSITION, *PTAPE_SET_POSITION;

//
// IOCTL_TAPE_GET_DRIVE_PARAMS definitions
//

//
// Definitions for FeaturesLow parameter
//
































//                                              //can't be a low features bit!
//                                              //reserved; high features only

//
// Definitions for FeaturesHigh parameter
//









































typedef struct _TAPE_GET_DRIVE_PARAMETERS {
    BOOLEAN ECC;
    BOOLEAN Compression;
    BOOLEAN DataPadding;
    BOOLEAN ReportSetmarks;
    DWORD DefaultBlockSize;
    DWORD MaximumBlockSize;
    DWORD MinimumBlockSize;
    DWORD MaximumPartitionCount;
    DWORD FeaturesLow;
    DWORD FeaturesHigh;
    DWORD EOTWarningZoneSize;
} TAPE_GET_DRIVE_PARAMETERS, *PTAPE_GET_DRIVE_PARAMETERS;

//
// IOCTL_TAPE_SET_DRIVE_PARAMETERS definitions
//

typedef struct _TAPE_SET_DRIVE_PARAMETERS {
    BOOLEAN ECC;
    BOOLEAN Compression;
    BOOLEAN DataPadding;
    BOOLEAN ReportSetmarks;
    DWORD EOTWarningZoneSize;
} TAPE_SET_DRIVE_PARAMETERS, *PTAPE_SET_DRIVE_PARAMETERS;

//
// IOCTL_TAPE_GET_MEDIA_PARAMETERS definitions
//

typedef struct _TAPE_GET_MEDIA_PARAMETERS {
    LARGE_INTEGER Capacity;
    LARGE_INTEGER Remaining;
    DWORD BlockSize;
    DWORD PartitionCount;
    BOOLEAN WriteProtected;
} TAPE_GET_MEDIA_PARAMETERS, *PTAPE_GET_MEDIA_PARAMETERS;

//
// IOCTL_TAPE_SET_MEDIA_PARAMETERS definitions
//

typedef struct _TAPE_SET_MEDIA_PARAMETERS {
    DWORD BlockSize;
} TAPE_SET_MEDIA_PARAMETERS, *PTAPE_SET_MEDIA_PARAMETERS;

//
// IOCTL_TAPE_CREATE_PARTITION definitions
//





typedef struct _TAPE_CREATE_PARTITION {
    DWORD Method;
    DWORD Count;
    DWORD Size;
} TAPE_CREATE_PARTITION, *PTAPE_CREATE_PARTITION;


//
// WMI Methods
//






typedef struct _TAPE_WMI_OPERATIONS {
   DWORD Method;
   DWORD DataBufferSize;
   PVOID DataBuffer;
} TAPE_WMI_OPERATIONS, *PTAPE_WMI_OPERATIONS;

//
// Type of drive errors
//
typedef enum _TAPE_DRIVE_PROBLEM_TYPE {
   TapeDriveProblemNone, TapeDriveReadWriteWarning,
   TapeDriveReadWriteError, TapeDriveReadWarning,
   TapeDriveWriteWarning, TapeDriveReadError,
   TapeDriveWriteError, TapeDriveHardwareError,
   TapeDriveUnsupportedMedia, TapeDriveScsiConnectionError,
   TapeDriveTimetoClean, TapeDriveCleanDriveNow,
   TapeDriveMediaLifeExpired, TapeDriveSnappedTape
} TAPE_DRIVE_PROBLEM_TYPE;






extern "C" {
#line 12342 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\ktmtypes.h"
/*++

Copyright (c) 2000  Microsoft Corporation

Module Name:

    ktmtypes.h

Abstract:

    Common types for KTM exposed at both the Nt- and Win32-layer.

Revision History:

--*/

// begin_wdm begin_winnt





extern "C" {
#line 25 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\ktmtypes.h"


typedef GUID UOW, *PUOW;
typedef GUID CRM_PROTOCOL_ID, *PCRM_PROTOCOL_ID;

//
// Define the TransactionManager option values
//











//
// Define the Transaction option values
//





//
// Define the ResourceManager option values
//






//
// Define the RegisterProtocol option values
//






//
// Define the Enlistment option values
//





typedef ULONG NOTIFICATION_MASK;

































//
// Path to the transaction manager objects in the NT
// object namespace.
//





//
// The following three defines are here to ease the allocation
// of string buffers which are to contain a fully qualified 
// transaction manager object name, e.g., \Transaction\{GUID}
//





// TODO: warning, duplicated def in tm.h.
typedef struct _TRANSACTION_NOTIFICATION {
    PVOID         TransactionKey;
    ULONG         TransactionNotification;
    LARGE_INTEGER TmVirtualClock;
    ULONG         ArgumentLength;
} TRANSACTION_NOTIFICATION, *PTRANSACTION_NOTIFICATION;

typedef struct _TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT {
    GUID   EnlistmentId;
    UOW    UOW;
} TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT, *PTRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT;

typedef ULONG SAVEPOINT_ID, *PSAVEPOINT_ID;

typedef struct _TRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT {
    SAVEPOINT_ID SavepointId;
} TRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT, *PTRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT;

typedef struct _TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT {
    ULONG PropagationCookie;
    GUID  UOW;
    GUID  TmIdentity;
    ULONG BufferLength;
    // Bufferlength bytes of Buffer follow
} TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT, *PTRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT;

typedef struct _TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT {
    ULONG MarshalCookie;
    GUID  UOW;
} TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT, *PTRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT;

typedef TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT TRANSACTION_NOTIFICATION_PROMOTE_ARGUMENT, *PTRANSACTION_NOTIFICATION_PROMOTE_ARGUMENT;







typedef struct _KCRM_MARSHAL_HEADER {
    ULONG              VersionMajor;
    ULONG              VersionMinor;
    ULONG              NumProtocols;
    ULONG              Unused;        // for alignment purposes
} KCRM_MARSHAL_HEADER, *PKCRM_MARSHAL_HEADER, * PRKCRM_MARSHAL_HEADER;

typedef struct _KCRM_TRANSACTION_BLOB {
    UOW                UOW;
    GUID               TmIdentity;
    ULONG              IsolationLevel;
    ULONG              IsolationFlags;
    ULONG              Timeout;
    WCHAR              Description[64];
} KCRM_TRANSACTION_BLOB, *PKCRM_TRANSACTION_BLOB, * PRKCRM_TRANSACTION_BLOB;

typedef struct _KCRM_PROTOCOL_BLOB {
    CRM_PROTOCOL_ID    ProtocolId;
     ULONG StaticInfoLength;
    ULONG              TransactionIdInfoLength; //??? ProtocolDynamicInfoLength;
    ULONG              Unused1;        // for alignment purposes
    ULONG              Unused2;        // for alignment purposes
} KCRM_PROTOCOL_BLOB, *PKCRM_PROTOCOL_BLOB, * PRKCRM_PROTOCOL_BLOB;


}
#line 198 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\ktmtypes.h"

#line 200 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\ktmtypes.h"

#line 12345 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

//
// Types for Nt level TM calls
//

//
// KTM Tm object rights
//






// The following right is intended for DTC's use only; it will be
// deprecated, and no one else should take a dependency on it.


//
// Generic mappings for transaction manager rights.
//



















//
// KTM transaction object rights.
//









//
// Generic mappings for transaction rights.
// Resource managers, when enlisting, should generally use the macro
// TRANSACTION_RESOURCE_MANAGER_RIGHTS when opening a transaction.
// It's the same as generic read and write except that it does not allow
// a commit decision to be made.
//
































//
// KTM resource manager object rights.
//








//
// Generic mappings for resource manager rights.
//


























//
// KTM enlistment object rights.
//






//
// Generic mappings for enlistment rights.
//




















//
// Transaction outcomes.
//
// TODO: warning, must match values in KTRANSACTION_OUTCOME duplicated def 
// in tm.h.
//

typedef enum _TRANSACTION_OUTCOME {
    TransactionOutcomeUndetermined = 1,
    TransactionOutcomeCommitted,
    TransactionOutcomeAborted,
} TRANSACTION_OUTCOME;


typedef enum _TRANSACTION_STATE {
    TransactionStateNormal = 1,
    TransactionStateIndoubt,
    TransactionStateCommittedNotify,
} TRANSACTION_STATE;


typedef struct _TRANSACTION_BASIC_INFORMATION {
    GUID    TransactionId;
    DWORD   State;
    DWORD   Outcome;
} TRANSACTION_BASIC_INFORMATION, *PTRANSACTION_BASIC_INFORMATION;

typedef struct _TRANSACTIONMANAGER_BASIC_INFORMATION {
    GUID    TmIdentity;
    LARGE_INTEGER VirtualClock;
} TRANSACTIONMANAGER_BASIC_INFORMATION, *PTRANSACTIONMANAGER_BASIC_INFORMATION;

typedef struct _TRANSACTIONMANAGER_LOG_INFORMATION {
    GUID  LogIdentity;
} TRANSACTIONMANAGER_LOG_INFORMATION, *PTRANSACTIONMANAGER_LOG_INFORMATION;

typedef struct _TRANSACTIONMANAGER_LOGPATH_INFORMATION {
    DWORD LogPathLength;
     WCHAR LogPath[1]; // Variable size
//  Data[1];                                        // Variable size data not declared
} TRANSACTIONMANAGER_LOGPATH_INFORMATION, *PTRANSACTIONMANAGER_LOGPATH_INFORMATION;

typedef struct _TRANSACTION_PROPERTIES_INFORMATION {
    DWORD              IsolationLevel;
    DWORD              IsolationFlags;
    LARGE_INTEGER      Timeout;
    DWORD              Outcome;
    DWORD              DescriptionLength;
    WCHAR              Description[1];            // Variable size
//          Data[1];            // Variable size data not declared
} TRANSACTION_PROPERTIES_INFORMATION, *PTRANSACTION_PROPERTIES_INFORMATION;

// The following info-class is intended for DTC's use only; it will be
// deprecated, and no one else should take a dependency on it.
typedef struct _TRANSACTION_BIND_INFORMATION {
    HANDLE TmHandle;
} TRANSACTION_BIND_INFORMATION, *PTRANSACTION_BIND_INFORMATION;

typedef struct _TRANSACTION_ENLISTMENT_PAIR {
    GUID   EnlistmentId;
    GUID   ResourceManagerId;
} TRANSACTION_ENLISTMENT_PAIR, *PTRANSACTION_ENLISTMENT_PAIR;

typedef struct _TRANSACTION_ENLISTMENTS_INFORMATION {
    DWORD                       NumberOfEnlistments;
    TRANSACTION_ENLISTMENT_PAIR EnlistmentPair[1]; // Variable size
} TRANSACTION_ENLISTMENTS_INFORMATION, *PTRANSACTION_ENLISTMENTS_INFORMATION;

typedef struct _TRANSACTION_FULL_INFORMATION {
// Not currently defined
    DWORD   NameLength;
} TRANSACTION_FULL_INFORMATION, *PTRANSACTION_FULL_INFORMATION;


typedef struct _RESOURCEMANAGER_BASIC_INFORMATION {
    GUID    ResourceManagerId;
    DWORD   DescriptionLength;
    WCHAR   Description[1];            // Variable size
} RESOURCEMANAGER_BASIC_INFORMATION, *PRESOURCEMANAGER_BASIC_INFORMATION;

typedef struct _RESOURCEMANAGER_COMPLETION_INFORMATION {
    HANDLE    IoCompletionPortHandle;
    ULONG_PTR CompletionKey;
} RESOURCEMANAGER_COMPLETION_INFORMATION, *PRESOURCEMANAGER_COMPLETION_INFORMATION;

// end_wdm
typedef struct _TRANSACTION_NAME_INFORMATION {
    DWORD   NameLength;
    WCHAR   Name[1];            // Variable length string
} TRANSACTION_NAME_INFORMATION, *PTRANSACTION_NAME_INFORMATION;


// begin_wdm
typedef enum _TRANSACTION_INFORMATION_CLASS {
    TransactionBasicInformation,
    TransactionPropertiesInformation,
    TransactionEnlistmentInformation,
    TransactionFullInformation
// end_wdm
    ,
// The following info-class is intended for DTC's use only; it will be
// deprecated, and no one else should take a dependency on it.
    TransactionBindInformation // private and deprecated
    ,
//    TransactionNameInformation
// begin_wdm
} TRANSACTION_INFORMATION_CLASS;

// begin_wdm
typedef enum _TRANSACTIONMANAGER_INFORMATION_CLASS {
    TransactionManagerBasicInformation,
    TransactionManagerLogInformation,
    TransactionManagerLogPathInformation,
    TransactionManagerOnlineProbeInformation
// end_wdm

// begin_wdm
} TRANSACTIONMANAGER_INFORMATION_CLASS;


// begin_wdm
typedef enum _RESOURCEMANAGER_INFORMATION_CLASS {
    ResourceManagerBasicInformation,
    ResourceManagerCompletionInformation,
    ResourceManagerFullInformation
// end_wdm
    ,
    ResourceManagerNameInformation
// begin_wdm
} RESOURCEMANAGER_INFORMATION_CLASS;


typedef struct _ENLISTMENT_BASIC_INFORMATION {
    GUID    EnlistmentId;
    GUID    TransactionId;
    GUID    ResourceManagerId;
} ENLISTMENT_BASIC_INFORMATION, *PENLISTMENT_BASIC_INFORMATION;

// begin_wdm
typedef enum _ENLISTMENT_INFORMATION_CLASS {
    EnlistmentBasicInformation,
    EnlistmentRecoveryInformation,
    EnlistmentFullInformation
// end_wdm
    ,
    EnlistmentNameInformation
// begin_wdm
} ENLISTMENT_INFORMATION_CLASS;

typedef struct _TRANSACTION_LIST_ENTRY {
    UOW    UOW;
} TRANSACTION_LIST_ENTRY, *PTRANSACTION_LIST_ENTRY;

typedef struct _TRANSACTION_LIST_INFORMATION {
    DWORD   NumberOfTransactions;
    TRANSACTION_LIST_ENTRY TransactionInformation[1]; // Var size
} TRANSACTION_LIST_INFORMATION, *PTRANSACTION_LIST_INFORMATION;


//
// Types of objects known to the kernel transaction manager.
//

typedef enum _KTMOBJECT_TYPE {

    KTMOBJECT_TRANSACTION,
    KTMOBJECT_TRANSACTION_MANAGER,
    KTMOBJECT_RESOURCE_MANAGER,
    KTMOBJECT_ENLISTMENT,
    KTMOBJECT_INVALID

} KTMOBJECT_TYPE, *PKTMOBJECT_TYPE;


//
// KTMOBJECT_CURSOR
//
// Used by NtEnumerateTransactionObject to enumerate a transaction
// object namespace (e.g. enlistments in a resource manager).
//

typedef struct _KTMOBJECT_CURSOR {

    //
    // The last GUID enumerated; zero if beginning enumeration.
    // 

    GUID    LastQuery;

    //
    // A count of GUIDs filled in by this last enumeration.
    // 

    DWORD   ObjectIdCount;

    //
    // ObjectIdCount GUIDs from the namespace specified.
    // 

    GUID    ObjectIds[1];

} KTMOBJECT_CURSOR, *PKTMOBJECT_CURSOR;

// begin_wdm


}
#line 12716 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 12718 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"
typedef DWORD TP_VERSION, *PTP_VERSION; 

typedef struct _TP_CALLBACK_INSTANCE TP_CALLBACK_INSTANCE, *PTP_CALLBACK_INSTANCE;

typedef void (__stdcall *PTP_SIMPLE_CALLBACK)(
         PTP_CALLBACK_INSTANCE Instance,
     PVOID                 Context
    );

typedef struct _TP_POOL TP_POOL, *PTP_POOL; 
typedef struct _TP_CLEANUP_GROUP TP_CLEANUP_GROUP, *PTP_CLEANUP_GROUP; 

typedef void (__stdcall *PTP_CLEANUP_GROUP_CANCEL_CALLBACK)(
     PVOID ObjectContext,
     PVOID CleanupContext
    );

//
// Do not manipulate this structure directly!  Allocate space for it
// and use the inline interfaces below.
//

typedef struct _TP_CALLBACK_ENVIRON {
    TP_VERSION                         Version;
    PTP_POOL                           Pool;
    PTP_CLEANUP_GROUP                  CleanupGroup;
    PTP_CLEANUP_GROUP_CANCEL_CALLBACK  CleanupGroupCancelCallback;
    PVOID                              RaceDll;
    struct _ACTIVATION_CONTEXT        *ActivationContext;
    PTP_SIMPLE_CALLBACK                FinalizationCallback;
    union {
        DWORD                          Flags;
        struct {
            DWORD                      LongFunction :  1;
            DWORD                      Private      : 31;
        } s;
    } u;
} TP_CALLBACK_ENVIRON, *PTP_CALLBACK_ENVIRON;



__forceinline
void
TpInitializeCallbackEnviron(
     PTP_CALLBACK_ENVIRON CallbackEnviron
    )
{
    CallbackEnviron->Version = 1;
    CallbackEnviron->Pool = 0;
    CallbackEnviron->CleanupGroup = 0;
    CallbackEnviron->CleanupGroupCancelCallback = 0;
    CallbackEnviron->RaceDll = 0;
    CallbackEnviron->ActivationContext = 0;
    CallbackEnviron->FinalizationCallback = 0;
    CallbackEnviron->u.Flags = 0;
}

__forceinline
void
TpSetCallbackThreadpool(
     PTP_CALLBACK_ENVIRON CallbackEnviron,
        PTP_POOL             Pool
    )
{
    CallbackEnviron->Pool = Pool;
}

__forceinline
void
TpSetCallbackCleanupGroup(
      PTP_CALLBACK_ENVIRON              CallbackEnviron,
         PTP_CLEANUP_GROUP                 CleanupGroup,
     PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback
    )
{
    CallbackEnviron->CleanupGroup = CleanupGroup;
    CallbackEnviron->CleanupGroupCancelCallback = CleanupGroupCancelCallback;
}

__forceinline
void
TpSetCallbackActivationContext(
      PTP_CALLBACK_ENVIRON CallbackEnviron,
     struct _ACTIVATION_CONTEXT *ActivationContext
    )
{
    CallbackEnviron->ActivationContext = ActivationContext;
}

__forceinline
void
TpSetCallbackNoActivationContext(
     PTP_CALLBACK_ENVIRON CallbackEnviron
    )
{
    CallbackEnviron->ActivationContext = (struct _ACTIVATION_CONTEXT *)(LONG_PTR) -1; // INVALID_ACTIVATION_CONTEXT
}

__forceinline
void
TpSetCallbackLongFunction(
     PTP_CALLBACK_ENVIRON CallbackEnviron
    )
{
    CallbackEnviron->u.s.LongFunction = 1;
}

__forceinline
void
TpSetCallbackRaceWithDll(
     PTP_CALLBACK_ENVIRON CallbackEnviron,
        PVOID                DllHandle
    )
{
    CallbackEnviron->RaceDll = DllHandle;
}

__forceinline
void
TpSetCallbackFinalizationCallback(
     PTP_CALLBACK_ENVIRON CallbackEnviron,
        PTP_SIMPLE_CALLBACK  FinalizationCallback
    )
{
    CallbackEnviron->FinalizationCallback = FinalizationCallback;
}

__forceinline
void
TpDestroyCallbackEnviron(
     PTP_CALLBACK_ENVIRON CallbackEnviron
    )
{
    //
    // For the current version of the callback environment, no actions
    // need to be taken to tear down an initialized structure.  This
    // may change in a future release.
    //
    
    (CallbackEnviron);
}

#line 12861 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


typedef struct _TP_WORK TP_WORK, *PTP_WORK;

typedef void (__stdcall *PTP_WORK_CALLBACK)(
         PTP_CALLBACK_INSTANCE Instance,
     PVOID                 Context,
         PTP_WORK              Work
    );

typedef struct _TP_TIMER TP_TIMER, *PTP_TIMER;

typedef void (__stdcall *PTP_TIMER_CALLBACK)(
         PTP_CALLBACK_INSTANCE Instance,
     PVOID                 Context,
         PTP_TIMER             Timer
    );

typedef DWORD    TP_WAIT_RESULT;

typedef struct _TP_WAIT TP_WAIT, *PTP_WAIT;

typedef void (__stdcall *PTP_WAIT_CALLBACK)(
         PTP_CALLBACK_INSTANCE Instance,
     PVOID                 Context,
         PTP_WAIT              Wait,
            TP_WAIT_RESULT        WaitResult
    );

typedef struct _TP_IO TP_IO, *PTP_IO;



































#line 12927 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"








__inline struct _TEB * NtCurrentTeb( void ) { return (struct _TEB *) (ULONG_PTR) __readfsdword (0x18); }

















#line 12954 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 12956 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"












#line 12969 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"


}
#line 12973 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"

#line 12975 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winnt.h"



#line 178 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
#line 179 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



/* Types use for passing & returning polymorphic values */
typedef UINT_PTR            WPARAM;
typedef LONG_PTR            LPARAM;
typedef LONG_PTR            LRESULT;






















struct HWND__ { int unused; }; typedef struct HWND__ *HWND;
struct HHOOK__ { int unused; }; typedef struct HHOOK__ *HHOOK;



#line 214 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

typedef WORD                ATOM;

typedef HANDLE          *SPHANDLE;
typedef HANDLE           *LPHANDLE;
typedef HANDLE              HGLOBAL;
typedef HANDLE              HLOCAL;
typedef HANDLE              GLOBALHANDLE;
typedef HANDLE              LOCALHANDLE;







typedef int ( __stdcall *FARPROC)();
typedef int ( __stdcall *NEARPROC)();
typedef int (__stdcall *PROC)();
#line 234 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"




#line 239 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"




#line 244 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



typedef void * HGDIOBJ;


#line 251 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
#line 252 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

struct HKEY__ { int unused; }; typedef struct HKEY__ *HKEY;
typedef HKEY *PHKEY;


struct HACCEL__ { int unused; }; typedef struct HACCEL__ *HACCEL;
#line 259 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

struct HBITMAP__ { int unused; }; typedef struct HBITMAP__ *HBITMAP;
struct HBRUSH__ { int unused; }; typedef struct HBRUSH__ *HBRUSH;
#line 263 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

struct HCOLORSPACE__ { int unused; }; typedef struct HCOLORSPACE__ *HCOLORSPACE;
#line 266 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

struct HDC__ { int unused; }; typedef struct HDC__ *HDC;
#line 269 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
struct HGLRC__ { int unused; }; typedef struct HGLRC__ *HGLRC;          // OpenGL
struct HDESK__ { int unused; }; typedef struct HDESK__ *HDESK;
struct HENHMETAFILE__ { int unused; }; typedef struct HENHMETAFILE__ *HENHMETAFILE;

struct HFONT__ { int unused; }; typedef struct HFONT__ *HFONT;
#line 275 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
struct HICON__ { int unused; }; typedef struct HICON__ *HICON;

struct HMENU__ { int unused; }; typedef struct HMENU__ *HMENU;
#line 279 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
struct HMETAFILE__ { int unused; }; typedef struct HMETAFILE__ *HMETAFILE;
struct HINSTANCE__ { int unused; }; typedef struct HINSTANCE__ *HINSTANCE;
typedef HINSTANCE HMODULE;      /* HMODULEs can be used in place of HINSTANCEs */

struct HPALETTE__ { int unused; }; typedef struct HPALETTE__ *HPALETTE;
struct HPEN__ { int unused; }; typedef struct HPEN__ *HPEN;
#line 286 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
struct HRGN__ { int unused; }; typedef struct HRGN__ *HRGN;
struct HRSRC__ { int unused; }; typedef struct HRSRC__ *HRSRC;
struct HSPRITE__ { int unused; }; typedef struct HSPRITE__ *HSPRITE;
struct HSTR__ { int unused; }; typedef struct HSTR__ *HSTR;
struct HTASK__ { int unused; }; typedef struct HTASK__ *HTASK;
struct HWINSTA__ { int unused; }; typedef struct HWINSTA__ *HWINSTA;
struct HKL__ { int unused; }; typedef struct HKL__ *HKL;


struct HWINEVENTHOOK__ { int unused; }; typedef struct HWINEVENTHOOK__ *HWINEVENTHOOK;
#line 297 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"



struct HMONITOR__ { int unused; }; typedef struct HMONITOR__ *HMONITOR;
#line 302 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
struct HUMPD__ { int unused; }; typedef struct HUMPD__ *HUMPD;
#line 304 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"


typedef int HFILE;
typedef HICON HCURSOR;      /* HICONs & HCURSORs are polymorphic */



#line 312 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

typedef DWORD   COLORREF;
typedef DWORD   *LPCOLORREF;



typedef struct tagRECT
{
    LONG    left;
    LONG    top;
    LONG    right;
    LONG    bottom;
} RECT, *PRECT,  *NPRECT,  *LPRECT;

typedef const RECT * LPCRECT;

typedef struct _RECTL       /* rcl */
{
    LONG    left;
    LONG    top;
    LONG    right;
    LONG    bottom;
} RECTL, *PRECTL, *LPRECTL;

typedef const RECTL * LPCRECTL;

typedef struct tagPOINT
{
    LONG  x;
    LONG  y;
} POINT, *PPOINT,  *NPPOINT,  *LPPOINT;

typedef struct _POINTL      /* ptl  */
{
    LONG  x;
    LONG  y;
} POINTL, *PPOINTL;

typedef struct tagSIZE
{
    LONG        cx;
    LONG        cy;
} SIZE, *PSIZE, *LPSIZE;

typedef SIZE               SIZEL;
typedef SIZE               *PSIZEL, *LPSIZEL;

typedef struct tagPOINTS
{

    SHORT   x;
    SHORT   y;



#line 368 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"
} POINTS, *PPOINTS, *LPPOINTS;

//
//  File System time stamps are represented with the following structure:
//

typedef struct _FILETIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
} FILETIME, *PFILETIME, *LPFILETIME;



/* mode selections for the device mode function */










/* device capabilities indices */




















}
#line 415 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"

#line 417 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windef.h"


#line 156 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\windows.h"
#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
/************************************************************************
*                                                                       *
*   winbase.h -- This module defines the 32-Bit Windows Base APIs       *
*                                                                       *
*   Copyright (c) Microsoft Corp. All rights reserved.                  *
*                                                                       *
************************************************************************/





#pragma once
#line 15 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





//
// Define API decoration for direct importing of DLL references.
//





#line 29 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





#line 35 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





#line 41 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


extern "C" {
#line 45 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

/*
 * Compatibility macros
 */





























































//
// File creation flags must start at the high end since they
// are combined with the attributes
//




















//
// Define possible return codes from the CopyFileEx callback routine
//






//
// Define CopyFileEx callback routine state change values
//




//
// Define CopyFileEx option flags
//






//
//  Gap for private copyfile flags
//



#line 166 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 167 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


//
// Define ReplaceFile option flags
//




#line 177 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Define the NamedPipe definitions
//


//
// Define the dwOpenMode values for CreateNamedPipe
//





//
// Define the Named Pipe End flags for GetNamedPipeInfo
//




//
// Define the dwPipeMode values for CreateNamedPipe
//










//
// Define the well known values for CreateNamedPipe nMaxInstances
//



//
// Define the Security Quality of Service bits to be passed
// into CreateFile
//












//
//  File structures
//

typedef struct _OVERLAPPED {
    ULONG_PTR Internal;
    ULONG_PTR InternalHigh;
    union {
        struct {
            DWORD Offset;
            DWORD OffsetHigh;
        };

        PVOID Pointer;
    };

    HANDLE  hEvent;
} OVERLAPPED, *LPOVERLAPPED;

typedef struct _OVERLAPPED_ENTRY {
    ULONG_PTR lpCompletionKey;
    LPOVERLAPPED lpOverlapped;
    ULONG_PTR Internal;
    DWORD dwNumberOfBytesTransferred;
} OVERLAPPED_ENTRY, *LPOVERLAPPED_ENTRY;

typedef struct _SECURITY_ATTRIBUTES {
    DWORD nLength;
    LPVOID lpSecurityDescriptor;
    BOOL bInheritHandle;
} SECURITY_ATTRIBUTES, *PSECURITY_ATTRIBUTES, *LPSECURITY_ATTRIBUTES;

typedef struct _PROCESS_INFORMATION {
    HANDLE hProcess;
    HANDLE hThread;
    DWORD dwProcessId;
    DWORD dwThreadId;
} PROCESS_INFORMATION, *PPROCESS_INFORMATION, *LPPROCESS_INFORMATION;

//
//  File System time stamps are represented with the following structure:
//










//
// System time is represented with the following structure:
//


typedef struct _SYSTEMTIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
} SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;


typedef DWORD (__stdcall *PTHREAD_START_ROUTINE)(
    LPVOID lpThreadParameter
    );
typedef PTHREAD_START_ROUTINE LPTHREAD_START_ROUTINE;


typedef void (__stdcall *PFIBER_START_ROUTINE)(
    LPVOID lpFiberParameter
    );
typedef PFIBER_START_ROUTINE LPFIBER_START_ROUTINE;
#line 313 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

typedef RTL_CRITICAL_SECTION CRITICAL_SECTION;
typedef PRTL_CRITICAL_SECTION PCRITICAL_SECTION;
typedef PRTL_CRITICAL_SECTION LPCRITICAL_SECTION;

typedef RTL_CRITICAL_SECTION_DEBUG CRITICAL_SECTION_DEBUG;
typedef PRTL_CRITICAL_SECTION_DEBUG PCRITICAL_SECTION_DEBUG;
typedef PRTL_CRITICAL_SECTION_DEBUG LPCRITICAL_SECTION_DEBUG;



//
// Define one-time initialization primitive
//

typedef RTL_RUN_ONCE INIT_ONCE;
typedef PRTL_RUN_ONCE PINIT_ONCE;
typedef PRTL_RUN_ONCE LPINIT_ONCE;



//
// Run once flags
//





//
// The context stored in the run once structure must leave the following number
// of low order bits unused.
//



typedef
BOOL
(__stdcall *PINIT_ONCE_FN) (
     PINIT_ONCE InitOnce,
     PVOID Parameter,
     PVOID *Context
    );

__declspec(dllimport)
void
__stdcall
InitOnceInitialize (
     PINIT_ONCE InitOnce
    );

__declspec(dllimport)
BOOL
__stdcall
InitOnceExecuteOnce (
     PINIT_ONCE InitOnce,
      PINIT_ONCE_FN InitFn,
     PVOID Parameter,
     LPVOID *Context
    );

__declspec(dllimport)
BOOL
__stdcall
InitOnceBeginInitialize (
     LPINIT_ONCE lpInitOnce,
     DWORD dwFlags,
     PBOOL fPending,
     LPVOID *lpContext
    );

__declspec(dllimport)
BOOL
__stdcall
InitOnceComplete (
     LPINIT_ONCE lpInitOnce,
     DWORD dwFlags,
     LPVOID lpContext
    );

#line 394 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Define the slim r/w lock
//

typedef RTL_SRWLOCK SRWLOCK, *PSRWLOCK;



__declspec(dllimport)
void
__stdcall
InitializeSRWLock (
      PSRWLOCK SRWLock
     );

__declspec(dllimport)
void
__stdcall
ReleaseSRWLockExclusive (
      PSRWLOCK SRWLock
     );

__declspec(dllimport)
void
__stdcall
ReleaseSRWLockShared (
      PSRWLOCK SRWLock
     );

__declspec(dllimport)
void
__stdcall
AcquireSRWLockExclusive (
      PSRWLOCK SRWLock
     );

__declspec(dllimport)
void
__stdcall
AcquireSRWLockShared (
      PSRWLOCK SRWLock
     );

//
// Define condition variable
//

typedef RTL_CONDITION_VARIABLE CONDITION_VARIABLE, *PCONDITION_VARIABLE;

__declspec(dllimport)
void
__stdcall
InitializeConditionVariable (
     PCONDITION_VARIABLE ConditionVariable
    );

__declspec(dllimport)
void
__stdcall
WakeConditionVariable (
     PCONDITION_VARIABLE ConditionVariable
    );

__declspec(dllimport)
void
__stdcall
WakeAllConditionVariable (
     PCONDITION_VARIABLE ConditionVariable
    );

__declspec(dllimport)
BOOL
__stdcall
SleepConditionVariableCS (
     PCONDITION_VARIABLE ConditionVariable,
     PCRITICAL_SECTION CriticalSection,
     DWORD dwMilliseconds
    );

__declspec(dllimport)
BOOL
__stdcall
SleepConditionVariableSRW (
     PCONDITION_VARIABLE ConditionVariable,
     PSRWLOCK SRWLock,
     DWORD dwMilliseconds,
     ULONG Flags
    );

//
// Static initializer for the condition variable
//



//
// Flags for condition variables
//



__declspec(dllimport)

PVOID
__stdcall
EncodePointer (
     PVOID Ptr
    );

__declspec(dllimport)

PVOID
__stdcall
DecodePointer (
     PVOID Ptr
    );

__declspec(dllimport)

PVOID
__stdcall
EncodeSystemPointer (
     PVOID Ptr
    );

__declspec(dllimport)

PVOID
__stdcall
DecodeSystemPointer (
     PVOID Ptr
    );


typedef PLDT_ENTRY LPLDT_ENTRY;


#line 533 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




//
// Serial provider type.
//



//
// Provider SubTypes
//
















//
// Provider capabilities flags.
//












//
// Comm provider settable parameters.
//









//
// Settable baud rates in the provider.
//






















//
// Settable Data Bits
//








//
// Settable Stop and Parity bits.
//










typedef struct _COMMPROP {
    WORD wPacketLength;
    WORD wPacketVersion;
    DWORD dwServiceMask;
    DWORD dwReserved1;
    DWORD dwMaxTxQueue;
    DWORD dwMaxRxQueue;
    DWORD dwMaxBaud;
    DWORD dwProvSubType;
    DWORD dwProvCapabilities;
    DWORD dwSettableParams;
    DWORD dwSettableBaud;
    WORD wSettableData;
    WORD wSettableStopParity;
    DWORD dwCurrentTxQueue;
    DWORD dwCurrentRxQueue;
    DWORD dwProvSpec1;
    DWORD dwProvSpec2;
    WCHAR wcProvChar[1];
} COMMPROP,*LPCOMMPROP;

//
// Set dwProvSpec1 to COMMPROP_INITIALIZED to indicate that wPacketLength
// is valid before a call to GetCommProperties().
//


typedef struct _COMSTAT {
    DWORD fCtsHold : 1;
    DWORD fDsrHold : 1;
    DWORD fRlsdHold : 1;
    DWORD fXoffHold : 1;
    DWORD fXoffSent : 1;
    DWORD fEof : 1;
    DWORD fTxim : 1;
    DWORD fReserved : 25;
    DWORD cbInQue;
    DWORD cbOutQue;
} COMSTAT, *LPCOMSTAT;

//
// DTR Control Flow Values.
//




//
// RTS Control Flow Values
//





typedef struct _DCB {
    DWORD DCBlength;      /* sizeof(DCB)                     */
    DWORD BaudRate;       /* Baudrate at which running       */
    DWORD fBinary: 1;     /* Binary Mode (skip EOF check)    */
    DWORD fParity: 1;     /* Enable parity checking          */
    DWORD fOutxCtsFlow:1; /* CTS handshaking on output       */
    DWORD fOutxDsrFlow:1; /* DSR handshaking on output       */
    DWORD fDtrControl:2;  /* DTR Flow control                */
    DWORD fDsrSensitivity:1; /* DSR Sensitivity              */
    DWORD fTXContinueOnXoff: 1; /* Continue TX when Xoff sent */
    DWORD fOutX: 1;       /* Enable output X-ON/X-OFF        */
    DWORD fInX: 1;        /* Enable input X-ON/X-OFF         */
    DWORD fErrorChar: 1;  /* Enable Err Replacement          */
    DWORD fNull: 1;       /* Enable Null stripping           */
    DWORD fRtsControl:2;  /* Rts Flow control                */
    DWORD fAbortOnError:1; /* Abort all reads and writes on Error */
    DWORD fDummy2:17;     /* Reserved                        */
    WORD wReserved;       /* Not currently used              */
    WORD XonLim;          /* Transmit X-ON threshold         */
    WORD XoffLim;         /* Transmit X-OFF threshold        */
    BYTE ByteSize;        /* Number of bits/byte, 4-8        */
    BYTE Parity;          /* 0-4=None,Odd,Even,Mark,Space    */
    BYTE StopBits;        /* 0,1,2 = 1, 1.5, 2               */
    char XonChar;         /* Tx and Rx X-ON character        */
    char XoffChar;        /* Tx and Rx X-OFF character       */
    char ErrorChar;       /* Error replacement char          */
    char EofChar;         /* End of Input character          */
    char EvtChar;         /* Received Event character        */
    WORD wReserved1;      /* Fill for now.                   */
} DCB, *LPDCB;

typedef struct _COMMTIMEOUTS {
    DWORD ReadIntervalTimeout;          /* Maximum time between read chars. */
    DWORD ReadTotalTimeoutMultiplier;   /* Multiplier of characters.        */
    DWORD ReadTotalTimeoutConstant;     /* Constant in milliseconds.        */
    DWORD WriteTotalTimeoutMultiplier;  /* Multiplier of characters.        */
    DWORD WriteTotalTimeoutConstant;    /* Constant in milliseconds.        */
} COMMTIMEOUTS,*LPCOMMTIMEOUTS;

typedef struct _COMMCONFIG {
    DWORD dwSize;               /* Size of the entire struct */
    WORD wVersion;              /* version of the structure */
    WORD wReserved;             /* alignment */
    DCB dcb;                    /* device control block */
    DWORD dwProviderSubType;    /* ordinal value for identifying
                                   provider-defined data structure format*/
    DWORD dwProviderOffset;     /* Specifies the offset of provider specific
                                   data field in bytes from the start */
    DWORD dwProviderSize;       /* size of the provider-specific data field */
    WCHAR wcProviderData[1];    /* provider-specific data */
} COMMCONFIG,*LPCOMMCONFIG;

typedef struct _SYSTEM_INFO {
    union {
        DWORD dwOemId;          // Obsolete field...do not use
        struct {
            WORD wProcessorArchitecture;
            WORD wReserved;
        };
    };
    DWORD dwPageSize;
    LPVOID lpMinimumApplicationAddress;
    LPVOID lpMaximumApplicationAddress;
    DWORD_PTR dwActiveProcessorMask;
    DWORD dwNumberOfProcessors;
    DWORD dwProcessorType;
    DWORD dwAllocationGranularity;
    WORD wProcessorLevel;
    WORD wProcessorRevision;
} SYSTEM_INFO, *LPSYSTEM_INFO;

//
//






/* Global Memory Flags */






















/* Flags returned by GlobalFlags (in addition to GMEM_DISCARDABLE) */



typedef struct _MEMORYSTATUS {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    SIZE_T dwTotalPhys;
    SIZE_T dwAvailPhys;
    SIZE_T dwTotalPageFile;
    SIZE_T dwAvailPageFile;
    SIZE_T dwTotalVirtual;
    SIZE_T dwAvailVirtual;
} MEMORYSTATUS, *LPMEMORYSTATUS;

/* Local Memory Flags */


















/* Flags returned by LocalFlags (in addition to LMEM_DISCARDABLE) */



//
// NUMA values
//


//
// dwCreationFlag values
//





























































//
// GetFinalPathNameByHandle
//









//
// Debug APIs
//










typedef struct _EXCEPTION_DEBUG_INFO {
    EXCEPTION_RECORD ExceptionRecord;
    DWORD dwFirstChance;
} EXCEPTION_DEBUG_INFO, *LPEXCEPTION_DEBUG_INFO;

typedef struct _CREATE_THREAD_DEBUG_INFO {
    HANDLE hThread;
    LPVOID lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
} CREATE_THREAD_DEBUG_INFO, *LPCREATE_THREAD_DEBUG_INFO;

typedef struct _CREATE_PROCESS_DEBUG_INFO {
    HANDLE hFile;
    HANDLE hProcess;
    HANDLE hThread;
    LPVOID lpBaseOfImage;
    DWORD dwDebugInfoFileOffset;
    DWORD nDebugInfoSize;
    LPVOID lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
    LPVOID lpImageName;
    WORD fUnicode;
} CREATE_PROCESS_DEBUG_INFO, *LPCREATE_PROCESS_DEBUG_INFO;

typedef struct _EXIT_THREAD_DEBUG_INFO {
    DWORD dwExitCode;
} EXIT_THREAD_DEBUG_INFO, *LPEXIT_THREAD_DEBUG_INFO;

typedef struct _EXIT_PROCESS_DEBUG_INFO {
    DWORD dwExitCode;
} EXIT_PROCESS_DEBUG_INFO, *LPEXIT_PROCESS_DEBUG_INFO;

typedef struct _LOAD_DLL_DEBUG_INFO {
    HANDLE hFile;
    LPVOID lpBaseOfDll;
    DWORD dwDebugInfoFileOffset;
    DWORD nDebugInfoSize;
    LPVOID lpImageName;
    WORD fUnicode;
} LOAD_DLL_DEBUG_INFO, *LPLOAD_DLL_DEBUG_INFO;

typedef struct _UNLOAD_DLL_DEBUG_INFO {
    LPVOID lpBaseOfDll;
} UNLOAD_DLL_DEBUG_INFO, *LPUNLOAD_DLL_DEBUG_INFO;

typedef struct _OUTPUT_DEBUG_STRING_INFO {
    LPSTR lpDebugStringData;
    WORD fUnicode;
    WORD nDebugStringLength;
} OUTPUT_DEBUG_STRING_INFO, *LPOUTPUT_DEBUG_STRING_INFO;

typedef struct _RIP_INFO {
    DWORD dwError;
    DWORD dwType;
} RIP_INFO, *LPRIP_INFO;


typedef struct _DEBUG_EVENT {
    DWORD dwDebugEventCode;
    DWORD dwProcessId;
    DWORD dwThreadId;
    union {
        EXCEPTION_DEBUG_INFO Exception;
        CREATE_THREAD_DEBUG_INFO CreateThread;
        CREATE_PROCESS_DEBUG_INFO CreateProcessInfo;
        EXIT_THREAD_DEBUG_INFO ExitThread;
        EXIT_PROCESS_DEBUG_INFO ExitProcess;
        LOAD_DLL_DEBUG_INFO LoadDll;
        UNLOAD_DLL_DEBUG_INFO UnloadDll;
        OUTPUT_DEBUG_STRING_INFO DebugString;
        RIP_INFO RipInfo;
    } u;
} DEBUG_EVENT, *LPDEBUG_EVENT;

//
// JIT Debugging Info. This structure is defined to have constant size in
// both the emulated and native environment.
//

typedef struct _JIT_DEBUG_INFO {
    DWORD dwSize;
    DWORD dwProcessorArchitecture;
    DWORD dwThreadID;
    DWORD dwReserved0;
    ULONG64 lpExceptionAddress;
    ULONG64 lpExceptionRecord;
    ULONG64 lpContextRecord;
} JIT_DEBUG_INFO, *LPJIT_DEBUG_INFO;

typedef JIT_DEBUG_INFO JIT_DEBUG_INFO32, *LPJIT_DEBUG_INFO32;
typedef JIT_DEBUG_INFO JIT_DEBUG_INFO64, *LPJIT_DEBUG_INFO64;


typedef PCONTEXT LPCONTEXT;
typedef PEXCEPTION_RECORD LPEXCEPTION_RECORD;
typedef PEXCEPTION_POINTERS LPEXCEPTION_POINTERS;
#line 1024 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"














#line 1039 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


























//
// Baud rates at which the communication device operates
//

















//
// Error Flags
//






















//
// Events
//















//
// Escape Functions
//











//
// PURGE function flags.
//







//
// Modem Status Flags
//





//
// WaitSoundState() Constants
//





//
// Accent Modes
//





//
// SetSoundNoise() Sources
//































































typedef struct _OFSTRUCT {
    BYTE cBytes;
    BYTE fFixedDisk;
    WORD nErrCode;
    WORD Reserved1;
    WORD Reserved2;
    CHAR szPathName[128];
} OFSTRUCT, *LPOFSTRUCT, *POFSTRUCT;






















































































































































































































































































































































































































































































































































































































































































































































































































#line 2041 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




















































































































































































































#line 2254 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
LONG
__stdcall
InterlockedIncrement (
     LONG volatile *lpAddend
    );

__declspec(dllimport)
LONG
__stdcall
InterlockedDecrement (
     LONG volatile *lpAddend
    );

__declspec(dllimport)
LONG
__stdcall
InterlockedExchange (
     LONG volatile *Target,
        LONG Value
    );




__declspec(dllimport)
LONG
__stdcall
InterlockedExchangeAdd (
     LONG volatile *Addend,
        LONG Value
    );

__declspec(dllimport)
LONG
__stdcall
InterlockedCompareExchange (
     LONG volatile *Destination,
        LONG Exchange,
        LONG Comperand
    );



__declspec(dllimport)
LONGLONG
__stdcall
InterlockedCompareExchange64 (
     LONGLONG volatile *Destination,
        LONGLONG Exchange,
        LONGLONG Comperand
    );

#line 2309 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





__forceinline
LONGLONG
InterlockedAnd64 (
     LONGLONG volatile *Destination,
        LONGLONG Value
    )
{
    LONGLONG Old;

    do {
        Old = *Destination;
    } while (InterlockedCompareExchange64(Destination,
                                          Old & Value,
                                          Old) != Old);

    return Old;
}

__forceinline
LONGLONG
InterlockedOr64 (
     LONGLONG volatile *Destination,
        LONGLONG Value
    )
{
    LONGLONG Old;

    do {
        Old = *Destination;
    } while (InterlockedCompareExchange64(Destination,
                                          Old | Value,
                                          Old) != Old);

    return Old;
}

__forceinline
LONGLONG
InterlockedXor64 (
     LONGLONG volatile *Destination,
        LONGLONG Value
    )
{
    LONGLONG Old;

    do {
        Old = *Destination;
    } while (InterlockedCompareExchange64(Destination,
                                          Old ^ Value,
                                          Old) != Old);

    return Old;
}

__forceinline
LONGLONG
InterlockedIncrement64 (
     LONGLONG volatile *Addend
    )
{
    LONGLONG Old;

    do {
        Old = *Addend;
    } while (InterlockedCompareExchange64(Addend,
                                          Old + 1,
                                          Old) != Old);

    return Old + 1;
}

__forceinline
LONGLONG
InterlockedDecrement64 (
     LONGLONG volatile *Addend
    )
{
    LONGLONG Old;

    do {
        Old = *Addend;
    } while (InterlockedCompareExchange64(Addend,
                                          Old - 1,
                                          Old) != Old);

    return Old - 1;
}

__forceinline
LONGLONG
InterlockedExchange64 (
     LONGLONG volatile *Target,
        LONGLONG Value
    )
{
    LONGLONG Old;

    do {
        Old = *Target;
    } while (InterlockedCompareExchange64(Target,
                                          Value,
                                          Old) != Old);

    return Old;
}

__forceinline
LONGLONG
InterlockedExchangeAdd64(
     LONGLONG volatile *Addend,
        LONGLONG Value
    )
{
    LONGLONG Old;

    do {
        Old = *Addend;
    } while (InterlockedCompareExchange64(Addend,
                                          Old + Value,
                                          Old) != Old);

    return Old;
}

#line 2439 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


#line 2442 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Use a function for C++ so X86 will generate the same errors as RISC.
//



__forceinline
PVOID

__cdecl
#line 2454 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
__InlineInterlockedCompareExchangePointer (
      PVOID volatile *Destination,
     PVOID ExChange,
     PVOID Comperand
    )
{
    return((PVOID)(LONG_PTR)InterlockedCompareExchange((LONG volatile *)Destination, (LONG)(LONG_PTR)ExChange, (LONG)(LONG_PTR)Comperand));
}








#line 2471 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"














#line 2486 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
void
__stdcall
InitializeSListHead (
     PSLIST_HEADER ListHead
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
InterlockedPopEntrySList (
     PSLIST_HEADER ListHead
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
InterlockedPushEntrySList (
     PSLIST_HEADER ListHead,
     PSINGLE_LIST_ENTRY ListEntry
    );

__declspec(dllimport)
PSINGLE_LIST_ENTRY
__stdcall
InterlockedFlushSList (
     PSLIST_HEADER ListHead
    );

__declspec(dllimport)
USHORT
__stdcall
QueryDepthSList (
     PSLIST_HEADER ListHead
    );

#line 2526 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 2528 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 2530 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
FreeResource(
     HGLOBAL hResData
    );

__declspec(dllimport)
LPVOID
__stdcall
LockResource(
     HGLOBAL hResData
    );






int



#line 2555 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
__stdcall
#line 2557 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


#line 2560 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
WinMain (
     HINSTANCE hInstance,
     HINSTANCE hPrevInstance,
     LPSTR lpCmdLine,
     int nShowCmd
    );

int


#line 2571 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
__stdcall
#line 2573 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
wWinMain(
     HINSTANCE hInstance,
     HINSTANCE hPrevInstance,
     LPWSTR lpCmdLine,
     int nShowCmd
    );

__declspec(dllimport)
BOOL
__stdcall
FreeLibrary (
     HMODULE hLibModule
    );


__declspec(dllimport)
__declspec(noreturn)
void
__stdcall
FreeLibraryAndExitThread (
     HMODULE hLibModule,
     DWORD dwExitCode
    );

__declspec(dllimport)
BOOL
__stdcall
DisableThreadLibraryCalls (
     HMODULE hLibModule
    );

__declspec(dllimport)
FARPROC
__stdcall
GetProcAddress (
     HMODULE hModule,
     LPCSTR lpProcName
    );

__declspec(dllimport)
DWORD
__stdcall
GetVersion (
    void
    );

__declspec(dllimport)

HGLOBAL
__stdcall
GlobalAlloc (
     UINT uFlags,
     SIZE_T dwBytes
    );

__declspec(dllimport)

HGLOBAL
__stdcall
GlobalReAlloc (
     HGLOBAL hMem,
     SIZE_T dwBytes,
     UINT uFlags
    );

__declspec(dllimport)
SIZE_T
__stdcall
GlobalSize (
     HGLOBAL hMem
    );

__declspec(dllimport)
UINT
__stdcall
GlobalFlags (
     HGLOBAL hMem
    );

__declspec(dllimport)

LPVOID
__stdcall
GlobalLock (
     HGLOBAL hMem
    );

__declspec(dllimport)

HGLOBAL
__stdcall
GlobalHandle (
     LPCVOID pMem
    );

__declspec(dllimport)
BOOL
__stdcall
GlobalUnlock(
     HGLOBAL hMem
    );

__declspec(dllimport)

HGLOBAL
__stdcall
GlobalFree(
     HGLOBAL hMem
    );

__declspec(dllimport)
SIZE_T
__stdcall
GlobalCompact(
     DWORD dwMinFree
    );

__declspec(dllimport)
void
__stdcall
GlobalFix(
     HGLOBAL hMem
    );

__declspec(dllimport)
void
__stdcall
GlobalUnfix(
     HGLOBAL hMem
    );

__declspec(dllimport)

LPVOID
__stdcall
GlobalWire(
     HGLOBAL hMem
    );

__declspec(dllimport)
BOOL
__stdcall
GlobalUnWire(
     HGLOBAL hMem
    );

__declspec(dllimport)
void
__stdcall
GlobalMemoryStatus(
     LPMEMORYSTATUS lpBuffer
    );

typedef struct _MEMORYSTATUSEX {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    DWORDLONG ullTotalPhys;
    DWORDLONG ullAvailPhys;
    DWORDLONG ullTotalPageFile;
    DWORDLONG ullAvailPageFile;
    DWORDLONG ullTotalVirtual;
    DWORDLONG ullAvailVirtual;
    DWORDLONG ullAvailExtendedVirtual;
} MEMORYSTATUSEX, *LPMEMORYSTATUSEX;

__declspec(dllimport)
BOOL
__stdcall
GlobalMemoryStatusEx(
     LPMEMORYSTATUSEX lpBuffer
    );

__declspec(dllimport)

HLOCAL
__stdcall
LocalAlloc(
     UINT uFlags,
     SIZE_T uBytes
    );

__declspec(dllimport)

HLOCAL
__stdcall
LocalReAlloc(
     HLOCAL hMem,
     SIZE_T uBytes,
     UINT uFlags
    );

__declspec(dllimport)

LPVOID
__stdcall
LocalLock(
     HLOCAL hMem
    );

__declspec(dllimport)

HLOCAL
__stdcall
LocalHandle(
     LPCVOID pMem
    );

__declspec(dllimport)
BOOL
__stdcall
LocalUnlock(
     HLOCAL hMem
    );

__declspec(dllimport)
SIZE_T
__stdcall
LocalSize(
     HLOCAL hMem
    );

__declspec(dllimport)
UINT
__stdcall
LocalFlags(
     HLOCAL hMem
    );

__declspec(dllimport)
HLOCAL
__stdcall
LocalFree(
     HLOCAL hMem
    );

__declspec(dllimport)
SIZE_T
__stdcall
LocalShrink(
     HLOCAL hMem,
     UINT cbNewSize
    );

__declspec(dllimport)
SIZE_T
__stdcall
LocalCompact(
     UINT uMinFree
    );

__declspec(dllimport)
BOOL
__stdcall
FlushInstructionCache(
     HANDLE hProcess,
     LPCVOID lpBaseAddress,
     SIZE_T dwSize
    );



__declspec(dllimport)
void
__stdcall
FlushProcessWriteBuffers(
    void
    );

__declspec(dllimport)
BOOL
__stdcall
QueryThreadCycleTime (
     HANDLE ThreadHandle,
     PULONG64 CycleTime
    );

__declspec(dllimport)
BOOL
__stdcall
QueryProcessCycleTime (
     HANDLE ProcessHandle,
     PULONG64 CycleTime
    );

__declspec(dllimport)
BOOL
__stdcall
QueryIdleProcessorCycleTime (
     PULONG BufferLength,
     PULONG64 ProcessorIdleCycleTime
    );

#line 2866 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

LPVOID
__stdcall
VirtualAlloc(
     LPVOID lpAddress,
         SIZE_T dwSize,
         DWORD flAllocationType,
         DWORD flProtect
    );

__declspec(dllimport)
BOOL
__stdcall
VirtualFree(
     LPVOID lpAddress,
     SIZE_T dwSize,
     DWORD dwFreeType
    );

__declspec(dllimport)
BOOL
__stdcall
VirtualProtect(
      LPVOID lpAddress,
      SIZE_T dwSize,
      DWORD flNewProtect,
     PDWORD lpflOldProtect
    );

__declspec(dllimport)
SIZE_T
__stdcall
VirtualQuery(
     LPCVOID lpAddress,
     PMEMORY_BASIC_INFORMATION lpBuffer,
         SIZE_T dwLength
    );

__declspec(dllimport)

LPVOID
__stdcall
VirtualAllocEx(
         HANDLE hProcess,
     LPVOID lpAddress,
         SIZE_T dwSize,
         DWORD flAllocationType,
         DWORD flProtect
    );



__declspec(dllimport)

LPVOID
__stdcall
VirtualAllocExNuma(
         HANDLE hProcess,
     LPVOID lpAddress,
         SIZE_T dwSize,
         DWORD  flAllocationType,
         DWORD  flProtect,
         DWORD  nndPreferred
    );

#line 2934 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetWriteWatch(
     DWORD dwFlags,
     PVOID lpBaseAddress,
     SIZE_T dwRegionSize,
     PVOID *lpAddresses,
     ULONG_PTR *lpdwCount,
     PULONG lpdwGranularity
    );

__declspec(dllimport)
UINT
__stdcall
ResetWriteWatch(
     LPVOID lpBaseAddress,
     SIZE_T dwRegionSize
    );

__declspec(dllimport)
SIZE_T
__stdcall
GetLargePageMinimum(
    void
    );

__declspec(dllimport)
UINT
__stdcall
EnumSystemFirmwareTables(
     DWORD FirmwareTableProviderSignature,
     PVOID pFirmwareTableEnumBuffer,
     DWORD BufferSize
    );

__declspec(dllimport)
UINT
__stdcall
GetSystemFirmwareTable(
     DWORD FirmwareTableProviderSignature,
     DWORD FirmwareTableID,
     PVOID pFirmwareTableBuffer,
     DWORD BufferSize
    );

__declspec(dllimport)
BOOL
__stdcall
VirtualFreeEx(
     HANDLE hProcess,
     LPVOID lpAddress,
     SIZE_T dwSize,
     DWORD  dwFreeType
    );

__declspec(dllimport)
BOOL
__stdcall
VirtualProtectEx(
      HANDLE hProcess,
      LPVOID lpAddress,
      SIZE_T dwSize,
      DWORD flNewProtect,
     PDWORD lpflOldProtect
    );

__declspec(dllimport)
SIZE_T
__stdcall
VirtualQueryEx(
         HANDLE hProcess,
     LPCVOID lpAddress,
     PMEMORY_BASIC_INFORMATION lpBuffer,
         SIZE_T dwLength
    );

__declspec(dllimport)

HANDLE
__stdcall
HeapCreate(
     DWORD flOptions,
     SIZE_T dwInitialSize,
     SIZE_T dwMaximumSize
    );

__declspec(dllimport)
BOOL
__stdcall
HeapDestroy(
     HANDLE hHeap
    );

__declspec(dllimport)

LPVOID
__stdcall
HeapAlloc(
     HANDLE hHeap,
     DWORD dwFlags,
     SIZE_T dwBytes
    );

__declspec(dllimport)

LPVOID
__stdcall
HeapReAlloc(
     HANDLE hHeap,
        DWORD dwFlags,
     LPVOID lpMem,
        SIZE_T dwBytes
    );

__declspec(dllimport)
BOOL
__stdcall
HeapFree(
     HANDLE hHeap,
        DWORD dwFlags,
     LPVOID lpMem
    );

__declspec(dllimport)
SIZE_T
__stdcall
HeapSize(
     HANDLE hHeap,
     DWORD dwFlags,
     LPCVOID lpMem
    );

__declspec(dllimport)
BOOL
__stdcall
HeapValidate(
         HANDLE hHeap,
         DWORD dwFlags,
     LPCVOID lpMem
    );

__declspec(dllimport)
SIZE_T
__stdcall
HeapCompact(
     HANDLE hHeap,
     DWORD dwFlags
    );

__declspec(dllimport)

HANDLE
__stdcall
GetProcessHeap( void );

__declspec(dllimport)
DWORD
__stdcall
GetProcessHeaps(
     DWORD NumberOfHeaps,
     PHANDLE ProcessHeaps
    );

typedef struct _PROCESS_HEAP_ENTRY {
    PVOID lpData;
    DWORD cbData;
    BYTE cbOverhead;
    BYTE iRegionIndex;
    WORD wFlags;
    union {
        struct {
            HANDLE hMem;
            DWORD dwReserved[ 3 ];
        } Block;
        struct {
            DWORD dwCommittedSize;
            DWORD dwUnCommittedSize;
            LPVOID lpFirstBlock;
            LPVOID lpLastBlock;
        } Region;
    };
} PROCESS_HEAP_ENTRY, *LPPROCESS_HEAP_ENTRY, *PPROCESS_HEAP_ENTRY;







__declspec(dllimport)
BOOL
__stdcall
HeapLock(
     HANDLE hHeap
    );

__declspec(dllimport)
BOOL
__stdcall
HeapUnlock(
     HANDLE hHeap
    );


__declspec(dllimport)
BOOL
__stdcall
HeapWalk(
        HANDLE hHeap,
     LPPROCESS_HEAP_ENTRY lpEntry
    );

__declspec(dllimport)
BOOL
__stdcall
HeapSetInformation (
     HANDLE HeapHandle,
     HEAP_INFORMATION_CLASS HeapInformationClass,
     PVOID HeapInformation,
     SIZE_T HeapInformationLength
    );

__declspec(dllimport)
BOOL
__stdcall
HeapQueryInformation (
     HANDLE HeapHandle,
     HEAP_INFORMATION_CLASS HeapInformationClass,
     PVOID HeapInformation,
     SIZE_T HeapInformationLength,
     PSIZE_T ReturnLength
    );

// GetBinaryType return values.











#line 3182 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 3184 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetBinaryTypeA(
      LPCSTR lpApplicationName,
     LPDWORD  lpBinaryType
    );
__declspec(dllimport)
BOOL
__stdcall
GetBinaryTypeW(
      LPCWSTR lpApplicationName,
     LPDWORD  lpBinaryType
    );




#line 3204 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetShortPathNameA(
     LPCSTR lpszLongPath,
     LPSTR  lpszShortPath,
     DWORD cchBuffer
    );
__declspec(dllimport)
DWORD
__stdcall
GetShortPathNameW(
     LPCWSTR lpszLongPath,
     LPWSTR  lpszShortPath,
     DWORD cchBuffer
    );




#line 3226 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetLongPathNameA(
     LPCSTR lpszShortPath,
     LPSTR  lpszLongPath,
     DWORD cchBuffer
    );
__declspec(dllimport)
DWORD
__stdcall
GetLongPathNameW(
     LPCWSTR lpszShortPath,
     LPWSTR  lpszLongPath,
     DWORD cchBuffer
    );




#line 3248 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
DWORD
__stdcall
GetLongPathNameTransactedA(
         LPCSTR lpszShortPath,
     LPSTR  lpszLongPath,
         DWORD cchBuffer,
         HANDLE hTransaction
    );
__declspec(dllimport)
DWORD
__stdcall
GetLongPathNameTransactedW(
         LPCWSTR lpszShortPath,
     LPWSTR  lpszLongPath,
         DWORD cchBuffer,
         HANDLE hTransaction
    );




#line 3274 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 3276 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetProcessAffinityMask(
      HANDLE hProcess,
     PDWORD_PTR lpProcessAffinityMask,
     PDWORD_PTR lpSystemAffinityMask
    );

__declspec(dllimport)
BOOL
__stdcall
SetProcessAffinityMask(
     HANDLE hProcess,
     DWORD_PTR dwProcessAffinityMask
    );



__declspec(dllimport)
BOOL
__stdcall
GetProcessHandleCount(
      HANDLE hProcess,
     PDWORD pdwHandleCount
    );

#line 3305 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetProcessTimes(
      HANDLE hProcess,
     LPFILETIME lpCreationTime,
     LPFILETIME lpExitTime,
     LPFILETIME lpKernelTime,
     LPFILETIME lpUserTime
    );

__declspec(dllimport)
BOOL
__stdcall
GetProcessIoCounters(
      HANDLE hProcess,
     PIO_COUNTERS lpIoCounters
    );

__declspec(dllimport)
BOOL
__stdcall
GetProcessWorkingSetSize(
      HANDLE hProcess,
     PSIZE_T lpMinimumWorkingSetSize,
     PSIZE_T lpMaximumWorkingSetSize
    );

__declspec(dllimport)
BOOL
__stdcall
GetProcessWorkingSetSizeEx(
      HANDLE hProcess,
     PSIZE_T lpMinimumWorkingSetSize,
     PSIZE_T lpMaximumWorkingSetSize,
     PDWORD Flags
    );

__declspec(dllimport)
BOOL
__stdcall
SetProcessWorkingSetSize(
     HANDLE hProcess,
     SIZE_T dwMinimumWorkingSetSize,
     SIZE_T dwMaximumWorkingSetSize
    );

__declspec(dllimport)
BOOL
__stdcall
SetProcessWorkingSetSizeEx(
     HANDLE hProcess,
     SIZE_T dwMinimumWorkingSetSize,
     SIZE_T dwMaximumWorkingSetSize,
     DWORD Flags
    );

__declspec(dllimport)
HANDLE
__stdcall
OpenProcess(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     DWORD dwProcessId
    );

__declspec(dllimport)

HANDLE
__stdcall
GetCurrentProcess(
    void
    );

__declspec(dllimport)
DWORD
__stdcall
GetCurrentProcessId(
    void
    );

__declspec(dllimport)
__declspec(noreturn)
void
__stdcall
ExitProcess(
     UINT uExitCode
    );

__declspec(dllimport)
BOOL
__stdcall
TerminateProcess(
     HANDLE hProcess,
     UINT uExitCode
    );

__declspec(dllimport)
BOOL
__stdcall
GetExitCodeProcess(
      HANDLE hProcess,
     LPDWORD lpExitCode
    );

__declspec(dllimport)
void
__stdcall
FatalExit(
     int ExitCode
    );

__declspec(dllimport)


LPCH
__stdcall
GetEnvironmentStrings(
    void
    );

__declspec(dllimport)


LPWCH
__stdcall
GetEnvironmentStringsW(
    void
    );





#line 3441 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetEnvironmentStringsA(
      LPCH NewEnvironment
    );
__declspec(dllimport)
BOOL
__stdcall
SetEnvironmentStringsW(
      LPWCH NewEnvironment
    );




#line 3459 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
FreeEnvironmentStringsA(
      LPCH
    );
__declspec(dllimport)
BOOL
__stdcall
FreeEnvironmentStringsW(
      LPWCH
    );




#line 3477 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
RaiseException(
     DWORD dwExceptionCode,
     DWORD dwExceptionFlags,
     DWORD nNumberOfArguments,
     const ULONG_PTR *lpArguments
    );


__declspec(dllimport)
LONG
__stdcall
UnhandledExceptionFilter(
     struct _EXCEPTION_POINTERS *ExceptionInfo
    );

typedef LONG (__stdcall *PTOP_LEVEL_EXCEPTION_FILTER)(
     struct _EXCEPTION_POINTERS *ExceptionInfo
    );
typedef PTOP_LEVEL_EXCEPTION_FILTER LPTOP_LEVEL_EXCEPTION_FILTER;

__declspec(dllimport)
LPTOP_LEVEL_EXCEPTION_FILTER
__stdcall
SetUnhandledExceptionFilter(
     LPTOP_LEVEL_EXCEPTION_FILTER lpTopLevelExceptionFilter
    );



//
// Fiber creation flags
//



__declspec(dllimport)

LPVOID
__stdcall
CreateFiber(
         SIZE_T dwStackSize,
         LPFIBER_START_ROUTINE lpStartAddress,
     LPVOID lpParameter
    );

__declspec(dllimport)

LPVOID
__stdcall
CreateFiberEx(
         SIZE_T dwStackCommitSize,
         SIZE_T dwStackReserveSize,
         DWORD dwFlags,
         LPFIBER_START_ROUTINE lpStartAddress,
     LPVOID lpParameter
    );

__declspec(dllimport)
void
__stdcall
DeleteFiber(
     LPVOID lpFiber
    );

__declspec(dllimport)

LPVOID
__stdcall
ConvertThreadToFiber(
     LPVOID lpParameter
    );

__declspec(dllimport)

LPVOID
__stdcall
ConvertThreadToFiberEx(
     LPVOID lpParameter,
         DWORD dwFlags
    );



__declspec(dllimport)
BOOL
__stdcall
ConvertFiberToThread(
    void
    );

#line 3572 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
IsThreadAFiber(
    void
    );

#line 3583 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
SwitchToFiber(
     LPVOID lpFiber
    );

__declspec(dllimport)
BOOL
__stdcall
SwitchToThread(
    void
    );

#line 3599 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
CreateThread(
      LPSECURITY_ATTRIBUTES lpThreadAttributes,
          SIZE_T dwStackSize,
          LPTHREAD_START_ROUTINE lpStartAddress,
      LPVOID lpParameter,
          DWORD dwCreationFlags,
     LPDWORD lpThreadId
    );

__declspec(dllimport)

HANDLE
__stdcall
CreateRemoteThread(
          HANDLE hProcess,
      LPSECURITY_ATTRIBUTES lpThreadAttributes,
          SIZE_T dwStackSize,
          LPTHREAD_START_ROUTINE lpStartAddress,
      LPVOID lpParameter,
          DWORD dwCreationFlags,
     LPDWORD lpThreadId
    );

__declspec(dllimport)

HANDLE
__stdcall
GetCurrentThread(
    void
    );

__declspec(dllimport)
DWORD
__stdcall
GetCurrentThreadId(
    void
    );

__declspec(dllimport)
BOOL
__stdcall
SetThreadStackGuarantee (
     PULONG StackSizeInBytes
    );

__declspec(dllimport)
DWORD
__stdcall
GetProcessIdOfThread(
     HANDLE Thread
    );



__declspec(dllimport)
DWORD
__stdcall
GetThreadId(
     HANDLE Thread
    );

#line 3666 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetProcessId(
     HANDLE Process
    );

__declspec(dllimport)
DWORD
__stdcall
GetCurrentProcessorNumber(
    void
    );

__declspec(dllimport)
DWORD_PTR
__stdcall
SetThreadAffinityMask(
     HANDLE hThread,
     DWORD_PTR dwThreadAffinityMask
    );


__declspec(dllimport)
DWORD
__stdcall
SetThreadIdealProcessor(
     HANDLE hThread,
     DWORD dwIdealProcessor
    );
#line 3698 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetProcessPriorityBoost(
     HANDLE hProcess,
     BOOL bDisablePriorityBoost
    );

__declspec(dllimport)
BOOL
__stdcall
GetProcessPriorityBoost(
      HANDLE hProcess,
     PBOOL  pDisablePriorityBoost
    );

__declspec(dllimport)
BOOL
__stdcall
RequestWakeupLatency(
     LATENCY_TIME latency
    );

__declspec(dllimport)
BOOL
__stdcall
IsSystemResumeAutomatic(
    void
    );

__declspec(dllimport)

HANDLE
__stdcall
OpenThread(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     DWORD dwThreadId
    );

__declspec(dllimport)
BOOL
__stdcall
SetThreadPriority(
     HANDLE hThread,
     int nPriority
    );

__declspec(dllimport)
BOOL
__stdcall
SetThreadPriorityBoost(
     HANDLE hThread,
     BOOL bDisablePriorityBoost
    );

__declspec(dllimport)
BOOL
__stdcall
GetThreadPriorityBoost(
      HANDLE hThread,
     PBOOL pDisablePriorityBoost
    );

__declspec(dllimport)
int
__stdcall
GetThreadPriority(
     HANDLE hThread
    );

__declspec(dllimport)
BOOL
__stdcall
GetThreadTimes(
      HANDLE hThread,
     LPFILETIME lpCreationTime,
     LPFILETIME lpExitTime,
     LPFILETIME lpKernelTime,
     LPFILETIME lpUserTime
    );



__declspec(dllimport)
BOOL
__stdcall
GetThreadIOPendingFlag(
      HANDLE hThread,
     PBOOL  lpIOIsPending
    );

#line 3792 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
__declspec(noreturn)
void
__stdcall
ExitThread(
     DWORD dwExitCode
    );

__declspec(dllimport)
BOOL
__stdcall
TerminateThread(
     HANDLE hThread,
     DWORD dwExitCode
    );

__declspec(dllimport)
BOOL
__stdcall
GetExitCodeThread(
      HANDLE hThread,
     LPDWORD lpExitCode
    );

__declspec(dllimport)
BOOL
__stdcall
GetThreadSelectorEntry(
      HANDLE hThread,
      DWORD dwSelector,
     LPLDT_ENTRY lpSelectorEntry
    );

__declspec(dllimport)
EXECUTION_STATE
__stdcall
SetThreadExecutionState(
     EXECUTION_STATE esFlags
    );




__declspec(dllimport)

DWORD
__stdcall
GetLastError(
    void
    );
#line 3844 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
SetLastError(
     DWORD dwErrCode
    );


//#if _WIN32_WINNT >= 0x0501 || defined(WINBASE_DECLARE_RESTORE_LAST_ERROR)














#line 3869 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 3870 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
GetOverlappedResult(
      HANDLE hFile,
      LPOVERLAPPED lpOverlapped,
     LPDWORD lpNumberOfBytesTransferred,
      BOOL bWait
    );

__declspec(dllimport)

HANDLE
__stdcall
CreateIoCompletionPort(
         HANDLE FileHandle,
     HANDLE ExistingCompletionPort,
         ULONG_PTR CompletionKey,
         DWORD NumberOfConcurrentThreads
    );

__declspec(dllimport)
BOOL
__stdcall
GetQueuedCompletionStatus(
      HANDLE CompletionPort,
     LPDWORD lpNumberOfBytesTransferred,
     PULONG_PTR lpCompletionKey,
     LPOVERLAPPED *lpOverlapped,
      DWORD dwMilliseconds
    );



__declspec(dllimport)
BOOL
__stdcall
GetQueuedCompletionStatusEx(
      HANDLE CompletionPort,
     LPOVERLAPPED_ENTRY lpCompletionPortEntries,
      ULONG ulCount,
     PULONG ulNumEntriesRemoved,
      DWORD dwMilliseconds,
      BOOL fAlertable
    );

#line 3920 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
PostQueuedCompletionStatus(
         HANDLE CompletionPort,
         DWORD dwNumberOfBytesTransferred,
         ULONG_PTR dwCompletionKey,
     LPOVERLAPPED lpOverlapped
    );



//
// The following flags allows an application to change
// the semantics of IO completion notification.
//

//
// Don't queue an entry to an associated completion port if returning success
// synchronously.
//


//
// Don't set the file handle event on IO completion.
//


__declspec(dllimport)
BOOL
__stdcall
SetFileCompletionNotificationModes(
     HANDLE FileHandle,
     UCHAR Flags
    );

__declspec(dllimport)
BOOL
__stdcall
SetFileIoOverlappedRange(
     HANDLE FileHandle,
     PUCHAR OverlappedRangeStart,
     ULONG Length
    );

#line 3967 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"






__declspec(dllimport)
UINT
__stdcall
GetErrorMode(
    void
    );

__declspec(dllimport)
UINT
__stdcall
SetErrorMode(
     UINT uMode
    );

__declspec(dllimport)
BOOL
__stdcall
ReadProcessMemory(
          HANDLE hProcess,
          LPCVOID lpBaseAddress,
     LPVOID lpBuffer,
          SIZE_T nSize,
     SIZE_T * lpNumberOfBytesRead
    );

__declspec(dllimport)
BOOL
__stdcall
WriteProcessMemory(
          HANDLE hProcess,
          LPVOID lpBaseAddress,
     LPCVOID lpBuffer,
          SIZE_T nSize,
     SIZE_T * lpNumberOfBytesWritten
    );


__declspec(dllimport)
BOOL
__stdcall
GetThreadContext(
        HANDLE hThread,
     LPCONTEXT lpContext
    );

__declspec(dllimport)
BOOL
__stdcall
SetThreadContext(
     HANDLE hThread,
     const CONTEXT *lpContext
    );

__declspec(dllimport)
BOOL
__stdcall
Wow64GetThreadContext(
        HANDLE hThread,
     PWOW64_CONTEXT lpContext
    );

__declspec(dllimport)
BOOL
__stdcall
Wow64SetThreadContext(
     HANDLE hThread,
     const WOW64_CONTEXT *lpContext
    );

#line 4043 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
SuspendThread(
     HANDLE hThread
    );

__declspec(dllimport)
DWORD
__stdcall
Wow64SuspendThread(
     HANDLE hThread
    );

__declspec(dllimport)
DWORD
__stdcall
ResumeThread(
     HANDLE hThread
    );




typedef
void
(__stdcall *PAPCFUNC)(
     ULONG_PTR dwParam
    );

__declspec(dllimport)
DWORD
__stdcall
QueueUserAPC(
     PAPCFUNC pfnAPC,
     HANDLE hThread,
     ULONG_PTR dwData
    );

#line 4084 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
IsDebuggerPresent(
    void
    );
#line 4093 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
CheckRemoteDebuggerPresent(
      HANDLE hProcess,
     PBOOL pbDebuggerPresent
    );

#line 4105 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
DebugBreak(
    void
    );

__declspec(dllimport)
BOOL
__stdcall
WaitForDebugEvent(
     LPDEBUG_EVENT lpDebugEvent,
     DWORD dwMilliseconds
    );

__declspec(dllimport)
BOOL
__stdcall
ContinueDebugEvent(
     DWORD dwProcessId,
     DWORD dwThreadId,
     DWORD dwContinueStatus
    );

__declspec(dllimport)
BOOL
__stdcall
DebugActiveProcess(
     DWORD dwProcessId
    );

__declspec(dllimport)
BOOL
__stdcall
DebugActiveProcessStop(
     DWORD dwProcessId
    );

__declspec(dllimport)
BOOL
__stdcall
DebugSetProcessKillOnExit(
     BOOL KillOnExit
    );

__declspec(dllimport)
BOOL
__stdcall
DebugBreakProcess (
     HANDLE Process
    );

__declspec(dllimport)
void
__stdcall
InitializeCriticalSection(
     LPCRITICAL_SECTION lpCriticalSection
    );

__declspec(dllimport)
void
__stdcall
EnterCriticalSection(
     LPCRITICAL_SECTION lpCriticalSection
    );

__declspec(dllimport)
void
__stdcall
LeaveCriticalSection(
     LPCRITICAL_SECTION lpCriticalSection
    );




__declspec(dllimport)
BOOL
__stdcall
InitializeCriticalSectionAndSpinCount(
     LPCRITICAL_SECTION lpCriticalSection,
      DWORD dwSpinCount
    );

__declspec(dllimport)
BOOL
__stdcall
InitializeCriticalSectionEx(
     LPCRITICAL_SECTION lpCriticalSection,
      DWORD dwSpinCount,
      DWORD Flags
    );

__declspec(dllimport)
DWORD
__stdcall
SetCriticalSectionSpinCount(
     LPCRITICAL_SECTION lpCriticalSection,
        DWORD dwSpinCount
    );
#line 4207 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
TryEnterCriticalSection(
     LPCRITICAL_SECTION lpCriticalSection
    );
#line 4216 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
DeleteCriticalSection(
     LPCRITICAL_SECTION lpCriticalSection
    );

__declspec(dllimport)
BOOL
__stdcall
SetEvent(
     HANDLE hEvent
    );

__declspec(dllimport)
BOOL
__stdcall
ResetEvent(
     HANDLE hEvent
    );

__declspec(dllimport)
BOOL
__stdcall
PulseEvent(
     HANDLE hEvent
    );

__declspec(dllimport)
BOOL
__stdcall
ReleaseSemaphore(
          HANDLE hSemaphore,
          LONG lReleaseCount,
     LPLONG lpPreviousCount
    );

__declspec(dllimport)
BOOL
__stdcall
ReleaseMutex(
     HANDLE hMutex
    );

__declspec(dllimport)
DWORD
__stdcall
WaitForSingleObject(
     HANDLE hHandle,
     DWORD dwMilliseconds
    );

__declspec(dllimport)
DWORD
__stdcall
WaitForMultipleObjects(
     DWORD nCount,
     const HANDLE *lpHandles,
     BOOL bWaitAll,
     DWORD dwMilliseconds
    );

__declspec(dllimport)
void
__stdcall
Sleep(
     DWORD dwMilliseconds
    );

__declspec(dllimport)

HGLOBAL
__stdcall
LoadResource(
     HMODULE hModule,
     HRSRC hResInfo
    );

__declspec(dllimport)
DWORD
__stdcall
SizeofResource(
     HMODULE hModule,
     HRSRC hResInfo
    );


__declspec(dllimport)
ATOM
__stdcall
GlobalDeleteAtom(
     ATOM nAtom
    );

__declspec(dllimport)
BOOL
__stdcall
InitAtomTable(
     DWORD nSize
    );

__declspec(dllimport)
ATOM
__stdcall
DeleteAtom(
     ATOM nAtom
    );

__declspec(dllimport)
UINT
__stdcall
SetHandleCount(
     UINT uNumber
    );

__declspec(dllimport)
DWORD
__stdcall
GetLogicalDrives(
    void
    );

__declspec(dllimport)
BOOL
__stdcall
LockFile(
     HANDLE hFile,
     DWORD dwFileOffsetLow,
     DWORD dwFileOffsetHigh,
     DWORD nNumberOfBytesToLockLow,
     DWORD nNumberOfBytesToLockHigh
    );

__declspec(dllimport)
BOOL
__stdcall
UnlockFile(
     HANDLE hFile,
     DWORD dwFileOffsetLow,
     DWORD dwFileOffsetHigh,
     DWORD nNumberOfBytesToUnlockLow,
     DWORD nNumberOfBytesToUnlockHigh
    );

__declspec(dllimport)
BOOL
__stdcall
LockFileEx(
           HANDLE hFile,
           DWORD dwFlags,
     DWORD dwReserved,
           DWORD nNumberOfBytesToLockLow,
           DWORD nNumberOfBytesToLockHigh,
        LPOVERLAPPED lpOverlapped
    );




__declspec(dllimport)
BOOL
__stdcall
UnlockFileEx(
           HANDLE hFile,
     DWORD dwReserved,
           DWORD nNumberOfBytesToUnlockLow,
           DWORD nNumberOfBytesToUnlockHigh,
        LPOVERLAPPED lpOverlapped
    );

typedef struct _BY_HANDLE_FILE_INFORMATION {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD dwVolumeSerialNumber;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD nNumberOfLinks;
    DWORD nFileIndexHigh;
    DWORD nFileIndexLow;
} BY_HANDLE_FILE_INFORMATION, *PBY_HANDLE_FILE_INFORMATION, *LPBY_HANDLE_FILE_INFORMATION;

__declspec(dllimport)
BOOL
__stdcall
GetFileInformationByHandle(
      HANDLE hFile,
     LPBY_HANDLE_FILE_INFORMATION lpFileInformation
    );

__declspec(dllimport)
DWORD
__stdcall
GetFileType(
     HANDLE hFile
    );

__declspec(dllimport)
DWORD
__stdcall
GetFileSize(
          HANDLE hFile,
     LPDWORD lpFileSizeHigh
    );

__declspec(dllimport)
BOOL
__stdcall
GetFileSizeEx(
      HANDLE hFile,
     PLARGE_INTEGER lpFileSize
    );


__declspec(dllimport)
HANDLE
__stdcall
GetStdHandle(
     DWORD nStdHandle
    );

__declspec(dllimport)
BOOL
__stdcall
SetStdHandle(
     DWORD nStdHandle,
     HANDLE hHandle
    );



__declspec(dllimport)
BOOL
__stdcall
SetStdHandleEx(
          DWORD nStdHandle,
          HANDLE hHandle,
     PHANDLE phPrevValue
    );

#line 4459 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WriteFile(
            HANDLE hFile,
     LPCVOID lpBuffer,
            DWORD nNumberOfBytesToWrite,
       LPDWORD lpNumberOfBytesWritten,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
BOOL
__stdcall
ReadFile(
            HANDLE hFile,
      LPVOID lpBuffer,
            DWORD nNumberOfBytesToRead,
       LPDWORD lpNumberOfBytesRead,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
BOOL
__stdcall
FlushFileBuffers(
     HANDLE hFile
    );

__declspec(dllimport)
BOOL
__stdcall
DeviceIoControl(
            HANDLE hDevice,
            DWORD dwIoControlCode,
     LPVOID lpInBuffer,
            DWORD nInBufferSize,
     LPVOID lpOutBuffer,
            DWORD nOutBufferSize,
       LPDWORD lpBytesReturned,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
BOOL
__stdcall
RequestDeviceWakeup(
     HANDLE hDevice
    );

__declspec(dllimport)
BOOL
__stdcall
CancelDeviceWakeupRequest(
     HANDLE hDevice
    );

__declspec(dllimport)
BOOL
__stdcall
GetDevicePowerState(
      HANDLE hDevice,
     BOOL *pfOn
    );

__declspec(dllimport)
BOOL
__stdcall
SetMessageWaitingIndicator(
     HANDLE hMsgIndicator,
     ULONG ulMsgCount
    );

__declspec(dllimport)
BOOL
__stdcall
SetEndOfFile(
     HANDLE hFile
    );

__declspec(dllimport)
DWORD
__stdcall
SetFilePointer(
            HANDLE hFile,
            LONG lDistanceToMove,
     PLONG lpDistanceToMoveHigh,
            DWORD dwMoveMethod
    );

__declspec(dllimport)
BOOL
__stdcall
SetFilePointerEx(
          HANDLE hFile,
          LARGE_INTEGER liDistanceToMove,
     PLARGE_INTEGER lpNewFilePointer,
          DWORD dwMoveMethod
    );

__declspec(dllimport)
BOOL
__stdcall
FindClose(
     HANDLE hFindFile
    );

__declspec(dllimport)
BOOL
__stdcall
GetFileTime(
          HANDLE hFile,
     LPFILETIME lpCreationTime,
     LPFILETIME lpLastAccessTime,
     LPFILETIME lpLastWriteTime
    );

__declspec(dllimport)
BOOL
__stdcall
SetFileTime(
         HANDLE hFile,
     const FILETIME *lpCreationTime,
     const FILETIME *lpLastAccessTime,
     const FILETIME *lpLastWriteTime
    );




__declspec(dllimport)
BOOL
__stdcall
SetFileValidData(
     HANDLE hFile,
     LONGLONG ValidDataLength
    );

#line 4599 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
SetFileShortNameA(
     HANDLE hFile,
     LPCSTR lpShortName
    );
__declspec(dllimport)
BOOL
__stdcall
SetFileShortNameW(
     HANDLE hFile,
     LPCWSTR lpShortName
    );




#line 4620 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CloseHandle(
     HANDLE hObject
    );

__declspec(dllimport)
BOOL
__stdcall
DuplicateHandle(
            HANDLE hSourceProcessHandle,
            HANDLE hSourceHandle,
            HANDLE hTargetProcessHandle,
     LPHANDLE lpTargetHandle,
            DWORD dwDesiredAccess,
            BOOL bInheritHandle,
            DWORD dwOptions
    );

__declspec(dllimport)
BOOL
__stdcall
GetHandleInformation(
      HANDLE hObject,
     LPDWORD lpdwFlags
    );

__declspec(dllimport)
BOOL
__stdcall
SetHandleInformation(
     HANDLE hObject,
     DWORD dwMask,
     DWORD dwFlags
    );






__declspec(dllimport)
DWORD
__stdcall
LoadModule(
     LPCSTR lpModuleName,
     LPVOID lpParameterBlock
    );


__declspec(dllimport)
UINT
__stdcall
WinExec(
     LPCSTR lpCmdLine,
     UINT uCmdShow
    );

__declspec(dllimport)
BOOL
__stdcall
ClearCommBreak(
     HANDLE hFile
    );

__declspec(dllimport)
BOOL
__stdcall
ClearCommError(
          HANDLE hFile,
     LPDWORD lpErrors,
     LPCOMSTAT lpStat
    );

__declspec(dllimport)
BOOL
__stdcall
SetupComm(
     HANDLE hFile,
     DWORD dwInQueue,
     DWORD dwOutQueue
    );

__declspec(dllimport)
BOOL
__stdcall
EscapeCommFunction(
     HANDLE hFile,
     DWORD dwFunc
    );

__declspec(dllimport)

BOOL
__stdcall
GetCommConfig(
          HANDLE hCommDev,
     LPCOMMCONFIG lpCC,
       LPDWORD lpdwSize
    );

__declspec(dllimport)
BOOL
__stdcall
GetCommMask(
      HANDLE hFile,
     LPDWORD lpEvtMask
    );

__declspec(dllimport)
BOOL
__stdcall
GetCommProperties(
        HANDLE hFile,
     LPCOMMPROP lpCommProp
    );

__declspec(dllimport)
BOOL
__stdcall
GetCommModemStatus(
      HANDLE hFile,
     LPDWORD lpModemStat
    );

__declspec(dllimport)
BOOL
__stdcall
GetCommState(
      HANDLE hFile,
     LPDCB lpDCB
    );

__declspec(dllimport)
BOOL
__stdcall
GetCommTimeouts(
      HANDLE hFile,
     LPCOMMTIMEOUTS lpCommTimeouts
    );

__declspec(dllimport)
BOOL
__stdcall
PurgeComm(
     HANDLE hFile,
     DWORD dwFlags
    );

__declspec(dllimport)
BOOL
__stdcall
SetCommBreak(
     HANDLE hFile
    );

__declspec(dllimport)
BOOL
__stdcall
SetCommConfig(
     HANDLE hCommDev,
     LPCOMMCONFIG lpCC,
     DWORD dwSize
    );

__declspec(dllimport)
BOOL
__stdcall
SetCommMask(
     HANDLE hFile,
     DWORD dwEvtMask
    );

__declspec(dllimport)
BOOL
__stdcall
SetCommState(
     HANDLE hFile,
     LPDCB lpDCB
    );

__declspec(dllimport)
BOOL
__stdcall
SetCommTimeouts(
     HANDLE hFile,
     LPCOMMTIMEOUTS lpCommTimeouts
    );

__declspec(dllimport)
BOOL
__stdcall
TransmitCommChar(
     HANDLE hFile,
     char cChar
    );

__declspec(dllimport)
BOOL
__stdcall
WaitCommEvent(
            HANDLE hFile,
         LPDWORD lpEvtMask,
     LPOVERLAPPED lpOverlapped
    );


__declspec(dllimport)
DWORD
__stdcall
SetTapePosition(
     HANDLE hDevice,
     DWORD dwPositionMethod,
     DWORD dwPartition,
     DWORD dwOffsetLow,
     DWORD dwOffsetHigh,
     BOOL bImmediate
    );

__declspec(dllimport)
DWORD
__stdcall
GetTapePosition(
      HANDLE hDevice,
      DWORD dwPositionType,
     LPDWORD lpdwPartition,
     LPDWORD lpdwOffsetLow,
     LPDWORD lpdwOffsetHigh
    );

__declspec(dllimport)
DWORD
__stdcall
PrepareTape(
     HANDLE hDevice,
     DWORD dwOperation,
     BOOL bImmediate
    );

__declspec(dllimport)
DWORD
__stdcall
EraseTape(
     HANDLE hDevice,
     DWORD dwEraseType,
     BOOL bImmediate
    );

__declspec(dllimport)
DWORD
__stdcall
CreateTapePartition(
     HANDLE hDevice,
     DWORD dwPartitionMethod,
     DWORD dwCount,
     DWORD dwSize
    );

__declspec(dllimport)
DWORD
__stdcall
WriteTapemark(
     HANDLE hDevice,
     DWORD dwTapemarkType,
     DWORD dwTapemarkCount,
     BOOL bImmediate
    );

__declspec(dllimport)
DWORD
__stdcall
GetTapeStatus(
     HANDLE hDevice
    );

__declspec(dllimport)
DWORD
__stdcall
GetTapeParameters(
        HANDLE hDevice,
        DWORD dwOperation,
     LPDWORD lpdwSize,
     LPVOID lpTapeInformation
    );




__declspec(dllimport)
DWORD
__stdcall
SetTapeParameters(
     HANDLE hDevice,
     DWORD dwOperation,
     LPVOID lpTapeInformation
    );




__declspec(dllimport)
BOOL
__stdcall
Beep(
     DWORD dwFreq,
     DWORD dwDuration
    );

__declspec(dllimport)
int
__stdcall
MulDiv(
     int nNumber,
     int nNumerator,
     int nDenominator
    );

__declspec(dllimport)
void
__stdcall
GetSystemTime(
     LPSYSTEMTIME lpSystemTime
    );

__declspec(dllimport)
void
__stdcall
GetSystemTimeAsFileTime(
     LPFILETIME lpSystemTimeAsFileTime
    );

__declspec(dllimport)
BOOL
__stdcall
SetSystemTime(
     const SYSTEMTIME *lpSystemTime
    );

__declspec(dllimport)
void
__stdcall
GetLocalTime(
     LPSYSTEMTIME lpSystemTime
    );

__declspec(dllimport)
BOOL
__stdcall
SetLocalTime(
     const SYSTEMTIME *lpSystemTime
    );

__declspec(dllimport)
void
__stdcall
GetSystemInfo(
     LPSYSTEM_INFO lpSystemInfo
    );



__declspec(dllimport)
BOOL
__stdcall
SetSystemFileCacheSize (
     SIZE_T MinimumFileCacheSize,
     SIZE_T MaximumFileCacheSize,
     DWORD Flags
    );

__declspec(dllimport)
BOOL
__stdcall
GetSystemFileCacheSize (
     PSIZE_T lpMinimumFileCacheSize,
     PSIZE_T lpMaximumFileCacheSize,
     PDWORD lpFlags
    );

#line 5002 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
GetSystemRegistryQuota(
     PDWORD pdwQuotaAllowed,
     PDWORD pdwQuotaUsed
    );

BOOL
__stdcall
GetSystemTimes(
     LPFILETIME lpIdleTime,
     LPFILETIME lpKernelTime,
     LPFILETIME lpUserTime
    );

#line 5022 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
void
__stdcall
GetNativeSystemInfo(
     LPSYSTEM_INFO lpSystemInfo
    );
#line 5031 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
IsProcessorFeaturePresent(
     DWORD ProcessorFeature
    );

typedef struct _TIME_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName[ 32 ];
    SYSTEMTIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName[ 32 ];
    SYSTEMTIME DaylightDate;
    LONG DaylightBias;
} TIME_ZONE_INFORMATION, *PTIME_ZONE_INFORMATION, *LPTIME_ZONE_INFORMATION;

typedef struct _TIME_DYNAMIC_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName[ 32 ];
    SYSTEMTIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName[ 32 ];
    SYSTEMTIME DaylightDate;
    LONG DaylightBias;
    WCHAR TimeZoneKeyName[ 128 ];
    BOOLEAN DynamicDaylightTimeDisabled;
} DYNAMIC_TIME_ZONE_INFORMATION, *PDYNAMIC_TIME_ZONE_INFORMATION;


__declspec(dllimport)
BOOL
__stdcall
SystemTimeToTzSpecificLocalTime(
     const TIME_ZONE_INFORMATION *lpTimeZoneInformation,
         const SYSTEMTIME *lpUniversalTime,
        LPSYSTEMTIME lpLocalTime
    );

__declspec(dllimport)
BOOL
__stdcall
TzSpecificLocalTimeToSystemTime(
     const TIME_ZONE_INFORMATION *lpTimeZoneInformation,
         const SYSTEMTIME *lpLocalTime,
        LPSYSTEMTIME lpUniversalTime
    );

__declspec(dllimport)
DWORD
__stdcall
GetTimeZoneInformation(
     LPTIME_ZONE_INFORMATION lpTimeZoneInformation
    );

__declspec(dllimport)
BOOL
__stdcall
SetTimeZoneInformation(
     const TIME_ZONE_INFORMATION *lpTimeZoneInformation
    );

__declspec(dllimport)
DWORD
__stdcall
GetDynamicTimeZoneInformation(
     PDYNAMIC_TIME_ZONE_INFORMATION pTimeZoneInformation
    );

__declspec(dllimport)
BOOL
__stdcall
SetDynamicTimeZoneInformation(
     const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation
    );



//
// Routines to convert back and forth between system time and file time
//

__declspec(dllimport)
BOOL
__stdcall
SystemTimeToFileTime(
      const SYSTEMTIME *lpSystemTime,
     LPFILETIME lpFileTime
    );

__declspec(dllimport)
BOOL
__stdcall
FileTimeToLocalFileTime(
      const FILETIME *lpFileTime,
     LPFILETIME lpLocalFileTime
    );

__declspec(dllimport)
BOOL
__stdcall
LocalFileTimeToFileTime(
      const FILETIME *lpLocalFileTime,
     LPFILETIME lpFileTime
    );

__declspec(dllimport)
BOOL
__stdcall
FileTimeToSystemTime(
      const FILETIME *lpFileTime,
     LPSYSTEMTIME lpSystemTime
    );

__declspec(dllimport)
LONG
__stdcall
CompareFileTime(
     const FILETIME *lpFileTime1,
     const FILETIME *lpFileTime2
    );

__declspec(dllimport)
BOOL
__stdcall
FileTimeToDosDateTime(
      const FILETIME *lpFileTime,
     LPWORD lpFatDate,
     LPWORD lpFatTime
    );

__declspec(dllimport)
BOOL
__stdcall
DosDateTimeToFileTime(
      WORD wFatDate,
      WORD wFatTime,
     LPFILETIME lpFileTime
    );

__declspec(dllimport)
DWORD
__stdcall
GetTickCount(
    void
    );

__declspec(dllimport)
ULONGLONG
__stdcall
GetTickCount64(
    void
    );

__declspec(dllimport)
BOOL
__stdcall
SetSystemTimeAdjustment(
     DWORD dwTimeAdjustment,
     BOOL  bTimeAdjustmentDisabled
    );

__declspec(dllimport)
BOOL
__stdcall
GetSystemTimeAdjustment(
     PDWORD lpTimeAdjustment,
     PDWORD lpTimeIncrement,
     PBOOL  lpTimeAdjustmentDisabled
    );


__declspec(dllimport)
DWORD
__stdcall
FormatMessageA(
         DWORD dwFlags,
     LPCVOID lpSource,
         DWORD dwMessageId,
         DWORD dwLanguageId,
        LPSTR lpBuffer,
         DWORD nSize,
     va_list *Arguments
    );
__declspec(dllimport)
DWORD
__stdcall
FormatMessageW(
         DWORD dwFlags,
     LPCVOID lpSource,
         DWORD dwMessageId,
         DWORD dwLanguageId,
        LPWSTR lpBuffer,
         DWORD nSize,
     va_list *Arguments
    );




#line 5233 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





























#line 5263 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 5264 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"











__declspec(dllimport)
BOOL
__stdcall
CreatePipe(
     PHANDLE hReadPipe,
     PHANDLE hWritePipe,
     LPSECURITY_ATTRIBUTES lpPipeAttributes,
         DWORD nSize
    );

__declspec(dllimport)
BOOL
__stdcall
ConnectNamedPipe(
            HANDLE hNamedPipe,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
BOOL
__stdcall
DisconnectNamedPipe(
     HANDLE hNamedPipe
    );

__declspec(dllimport)
BOOL
__stdcall
SetNamedPipeHandleState(
         HANDLE hNamedPipe,
     LPDWORD lpMode,
     LPDWORD lpMaxCollectionCount,
     LPDWORD lpCollectDataTimeout
    );

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeInfo(
          HANDLE hNamedPipe,
     LPDWORD lpFlags,
     LPDWORD lpOutBufferSize,
     LPDWORD lpInBufferSize,
     LPDWORD lpMaxInstances
    );

__declspec(dllimport)
BOOL
__stdcall
PeekNamedPipe(
          HANDLE hNamedPipe,
     LPVOID lpBuffer,
          DWORD nBufferSize,
     LPDWORD lpBytesRead,
     LPDWORD lpTotalBytesAvail,
     LPDWORD lpBytesLeftThisMessage
    );

__declspec(dllimport)
BOOL
__stdcall
TransactNamedPipe(
            HANDLE hNamedPipe,
     LPVOID lpInBuffer,
            DWORD nInBufferSize,
     LPVOID lpOutBuffer,
            DWORD nOutBufferSize,
           LPDWORD lpBytesRead,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)

HANDLE
__stdcall
CreateMailslotA(
         LPCSTR lpName,
         DWORD nMaxMessageSize,
         DWORD lReadTimeout,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateMailslotW(
         LPCWSTR lpName,
         DWORD nMaxMessageSize,
         DWORD lReadTimeout,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );




#line 5371 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetMailslotInfo(
          HANDLE hMailslot,
     LPDWORD lpMaxMessageSize,
     LPDWORD lpNextSize,
     LPDWORD lpMessageCount,
     LPDWORD lpReadTimeout
    );

__declspec(dllimport)
BOOL
__stdcall
SetMailslotInfo(
     HANDLE hMailslot,
     DWORD lReadTimeout
    );

__declspec(dllimport)
 
LPVOID
__stdcall
MapViewOfFile(
     HANDLE hFileMappingObject,
     DWORD dwDesiredAccess,
     DWORD dwFileOffsetHigh,
     DWORD dwFileOffsetLow,
     SIZE_T dwNumberOfBytesToMap
    );

__declspec(dllimport)
BOOL
__stdcall
FlushViewOfFile(
     LPCVOID lpBaseAddress,
     SIZE_T dwNumberOfBytesToFlush
    );

__declspec(dllimport)
BOOL
__stdcall
UnmapViewOfFile(
     LPCVOID lpBaseAddress
    );

//
// File Encryption API
//

__declspec(dllimport)
BOOL
__stdcall
EncryptFileA(
     LPCSTR lpFileName
    );
__declspec(dllimport)
BOOL
__stdcall
EncryptFileW(
     LPCWSTR lpFileName
    );




#line 5439 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
DecryptFileA(
           LPCSTR lpFileName,
     DWORD dwReserved
    );
__declspec(dllimport)
BOOL
__stdcall
DecryptFileW(
           LPCWSTR lpFileName,
     DWORD dwReserved
    );




#line 5459 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
//  Encryption Status Value
//












__declspec(dllimport)
BOOL
__stdcall
FileEncryptionStatusA(
      LPCSTR lpFileName,
     LPDWORD  lpStatus
    );
__declspec(dllimport)
BOOL
__stdcall
FileEncryptionStatusW(
      LPCWSTR lpFileName,
     LPDWORD  lpStatus
    );




#line 5494 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Currently defined recovery flags
//



typedef
DWORD
(__stdcall *PFE_EXPORT_FUNC)(
     PBYTE pbData,
     PVOID pvCallbackContext,
         ULONG ulLength
    );

typedef
DWORD
(__stdcall *PFE_IMPORT_FUNC)(
     PBYTE pbData,
     PVOID pvCallbackContext,
      PULONG ulLength
    );


//
//  OpenRaw flag values
//







__declspec(dllimport)
DWORD
__stdcall
OpenEncryptedFileRawA(
            LPCSTR lpFileName,
            ULONG    ulFlags,
     PVOID   *pvContext
    );
__declspec(dllimport)
DWORD
__stdcall
OpenEncryptedFileRawW(
            LPCWSTR lpFileName,
            ULONG    ulFlags,
     PVOID   *pvContext
    );




#line 5549 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
ReadEncryptedFileRaw(
         PFE_EXPORT_FUNC pfExportCallback,
     PVOID           pvCallbackContext,
         PVOID           pvContext
    );

__declspec(dllimport)
DWORD
__stdcall
WriteEncryptedFileRaw(
         PFE_IMPORT_FUNC pfImportCallback,
     PVOID           pvCallbackContext,
         PVOID           pvContext
    );

__declspec(dllimport)
void
__stdcall
CloseEncryptedFileRaw(
     PVOID           pvContext
    );

//
// _l Compat Functions
//

__declspec(dllimport)
int
__stdcall
lstrcmpA(
     LPCSTR lpString1,
     LPCSTR lpString2
    );
__declspec(dllimport)
int
__stdcall
lstrcmpW(
     LPCWSTR lpString1,
     LPCWSTR lpString2
    );




#line 5598 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
int
__stdcall
lstrcmpiA(
     LPCSTR lpString1,
     LPCSTR lpString2
    );
__declspec(dllimport)
int
__stdcall
lstrcmpiW(
     LPCWSTR lpString1,
     LPCWSTR lpString2
    );




#line 5618 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

LPSTR
__stdcall
lstrcpynA(
     LPSTR lpString1,
     LPCSTR lpString2,
     int iMaxLength
    );
__declspec(dllimport)

LPWSTR
__stdcall
lstrcpynW(
     LPWSTR lpString1,
     LPCWSTR lpString2,
     int iMaxLength
    );




#line 5642 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


#pragma warning(push)
#pragma warning(disable:4995)
#line 5647 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

LPSTR
__stdcall
lstrcpyA(
     LPSTR lpString1,
      LPCSTR lpString2
    );
__declspec(dllimport)

LPWSTR
__stdcall
lstrcpyW(
     LPWSTR lpString1,
      LPCWSTR lpString2
    );




#line 5669 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

LPSTR
__stdcall
lstrcatA(
     LPSTR lpString1,
        LPCSTR lpString2
    );
__declspec(dllimport)

LPWSTR
__stdcall
lstrcatW(
     LPWSTR lpString1,
        LPCWSTR lpString2
    );




#line 5691 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


#pragma warning(pop)
#line 5695 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
int
__stdcall
lstrlenA(
     LPCSTR lpString
    );
__declspec(dllimport)
int
__stdcall
lstrlenW(
     LPCWSTR lpString
    );




#line 5713 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
HFILE
__stdcall
OpenFile(
        LPCSTR lpFileName,
     LPOFSTRUCT lpReOpenBuff,
        UINT uStyle
    );

__declspec(dllimport)
HFILE
__stdcall
_lopen(
     LPCSTR lpPathName,
     int iReadWrite
    );

__declspec(dllimport)
HFILE
__stdcall
_lcreat(
     LPCSTR lpPathName,
     int  iAttribute
    );

__declspec(dllimport)
UINT
__stdcall
_lread(
     HFILE hFile,
     LPVOID lpBuffer,
     UINT uBytes
    );

__declspec(dllimport)
UINT
__stdcall
_lwrite(
     HFILE hFile,
     LPCCH lpBuffer,
     UINT uBytes
    );

__declspec(dllimport)
long
__stdcall
_hread(
     HFILE hFile,
     LPVOID lpBuffer,
     long lBytes
    );

__declspec(dllimport)
long
__stdcall
_hwrite(
     HFILE hFile,
     LPCCH lpBuffer,
     long lBytes
    );

__declspec(dllimport)
HFILE
__stdcall
_lclose(
     HFILE hFile
    );

__declspec(dllimport)
LONG
__stdcall
_llseek(
     HFILE hFile,
     LONG lOffset,
     int iOrigin
    );

__declspec(dllimport)
BOOL
__stdcall
IsTextUnicode(
     const void* lpv,
            int iSize,
     LPINT lpiResult
    );



__declspec(dllimport)
DWORD
__stdcall
FlsAlloc(
     PFLS_CALLBACK_FUNCTION lpCallback
    );

__declspec(dllimport)
PVOID
__stdcall
FlsGetValue(
     DWORD dwFlsIndex
    );

__declspec(dllimport)
BOOL
__stdcall
FlsSetValue(
         DWORD dwFlsIndex,
     PVOID lpFlsData
    );

__declspec(dllimport)
BOOL
__stdcall
FlsFree(
     DWORD dwFlsIndex
    );



__declspec(dllimport)
DWORD
__stdcall
TlsAlloc(
    void
    );

__declspec(dllimport)
LPVOID
__stdcall
TlsGetValue(
     DWORD dwTlsIndex
    );

__declspec(dllimport)
BOOL
__stdcall
TlsSetValue(
         DWORD dwTlsIndex,
     LPVOID lpTlsValue
    );

__declspec(dllimport)
BOOL
__stdcall
TlsFree(
     DWORD dwTlsIndex
    );

typedef
void
(__stdcall *LPOVERLAPPED_COMPLETION_ROUTINE)(
        DWORD dwErrorCode,
        DWORD dwNumberOfBytesTransfered,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
DWORD
__stdcall
SleepEx(
     DWORD dwMilliseconds,
     BOOL bAlertable
    );

__declspec(dllimport)
DWORD
__stdcall
WaitForSingleObjectEx(
     HANDLE hHandle,
     DWORD dwMilliseconds,
     BOOL bAlertable
    );

__declspec(dllimport)
DWORD
__stdcall
WaitForMultipleObjectsEx(
     DWORD nCount,
     const HANDLE *lpHandles,
     BOOL bWaitAll,
     DWORD dwMilliseconds,
     BOOL bAlertable
    );


__declspec(dllimport)
DWORD
__stdcall
SignalObjectAndWait(
     HANDLE hObjectToSignal,
     HANDLE hObjectToWaitOn,
     DWORD dwMilliseconds,
     BOOL bAlertable
    );
#line 5909 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
ReadFileEx(
         HANDLE hFile,
      LPVOID lpBuffer,
         DWORD nNumberOfBytesToRead,
      LPOVERLAPPED lpOverlapped,
     LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    );

__declspec(dllimport)
BOOL
__stdcall
WriteFileEx(
         HANDLE hFile,
     LPCVOID lpBuffer,
         DWORD nNumberOfBytesToWrite,
      LPOVERLAPPED lpOverlapped,
     LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    );

__declspec(dllimport)
BOOL
__stdcall
BackupRead(
        HANDLE hFile,
     LPBYTE lpBuffer,
        DWORD nNumberOfBytesToRead,
       LPDWORD lpNumberOfBytesRead,
        BOOL bAbort,
        BOOL bProcessSecurity,
     LPVOID *lpContext
    );

__declspec(dllimport)
BOOL
__stdcall
BackupSeek(
        HANDLE hFile,
        DWORD  dwLowBytesToSeek,
        DWORD  dwHighBytesToSeek,
       LPDWORD lpdwLowByteSeeked,
       LPDWORD lpdwHighByteSeeked,
     LPVOID *lpContext
    );

__declspec(dllimport)
BOOL
__stdcall
BackupWrite(
        HANDLE hFile,
     LPBYTE lpBuffer,
        DWORD nNumberOfBytesToWrite,
       LPDWORD lpNumberOfBytesWritten,
        BOOL bAbort,
        BOOL bProcessSecurity,
     LPVOID *lpContext
    );

//
//  Stream id structure
//
typedef struct _WIN32_STREAM_ID {
        DWORD          dwStreamId ;
        DWORD          dwStreamAttributes ;
        LARGE_INTEGER  Size ;
        DWORD          dwStreamNameSize ;
        WCHAR          cStreamName[ 1 ] ;
} WIN32_STREAM_ID, *LPWIN32_STREAM_ID ;

//
//  Stream Ids
//














//
//  Stream Attributes
//







__declspec(dllimport)
BOOL
__stdcall
ReadFileScatter(
           HANDLE hFile,
           FILE_SEGMENT_ELEMENT aSegmentArray[],
           DWORD nNumberOfBytesToRead,
     LPDWORD lpReserved,
        LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
BOOL
__stdcall
WriteFileGather(
           HANDLE hFile,
           FILE_SEGMENT_ELEMENT aSegmentArray[],
           DWORD nNumberOfBytesToWrite,
     LPDWORD lpReserved,
        LPOVERLAPPED lpOverlapped
    );

//
// Dual Mode API below this line. Dual Mode Structures also included.
//














#line 6048 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

typedef struct _STARTUPINFOA {
    DWORD   cb;
    LPSTR   lpReserved;
    LPSTR   lpDesktop;
    LPSTR   lpTitle;
    DWORD   dwX;
    DWORD   dwY;
    DWORD   dwXSize;
    DWORD   dwYSize;
    DWORD   dwXCountChars;
    DWORD   dwYCountChars;
    DWORD   dwFillAttribute;
    DWORD   dwFlags;
    WORD    wShowWindow;
    WORD    cbReserved2;
    LPBYTE  lpReserved2;
    HANDLE  hStdInput;
    HANDLE  hStdOutput;
    HANDLE  hStdError;
} STARTUPINFOA, *LPSTARTUPINFOA;
typedef struct _STARTUPINFOW {
    DWORD   cb;
    LPWSTR  lpReserved;
    LPWSTR  lpDesktop;
    LPWSTR  lpTitle;
    DWORD   dwX;
    DWORD   dwY;
    DWORD   dwXSize;
    DWORD   dwYSize;
    DWORD   dwXCountChars;
    DWORD   dwYCountChars;
    DWORD   dwFillAttribute;
    DWORD   dwFlags;
    WORD    wShowWindow;
    WORD    cbReserved2;
    LPBYTE  lpReserved2;
    HANDLE  hStdInput;
    HANDLE  hStdOutput;
    HANDLE  hStdError;
} STARTUPINFOW, *LPSTARTUPINFOW;

typedef STARTUPINFOW STARTUPINFO;
typedef LPSTARTUPINFOW LPSTARTUPINFO;



#line 6096 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

typedef struct _STARTUPINFOEXA {
    STARTUPINFOA StartupInfo;
    struct _PROC_THREAD_ATTRIBUTE_LIST *lpAttributeList;
} STARTUPINFOEXA, *LPSTARTUPINFOEXA;
typedef struct _STARTUPINFOEXW {
    STARTUPINFOW StartupInfo;
    struct _PROC_THREAD_ATTRIBUTE_LIST *lpAttributeList;
} STARTUPINFOEXW, *LPSTARTUPINFOEXW;

typedef STARTUPINFOEXW STARTUPINFOEX;
typedef LPSTARTUPINFOEXW LPSTARTUPINFOEX;



#line 6112 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



typedef struct _WIN32_FIND_DATAA {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD dwReserved0;
    DWORD dwReserved1;
    CHAR   cFileName[ 260 ];
    CHAR   cAlternateFileName[ 14 ];





} WIN32_FIND_DATAA, *PWIN32_FIND_DATAA, *LPWIN32_FIND_DATAA;
typedef struct _WIN32_FIND_DATAW {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD dwReserved0;
    DWORD dwReserved1;
    WCHAR  cFileName[ 260 ];
    WCHAR  cAlternateFileName[ 14 ];





} WIN32_FIND_DATAW, *PWIN32_FIND_DATAW, *LPWIN32_FIND_DATAW;

typedef WIN32_FIND_DATAW WIN32_FIND_DATA;
typedef PWIN32_FIND_DATAW PWIN32_FIND_DATA;
typedef LPWIN32_FIND_DATAW LPWIN32_FIND_DATA;




#line 6158 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

typedef struct _WIN32_FILE_ATTRIBUTE_DATA {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
} WIN32_FILE_ATTRIBUTE_DATA, *LPWIN32_FILE_ATTRIBUTE_DATA;

//
// Synchronization APIs
//

__declspec(dllimport)

HANDLE
__stdcall
CreateMutexA(
     LPSECURITY_ATTRIBUTES lpMutexAttributes,
         BOOL bInitialOwner,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateMutexW(
     LPSECURITY_ATTRIBUTES lpMutexAttributes,
         BOOL bInitialOwner,
     LPCWSTR lpName
    );




#line 6195 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenMutexA(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenMutexW(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCWSTR lpName
    );




#line 6219 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
CreateEventA(
     LPSECURITY_ATTRIBUTES lpEventAttributes,
         BOOL bManualReset,
         BOOL bInitialState,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateEventW(
     LPSECURITY_ATTRIBUTES lpEventAttributes,
         BOOL bManualReset,
         BOOL bInitialState,
     LPCWSTR lpName
    );




#line 6245 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenEventA(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenEventW(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCWSTR lpName
    );




#line 6269 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
CreateSemaphoreA(
     LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
         LONG lInitialCount,
         LONG lMaximumCount,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateSemaphoreW(
     LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
         LONG lInitialCount,
         LONG lMaximumCount,
     LPCWSTR lpName
    );




#line 6295 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenSemaphoreA(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenSemaphoreW(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCWSTR lpName
    );




#line 6319 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


typedef
void
(__stdcall *PTIMERAPCROUTINE)(
     LPVOID lpArgToCompletionRoutine,
         DWORD dwTimerLowValue,
         DWORD dwTimerHighValue
    );

__declspec(dllimport)

HANDLE
__stdcall
CreateWaitableTimerA(
     LPSECURITY_ATTRIBUTES lpTimerAttributes,
         BOOL bManualReset,
     LPCSTR lpTimerName
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateWaitableTimerW(
     LPSECURITY_ATTRIBUTES lpTimerAttributes,
         BOOL bManualReset,
     LPCWSTR lpTimerName
    );




#line 6352 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenWaitableTimerA(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCSTR lpTimerName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenWaitableTimerW(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCWSTR lpTimerName
    );




#line 6376 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetWaitableTimer(
         HANDLE hTimer,
         const LARGE_INTEGER *lpDueTime,
         LONG lPeriod,
     PTIMERAPCROUTINE pfnCompletionRoutine,
     LPVOID lpArgToCompletionRoutine,
         BOOL fResume
    );

__declspec(dllimport)
BOOL
__stdcall
CancelWaitableTimer(
     HANDLE hTimer
    );





__declspec(dllimport)

HANDLE
__stdcall
CreateMutexExA(
     LPSECURITY_ATTRIBUTES lpMutexAttributes,
     LPCSTR lpName,
         DWORD dwFlags,
         DWORD dwDesiredAccess
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateMutexExW(
     LPSECURITY_ATTRIBUTES lpMutexAttributes,
     LPCWSTR lpName,
         DWORD dwFlags,
         DWORD dwDesiredAccess
    );




#line 6425 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




__declspec(dllimport)

HANDLE
__stdcall
CreateEventExA(
     LPSECURITY_ATTRIBUTES lpEventAttributes,
     LPCSTR lpName,
         DWORD dwFlags,
         DWORD dwDesiredAccess
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateEventExW(
     LPSECURITY_ATTRIBUTES lpEventAttributes,
     LPCWSTR lpName,
         DWORD dwFlags,
         DWORD dwDesiredAccess
    );




#line 6454 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
CreateSemaphoreExA(
        LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
            LONG lInitialCount,
            LONG lMaximumCount,
        LPCSTR lpName,
      DWORD dwFlags,
            DWORD dwDesiredAccess
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateSemaphoreExW(
        LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
            LONG lInitialCount,
            LONG lMaximumCount,
        LPCWSTR lpName,
      DWORD dwFlags,
            DWORD dwDesiredAccess
    );




#line 6484 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)

HANDLE
__stdcall
CreateWaitableTimerExA(
     LPSECURITY_ATTRIBUTES lpTimerAttributes,
     LPCSTR lpTimerName,
         DWORD dwFlags,
         DWORD dwDesiredAccess
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateWaitableTimerExW(
     LPSECURITY_ATTRIBUTES lpTimerAttributes,
     LPCWSTR lpTimerName,
         DWORD dwFlags,
         DWORD dwDesiredAccess
    );




#line 6512 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 6514 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 6516 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
CreateFileMappingA(
         HANDLE hFile,
     LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
         DWORD flProtect,
         DWORD dwMaximumSizeHigh,
         DWORD dwMaximumSizeLow,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateFileMappingW(
         HANDLE hFile,
     LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
         DWORD flProtect,
         DWORD dwMaximumSizeHigh,
         DWORD dwMaximumSizeLow,
     LPCWSTR lpName
    );




#line 6546 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)

HANDLE
__stdcall
CreateFileMappingNumaA(
         HANDLE hFile,
     LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
         DWORD flProtect,
         DWORD dwMaximumSizeHigh,
         DWORD dwMaximumSizeLow,
     LPCSTR lpName,
         DWORD nndPreferred
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateFileMappingNumaW(
         HANDLE hFile,
     LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
         DWORD flProtect,
         DWORD dwMaximumSizeHigh,
         DWORD dwMaximumSizeLow,
     LPCWSTR lpName,
         DWORD nndPreferred
    );




#line 6580 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 6582 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenFileMappingA(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCSTR lpName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenFileMappingW(
     DWORD dwDesiredAccess,
     BOOL bInheritHandle,
     LPCWSTR lpName
    );




#line 6606 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetLogicalDriveStringsA(
     DWORD nBufferLength,
     LPSTR lpBuffer
    );
__declspec(dllimport)
DWORD
__stdcall
GetLogicalDriveStringsW(
     DWORD nBufferLength,
     LPWSTR lpBuffer
    );




#line 6626 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



typedef enum _MEMORY_RESOURCE_NOTIFICATION_TYPE {
    LowMemoryResourceNotification,
    HighMemoryResourceNotification
} MEMORY_RESOURCE_NOTIFICATION_TYPE;

__declspec(dllimport)

HANDLE
__stdcall
CreateMemoryResourceNotification(
     MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType
    );

__declspec(dllimport)
BOOL
__stdcall
QueryMemoryResourceNotification(
      HANDLE ResourceNotificationHandle,
     PBOOL  ResourceState
    );

#line 6651 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)

HMODULE
__stdcall
LoadLibraryA(
     LPCSTR lpLibFileName
    );
__declspec(dllimport)

HMODULE
__stdcall
LoadLibraryW(
     LPCWSTR lpLibFileName
    );




#line 6672 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HMODULE
__stdcall
LoadLibraryExA(
           LPCSTR lpLibFileName,
     HANDLE hFile,
           DWORD dwFlags
    );
__declspec(dllimport)

HMODULE
__stdcall
LoadLibraryExW(
           LPCWSTR lpLibFileName,
     HANDLE hFile,
           DWORD dwFlags
    );




#line 6696 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"









__declspec(dllimport)
DWORD
__stdcall
GetModuleFileNameA(
     HMODULE hModule,
     LPCH lpFilename,
         DWORD nSize
    );
__declspec(dllimport)
DWORD
__stdcall
GetModuleFileNameW(
     HMODULE hModule,
     LPWCH lpFilename,
         DWORD nSize
    );




#line 6726 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HMODULE
__stdcall
GetModuleHandleA(
     LPCSTR lpModuleName
    );
__declspec(dllimport)

HMODULE
__stdcall
GetModuleHandleW(
     LPCWSTR lpModuleName
    );




#line 6746 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"








typedef
BOOL
(__stdcall*
PGET_MODULE_HANDLE_EXA)(
            DWORD        dwFlags,
        LPCSTR     lpModuleName,
     HMODULE*    phModule
    );
typedef
BOOL
(__stdcall*
PGET_MODULE_HANDLE_EXW)(
            DWORD        dwFlags,
        LPCWSTR     lpModuleName,
     HMODULE*    phModule
    );




#line 6775 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetModuleHandleExA(
            DWORD    dwFlags,
        LPCSTR lpModuleName,
     HMODULE* phModule
    );
__declspec(dllimport)
BOOL
__stdcall
GetModuleHandleExW(
            DWORD    dwFlags,
        LPCWSTR lpModuleName,
     HMODULE* phModule
    );




#line 6797 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 6799 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 6800 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
NeedCurrentDirectoryForExePathA(
     LPCSTR ExeName
    );
__declspec(dllimport)
BOOL
__stdcall
NeedCurrentDirectoryForExePathW(
     LPCWSTR ExeName
    );




#line 6820 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 6822 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





__declspec(dllimport)
BOOL
__stdcall
QueryFullProcessImageNameA(
     HANDLE hProcess,
     DWORD dwFlags,
     LPSTR lpExeName,
     PDWORD lpdwSize
    );
__declspec(dllimport)
BOOL
__stdcall
QueryFullProcessImageNameW(
     HANDLE hProcess,
     DWORD dwFlags,
     LPWSTR lpExeName,
     PDWORD lpdwSize
    );




#line 6850 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 6852 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Extended process and thread attribute support
//






typedef enum _PROC_THREAD_ATTRIBUTE_NUM {
    ProcThreadAttributeParentProcess = 0,
    ProcThreadAttributeExtendedFlags,
    ProcThreadAttributeHandleList,
    ProcThreadAttributeMax
} PROC_THREAD_ATTRIBUTE_NUM;














typedef struct _PROC_THREAD_ATTRIBUTE_LIST *PPROC_THREAD_ATTRIBUTE_LIST, *LPPROC_THREAD_ATTRIBUTE_LIST;


__declspec(dllimport)
BOOL
__stdcall
InitializeProcThreadAttributeList(
     LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
     DWORD dwAttributeCount,
      DWORD dwFlags,
     PSIZE_T lpSize
    );

__declspec(dllimport)
void
__stdcall
DeleteProcThreadAttributeList(
     LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList
    );



__declspec(dllimport)
BOOL
__stdcall
UpdateProcThreadAttribute(
     LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
     DWORD dwFlags,
     DWORD_PTR Attribute,
     PVOID lpValue,
     SIZE_T cbSize,
     PVOID lpPreviousValue,
     PSIZE_T lpReturnSize
    );


__declspec(dllimport)
BOOL
__stdcall
CreateProcessA(
        LPCSTR lpApplicationName,
     LPSTR lpCommandLine,
        LPSECURITY_ATTRIBUTES lpProcessAttributes,
        LPSECURITY_ATTRIBUTES lpThreadAttributes,
            BOOL bInheritHandles,
            DWORD dwCreationFlags,
        LPVOID lpEnvironment,
        LPCSTR lpCurrentDirectory,
            LPSTARTUPINFOA lpStartupInfo,
           LPPROCESS_INFORMATION lpProcessInformation
    );
__declspec(dllimport)
BOOL
__stdcall
CreateProcessW(
        LPCWSTR lpApplicationName,
     LPWSTR lpCommandLine,
        LPSECURITY_ATTRIBUTES lpProcessAttributes,
        LPSECURITY_ATTRIBUTES lpThreadAttributes,
            BOOL bInheritHandles,
            DWORD dwCreationFlags,
        LPVOID lpEnvironment,
        LPCWSTR lpCurrentDirectory,
            LPSTARTUPINFOW lpStartupInfo,
           LPPROCESS_INFORMATION lpProcessInformation
    );




#line 6953 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
SetProcessShutdownParameters(
     DWORD dwLevel,
     DWORD dwFlags
    );

__declspec(dllimport)
BOOL
__stdcall
GetProcessShutdownParameters(
     LPDWORD lpdwLevel,
     LPDWORD lpdwFlags
    );

__declspec(dllimport)
DWORD
__stdcall
GetProcessVersion(
     DWORD ProcessId
    );

__declspec(dllimport)
void
__stdcall
FatalAppExitA(
     UINT uAction,
     LPCSTR lpMessageText
    );
__declspec(dllimport)
void
__stdcall
FatalAppExitW(
     UINT uAction,
     LPCWSTR lpMessageText
    );




#line 6998 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
GetStartupInfoA(
     LPSTARTUPINFOA lpStartupInfo
    );
__declspec(dllimport)
void
__stdcall
GetStartupInfoW(
     LPSTARTUPINFOW lpStartupInfo
    );




#line 7016 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

LPSTR
__stdcall
GetCommandLineA(
    void
    );
__declspec(dllimport)

LPWSTR
__stdcall
GetCommandLineW(
    void
    );




#line 7036 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)


DWORD
__stdcall
GetEnvironmentVariableA(
     LPCSTR lpName,
     LPSTR lpBuffer,
     DWORD nSize
    );
__declspec(dllimport)


DWORD
__stdcall
GetEnvironmentVariableW(
     LPCWSTR lpName,
     LPWSTR lpBuffer,
     DWORD nSize
    );




#line 7062 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetEnvironmentVariableA(
         LPCSTR lpName,
     LPCSTR lpValue
    );
__declspec(dllimport)
BOOL
__stdcall
SetEnvironmentVariableW(
         LPCWSTR lpName,
     LPCWSTR lpValue
    );




#line 7082 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



















#line 7102 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)


DWORD
__stdcall
ExpandEnvironmentStringsA(
     LPCSTR lpSrc,
     LPSTR lpDst,
     DWORD nSize
    );
__declspec(dllimport)


DWORD
__stdcall
ExpandEnvironmentStringsW(
     LPCWSTR lpSrc,
     LPWSTR lpDst,
     DWORD nSize
    );




#line 7128 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetFirmwareEnvironmentVariableA(
     LPCSTR lpName,
     LPCSTR lpGuid,
     PVOID pBuffer,
     DWORD    nSize
    );
__declspec(dllimport)
DWORD
__stdcall
GetFirmwareEnvironmentVariableW(
     LPCWSTR lpName,
     LPCWSTR lpGuid,
     PVOID pBuffer,
     DWORD    nSize
    );




#line 7152 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetFirmwareEnvironmentVariableA(
     LPCSTR lpName,
     LPCSTR lpGuid,
     PVOID pValue,
     DWORD    nSize
    );
__declspec(dllimport)
BOOL
__stdcall
SetFirmwareEnvironmentVariableW(
     LPCWSTR lpName,
     LPCWSTR lpGuid,
     PVOID pValue,
     DWORD    nSize
    );




#line 7176 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
void
__stdcall
OutputDebugStringA(
     LPCSTR lpOutputString
    );
__declspec(dllimport)
void
__stdcall
OutputDebugStringW(
     LPCWSTR lpOutputString
    );




#line 7195 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HRSRC
__stdcall
FindResourceA(
     HMODULE hModule,
         LPCSTR lpName,
         LPCSTR lpType
    );
__declspec(dllimport)

HRSRC
__stdcall
FindResourceW(
     HMODULE hModule,
         LPCWSTR lpName,
         LPCWSTR lpType
    );




#line 7219 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HRSRC
__stdcall
FindResourceExA(
     HMODULE hModule,
         LPCSTR lpType,
         LPCSTR lpName,
         WORD    wLanguage
    );
__declspec(dllimport)

HRSRC
__stdcall
FindResourceExW(
     HMODULE hModule,
         LPCWSTR lpType,
         LPCWSTR lpName,
         WORD    wLanguage
    );




#line 7245 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


typedef BOOL (__stdcall* ENUMRESTYPEPROCA)( HMODULE hModule,  LPSTR lpType,
 LONG_PTR lParam);
typedef BOOL (__stdcall* ENUMRESTYPEPROCW)( HMODULE hModule,  LPWSTR lpType,
 LONG_PTR lParam);




#line 7256 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
typedef BOOL (__stdcall* ENUMRESNAMEPROCA)( HMODULE hModule,  LPCSTR lpType,
 LPSTR lpName,  LONG_PTR lParam);
typedef BOOL (__stdcall* ENUMRESNAMEPROCW)( HMODULE hModule,  LPCWSTR lpType,
 LPWSTR lpName,  LONG_PTR lParam);




#line 7265 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
typedef BOOL (__stdcall* ENUMRESLANGPROCA)( HMODULE hModule,  LPCSTR lpType,
 LPCSTR lpName,  WORD  wLanguage,  LONG_PTR lParam);
typedef BOOL (__stdcall* ENUMRESLANGPROCW)( HMODULE hModule,  LPCWSTR lpType,
 LPCWSTR lpName,  WORD  wLanguage,  LONG_PTR lParam);




#line 7274 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"






















#line 7297 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
EnumResourceTypesA(
     HMODULE hModule,
         ENUMRESTYPEPROCA lpEnumFunc,
         LONG_PTR lParam
    );
__declspec(dllimport)
BOOL
__stdcall
EnumResourceTypesW(
     HMODULE hModule,
         ENUMRESTYPEPROCW lpEnumFunc,
         LONG_PTR lParam
    );




#line 7319 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
EnumResourceNamesA(
     HMODULE hModule,
         LPCSTR lpType,
         ENUMRESNAMEPROCA lpEnumFunc,
         LONG_PTR lParam
    );
__declspec(dllimport)
BOOL
__stdcall
EnumResourceNamesW(
     HMODULE hModule,
         LPCWSTR lpType,
         ENUMRESNAMEPROCW lpEnumFunc,
         LONG_PTR lParam
    );




#line 7343 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
EnumResourceLanguagesA(
     HMODULE hModule,
         LPCSTR lpType,
         LPCSTR lpName,
         ENUMRESLANGPROCA lpEnumFunc,
         LONG_PTR lParam
    );
__declspec(dllimport)
BOOL
__stdcall
EnumResourceLanguagesW(
     HMODULE hModule,
         LPCWSTR lpType,
         LPCWSTR lpName,
         ENUMRESLANGPROCW lpEnumFunc,
         LONG_PTR lParam
    );




#line 7369 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"







__declspec(dllimport)
BOOL
__stdcall
EnumResourceTypesExA(
     HMODULE hModule,
     ENUMRESTYPEPROCA lpEnumFunc,
     LONG_PTR lParam,
    DWORD dwFlags,
    LANGID LangId
    );
__declspec(dllimport)
BOOL
__stdcall
EnumResourceTypesExW(
     HMODULE hModule,
     ENUMRESTYPEPROCW lpEnumFunc,
     LONG_PTR lParam,
    DWORD dwFlags,
    LANGID LangId
    );




#line 7401 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
EnumResourceNamesExA(
     HMODULE hModule,
     LPCSTR lpType,
     ENUMRESNAMEPROCA lpEnumFunc,
     LONG_PTR lParam,
    DWORD dwFlags,
    LANGID LangId
    );
__declspec(dllimport)
BOOL
__stdcall
EnumResourceNamesExW(
     HMODULE hModule,
     LPCWSTR lpType,
     ENUMRESNAMEPROCW lpEnumFunc,
     LONG_PTR lParam,
    DWORD dwFlags,
    LANGID LangId
    );




#line 7430 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
EnumResourceLanguagesExA(
     HMODULE hModule,
     LPCSTR lpType,
     LPCSTR lpName,
     ENUMRESLANGPROCA lpEnumFunc,
     LONG_PTR lParam,
    DWORD dwFlags,
    LANGID LangId
    );
__declspec(dllimport)
BOOL
__stdcall
EnumResourceLanguagesExW(
     HMODULE hModule,
     LPCWSTR lpType,
     LPCWSTR lpName,
     ENUMRESLANGPROCW lpEnumFunc,
     LONG_PTR lParam,
    DWORD dwFlags,
    LANGID LangId
    );




#line 7460 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
HANDLE
__stdcall
BeginUpdateResourceA(
     LPCSTR pFileName,
     BOOL bDeleteExistingResources
    );
__declspec(dllimport)
HANDLE
__stdcall
BeginUpdateResourceW(
     LPCWSTR pFileName,
     BOOL bDeleteExistingResources
    );




#line 7480 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
UpdateResourceA(
     HANDLE hUpdate,
     LPCSTR lpType,
     LPCSTR lpName,
     WORD wLanguage,
     LPVOID lpData,
     DWORD cb
    );
__declspec(dllimport)
BOOL
__stdcall
UpdateResourceW(
     HANDLE hUpdate,
     LPCWSTR lpType,
     LPCWSTR lpName,
     WORD wLanguage,
     LPVOID lpData,
     DWORD cb
    );




#line 7508 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
EndUpdateResourceA(
     HANDLE hUpdate,
     BOOL   fDiscard
    );
__declspec(dllimport)
BOOL
__stdcall
EndUpdateResourceW(
     HANDLE hUpdate,
     BOOL   fDiscard
    );




#line 7528 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
ATOM
__stdcall
GlobalAddAtomA(
     LPCSTR lpString
    );
__declspec(dllimport)
ATOM
__stdcall
GlobalAddAtomW(
     LPCWSTR lpString
    );




#line 7547 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
ATOM
__stdcall
GlobalFindAtomA(
     LPCSTR lpString
    );
__declspec(dllimport)
ATOM
__stdcall
GlobalFindAtomW(
     LPCWSTR lpString
    );




#line 7565 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GlobalGetAtomNameA(
     ATOM nAtom,
     LPSTR lpBuffer,
     int nSize
    );
__declspec(dllimport)
UINT
__stdcall
GlobalGetAtomNameW(
     ATOM nAtom,
     LPWSTR lpBuffer,
     int nSize
    );




#line 7587 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
ATOM
__stdcall
AddAtomA(
     LPCSTR lpString
    );
__declspec(dllimport)
ATOM
__stdcall
AddAtomW(
     LPCWSTR lpString
    );




#line 7605 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
ATOM
__stdcall
FindAtomA(
     LPCSTR lpString
    );
__declspec(dllimport)
ATOM
__stdcall
FindAtomW(
     LPCWSTR lpString
    );




#line 7623 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetAtomNameA(
     ATOM nAtom,
     LPSTR lpBuffer,
     int nSize
    );
__declspec(dllimport)
UINT
__stdcall
GetAtomNameW(
     ATOM nAtom,
     LPWSTR lpBuffer,
     int nSize
    );




#line 7645 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetProfileIntA(
     LPCSTR lpAppName,
     LPCSTR lpKeyName,
     INT nDefault
    );
__declspec(dllimport)
UINT
__stdcall
GetProfileIntW(
     LPCWSTR lpAppName,
     LPCWSTR lpKeyName,
     INT nDefault
    );




#line 7667 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetProfileStringA(
     LPCSTR lpAppName,
     LPCSTR lpKeyName,
     LPCSTR lpDefault,
     LPSTR lpReturnedString,
         DWORD nSize
    );
__declspec(dllimport)
DWORD
__stdcall
GetProfileStringW(
     LPCWSTR lpAppName,
     LPCWSTR lpKeyName,
     LPCWSTR lpDefault,
     LPWSTR lpReturnedString,
         DWORD nSize
    );




#line 7693 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WriteProfileStringA(
     LPCSTR lpAppName,
     LPCSTR lpKeyName,
     LPCSTR lpString
    );
__declspec(dllimport)
BOOL
__stdcall
WriteProfileStringW(
     LPCWSTR lpAppName,
     LPCWSTR lpKeyName,
     LPCWSTR lpString
    );




#line 7715 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetProfileSectionA(
     LPCSTR lpAppName,
     LPSTR lpReturnedString,
     DWORD nSize
    );
__declspec(dllimport)
DWORD
__stdcall
GetProfileSectionW(
     LPCWSTR lpAppName,
     LPWSTR lpReturnedString,
     DWORD nSize
    );




#line 7737 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WriteProfileSectionA(
     LPCSTR lpAppName,
     LPCSTR lpString
    );
__declspec(dllimport)
BOOL
__stdcall
WriteProfileSectionW(
     LPCWSTR lpAppName,
     LPCWSTR lpString
    );




#line 7757 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetPrivateProfileIntA(
         LPCSTR lpAppName,
         LPCSTR lpKeyName,
         INT nDefault,
     LPCSTR lpFileName
    );
__declspec(dllimport)
UINT
__stdcall
GetPrivateProfileIntW(
         LPCWSTR lpAppName,
         LPCWSTR lpKeyName,
         INT nDefault,
     LPCWSTR lpFileName
    );




#line 7781 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetPrivateProfileStringA(
     LPCSTR lpAppName,
     LPCSTR lpKeyName,
     LPCSTR lpDefault,
     LPSTR lpReturnedString,
         DWORD nSize,
     LPCSTR lpFileName
    );
__declspec(dllimport)
DWORD
__stdcall
GetPrivateProfileStringW(
     LPCWSTR lpAppName,
     LPCWSTR lpKeyName,
     LPCWSTR lpDefault,
     LPWSTR lpReturnedString,
         DWORD nSize,
     LPCWSTR lpFileName
    );




#line 7809 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WritePrivateProfileStringA(
     LPCSTR lpAppName,
     LPCSTR lpKeyName,
     LPCSTR lpString,
     LPCSTR lpFileName
    );
__declspec(dllimport)
BOOL
__stdcall
WritePrivateProfileStringW(
     LPCWSTR lpAppName,
     LPCWSTR lpKeyName,
     LPCWSTR lpString,
     LPCWSTR lpFileName
    );




#line 7833 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetPrivateProfileSectionA(
         LPCSTR lpAppName,
     LPSTR lpReturnedString,
         DWORD nSize,
     LPCSTR lpFileName
    );
__declspec(dllimport)
DWORD
__stdcall
GetPrivateProfileSectionW(
         LPCWSTR lpAppName,
     LPWSTR lpReturnedString,
         DWORD nSize,
     LPCWSTR lpFileName
    );




#line 7857 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WritePrivateProfileSectionA(
         LPCSTR lpAppName,
         LPCSTR lpString,
     LPCSTR lpFileName
    );
__declspec(dllimport)
BOOL
__stdcall
WritePrivateProfileSectionW(
         LPCWSTR lpAppName,
         LPCWSTR lpString,
     LPCWSTR lpFileName
    );




#line 7879 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
DWORD
__stdcall
GetPrivateProfileSectionNamesA(
     LPSTR lpszReturnBuffer,
         DWORD nSize,
     LPCSTR lpFileName
    );
__declspec(dllimport)
DWORD
__stdcall
GetPrivateProfileSectionNamesW(
     LPWSTR lpszReturnBuffer,
         DWORD nSize,
     LPCWSTR lpFileName
    );




#line 7902 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetPrivateProfileStructA(
         LPCSTR lpszSection,
         LPCSTR lpszKey,
     LPVOID   lpStruct,
         UINT     uSizeStruct,
     LPCSTR szFile
    );
__declspec(dllimport)
BOOL
__stdcall
GetPrivateProfileStructW(
         LPCWSTR lpszSection,
         LPCWSTR lpszKey,
     LPVOID   lpStruct,
         UINT     uSizeStruct,
     LPCWSTR szFile
    );




#line 7928 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WritePrivateProfileStructA(
         LPCSTR lpszSection,
         LPCSTR lpszKey,
     LPVOID lpStruct,
         UINT     uSizeStruct,
     LPCSTR szFile
    );
__declspec(dllimport)
BOOL
__stdcall
WritePrivateProfileStructW(
         LPCWSTR lpszSection,
         LPCWSTR lpszKey,
     LPVOID lpStruct,
         UINT     uSizeStruct,
     LPCWSTR szFile
    );




#line 7954 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
UINT
__stdcall
GetDriveTypeA(
     LPCSTR lpRootPathName
    );
__declspec(dllimport)
UINT
__stdcall
GetDriveTypeW(
     LPCWSTR lpRootPathName
    );




#line 7973 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetSystemDirectoryA(
     LPSTR lpBuffer,
     UINT uSize
    );
__declspec(dllimport)
UINT
__stdcall
GetSystemDirectoryW(
     LPWSTR lpBuffer,
     UINT uSize
    );




#line 7993 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetTempPathA(
     DWORD nBufferLength,
     LPSTR lpBuffer
    );
__declspec(dllimport)
DWORD
__stdcall
GetTempPathW(
     DWORD nBufferLength,
     LPWSTR lpBuffer
    );




#line 8013 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetTempFileNameA(
     LPCSTR lpPathName,
     LPCSTR lpPrefixString,
     UINT uUnique,
     LPSTR lpTempFileName
    );
__declspec(dllimport)
UINT
__stdcall
GetTempFileNameW(
     LPCWSTR lpPathName,
     LPCWSTR lpPrefixString,
     UINT uUnique,
     LPWSTR lpTempFileName
    );




#line 8037 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"























#line 8061 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetWindowsDirectoryA(
     LPSTR lpBuffer,
     UINT uSize
    );
__declspec(dllimport)
UINT
__stdcall
GetWindowsDirectoryW(
     LPWSTR lpBuffer,
     UINT uSize
    );




#line 8081 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
UINT
__stdcall
GetSystemWindowsDirectoryA(
     LPSTR lpBuffer,
     UINT uSize
    );
__declspec(dllimport)
UINT
__stdcall
GetSystemWindowsDirectoryW(
     LPWSTR lpBuffer,
     UINT uSize
    );




#line 8101 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




__declspec(dllimport)
UINT
__stdcall
GetSystemWow64DirectoryA(
     LPSTR lpBuffer,
     UINT uSize
    );
__declspec(dllimport)
UINT
__stdcall
GetSystemWow64DirectoryW(
     LPWSTR lpBuffer,
     UINT uSize
    );




#line 8124 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOLEAN
__stdcall
Wow64EnableWow64FsRedirection (
     BOOLEAN Wow64FsEnableRedirection
    );

__declspec(dllimport)
BOOL
__stdcall
Wow64DisableWow64FsRedirection (
     PVOID *OldValue
    );

__declspec(dllimport)
BOOL
__stdcall
Wow64RevertWow64FsRedirection (
     PVOID OlValue
    );


//
// for GetProcAddress
//
typedef UINT (__stdcall* PGET_SYSTEM_WOW64_DIRECTORY_A)( LPSTR lpBuffer,  UINT uSize);
typedef UINT (__stdcall* PGET_SYSTEM_WOW64_DIRECTORY_W)( LPWSTR lpBuffer,  UINT uSize);

//
// GetProcAddress only accepts GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A,
// GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A, GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A.
// The others are if you want to use the strings in some other way.
//















#line 8174 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8176 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 8177 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetCurrentDirectoryA(
     LPCSTR lpPathName
    );
__declspec(dllimport)
BOOL
__stdcall
SetCurrentDirectoryW(
     LPCWSTR lpPathName
    );




#line 8195 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

















#line 8213 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetCurrentDirectoryA(
     DWORD nBufferLength,
     LPSTR lpBuffer
    );
__declspec(dllimport)
DWORD
__stdcall
GetCurrentDirectoryW(
     DWORD nBufferLength,
     LPWSTR lpBuffer
    );




#line 8233 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
SetDllDirectoryA(
     LPCSTR lpPathName
    );
__declspec(dllimport)
BOOL
__stdcall
SetDllDirectoryW(
     LPCWSTR lpPathName
    );




#line 8253 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetDllDirectoryA(
     DWORD nBufferLength,
     LPSTR lpBuffer
    );
__declspec(dllimport)
DWORD
__stdcall
GetDllDirectoryW(
     DWORD nBufferLength,
     LPWSTR lpBuffer
    );




#line 8273 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8275 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetDiskFreeSpaceA(
      LPCSTR lpRootPathName,
     LPDWORD lpSectorsPerCluster,
     LPDWORD lpBytesPerSector,
     LPDWORD lpNumberOfFreeClusters,
     LPDWORD lpTotalNumberOfClusters
    );
__declspec(dllimport)
BOOL
__stdcall
GetDiskFreeSpaceW(
      LPCWSTR lpRootPathName,
     LPDWORD lpSectorsPerCluster,
     LPDWORD lpBytesPerSector,
     LPDWORD lpNumberOfFreeClusters,
     LPDWORD lpTotalNumberOfClusters
    );




#line 8301 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetDiskFreeSpaceExA(
      LPCSTR lpDirectoryName,
     PULARGE_INTEGER lpFreeBytesAvailableToCaller,
     PULARGE_INTEGER lpTotalNumberOfBytes,
     PULARGE_INTEGER lpTotalNumberOfFreeBytes
    );
__declspec(dllimport)
BOOL
__stdcall
GetDiskFreeSpaceExW(
      LPCWSTR lpDirectoryName,
     PULARGE_INTEGER lpFreeBytesAvailableToCaller,
     PULARGE_INTEGER lpTotalNumberOfBytes,
     PULARGE_INTEGER lpTotalNumberOfFreeBytes
    );




#line 8325 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CreateDirectoryA(
         LPCSTR lpPathName,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
__declspec(dllimport)
BOOL
__stdcall
CreateDirectoryW(
         LPCWSTR lpPathName,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );




#line 8345 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



















#line 8365 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CreateDirectoryExA(
         LPCSTR lpTemplateDirectory,
         LPCSTR lpNewDirectory,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
__declspec(dllimport)
BOOL
__stdcall
CreateDirectoryExW(
         LPCWSTR lpTemplateDirectory,
         LPCWSTR lpNewDirectory,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );




#line 8387 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
CreateDirectoryTransactedA(
         LPCSTR lpTemplateDirectory,
         LPCSTR lpNewDirectory,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
CreateDirectoryTransactedW(
         LPCWSTR lpTemplateDirectory,
         LPCWSTR lpNewDirectory,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
         HANDLE hTransaction
    );




#line 8413 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8415 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
RemoveDirectoryA(
     LPCSTR lpPathName
    );
__declspec(dllimport)
BOOL
__stdcall
RemoveDirectoryW(
     LPCWSTR lpPathName
    );




#line 8433 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
RemoveDirectoryTransactedA(
     LPCSTR lpPathName,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
RemoveDirectoryTransactedW(
     LPCWSTR lpPathName,
         HANDLE hTransaction
    );




#line 8455 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8457 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetFullPathNameA(
                LPCSTR lpFileName,
                DWORD nBufferLength,
     LPSTR lpBuffer,
     LPSTR *lpFilePart
    );
__declspec(dllimport)
DWORD
__stdcall
GetFullPathNameW(
                LPCWSTR lpFileName,
                DWORD nBufferLength,
     LPWSTR lpBuffer,
     LPWSTR *lpFilePart
    );




#line 8481 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
DWORD
__stdcall
GetFullPathNameTransactedA(
                LPCSTR lpFileName,
                DWORD nBufferLength,
     LPSTR lpBuffer,
     LPSTR *lpFilePart,
                HANDLE hTransaction
    );
__declspec(dllimport)
DWORD
__stdcall
GetFullPathNameTransactedW(
                LPCWSTR lpFileName,
                DWORD nBufferLength,
     LPWSTR lpBuffer,
     LPWSTR *lpFilePart,
                HANDLE hTransaction
    );




#line 8508 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8510 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"







__declspec(dllimport)
BOOL
__stdcall
DefineDosDeviceA(
         DWORD dwFlags,
         LPCSTR lpDeviceName,
     LPCSTR lpTargetPath
    );
__declspec(dllimport)
BOOL
__stdcall
DefineDosDeviceW(
         DWORD dwFlags,
         LPCWSTR lpDeviceName,
     LPCWSTR lpTargetPath
    );




#line 8538 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
QueryDosDeviceA(
     LPCSTR lpDeviceName,
     LPSTR lpTargetPath,
         DWORD ucchMax
    );
__declspec(dllimport)
DWORD
__stdcall
QueryDosDeviceW(
     LPCWSTR lpDeviceName,
     LPWSTR lpTargetPath,
         DWORD ucchMax
    );




#line 8560 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)

HANDLE
__stdcall
CreateFileA(
         LPCSTR lpFileName,
         DWORD dwDesiredAccess,
         DWORD dwShareMode,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
         DWORD dwCreationDisposition,
         DWORD dwFlagsAndAttributes,
     HANDLE hTemplateFile
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateFileW(
         LPCWSTR lpFileName,
         DWORD dwDesiredAccess,
         DWORD dwShareMode,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
         DWORD dwCreationDisposition,
         DWORD dwFlagsAndAttributes,
     HANDLE hTemplateFile
    );




#line 8594 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)

HANDLE
__stdcall
CreateFileTransactedA(
           LPCSTR lpFileName,
           DWORD dwDesiredAccess,
           DWORD dwShareMode,
       LPSECURITY_ATTRIBUTES lpSecurityAttributes,
           DWORD dwCreationDisposition,
           DWORD dwFlagsAndAttributes,
       HANDLE hTemplateFile,
           HANDLE hTransaction,
       PUSHORT pusMiniVersion,
     PVOID  lpExtendedParameter
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateFileTransactedW(
           LPCWSTR lpFileName,
           DWORD dwDesiredAccess,
           DWORD dwShareMode,
       LPSECURITY_ATTRIBUTES lpSecurityAttributes,
           DWORD dwCreationDisposition,
           DWORD dwFlagsAndAttributes,
       HANDLE hTemplateFile,
           HANDLE hTransaction,
       PUSHORT pusMiniVersion,
     PVOID  lpExtendedParameter
    );




#line 8634 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8636 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




__declspec(dllimport)

HANDLE
__stdcall
ReOpenFile(
     HANDLE  hOriginalFile,
     DWORD   dwDesiredAccess,
     DWORD   dwShareMode,
     DWORD   dwFlagsAndAttributes
    );

#line 8652 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetFileAttributesA(
     LPCSTR lpFileName,
     DWORD dwFileAttributes
    );
__declspec(dllimport)
BOOL
__stdcall
SetFileAttributesW(
     LPCWSTR lpFileName,
     DWORD dwFileAttributes
    );




#line 8672 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetFileAttributesA(
     LPCSTR lpFileName
    );
__declspec(dllimport)
DWORD
__stdcall
GetFileAttributesW(
     LPCWSTR lpFileName
    );




#line 8690 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
SetFileAttributesTransactedA(
         LPCSTR lpFileName,
         DWORD dwFileAttributes,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
SetFileAttributesTransactedW(
         LPCWSTR lpFileName,
         DWORD dwFileAttributes,
         HANDLE hTransaction
    );




#line 8714 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8716 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

typedef enum _GET_FILEEX_INFO_LEVELS {
    GetFileExInfoStandard,
    GetFileExMaxInfoLevel
} GET_FILEEX_INFO_LEVELS;



__declspec(dllimport)
BOOL
__stdcall
GetFileAttributesTransactedA(
      LPCSTR lpFileName,
      GET_FILEEX_INFO_LEVELS fInfoLevelId,
     LPVOID lpFileInformation,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
GetFileAttributesTransactedW(
      LPCWSTR lpFileName,
      GET_FILEEX_INFO_LEVELS fInfoLevelId,
     LPVOID lpFileInformation,
         HANDLE hTransaction
    );




#line 8747 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8749 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetFileAttributesExA(
      LPCSTR lpFileName,
      GET_FILEEX_INFO_LEVELS fInfoLevelId,
     LPVOID lpFileInformation
    );
__declspec(dllimport)
BOOL
__stdcall
GetFileAttributesExW(
      LPCWSTR lpFileName,
      GET_FILEEX_INFO_LEVELS fInfoLevelId,
     LPVOID lpFileInformation
    );




#line 8771 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
DWORD
__stdcall
GetCompressedFileSizeA(
      LPCSTR lpFileName,
     LPDWORD  lpFileSizeHigh
    );
__declspec(dllimport)
DWORD
__stdcall
GetCompressedFileSizeW(
      LPCWSTR lpFileName,
     LPDWORD  lpFileSizeHigh
    );




#line 8791 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
DWORD
__stdcall
GetCompressedFileSizeTransactedA(
          LPCSTR lpFileName,
     LPDWORD  lpFileSizeHigh,
          HANDLE hTransaction
    );
__declspec(dllimport)
DWORD
__stdcall
GetCompressedFileSizeTransactedW(
          LPCWSTR lpFileName,
     LPDWORD  lpFileSizeHigh,
          HANDLE hTransaction
    );




#line 8815 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8817 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
DeleteFileA(
     LPCSTR lpFileName
    );
__declspec(dllimport)
BOOL
__stdcall
DeleteFileW(
     LPCWSTR lpFileName
    );




#line 8835 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
DeleteFileTransactedA(
         LPCSTR lpFileName,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
DeleteFileTransactedW(
         LPCWSTR lpFileName,
         HANDLE hTransaction
    );




#line 8857 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8859 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

















#line 8877 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




__declspec(dllimport)
BOOL
__stdcall
CheckNameLegalDOS8Dot3A(
          LPCSTR lpName,
     LPSTR lpOemName,
          DWORD OemNameSize,
     PBOOL pbNameContainsSpaces ,
         PBOOL pbNameLegal
    );
__declspec(dllimport)
BOOL
__stdcall
CheckNameLegalDOS8Dot3W(
          LPCWSTR lpName,
     LPSTR lpOemName,
          DWORD OemNameSize,
     PBOOL pbNameContainsSpaces ,
         PBOOL pbNameLegal
    );




#line 8906 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8908 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


typedef enum _FINDEX_INFO_LEVELS {
    FindExInfoStandard,
    FindExInfoMaxInfoLevel
} FINDEX_INFO_LEVELS;

typedef enum _FINDEX_SEARCH_OPS {
    FindExSearchNameMatch,
    FindExSearchLimitToDirectories,
    FindExSearchLimitToDevices,
    FindExSearchMaxSearchOp
} FINDEX_SEARCH_OPS;



__declspec(dllimport)

HANDLE
__stdcall
FindFirstFileExA(
           LPCSTR lpFileName,
           FINDEX_INFO_LEVELS fInfoLevelId,
          LPVOID lpFindFileData,
           FINDEX_SEARCH_OPS fSearchOp,
     LPVOID lpSearchFilter,
           DWORD dwAdditionalFlags
    );
__declspec(dllimport)

HANDLE
__stdcall
FindFirstFileExW(
           LPCWSTR lpFileName,
           FINDEX_INFO_LEVELS fInfoLevelId,
          LPVOID lpFindFileData,
           FINDEX_SEARCH_OPS fSearchOp,
     LPVOID lpSearchFilter,
           DWORD dwAdditionalFlags
    );




#line 8953 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)

HANDLE
__stdcall
FindFirstFileTransactedA(
           LPCSTR lpFileName,
           FINDEX_INFO_LEVELS fInfoLevelId,
          LPVOID lpFindFileData,
           FINDEX_SEARCH_OPS fSearchOp,
     LPVOID lpSearchFilter,
           DWORD dwAdditionalFlags,
           HANDLE hTransaction
    );
__declspec(dllimport)

HANDLE
__stdcall
FindFirstFileTransactedW(
           LPCWSTR lpFileName,
           FINDEX_INFO_LEVELS fInfoLevelId,
          LPVOID lpFindFileData,
           FINDEX_SEARCH_OPS fSearchOp,
     LPVOID lpSearchFilter,
           DWORD dwAdditionalFlags,
           HANDLE hTransaction
    );




#line 8987 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8989 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 8991 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
FindFirstFileA(
      LPCSTR lpFileName,
     LPWIN32_FIND_DATAA lpFindFileData
    );
__declspec(dllimport)

HANDLE
__stdcall
FindFirstFileW(
      LPCWSTR lpFileName,
     LPWIN32_FIND_DATAW lpFindFileData
    );




#line 9013 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
FindNextFileA(
      HANDLE hFindFile,
     LPWIN32_FIND_DATAA lpFindFileData
    );
__declspec(dllimport)
BOOL
__stdcall
FindNextFileW(
      HANDLE hFindFile,
     LPWIN32_FIND_DATAW lpFindFileData
    );




#line 9033 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
DWORD
__stdcall
SearchPathA(
      LPCSTR lpPath,
          LPCSTR lpFileName,
      LPCSTR lpExtension,
          DWORD nBufferLength,
     LPSTR lpBuffer,
     LPSTR *lpFilePart
    );
__declspec(dllimport)
DWORD
__stdcall
SearchPathW(
      LPCWSTR lpPath,
          LPCWSTR lpFileName,
      LPCWSTR lpExtension,
          DWORD nBufferLength,
     LPWSTR lpBuffer,
     LPWSTR *lpFilePart
    );




#line 9062 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CopyFileA(
     LPCSTR lpExistingFileName,
     LPCSTR lpNewFileName,
     BOOL bFailIfExists
    );
__declspec(dllimport)
BOOL
__stdcall
CopyFileW(
     LPCWSTR lpExistingFileName,
     LPCWSTR lpNewFileName,
     BOOL bFailIfExists
    );




#line 9084 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





















#line 9106 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


typedef
DWORD
(__stdcall *LPPROGRESS_ROUTINE)(
         LARGE_INTEGER TotalFileSize,
         LARGE_INTEGER TotalBytesTransferred,
         LARGE_INTEGER StreamSize,
         LARGE_INTEGER StreamBytesTransferred,
         DWORD dwStreamNumber,
         DWORD dwCallbackReason,
         HANDLE hSourceFile,
         HANDLE hDestinationFile,
     LPVOID lpData
    );

__declspec(dllimport)
BOOL
__stdcall
CopyFileExA(
         LPCSTR lpExistingFileName,
         LPCSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
     LPBOOL pbCancel,
         DWORD dwCopyFlags
    );
__declspec(dllimport)
BOOL
__stdcall
CopyFileExW(
         LPCWSTR lpExistingFileName,
         LPCWSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
     LPBOOL pbCancel,
         DWORD dwCopyFlags
    );




#line 9149 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
CopyFileTransactedA(
         LPCSTR lpExistingFileName,
         LPCSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
     LPBOOL pbCancel,
         DWORD dwCopyFlags,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
CopyFileTransactedW(
         LPCWSTR lpExistingFileName,
         LPCWSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
     LPBOOL pbCancel,
         DWORD dwCopyFlags,
         HANDLE hTransaction
    );




#line 9181 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 9183 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 9184 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
MoveFileA(
     LPCSTR lpExistingFileName,
     LPCSTR lpNewFileName
    );
__declspec(dllimport)
BOOL
__stdcall
MoveFileW(
     LPCWSTR lpExistingFileName,
     LPCWSTR lpNewFileName
    );




#line 9204 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



















#line 9224 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
MoveFileExA(
         LPCSTR lpExistingFileName,
     LPCSTR lpNewFileName,
         DWORD    dwFlags
    );
__declspec(dllimport)
BOOL
__stdcall
MoveFileExW(
         LPCWSTR lpExistingFileName,
     LPCWSTR lpNewFileName,
         DWORD    dwFlags
    );




#line 9246 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
MoveFileWithProgressA(
         LPCSTR lpExistingFileName,
     LPCSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
         DWORD dwFlags
    );
__declspec(dllimport)
BOOL
__stdcall
MoveFileWithProgressW(
         LPCWSTR lpExistingFileName,
     LPCWSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
         DWORD dwFlags
    );




#line 9273 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 9274 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
MoveFileTransactedA(
         LPCSTR lpExistingFileName,
     LPCSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
         DWORD dwFlags,
         HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
MoveFileTransactedW(
         LPCWSTR lpExistingFileName,
     LPCWSTR lpNewFileName,
     LPPROGRESS_ROUTINE lpProgressRoutine,
     LPVOID lpData,
         DWORD dwFlags,
         HANDLE hTransaction
    );




#line 9303 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 9304 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"








#line 9313 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




__declspec(dllimport)
BOOL
__stdcall
ReplaceFileA(
           LPCSTR  lpReplacedFileName,
           LPCSTR  lpReplacementFileName,
       LPCSTR  lpBackupFileName,
           DWORD   dwReplaceFlags,
     LPVOID  lpExclude,
     LPVOID  lpReserved
    );
__declspec(dllimport)
BOOL
__stdcall
ReplaceFileW(
           LPCWSTR lpReplacedFileName,
           LPCWSTR lpReplacementFileName,
       LPCWSTR lpBackupFileName,
           DWORD   dwReplaceFlags,
     LPVOID  lpExclude,
     LPVOID  lpReserved
    );




#line 9344 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 9345 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



//
// API call to create hard links.
//

__declspec(dllimport)
BOOL
__stdcall
CreateHardLinkA(
           LPCSTR lpFileName,
           LPCSTR lpExistingFileName,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
__declspec(dllimport)
BOOL
__stdcall
CreateHardLinkW(
           LPCWSTR lpFileName,
           LPCWSTR lpExistingFileName,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );




#line 9373 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 9375 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


//
// API call to create hard links.
//

__declspec(dllimport)
BOOL
__stdcall
CreateHardLinkTransactedA(
           LPCSTR lpFileName,
           LPCSTR lpExistingFileName,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
           HANDLE hTransaction
    );
__declspec(dllimport)
BOOL
__stdcall
CreateHardLinkTransactedW(
           LPCWSTR lpFileName,
           LPCWSTR lpExistingFileName,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
           HANDLE hTransaction
    );




#line 9404 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 9406 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




//
// API call to enumerate for streams within a file
//

typedef enum _STREAM_INFO_LEVELS {

    FindStreamInfoStandard,
    FindStreamInfoMaxInfoLevel

} STREAM_INFO_LEVELS;

typedef struct _WIN32_FIND_STREAM_DATA {

    LARGE_INTEGER StreamSize;
    WCHAR cStreamName[ 260 + 36 ];

} WIN32_FIND_STREAM_DATA, *PWIN32_FIND_STREAM_DATA;


HANDLE
__stdcall
FindFirstStreamW(
           LPCWSTR lpFileName,
           STREAM_INFO_LEVELS InfoLevel,
          LPVOID lpFindStreamData,
     DWORD dwFlags
    );

BOOL
__stdcall
FindNextStreamW(
      HANDLE hFindStream,
     LPVOID lpFindStreamData
    );
#line 9445 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



HANDLE
__stdcall
FindFirstFileNameW (
        LPCWSTR lpFileName,
        DWORD dwFlags,
     LPDWORD StringLength,
     PWCHAR LinkName
    );

BOOL
__stdcall
FindNextFileNameW (
        HANDLE hFindStream,
     LPDWORD StringLength,
     PWCHAR LinkName
    );

HANDLE
__stdcall
FindFirstFileNameTransactedW (
         LPCWSTR lpFileName,
         DWORD dwFlags,
      LPDWORD StringLength,
     PWCHAR LinkName,
     HANDLE hTransaction
    );

#line 9476 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)

HANDLE
__stdcall
CreateNamedPipeA(
         LPCSTR lpName,
         DWORD dwOpenMode,
         DWORD dwPipeMode,
         DWORD nMaxInstances,
         DWORD nOutBufferSize,
         DWORD nInBufferSize,
         DWORD nDefaultTimeOut,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );
__declspec(dllimport)

HANDLE
__stdcall
CreateNamedPipeW(
         LPCWSTR lpName,
         DWORD dwOpenMode,
         DWORD dwPipeMode,
         DWORD nMaxInstances,
         DWORD nOutBufferSize,
         DWORD nInBufferSize,
         DWORD nDefaultTimeOut,
     LPSECURITY_ATTRIBUTES lpSecurityAttributes
    );




#line 9511 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeHandleStateA(
          HANDLE hNamedPipe,
     LPDWORD lpState,
     LPDWORD lpCurInstances,
     LPDWORD lpMaxCollectionCount,
     LPDWORD lpCollectDataTimeout,
     LPSTR lpUserName,
          DWORD nMaxUserNameSize
    );
__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeHandleStateW(
          HANDLE hNamedPipe,
     LPDWORD lpState,
     LPDWORD lpCurInstances,
     LPDWORD lpMaxCollectionCount,
     LPDWORD lpCollectDataTimeout,
     LPWSTR lpUserName,
          DWORD nMaxUserNameSize
    );




#line 9541 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CallNamedPipeA(
      LPCSTR lpNamedPipeName,
     LPVOID lpInBuffer,
      DWORD nInBufferSize,
     LPVOID lpOutBuffer,
      DWORD nOutBufferSize,
     LPDWORD lpBytesRead,
      DWORD nTimeOut
    );
__declspec(dllimport)
BOOL
__stdcall
CallNamedPipeW(
      LPCWSTR lpNamedPipeName,
     LPVOID lpInBuffer,
      DWORD nInBufferSize,
     LPVOID lpOutBuffer,
      DWORD nOutBufferSize,
     LPDWORD lpBytesRead,
      DWORD nTimeOut
    );




#line 9571 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
WaitNamedPipeA(
     LPCSTR lpNamedPipeName,
     DWORD nTimeOut
    );
__declspec(dllimport)
BOOL
__stdcall
WaitNamedPipeW(
     LPCWSTR lpNamedPipeName,
     DWORD nTimeOut
    );




#line 9591 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

typedef enum {
    PipeAttribute,
    PipeConnectionAttribute,
    PipeHandleAttribute
} PIPE_ATTRIBUTE_TYPE;

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeAttribute(
     HANDLE Pipe,
     PIPE_ATTRIBUTE_TYPE AttributeType,
     PSTR AttributeName,
     PVOID AttributeValue,
     PSIZE_T AttributeValueLength
    );

__declspec(dllimport)
BOOL
__stdcall
SetNamedPipeAttribute(
     HANDLE Pipe,
     PIPE_ATTRIBUTE_TYPE AttributeType,
     PSTR AttributeName,
     PVOID AttributeValue,
     SIZE_T AttributeValueLength
    );

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeClientComputerNameA(
     HANDLE Pipe,
      LPSTR ClientComputerName,
     ULONG ClientComputerNameLength
    );
__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeClientComputerNameW(
     HANDLE Pipe,
      LPWSTR ClientComputerName,
     ULONG ClientComputerNameLength
    );




#line 9641 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeClientProcessId(
     HANDLE Pipe,
     PULONG ClientProcessId
    );

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeClientSessionId(
     HANDLE Pipe,
     PULONG ClientSessionId
    );

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeServerProcessId(
     HANDLE Pipe,
     PULONG ServerProcessId
    );

__declspec(dllimport)
BOOL
__stdcall
GetNamedPipeServerSessionId(
     HANDLE Pipe,
     PULONG ServerSessionId
    );

__declspec(dllimport)
BOOL
__stdcall
SetVolumeLabelA(
     LPCSTR lpRootPathName,
     LPCSTR lpVolumeName
    );
__declspec(dllimport)
BOOL
__stdcall
SetVolumeLabelW(
     LPCWSTR lpRootPathName,
     LPCWSTR lpVolumeName
    );




#line 9693 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
SetFileApisToOEM( void );

__declspec(dllimport)
void
__stdcall
SetFileApisToANSI( void );

__declspec(dllimport)
BOOL
__stdcall
AreFileApisANSI( void );

__declspec(dllimport)
BOOL
__stdcall
GetVolumeInformationA(
      LPCSTR lpRootPathName,
     LPSTR lpVolumeNameBuffer,
          DWORD nVolumeNameSize,
     LPDWORD lpVolumeSerialNumber,
     LPDWORD lpMaximumComponentLength,
     LPDWORD lpFileSystemFlags,
     LPSTR lpFileSystemNameBuffer,
          DWORD nFileSystemNameSize
    );
__declspec(dllimport)
BOOL
__stdcall
GetVolumeInformationW(
      LPCWSTR lpRootPathName,
     LPWSTR lpVolumeNameBuffer,
          DWORD nVolumeNameSize,
     LPDWORD lpVolumeSerialNumber,
     LPDWORD lpMaximumComponentLength,
     LPDWORD lpFileSystemFlags,
     LPWSTR lpFileSystemNameBuffer,
          DWORD nFileSystemNameSize
    );




#line 9740 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
GetVolumeInformationByHandleW(
          HANDLE hFile,
     LPWSTR lpVolumeNameBuffer,
          DWORD nVolumeNameSize,
     LPDWORD lpVolumeSerialNumber,
     LPDWORD lpMaximumComponentLength,
     LPDWORD lpFileSystemFlags,
     LPWSTR lpFileSystemNameBuffer,
          DWORD nFileSystemNameSize
    );
#line 9756 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CancelSynchronousIo(
     HANDLE hThread
    );

__declspec(dllimport)
BOOL
__stdcall
CancelIoEx(
     HANDLE hFile,
     LPOVERLAPPED lpOverlapped
    );

__declspec(dllimport)
BOOL
__stdcall
CancelIo(
     HANDLE hFile
    );

__declspec(dllimport)
BOOL
__stdcall
SetFileBandwidthReservation(
      HANDLE  hFile,
      DWORD   nPeriodMilliseconds,
      DWORD   nBytesPerPeriod,
      BOOL    bDiscardable,
     LPDWORD lpTransferSize,
     LPDWORD lpNumOutstandingRequests
    );

__declspec(dllimport)
BOOL
__stdcall
GetFileBandwidthReservation(
      HANDLE  hFile,
     LPDWORD lpPeriodMilliseconds,
     LPDWORD lpBytesPerPeriod,
     LPBOOL  pDiscardable,
     LPDWORD lpTransferSize,
     LPDWORD lpNumOutstandingRequests
    );

//
// Event logging APIs
//

__declspec(dllimport)
BOOL
__stdcall
ClearEventLogA (
         HANDLE hEventLog,
     LPCSTR lpBackupFileName
    );
__declspec(dllimport)
BOOL
__stdcall
ClearEventLogW (
         HANDLE hEventLog,
     LPCWSTR lpBackupFileName
    );




#line 9826 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
BackupEventLogA (
     HANDLE hEventLog,
     LPCSTR lpBackupFileName
    );
__declspec(dllimport)
BOOL
__stdcall
BackupEventLogW (
     HANDLE hEventLog,
     LPCWSTR lpBackupFileName
    );




#line 9846 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CloseEventLog (
     HANDLE hEventLog
    );

__declspec(dllimport)
BOOL
__stdcall
DeregisterEventSource (
     HANDLE hEventLog
    );

__declspec(dllimport)
BOOL
__stdcall
NotifyChangeEventLog(
     HANDLE  hEventLog,
     HANDLE  hEvent
    );

__declspec(dllimport)
BOOL
__stdcall
GetNumberOfEventLogRecords (
      HANDLE hEventLog,
     PDWORD NumberOfRecords
    );

__declspec(dllimport)
BOOL
__stdcall
GetOldestEventLogRecord (
      HANDLE hEventLog,
     PDWORD OldestRecord
    );

__declspec(dllimport)

HANDLE
__stdcall
OpenEventLogA (
     LPCSTR lpUNCServerName,
         LPCSTR lpSourceName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenEventLogW (
     LPCWSTR lpUNCServerName,
         LPCWSTR lpSourceName
    );




#line 9906 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
RegisterEventSourceA (
     LPCSTR lpUNCServerName,
         LPCSTR lpSourceName
    );
__declspec(dllimport)

HANDLE
__stdcall
RegisterEventSourceW (
     LPCWSTR lpUNCServerName,
         LPCWSTR lpSourceName
    );




#line 9928 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenBackupEventLogA (
     LPCSTR lpUNCServerName,
         LPCSTR lpFileName
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenBackupEventLogW (
     LPCWSTR lpUNCServerName,
         LPCWSTR lpFileName
    );




#line 9950 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
ReadEventLogA (
      HANDLE     hEventLog,
      DWORD      dwReadFlags,
      DWORD      dwRecordOffset,
     LPVOID     lpBuffer,
      DWORD      nNumberOfBytesToRead,
     DWORD      *pnBytesRead,
     DWORD      *pnMinNumberOfBytesNeeded
    );
__declspec(dllimport)
BOOL
__stdcall
ReadEventLogW (
      HANDLE     hEventLog,
      DWORD      dwReadFlags,
      DWORD      dwRecordOffset,
     LPVOID     lpBuffer,
      DWORD      nNumberOfBytesToRead,
     DWORD      *pnBytesRead,
     DWORD      *pnMinNumberOfBytesNeeded
    );




#line 9980 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
ReportEventA (
         HANDLE     hEventLog,
         WORD       wType,
         WORD       wCategory,
         DWORD      dwEventID,
     PSID       lpUserSid,
         WORD       wNumStrings,
         DWORD      dwDataSize,
     LPCSTR *lpStrings,
     LPVOID lpRawData
    );
__declspec(dllimport)
BOOL
__stdcall
ReportEventW (
         HANDLE     hEventLog,
         WORD       wType,
         WORD       wCategory,
         DWORD      dwEventID,
     PSID       lpUserSid,
         WORD       wNumStrings,
         DWORD      dwDataSize,
     LPCWSTR *lpStrings,
     LPVOID lpRawData
    );




#line 10014 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




typedef struct _EVENTLOG_FULL_INFORMATION
{
    DWORD    dwFull;
}
EVENTLOG_FULL_INFORMATION, *LPEVENTLOG_FULL_INFORMATION;

__declspec(dllimport)
BOOL
__stdcall
GetEventLogInformation (
      HANDLE     hEventLog,
      DWORD      dwInfoLevel,
     LPVOID lpBuffer,
      DWORD      cbBufSize,
     LPDWORD    pcbBytesNeeded
    );

//
//
// Security APIs
//


__declspec(dllimport)
BOOL
__stdcall
DuplicateToken(
            HANDLE ExistingTokenHandle,
            SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
     PHANDLE DuplicateTokenHandle
    );

__declspec(dllimport)
BOOL
__stdcall
GetKernelObjectSecurity (
      HANDLE Handle,
      SECURITY_INFORMATION RequestedInformation,
     PSECURITY_DESCRIPTOR pSecurityDescriptor,
      DWORD nLength,
     LPDWORD lpnLengthNeeded
    );

__declspec(dllimport)
BOOL
__stdcall
ImpersonateNamedPipeClient(
     HANDLE hNamedPipe
    );

__declspec(dllimport)
BOOL
__stdcall
ImpersonateSelf(
     SECURITY_IMPERSONATION_LEVEL ImpersonationLevel
    );


__declspec(dllimport)
BOOL
__stdcall
RevertToSelf (
    void
    );

__declspec(dllimport)
BOOL
__stdcall
SetThreadToken (
     PHANDLE Thread,
     HANDLE Token
    );

__declspec(dllimport)
BOOL
__stdcall
AccessCheck (
        PSECURITY_DESCRIPTOR pSecurityDescriptor,
        HANDLE ClientToken,
        DWORD DesiredAccess,
        PGENERIC_MAPPING GenericMapping,
     PPRIVILEGE_SET PrivilegeSet,
     LPDWORD PrivilegeSetLength,
       LPDWORD GrantedAccess,
       LPBOOL AccessStatus
    );


__declspec(dllimport)
BOOL
__stdcall
AccessCheckByType (
         PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSID PrincipalSelfSid,
         HANDLE ClientToken,
         DWORD DesiredAccess,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
     PPRIVILEGE_SET PrivilegeSet,
      LPDWORD PrivilegeSetLength,
        LPDWORD GrantedAccess,
        LPBOOL AccessStatus
    );

__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeResultList (
         PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSID PrincipalSelfSid,
         HANDLE ClientToken,
         DWORD DesiredAccess,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
     PPRIVILEGE_SET PrivilegeSet,
      LPDWORD PrivilegeSetLength,
        LPDWORD GrantedAccessList,
        LPDWORD AccessStatusList
    );
#line 10140 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
OpenProcessToken (
            HANDLE ProcessHandle,
            DWORD DesiredAccess,
     PHANDLE TokenHandle
    );


__declspec(dllimport)
BOOL
__stdcall
OpenThreadToken (
            HANDLE ThreadHandle,
            DWORD DesiredAccess,
            BOOL OpenAsSelf,
     PHANDLE TokenHandle
    );


__declspec(dllimport)
BOOL
__stdcall
GetTokenInformation (
          HANDLE TokenHandle,
          TOKEN_INFORMATION_CLASS TokenInformationClass,
     LPVOID TokenInformation,
          DWORD TokenInformationLength,
         PDWORD ReturnLength
    );


__declspec(dllimport)
BOOL
__stdcall
SetTokenInformation (
     HANDLE TokenHandle,
     TOKEN_INFORMATION_CLASS TokenInformationClass,
     LPVOID TokenInformation,
     DWORD TokenInformationLength
    );


__declspec(dllimport)
BOOL
__stdcall
AdjustTokenPrivileges (
          HANDLE TokenHandle,
          BOOL DisableAllPrivileges,
      PTOKEN_PRIVILEGES NewState,
          DWORD BufferLength,
     PTOKEN_PRIVILEGES PreviousState,
     PDWORD ReturnLength
    );


__declspec(dllimport)
BOOL
__stdcall
AdjustTokenGroups (
          HANDLE TokenHandle,
          BOOL ResetToDefault,
      PTOKEN_GROUPS NewState,
          DWORD BufferLength,
     PTOKEN_GROUPS PreviousState,
     PDWORD ReturnLength
    );


__declspec(dllimport)
BOOL
__stdcall
PrivilegeCheck (
        HANDLE ClientToken,
     PPRIVILEGE_SET RequiredPrivileges,
       LPBOOL pfResult
    );


__declspec(dllimport)
BOOL
__stdcall
AccessCheckAndAuditAlarmA (
         LPCSTR SubsystemName,
     LPVOID HandleId,
         LPSTR ObjectTypeName,
     LPSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
         DWORD DesiredAccess,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPBOOL AccessStatus,
        LPBOOL pfGenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
AccessCheckAndAuditAlarmW (
         LPCWSTR SubsystemName,
     LPVOID HandleId,
         LPWSTR ObjectTypeName,
     LPWSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
         DWORD DesiredAccess,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPBOOL AccessStatus,
        LPBOOL pfGenerateOnClose
    );




#line 10259 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeAndAuditAlarmA (
         LPCSTR SubsystemName,
         LPVOID HandleId,
         LPCSTR ObjectTypeName,
     LPCSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
     PSID PrincipalSelfSid,
         DWORD DesiredAccess,
         AUDIT_EVENT_TYPE AuditType,
         DWORD Flags,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPBOOL AccessStatus,
        LPBOOL pfGenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeAndAuditAlarmW (
         LPCWSTR SubsystemName,
         LPVOID HandleId,
         LPCWSTR ObjectTypeName,
     LPCWSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
     PSID PrincipalSelfSid,
         DWORD DesiredAccess,
         AUDIT_EVENT_TYPE AuditType,
         DWORD Flags,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPBOOL AccessStatus,
        LPBOOL pfGenerateOnClose
    );




#line 10309 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeResultListAndAuditAlarmA (
         LPCSTR SubsystemName,
         LPVOID HandleId,
         LPCSTR ObjectTypeName,
     LPCSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
     PSID PrincipalSelfSid,
         DWORD DesiredAccess,
         AUDIT_EVENT_TYPE AuditType,
         DWORD Flags,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPDWORD AccessStatusList,
        LPBOOL pfGenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeResultListAndAuditAlarmW (
         LPCWSTR SubsystemName,
         LPVOID HandleId,
         LPCWSTR ObjectTypeName,
     LPCWSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
     PSID PrincipalSelfSid,
         DWORD DesiredAccess,
         AUDIT_EVENT_TYPE AuditType,
         DWORD Flags,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPDWORD AccessStatusList,
        LPBOOL pfGenerateOnClose
    );




#line 10357 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeResultListAndAuditAlarmByHandleA (
         LPCSTR SubsystemName,
         LPVOID HandleId,
         HANDLE ClientToken,
         LPCSTR ObjectTypeName,
     LPCSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
     PSID PrincipalSelfSid,
         DWORD DesiredAccess,
         AUDIT_EVENT_TYPE AuditType,
         DWORD Flags,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPDWORD AccessStatusList,
        LPBOOL pfGenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
AccessCheckByTypeResultListAndAuditAlarmByHandleW (
         LPCWSTR SubsystemName,
         LPVOID HandleId,
         HANDLE ClientToken,
         LPCWSTR ObjectTypeName,
     LPCWSTR ObjectName,
         PSECURITY_DESCRIPTOR SecurityDescriptor,
     PSID PrincipalSelfSid,
         DWORD DesiredAccess,
         AUDIT_EVENT_TYPE AuditType,
         DWORD Flags,
     POBJECT_TYPE_LIST ObjectTypeList,
         DWORD ObjectTypeListLength,
         PGENERIC_MAPPING GenericMapping,
         BOOL ObjectCreation,
        LPDWORD GrantedAccess,
        LPDWORD AccessStatusList,
        LPBOOL pfGenerateOnClose
    );




#line 10407 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 10409 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
ObjectOpenAuditAlarmA (
         LPCSTR SubsystemName,
         LPVOID HandleId,
         LPSTR ObjectTypeName,
     LPSTR ObjectName,
         PSECURITY_DESCRIPTOR pSecurityDescriptor,
         HANDLE ClientToken,
         DWORD DesiredAccess,
         DWORD GrantedAccess,
     PPRIVILEGE_SET Privileges,
         BOOL ObjectCreation,
         BOOL AccessGranted,
        LPBOOL GenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
ObjectOpenAuditAlarmW (
         LPCWSTR SubsystemName,
         LPVOID HandleId,
         LPWSTR ObjectTypeName,
     LPWSTR ObjectName,
         PSECURITY_DESCRIPTOR pSecurityDescriptor,
         HANDLE ClientToken,
         DWORD DesiredAccess,
         DWORD GrantedAccess,
     PPRIVILEGE_SET Privileges,
         BOOL ObjectCreation,
         BOOL AccessGranted,
        LPBOOL GenerateOnClose
    );




#line 10449 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
ObjectPrivilegeAuditAlarmA (
     LPCSTR SubsystemName,
     LPVOID HandleId,
     HANDLE ClientToken,
     DWORD DesiredAccess,
     PPRIVILEGE_SET Privileges,
     BOOL AccessGranted
    );
__declspec(dllimport)
BOOL
__stdcall
ObjectPrivilegeAuditAlarmW (
     LPCWSTR SubsystemName,
     LPVOID HandleId,
     HANDLE ClientToken,
     DWORD DesiredAccess,
     PPRIVILEGE_SET Privileges,
     BOOL AccessGranted
    );




#line 10478 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
ObjectCloseAuditAlarmA (
     LPCSTR SubsystemName,
     LPVOID HandleId,
     BOOL GenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
ObjectCloseAuditAlarmW (
     LPCWSTR SubsystemName,
     LPVOID HandleId,
     BOOL GenerateOnClose
    );




#line 10501 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
ObjectDeleteAuditAlarmA (
     LPCSTR SubsystemName,
     LPVOID HandleId,
     BOOL GenerateOnClose
    );
__declspec(dllimport)
BOOL
__stdcall
ObjectDeleteAuditAlarmW (
     LPCWSTR SubsystemName,
     LPVOID HandleId,
     BOOL GenerateOnClose
    );




#line 10524 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
PrivilegedServiceAuditAlarmA (
     LPCSTR SubsystemName,
     LPCSTR ServiceName,
     HANDLE ClientToken,
     PPRIVILEGE_SET Privileges,
     BOOL AccessGranted
    );
__declspec(dllimport)
BOOL
__stdcall
PrivilegedServiceAuditAlarmW (
     LPCWSTR SubsystemName,
     LPCWSTR ServiceName,
     HANDLE ClientToken,
     PPRIVILEGE_SET Privileges,
     BOOL AccessGranted
    );




#line 10551 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"






__declspec(dllimport)
BOOL
__stdcall
IsWellKnownSid (
     PSID pSid,
     WELL_KNOWN_SID_TYPE WellKnownSidType
    );

__declspec(dllimport)
BOOL
__stdcall
CreateWellKnownSid(
         WELL_KNOWN_SID_TYPE WellKnownSidType,
     PSID DomainSid,
     PSID pSid,
      DWORD *cbSid
    );

__declspec(dllimport)
BOOL
__stdcall
EqualDomainSid(
      PSID pSid1,
      PSID pSid2,
     BOOL *pfEqual
    );

__declspec(dllimport)
BOOL
__stdcall
GetWindowsAccountDomainSid(
        PSID pSid,
     PSID pDomainSid,
     DWORD* cbDomainSid
    );

#line 10594 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
IsValidSid (
     PSID pSid
    );


__declspec(dllimport)
BOOL
__stdcall
EqualSid (
     PSID pSid1,
     PSID pSid2
    );


__declspec(dllimport)
BOOL
__stdcall
EqualPrefixSid (
     PSID pSid1,
     PSID pSid2
    );


__declspec(dllimport)
DWORD
__stdcall
GetSidLengthRequired (
     UCHAR nSubAuthorityCount
    );


__declspec(dllimport)
BOOL
__stdcall
AllocateAndInitializeSid (
            PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority,
            BYTE nSubAuthorityCount,
            DWORD nSubAuthority0,
            DWORD nSubAuthority1,
            DWORD nSubAuthority2,
            DWORD nSubAuthority3,
            DWORD nSubAuthority4,
            DWORD nSubAuthority5,
            DWORD nSubAuthority6,
            DWORD nSubAuthority7,
     PSID *pSid
    );

__declspec(dllimport)
PVOID
__stdcall
FreeSid(
     PSID pSid
    );

__declspec(dllimport)
BOOL
__stdcall
InitializeSid (
     PSID Sid,
      PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority,
      BYTE nSubAuthorityCount
    );


__declspec(dllimport)

PSID_IDENTIFIER_AUTHORITY
__stdcall
GetSidIdentifierAuthority (
     PSID pSid
    );


__declspec(dllimport)

PDWORD
__stdcall
GetSidSubAuthority (
     PSID pSid,
     DWORD nSubAuthority
    );


__declspec(dllimport)

PUCHAR
__stdcall
GetSidSubAuthorityCount (
     PSID pSid
    );


__declspec(dllimport)
DWORD
__stdcall
GetLengthSid (
     PSID pSid
    );


__declspec(dllimport)
BOOL
__stdcall
CopySid (
     DWORD nDestinationSidLength,
     PSID pDestinationSid,
     PSID pSourceSid
    );


__declspec(dllimport)
BOOL
__stdcall
AreAllAccessesGranted (
     DWORD GrantedAccess,
     DWORD DesiredAccess
    );


__declspec(dllimport)
BOOL
__stdcall
AreAnyAccessesGranted (
     DWORD GrantedAccess,
     DWORD DesiredAccess
    );


__declspec(dllimport)
void
__stdcall
MapGenericMask (
     PDWORD AccessMask,
        PGENERIC_MAPPING GenericMapping
    );


__declspec(dllimport)
BOOL
__stdcall
IsValidAcl (
     PACL pAcl
    );


__declspec(dllimport)
BOOL
__stdcall
InitializeAcl (
     PACL pAcl,
     DWORD nAclLength,
     DWORD dwAclRevision
    );


__declspec(dllimport)
BOOL
__stdcall
GetAclInformation (
     PACL pAcl,
     LPVOID pAclInformation,
     DWORD nAclInformationLength,
     ACL_INFORMATION_CLASS dwAclInformationClass
    );


__declspec(dllimport)
BOOL
__stdcall
SetAclInformation (
     PACL pAcl,
     LPVOID pAclInformation,
        DWORD nAclInformationLength,
        ACL_INFORMATION_CLASS dwAclInformationClass
    );


__declspec(dllimport)
BOOL
__stdcall
AddAce (
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD dwStartingAceIndex,
     LPVOID pAceList,
        DWORD nAceListLength
    );


__declspec(dllimport)
BOOL
__stdcall
DeleteAce (
     PACL pAcl,
        DWORD dwAceIndex
    );


__declspec(dllimport)
BOOL
__stdcall
GetAce (
            PACL pAcl,
            DWORD dwAceIndex,
     LPVOID *pAce
    );


__declspec(dllimport)
BOOL
__stdcall
AddAccessAllowedAce (
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD AccessMask,
        PSID pSid
    );


__declspec(dllimport)
BOOL
__stdcall
AddAccessAllowedAceEx (
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD AceFlags,
        DWORD AccessMask,
        PSID pSid
    );
#line 10829 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
AddMandatoryAce (
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD AceFlags,
        DWORD MandatoryPolicy,
        PSID pLabelSid
    );
#line 10842 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
AddAccessDeniedAce (
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD AccessMask,
        PSID pSid
    );


__declspec(dllimport)
BOOL
__stdcall
AddAccessDeniedAceEx (
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD AceFlags,
        DWORD AccessMask,
        PSID pSid
    );
#line 10865 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
AddAuditAccessAce(
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD dwAccessMask,
        PSID pSid,
        BOOL bAuditSuccess,
        BOOL bAuditFailure
    );


__declspec(dllimport)
BOOL
__stdcall
AddAuditAccessAceEx(
     PACL pAcl,
        DWORD dwAceRevision,
        DWORD AceFlags,
        DWORD dwAccessMask,
        PSID pSid,
        BOOL bAuditSuccess,
        BOOL bAuditFailure
    );

__declspec(dllimport)
BOOL
__stdcall
AddAccessAllowedObjectAce (
      PACL pAcl,
         DWORD dwAceRevision,
         DWORD AceFlags,
         DWORD AccessMask,
     GUID *ObjectTypeGuid,
     GUID *InheritedObjectTypeGuid,
         PSID pSid
    );

__declspec(dllimport)
BOOL
__stdcall
AddAccessDeniedObjectAce (
      PACL pAcl,
         DWORD dwAceRevision,
         DWORD AceFlags,
         DWORD AccessMask,
     GUID *ObjectTypeGuid,
     GUID *InheritedObjectTypeGuid,
         PSID pSid
    );

__declspec(dllimport)
BOOL
__stdcall
AddAuditAccessObjectAce (
      PACL pAcl,
         DWORD dwAceRevision,
         DWORD AceFlags,
         DWORD AccessMask,
     GUID *ObjectTypeGuid,
     GUID *InheritedObjectTypeGuid,
         PSID pSid,
         BOOL bAuditSuccess,
         BOOL bAuditFailure
    );
#line 10933 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
FindFirstFreeAce (
            PACL pAcl,
     LPVOID *pAce
    );


__declspec(dllimport)
BOOL
__stdcall
InitializeSecurityDescriptor (
     PSECURITY_DESCRIPTOR pSecurityDescriptor,
      DWORD dwRevision
    );


__declspec(dllimport)
BOOL
__stdcall
IsValidSecurityDescriptor (
     PSECURITY_DESCRIPTOR pSecurityDescriptor
    );

__declspec(dllimport)
BOOL
__stdcall
IsValidRelativeSecurityDescriptor (
     PSECURITY_DESCRIPTOR pSecurityDescriptor,
     ULONG SecurityDescriptorLength,
     SECURITY_INFORMATION RequiredInformation
    );

__declspec(dllimport)
DWORD
__stdcall
GetSecurityDescriptorLength (
     PSECURITY_DESCRIPTOR pSecurityDescriptor
    );


__declspec(dllimport)
BOOL
__stdcall
GetSecurityDescriptorControl (
      PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSECURITY_DESCRIPTOR_CONTROL pControl,
     LPDWORD lpdwRevision
    );


__declspec(dllimport)
BOOL
__stdcall
SetSecurityDescriptorControl (
     PSECURITY_DESCRIPTOR pSecurityDescriptor,
     SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest,
     SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet
    );
#line 10995 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetSecurityDescriptorDacl (
      PSECURITY_DESCRIPTOR pSecurityDescriptor,
         BOOL bDaclPresent,
     PACL pDacl,
         BOOL bDaclDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
GetSecurityDescriptorDacl (
            PSECURITY_DESCRIPTOR pSecurityDescriptor,
           LPBOOL lpbDaclPresent,
     PACL *pDacl,
           LPBOOL lpbDaclDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
SetSecurityDescriptorSacl (
      PSECURITY_DESCRIPTOR pSecurityDescriptor,
         BOOL bSaclPresent,
     PACL pSacl,
         BOOL bSaclDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
GetSecurityDescriptorSacl (
            PSECURITY_DESCRIPTOR pSecurityDescriptor,
           LPBOOL lpbSaclPresent,
     PACL *pSacl,
           LPBOOL lpbSaclDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
SetSecurityDescriptorOwner (
      PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSID pOwner,
         BOOL bOwnerDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
GetSecurityDescriptorOwner (
            PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSID *pOwner,
           LPBOOL lpbOwnerDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
SetSecurityDescriptorGroup (
      PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSID pGroup,
         BOOL bGroupDefaulted
    );


__declspec(dllimport)
BOOL
__stdcall
GetSecurityDescriptorGroup (
            PSECURITY_DESCRIPTOR pSecurityDescriptor,
     PSID *pGroup,
           LPBOOL lpbGroupDefaulted
    );


__declspec(dllimport)
DWORD
__stdcall
SetSecurityDescriptorRMControl(
      PSECURITY_DESCRIPTOR SecurityDescriptor,
     PUCHAR RMControl
    );

__declspec(dllimport)
DWORD
__stdcall
GetSecurityDescriptorRMControl(
      PSECURITY_DESCRIPTOR SecurityDescriptor,
     PUCHAR RMControl
    );

__declspec(dllimport)
BOOL
__stdcall
CreatePrivateObjectSecurity (
        PSECURITY_DESCRIPTOR ParentDescriptor,
        PSECURITY_DESCRIPTOR CreatorDescriptor,
     PSECURITY_DESCRIPTOR * NewDescriptor,
            BOOL IsDirectoryObject,
        HANDLE Token,
            PGENERIC_MAPPING GenericMapping
    );


__declspec(dllimport)
BOOL
__stdcall
ConvertToAutoInheritPrivateObjectSecurity(
        PSECURITY_DESCRIPTOR ParentDescriptor,
            PSECURITY_DESCRIPTOR CurrentSecurityDescriptor,
     PSECURITY_DESCRIPTOR *NewSecurityDescriptor,
        GUID *ObjectType,
            BOOLEAN IsDirectoryObject,
            PGENERIC_MAPPING GenericMapping
    );

__declspec(dllimport)
BOOL
__stdcall
CreatePrivateObjectSecurityEx (
        PSECURITY_DESCRIPTOR ParentDescriptor,
        PSECURITY_DESCRIPTOR CreatorDescriptor,
     PSECURITY_DESCRIPTOR * NewDescriptor,
        GUID *ObjectType,
            BOOL IsContainerObject,
            ULONG AutoInheritFlags,
        HANDLE Token,
            PGENERIC_MAPPING GenericMapping
    );

__declspec(dllimport)
BOOL
__stdcall
CreatePrivateObjectSecurityWithMultipleInheritance (
        PSECURITY_DESCRIPTOR ParentDescriptor,
        PSECURITY_DESCRIPTOR CreatorDescriptor,
     PSECURITY_DESCRIPTOR * NewDescriptor,
     GUID **ObjectTypes,
            ULONG GuidCount,
            BOOL IsContainerObject,
            ULONG AutoInheritFlags,
        HANDLE Token,
            PGENERIC_MAPPING GenericMapping
    );
#line 11150 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetPrivateObjectSecurity (
              SECURITY_INFORMATION SecurityInformation,
              PSECURITY_DESCRIPTOR ModificationDescriptor,
     PSECURITY_DESCRIPTOR *ObjectsSecurityDescriptor,
              PGENERIC_MAPPING GenericMapping,
          HANDLE Token
    );


__declspec(dllimport)
BOOL
__stdcall
SetPrivateObjectSecurityEx (
              SECURITY_INFORMATION SecurityInformation,
              PSECURITY_DESCRIPTOR ModificationDescriptor,
     PSECURITY_DESCRIPTOR *ObjectsSecurityDescriptor,
              ULONG AutoInheritFlags,
              PGENERIC_MAPPING GenericMapping,
          HANDLE Token
    );
#line 11175 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetPrivateObjectSecurity (
      PSECURITY_DESCRIPTOR ObjectDescriptor,
      SECURITY_INFORMATION SecurityInformation,
     PSECURITY_DESCRIPTOR ResultantDescriptor,
      DWORD DescriptorLength,
     PDWORD ReturnLength
    );


__declspec(dllimport)
BOOL
__stdcall
DestroyPrivateObjectSecurity (
     PSECURITY_DESCRIPTOR * ObjectDescriptor
    );


__declspec(dllimport)
BOOL
__stdcall
MakeSelfRelativeSD (
        PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor,
     PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor,
     LPDWORD lpdwBufferLength
    );


__declspec(dllimport)
BOOL
__stdcall
MakeAbsoluteSD (
        PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor,
     PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor,
     LPDWORD lpdwAbsoluteSecurityDescriptorSize,
     PACL pDacl,
     LPDWORD lpdwDaclSize,
     PACL pSacl,
     LPDWORD lpdwSaclSize,
     PSID pOwner,
     LPDWORD lpdwOwnerSize,
     PSID pPrimaryGroup,
     LPDWORD lpdwPrimaryGroupSize
    );


__declspec(dllimport)
BOOL
__stdcall
MakeAbsoluteSD2 (
     PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor,
     LPDWORD lpdwBufferSize
    );

__declspec(dllimport)
void
__stdcall
QuerySecurityAccessMask(
     SECURITY_INFORMATION SecurityInformation,
     LPDWORD DesiredAccess
    );

__declspec(dllimport)
void
__stdcall
SetSecurityAccessMask(
     SECURITY_INFORMATION SecurityInformation,
     LPDWORD DesiredAccess
    );

__declspec(dllimport)
BOOL
__stdcall
SetFileSecurityA (
     LPCSTR lpFileName,
     SECURITY_INFORMATION SecurityInformation,
     PSECURITY_DESCRIPTOR pSecurityDescriptor
    );
__declspec(dllimport)
BOOL
__stdcall
SetFileSecurityW (
     LPCWSTR lpFileName,
     SECURITY_INFORMATION SecurityInformation,
     PSECURITY_DESCRIPTOR pSecurityDescriptor
    );




#line 11269 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
GetFileSecurityA (
      LPCSTR lpFileName,
      SECURITY_INFORMATION RequestedInformation,
     PSECURITY_DESCRIPTOR pSecurityDescriptor,
      DWORD nLength,
     LPDWORD lpnLengthNeeded
    );
__declspec(dllimport)
BOOL
__stdcall
GetFileSecurityW (
      LPCWSTR lpFileName,
      SECURITY_INFORMATION RequestedInformation,
     PSECURITY_DESCRIPTOR pSecurityDescriptor,
      DWORD nLength,
     LPDWORD lpnLengthNeeded
    );




#line 11296 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
SetKernelObjectSecurity (
     HANDLE Handle,
     SECURITY_INFORMATION SecurityInformation,
     PSECURITY_DESCRIPTOR SecurityDescriptor
    );

__declspec(dllimport)

HANDLE
__stdcall
FindFirstChangeNotificationA(
     LPCSTR lpPathName,
     BOOL bWatchSubtree,
     DWORD dwNotifyFilter
    );
__declspec(dllimport)

HANDLE
__stdcall
FindFirstChangeNotificationW(
     LPCWSTR lpPathName,
     BOOL bWatchSubtree,
     DWORD dwNotifyFilter
    );




#line 11330 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
FindNextChangeNotification(
     HANDLE hChangeHandle
    );

__declspec(dllimport)
BOOL
__stdcall
FindCloseChangeNotification(
     HANDLE hChangeHandle
    );


__declspec(dllimport)
BOOL
__stdcall
ReadDirectoryChangesW(
            HANDLE hDirectory,
     LPVOID lpBuffer,
            DWORD nBufferLength,
            BOOL bWatchSubtree,
            DWORD dwNotifyFilter,
       LPDWORD lpBytesReturned,
     LPOVERLAPPED lpOverlapped,
        LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine
    );
#line 11360 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
VirtualLock(
     LPVOID lpAddress,
     SIZE_T dwSize
    );

__declspec(dllimport)
BOOL
__stdcall
VirtualUnlock(
     LPVOID lpAddress,
     SIZE_T dwSize
    );

__declspec(dllimport)
 
LPVOID
__stdcall
MapViewOfFileEx(
         HANDLE hFileMappingObject,
         DWORD dwDesiredAccess,
         DWORD dwFileOffsetHigh,
         DWORD dwFileOffsetLow,
         SIZE_T dwNumberOfBytesToMap,
     LPVOID lpBaseAddress
    );



__declspec(dllimport)
 
LPVOID
__stdcall
MapViewOfFileExNuma(
         HANDLE hFileMappingObject,
         DWORD dwDesiredAccess,
         DWORD dwFileOffsetHigh,
         DWORD dwFileOffsetLow,
         SIZE_T dwNumberOfBytesToMap,
     LPVOID lpBaseAddress,
         DWORD nndPreferred
    );

#line 11407 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetPriorityClass(
     HANDLE hProcess,
     DWORD dwPriorityClass
    );

__declspec(dllimport)
DWORD
__stdcall
GetPriorityClass(
     HANDLE hProcess
    );

__declspec(dllimport)
BOOL
__stdcall
IsBadReadPtr(
     const void *lp,
         UINT_PTR ucb
    );

__declspec(dllimport)
BOOL
__stdcall
IsBadWritePtr(
     LPVOID lp,
         UINT_PTR ucb
    );

__declspec(dllimport)
BOOL
__stdcall
IsBadHugeReadPtr(
     const void *lp,
         UINT_PTR ucb
    );

__declspec(dllimport)
BOOL
__stdcall
IsBadHugeWritePtr(
     LPVOID lp,
         UINT_PTR ucb
    );

__declspec(dllimport)
BOOL
__stdcall
IsBadCodePtr(
     FARPROC lpfn
    );

__declspec(dllimport)
BOOL
__stdcall
IsBadStringPtrA(
     LPCSTR lpsz,
         UINT_PTR ucchMax
    );
__declspec(dllimport)
BOOL
__stdcall
IsBadStringPtrW(
     LPCWSTR lpsz,
         UINT_PTR ucchMax
    );




#line 11481 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
LookupAccountSidA(
     LPCSTR lpSystemName,
     PSID Sid,
     LPSTR Name,
      LPDWORD cchName,
     LPSTR ReferencedDomainName,
     LPDWORD cchReferencedDomainName,
     PSID_NAME_USE peUse
    );
__declspec(dllimport)
BOOL
__stdcall
LookupAccountSidW(
     LPCWSTR lpSystemName,
     PSID Sid,
     LPWSTR Name,
      LPDWORD cchName,
     LPWSTR ReferencedDomainName,
     LPDWORD cchReferencedDomainName,
     PSID_NAME_USE peUse
    );




#line 11511 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
LookupAccountNameA(
     LPCSTR lpSystemName,
         LPCSTR lpAccountName,
     PSID Sid,
      LPDWORD cbSid,
     LPSTR ReferencedDomainName,
      LPDWORD cchReferencedDomainName,
        PSID_NAME_USE peUse
    );
__declspec(dllimport)
BOOL
__stdcall
LookupAccountNameW(
     LPCWSTR lpSystemName,
         LPCWSTR lpAccountName,
     PSID Sid,
      LPDWORD cbSid,
     LPWSTR ReferencedDomainName,
      LPDWORD cchReferencedDomainName,
        PSID_NAME_USE peUse
    );




#line 11541 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
LookupPrivilegeValueA(
     LPCSTR lpSystemName,
         LPCSTR lpName,
        PLUID   lpLuid
    );
__declspec(dllimport)
BOOL
__stdcall
LookupPrivilegeValueW(
     LPCWSTR lpSystemName,
         LPCWSTR lpName,
        PLUID   lpLuid
    );




#line 11563 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
LookupPrivilegeNameA(
     LPCSTR lpSystemName,
         PLUID   lpLuid,
     LPSTR lpName,
      LPDWORD cchName
    );
__declspec(dllimport)
BOOL
__stdcall
LookupPrivilegeNameW(
     LPCWSTR lpSystemName,
         PLUID   lpLuid,
     LPWSTR lpName,
      LPDWORD cchName
    );




#line 11587 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
LookupPrivilegeDisplayNameA(
     LPCSTR lpSystemName,
         LPCSTR lpName,
     LPSTR lpDisplayName,
      LPDWORD cchDisplayName,
        LPDWORD lpLanguageId
    );
__declspec(dllimport)
BOOL
__stdcall
LookupPrivilegeDisplayNameW(
     LPCWSTR lpSystemName,
         LPCWSTR lpName,
     LPWSTR lpDisplayName,
      LPDWORD cchDisplayName,
        LPDWORD lpLanguageId
    );




#line 11613 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
AllocateLocallyUniqueId(
     PLUID Luid
    );

__declspec(dllimport)
BOOL
__stdcall
BuildCommDCBA(
      LPCSTR lpDef,
     LPDCB lpDCB
    );
__declspec(dllimport)
BOOL
__stdcall
BuildCommDCBW(
      LPCWSTR lpDef,
     LPDCB lpDCB
    );




#line 11640 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
BuildCommDCBAndTimeoutsA(
      LPCSTR lpDef,
     LPDCB lpDCB,
     LPCOMMTIMEOUTS lpCommTimeouts
    );
__declspec(dllimport)
BOOL
__stdcall
BuildCommDCBAndTimeoutsW(
      LPCWSTR lpDef,
     LPDCB lpDCB,
     LPCOMMTIMEOUTS lpCommTimeouts
    );




#line 11662 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
CommConfigDialogA(
         LPCSTR lpszName,
     HWND hWnd,
      LPCOMMCONFIG lpCC
    );
__declspec(dllimport)
BOOL
__stdcall
CommConfigDialogW(
         LPCWSTR lpszName,
     HWND hWnd,
      LPCOMMCONFIG lpCC
    );




#line 11684 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetDefaultCommConfigA(
        LPCSTR lpszName,
     LPCOMMCONFIG lpCC,
     LPDWORD lpdwSize
    );
__declspec(dllimport)
BOOL
__stdcall
GetDefaultCommConfigW(
        LPCWSTR lpszName,
     LPCOMMCONFIG lpCC,
     LPDWORD lpdwSize
    );




#line 11706 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetDefaultCommConfigA(
     LPCSTR lpszName,
     LPCOMMCONFIG lpCC,
     DWORD dwSize
    );
__declspec(dllimport)
BOOL
__stdcall
SetDefaultCommConfigW(
     LPCWSTR lpszName,
     LPCOMMCONFIG lpCC,
     DWORD dwSize
    );




#line 11728 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





#line 11734 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

BOOL
__stdcall
GetComputerNameA (
      LPSTR lpBuffer,
     LPDWORD nSize
    );
__declspec(dllimport)

BOOL
__stdcall
GetComputerNameW (
      LPWSTR lpBuffer,
     LPDWORD nSize
    );




#line 11756 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetComputerNameA (
     LPCSTR lpComputerName
    );
__declspec(dllimport)
BOOL
__stdcall
SetComputerNameW (
     LPCWSTR lpComputerName
    );




#line 11774 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




typedef enum _COMPUTER_NAME_FORMAT {
    ComputerNameNetBIOS,
    ComputerNameDnsHostname,
    ComputerNameDnsDomain,
    ComputerNameDnsFullyQualified,
    ComputerNamePhysicalNetBIOS,
    ComputerNamePhysicalDnsHostname,
    ComputerNamePhysicalDnsDomain,
    ComputerNamePhysicalDnsFullyQualified,
    ComputerNameMax
} COMPUTER_NAME_FORMAT ;

__declspec(dllimport)

BOOL
__stdcall
GetComputerNameExA (
        COMPUTER_NAME_FORMAT NameType,
     LPSTR lpBuffer,
     LPDWORD nSize
    );
__declspec(dllimport)

BOOL
__stdcall
GetComputerNameExW (
        COMPUTER_NAME_FORMAT NameType,
     LPWSTR lpBuffer,
     LPDWORD nSize
    );




#line 11813 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
SetComputerNameExA (
     COMPUTER_NAME_FORMAT NameType,
     LPCSTR lpBuffer
    );
__declspec(dllimport)
BOOL
__stdcall
SetComputerNameExW (
     COMPUTER_NAME_FORMAT NameType,
     LPCWSTR lpBuffer
    );




#line 11833 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)

BOOL
__stdcall
DnsHostnameToComputerNameA (
        LPCSTR Hostname,
      LPSTR ComputerName,
     LPDWORD nSize
    );
__declspec(dllimport)

BOOL
__stdcall
DnsHostnameToComputerNameW (
        LPCWSTR Hostname,
      LPWSTR ComputerName,
     LPDWORD nSize
    );




#line 11858 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 11860 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
GetUserNameA (
     LPSTR lpBuffer,
     LPDWORD pcbBuffer
    );
__declspec(dllimport)
BOOL
__stdcall
GetUserNameW (
     LPWSTR lpBuffer,
     LPDWORD pcbBuffer
    );




#line 11880 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Logon Support APIs
//









#line 11894 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





#line 11900 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


#line 11903 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
LogonUserA (
            LPCSTR lpszUsername,
        LPCSTR lpszDomain,
            LPCSTR lpszPassword,
            DWORD dwLogonType,
            DWORD dwLogonProvider,
     PHANDLE phToken
    );
__declspec(dllimport)
BOOL
__stdcall
LogonUserW (
            LPCWSTR lpszUsername,
        LPCWSTR lpszDomain,
            LPCWSTR lpszPassword,
            DWORD dwLogonType,
            DWORD dwLogonProvider,
     PHANDLE phToken
    );




#line 11933 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
LogonUserExA (
                LPCSTR lpszUsername,
            LPCSTR lpszDomain,
                LPCSTR lpszPassword,
                DWORD dwLogonType,
                DWORD dwLogonProvider,
     PHANDLE phToken,
     PSID  *ppLogonSid,
     PVOID *ppProfileBuffer,
           LPDWORD pdwProfileLength,
           PQUOTA_LIMITS pQuotaLimits
    );
__declspec(dllimport)
BOOL
__stdcall
LogonUserExW (
                LPCWSTR lpszUsername,
            LPCWSTR lpszDomain,
                LPCWSTR lpszPassword,
                DWORD dwLogonType,
                DWORD dwLogonProvider,
     PHANDLE phToken,
     PSID  *ppLogonSid,
     PVOID *ppProfileBuffer,
           LPDWORD pdwProfileLength,
           PQUOTA_LIMITS pQuotaLimits
    );




#line 11969 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"





#line 11975 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
ImpersonateLoggedOnUser(
     HANDLE  hToken
    );

__declspec(dllimport)
BOOL
__stdcall
CreateProcessAsUserA (
        HANDLE hToken,
        LPCSTR lpApplicationName,
     LPSTR lpCommandLine,
        LPSECURITY_ATTRIBUTES lpProcessAttributes,
        LPSECURITY_ATTRIBUTES lpThreadAttributes,
            BOOL bInheritHandles,
            DWORD dwCreationFlags,
        LPVOID lpEnvironment,
        LPCSTR lpCurrentDirectory,
            LPSTARTUPINFOA lpStartupInfo,
           LPPROCESS_INFORMATION lpProcessInformation
    );
__declspec(dllimport)
BOOL
__stdcall
CreateProcessAsUserW (
        HANDLE hToken,
        LPCWSTR lpApplicationName,
     LPWSTR lpCommandLine,
        LPSECURITY_ATTRIBUTES lpProcessAttributes,
        LPSECURITY_ATTRIBUTES lpThreadAttributes,
            BOOL bInheritHandles,
            DWORD dwCreationFlags,
        LPVOID lpEnvironment,
        LPCWSTR lpCurrentDirectory,
            LPSTARTUPINFOW lpStartupInfo,
           LPPROCESS_INFORMATION lpProcessInformation
    );




#line 12020 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




//
// LogonFlags
//




__declspec(dllimport)
BOOL
__stdcall
CreateProcessWithLogonW(
            LPCWSTR lpUsername,
        LPCWSTR lpDomain,
            LPCWSTR lpPassword,
            DWORD dwLogonFlags,
        LPCWSTR lpApplicationName,
     LPWSTR lpCommandLine,
            DWORD dwCreationFlags,
        LPVOID lpEnvironment,
        LPCWSTR lpCurrentDirectory,
            LPSTARTUPINFOW lpStartupInfo,
           LPPROCESS_INFORMATION lpProcessInformation
      );

__declspec(dllimport)
BOOL
__stdcall
CreateProcessWithTokenW(
            HANDLE hToken,
            DWORD dwLogonFlags,
        LPCWSTR lpApplicationName,
     LPWSTR lpCommandLine,
            DWORD dwCreationFlags,
        LPVOID lpEnvironment,
        LPCWSTR lpCurrentDirectory,
            LPSTARTUPINFOW lpStartupInfo,
           LPPROCESS_INFORMATION lpProcessInformation
      );

#line 12064 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
ImpersonateAnonymousToken(
     HANDLE ThreadHandle
    );

__declspec(dllimport)
BOOL
__stdcall
DuplicateTokenEx(
            HANDLE hExistingToken,
            DWORD dwDesiredAccess,
        LPSECURITY_ATTRIBUTES lpTokenAttributes,
            SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
            TOKEN_TYPE TokenType,
     PHANDLE phNewToken);

__declspec(dllimport)
BOOL
__stdcall
CreateRestrictedToken(
            HANDLE ExistingTokenHandle,
            DWORD Flags,
            DWORD DisableSidCount,
     PSID_AND_ATTRIBUTES SidsToDisable,
            DWORD DeletePrivilegeCount,
     PLUID_AND_ATTRIBUTES PrivilegesToDelete,
            DWORD RestrictedSidCount,
     PSID_AND_ATTRIBUTES SidsToRestrict,
     PHANDLE NewTokenHandle
    );


__declspec(dllimport)
BOOL
__stdcall
IsTokenRestricted(
     HANDLE TokenHandle
    );

__declspec(dllimport)
BOOL
__stdcall
IsTokenUntrusted(
     HANDLE TokenHandle
    );

__declspec(dllimport)
BOOL
__stdcall
CheckTokenMembership(
     HANDLE TokenHandle,
         PSID SidToCheck,
        PBOOL IsMember
    );

//
// Thread pool API's
//



typedef WAITORTIMERCALLBACKFUNC WAITORTIMERCALLBACK ;

__declspec(dllimport)
BOOL
__stdcall
RegisterWaitForSingleObject(
     PHANDLE phNewWaitObject,
            HANDLE hObject,
            WAITORTIMERCALLBACK Callback,
        PVOID Context,
            ULONG dwMilliseconds,
            ULONG dwFlags
    );

__declspec(dllimport)
HANDLE
__stdcall
RegisterWaitForSingleObjectEx(
         HANDLE hObject,
         WAITORTIMERCALLBACK Callback,
     PVOID Context,
         ULONG dwMilliseconds,
         ULONG dwFlags
    );

__declspec(dllimport)

BOOL
__stdcall
UnregisterWait(
     HANDLE WaitHandle
    );

__declspec(dllimport)

BOOL
__stdcall
UnregisterWaitEx(
         HANDLE WaitHandle,
     HANDLE CompletionEvent
    );

__declspec(dllimport)
BOOL
__stdcall
QueueUserWorkItem(
         LPTHREAD_START_ROUTINE Function,
     PVOID Context,
         ULONG Flags
    );

__declspec(dllimport)
BOOL
__stdcall
BindIoCompletionCallback (
     HANDLE FileHandle,
     LPOVERLAPPED_COMPLETION_ROUTINE Function,
     ULONG Flags
    );

__declspec(dllimport)

HANDLE
__stdcall
CreateTimerQueue(
    void
    );

__declspec(dllimport)
BOOL
__stdcall
CreateTimerQueueTimer(
     PHANDLE phNewTimer,
        HANDLE TimerQueue,
            WAITORTIMERCALLBACK Callback,
        PVOID Parameter,
            DWORD DueTime,
            DWORD Period,
            ULONG Flags
    ) ;

__declspec(dllimport)

BOOL
__stdcall
ChangeTimerQueueTimer(
     HANDLE TimerQueue,
      HANDLE Timer,
         ULONG DueTime,
         ULONG Period
    );

__declspec(dllimport)

BOOL
__stdcall
DeleteTimerQueueTimer(
     HANDLE TimerQueue,
         HANDLE Timer,
     HANDLE CompletionEvent
    );

__declspec(dllimport)

BOOL
__stdcall
DeleteTimerQueueEx(
         HANDLE TimerQueue,
     HANDLE CompletionEvent
    );

__declspec(dllimport)
HANDLE
__stdcall
SetTimerQueueTimer(
     HANDLE TimerQueue,
         WAITORTIMERCALLBACK Callback,
     PVOID Parameter,
         DWORD DueTime,
         DWORD Period,
         BOOL PreferIo
    );

__declspec(dllimport)

BOOL
__stdcall
CancelTimerQueueTimer(
     HANDLE TimerQueue,
         HANDLE Timer
    );

__declspec(dllimport)

BOOL
__stdcall
DeleteTimerQueue(
     HANDLE TimerQueue
    );



typedef void (__stdcall *PTP_WIN32_IO_CALLBACK)(
         PTP_CALLBACK_INSTANCE Instance,
     PVOID                 Context,
     PVOID                 Overlapped,
            ULONG                 IoResult,
            ULONG_PTR             NumberOfBytesTransferred,
         PTP_IO                Io
    );

__declspec(dllimport)


PTP_POOL
__stdcall
CreateThreadpool(
     PVOID reserved
    );

__declspec(dllimport)
void
__stdcall
SetThreadpoolThreadMaximum(
     PTP_POOL ptpp,
        DWORD    cthrdMost
    );

__declspec(dllimport)
BOOL
__stdcall
SetThreadpoolThreadMinimum(
     PTP_POOL ptpp,
        DWORD    cthrdMic
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpool(
     PTP_POOL ptpp
    );

__declspec(dllimport)


PTP_CLEANUP_GROUP
__stdcall
CreateThreadpoolCleanupGroup(
    void
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpoolCleanupGroupMembers(
         PTP_CLEANUP_GROUP ptpcg,
            BOOL              fCancelPendingCallbacks,
     PVOID             pvCleanupContext
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpoolCleanupGroup(
     PTP_CLEANUP_GROUP ptpcg
    );



__forceinline
void
InitializeThreadpoolEnvironment(
     PTP_CALLBACK_ENVIRON pcbe
    )
{
    TpInitializeCallbackEnviron(pcbe);
}

__forceinline
void
SetThreadpoolCallbackPool(
     PTP_CALLBACK_ENVIRON pcbe,
        PTP_POOL             ptpp
    )
{
    TpSetCallbackThreadpool(pcbe, ptpp);
}

__forceinline
void
SetThreadpoolCallbackCleanupGroup(
      PTP_CALLBACK_ENVIRON              pcbe,
         PTP_CLEANUP_GROUP                 ptpcg,
     PTP_CLEANUP_GROUP_CANCEL_CALLBACK pfng
    )
{
    TpSetCallbackCleanupGroup(pcbe, ptpcg, pfng);
}

__forceinline
void
SetThreadpoolCallbackRunsLong(
     PTP_CALLBACK_ENVIRON pcbe
    )
{
    TpSetCallbackLongFunction(pcbe);
}

__forceinline
void
SetThreadpoolCallbackLibrary(
     PTP_CALLBACK_ENVIRON pcbe,
        PVOID                mod
    )
{
    TpSetCallbackRaceWithDll(pcbe, mod);
}

__forceinline
void
DestroyThreadpoolEnvironment(
     PTP_CALLBACK_ENVIRON pcbe
    )
{
    TpDestroyCallbackEnviron(pcbe);
}

#line 12397 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
void
__stdcall
SetEventWhenCallbackReturns(
     PTP_CALLBACK_INSTANCE pci,
        HANDLE                evt
    );

__declspec(dllimport)
void
__stdcall
ReleaseSemaphoreWhenCallbackReturns(
     PTP_CALLBACK_INSTANCE pci,
        HANDLE                sem,
        DWORD                 crel
    );

__declspec(dllimport)
void
__stdcall
ReleaseMutexWhenCallbackReturns(
     PTP_CALLBACK_INSTANCE pci,
        HANDLE                mut
    );

__declspec(dllimport)
void
__stdcall
LeaveCriticalSectionWhenCallbackReturns(
     PTP_CALLBACK_INSTANCE pci,
     PCRITICAL_SECTION     pcs
    );

__declspec(dllimport)
void
__stdcall
FreeLibraryWhenCallbackReturns(
     PTP_CALLBACK_INSTANCE pci,
        HMODULE               mod
    );

__declspec(dllimport)
BOOL
__stdcall
CallbackMayRunLong(
     PTP_CALLBACK_INSTANCE pci
    );

__declspec(dllimport)
void
__stdcall
DisassociateCurrentThreadFromCallback(
     PTP_CALLBACK_INSTANCE pci
    );

__declspec(dllimport)

BOOL
__stdcall
TrySubmitThreadpoolCallback(
            PTP_SIMPLE_CALLBACK  pfns,
     PVOID                pv,
        PTP_CALLBACK_ENVIRON pcbe
    );

__declspec(dllimport)


PTP_WORK
__stdcall
CreateThreadpoolWork(
            PTP_WORK_CALLBACK    pfnwk,
     PVOID                pv,
        PTP_CALLBACK_ENVIRON pcbe
    );

__declspec(dllimport)
void
__stdcall
SubmitThreadpoolWork(
     PTP_WORK pwk
    );

__declspec(dllimport)
void
__stdcall
WaitForThreadpoolWorkCallbacks(
     PTP_WORK pwk,
        BOOL     fCancelPendingCallbacks
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpoolWork(
     PTP_WORK pwk
    );

__declspec(dllimport)


PTP_TIMER
__stdcall
CreateThreadpoolTimer(
            PTP_TIMER_CALLBACK   pfnti,
     PVOID                pv,
        PTP_CALLBACK_ENVIRON pcbe
    );

__declspec(dllimport)
void
__stdcall
SetThreadpoolTimer(
      PTP_TIMER pti,
     PFILETIME pftDueTime,
         DWORD     msPeriod,
     DWORD     msWindowLength
    );

__declspec(dllimport)
BOOL
__stdcall
IsThreadpoolTimerSet(
     PTP_TIMER pti
    );

__declspec(dllimport)
void
__stdcall
WaitForThreadpoolTimerCallbacks(
     PTP_TIMER pti,
        BOOL      fCancelPendingCallbacks
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpoolTimer(
     PTP_TIMER pti
    );

__declspec(dllimport)


PTP_WAIT
__stdcall
CreateThreadpoolWait(
            PTP_WAIT_CALLBACK    pfnwa,
     PVOID                pv,
        PTP_CALLBACK_ENVIRON pcbe
    );

__declspec(dllimport)
void
__stdcall
SetThreadpoolWait(
      PTP_WAIT  pwa,
     HANDLE    h,
     PFILETIME pftTimeout
    );

__declspec(dllimport)
void
__stdcall
WaitForThreadpoolWaitCallbacks(
     PTP_WAIT pwa,
        BOOL     fCancelPendingCallbacks
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpoolWait(
     PTP_WAIT pwa
    );

__declspec(dllimport)


PTP_IO
__stdcall
CreateThreadpoolIo(
            HANDLE                fl,
            PTP_WIN32_IO_CALLBACK pfnio,
     PVOID                 pv,
        PTP_CALLBACK_ENVIRON  pcbe
    );

__declspec(dllimport)
void
__stdcall
StartThreadpoolIo(
     PTP_IO pio
    );

__declspec(dllimport)
void
__stdcall
CancelThreadpoolIo(
     PTP_IO pio
    );

__declspec(dllimport)
void
__stdcall
WaitForThreadpoolIoCallbacks(
     PTP_IO pio,
        BOOL   fCancelPendingCallbacks
    );

__declspec(dllimport)
void
__stdcall
CloseThreadpoolIo(
     PTP_IO pio
    );

//
//  Private Namespaces support
//

__declspec(dllimport)

HANDLE
__stdcall
CreatePrivateNamespaceA(
     LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes,
         LPVOID lpBoundaryDescriptor,
         LPCSTR lpAliasPrefix
    );
__declspec(dllimport)

HANDLE
__stdcall
CreatePrivateNamespaceW(
     LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes,
         LPVOID lpBoundaryDescriptor,
         LPCWSTR lpAliasPrefix
    );




#line 12642 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)

HANDLE
__stdcall
OpenPrivateNamespaceA(
         LPVOID lpBoundaryDescriptor,
         LPCSTR lpAliasPrefix
    );
__declspec(dllimport)

HANDLE
__stdcall
OpenPrivateNamespaceW(
         LPVOID lpBoundaryDescriptor,
         LPCWSTR lpAliasPrefix
    );




#line 12664 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"




__declspec(dllimport)
BOOLEAN
__stdcall
ClosePrivateNamespace(
     HANDLE Handle,
     ULONG Flags
    );


//
//  Boundary descriptors support
//


HANDLE
__stdcall
CreateBoundaryDescriptorA(
     LPCSTR Name,
     ULONG Flags
    );

HANDLE
__stdcall
CreateBoundaryDescriptorW(
     LPCWSTR Name,
     ULONG Flags
    );




#line 12700 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

__declspec(dllimport)
BOOL
__stdcall
AddSIDToBoundaryDescriptor(
     HANDLE * BoundaryDescriptor,
     PSID RequiredSid
    );


__declspec(dllimport)
void
__stdcall
DeleteBoundaryDescriptor(
     HANDLE BoundaryDescriptor
    );


#line 12719 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

#line 12721 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



//
// Plug-and-Play API's
//










typedef struct tagHW_PROFILE_INFOA {
    DWORD  dwDockInfo;
    CHAR   szHwProfileGuid[39];
    CHAR   szHwProfileName[80];
} HW_PROFILE_INFOA, *LPHW_PROFILE_INFOA;
typedef struct tagHW_PROFILE_INFOW {
    DWORD  dwDockInfo;
    WCHAR  szHwProfileGuid[39];
    WCHAR  szHwProfileName[80];
} HW_PROFILE_INFOW, *LPHW_PROFILE_INFOW;

typedef HW_PROFILE_INFOW HW_PROFILE_INFO;
typedef LPHW_PROFILE_INFOW LPHW_PROFILE_INFO;



#line 12754 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"


__declspec(dllimport)
BOOL
__stdcall
GetCurrentHwProfileA (
     LPHW_PROFILE_INFOA  lpHwProfileInfo
    );
__declspec(dllimport)
BOOL
__stdcall
GetCurrentHwProfileW (
     LPHW_PROFILE_INFOW  lpHwProfileInfo
    );




#line 12773 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"
#line 12774 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

//
// Performance counter API's
//

__declspec(dllimport)
BOOL
__stdcall
QueryPerformanceCounter(
     LARGE_INTEGER *lpPerformanceCount
    );

__declspec(dllimport)
BOOL
__stdcall
QueryPerformanceFrequency(
     LARGE_INTEGER *lpFrequency
    );



__declspec(dllimport)
BOOL
__stdcall
GetVersionExA(
     LPOSVERSIONINFOA lpVersionInformation
    );
__declspec(dllimport)
BOOL
__stdcall
GetVersionExW(
     LPOSVERSIONINFOW lpVersionInformation
    );




#line 12812 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
VerifyVersionInfoA(
     LPOSVERSIONINFOEXA lpVersionInformation,
        DWORD dwTypeMask,
        DWORDLONG dwlConditionMask
    );
__declspec(dllimport)
BOOL
__stdcall
VerifyVersionInfoW(
     LPOSVERSIONINFOEXW lpVersionInformation,
        DWORD dwTypeMask,
        DWORDLONG dwlConditionMask
    );




#line 12836 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"



__declspec(dllimport)
BOOL
__stdcall
GetProductInfo(
      DWORD  dwOSMajorVersion,
      DWORD  dwOSMinorVersion,
      DWORD  dwSpMajorVersion,
      DWORD  dwSpMinorVersion,
     PDWORD pdwReturnedProductType
    );

#line 12851 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winbase.h"

// DOS and OS/2 Compatible Error Code definitions returned by the Win32 Base
// API functions.
//

#line 1 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winerror.h"
/************************************************************************
*                                                                       *
*   winerror.h --  error code definitions for the Win32 API functions   *
*                                                                       *
*   Copyright (c) Microsoft Corp.  All rights reserved.                 *
*                                                                       *
************************************************************************/





#pragma once
#line 15 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winerror.h"











//
//  Values are 32 bit values laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//















































//
// Define the severity codes
//


//
// MessageId: ERROR_SUCCESS
//
// MessageText:
//
// The operation completed successfully.
//





//
// MessageId: ERROR_INVALID_FUNCTION
//
// MessageText:
//
// Incorrect function.
//


//
// MessageId: ERROR_FILE_NOT_FOUND
//
// MessageText:
//
// The system cannot find the file specified.
//


//
// MessageId: ERROR_PATH_NOT_FOUND
//
// MessageText:
//
// The system cannot find the path specified.
//


//
// MessageId: ERROR_TOO_MANY_OPEN_FILES
//
// MessageText:
//
// The system cannot open the file.
//


//
// MessageId: ERROR_ACCESS_DENIED
//
// MessageText:
//
// Access is denied.
//


//
// MessageId: ERROR_INVALID_HANDLE
//
// MessageText:
//
// The handle is invalid.
//


//
// MessageId: ERROR_ARENA_TRASHED
//
// MessageText:
//
// The storage control blocks were destroyed.
//


//
// MessageId: ERROR_NOT_ENOUGH_MEMORY
//
// MessageText:
//
// Not enough storage is available to process this command.
//


//
// MessageId: ERROR_INVALID_BLOCK
//
// MessageText:
//
// The storage control block address is invalid.
//


//
// MessageId: ERROR_BAD_ENVIRONMENT
//
// MessageText:
//
// The environment is incorrect.
//


//
// MessageId: ERROR_BAD_FORMAT
//
// MessageText:
//
// An attempt was made to load a program with an incorrect format.
//


//
// MessageId: ERROR_INVALID_ACCESS
//
// MessageText:
//
// The access code is invalid.
//


//
// MessageId: ERROR_INVALID_DATA
//
// MessageText:
//
// The data is invalid.
//


//
// MessageId: ERROR_OUTOFMEMORY
//
// MessageText:
//
// Not enough storage is available to complete this operation.
//


//
// MessageId: ERROR_INVALID_DRIVE
//
// MessageText:
//
// The system cannot find the drive specified.
//


//
// MessageId: ERROR_CURRENT_DIRECTORY
//
// MessageText:
//
// The directory cannot be removed.
//


//
// MessageId: ERROR_NOT_SAME_DEVICE
//
// MessageText:
//
// The system cannot move the file to a different disk drive.
//


//
// MessageId: ERROR_NO_MORE_FILES
//
// MessageText:
//
// There are no more files.
//


//
// MessageId: ERROR_WRITE_PROTECT
//
// MessageText:
//
// The media is write protected.
//


//
// MessageId: ERROR_BAD_UNIT
//
// MessageText:
//
// The system cannot find the device specified.
//


//
// MessageId: ERROR_NOT_READY
//
// MessageText:
//
// The device is not ready.
//


//
// MessageId: ERROR_BAD_COMMAND
//
// MessageText:
//
// The device does not recognize the command.
//


//
// MessageId: ERROR_CRC
//
// MessageText:
//
// Data error (cyclic redundancy check).
//


//
// MessageId: ERROR_BAD_LENGTH
//
// MessageText:
//
// The program issued a command but the command length is incorrect.
//


//
// MessageId: ERROR_SEEK
//
// MessageText:
//
// The drive cannot locate a specific area or track on the disk.
//


//
// MessageId: ERROR_NOT_DOS_DISK
//
// MessageText:
//
// The specified disk or diskette cannot be accessed.
//


//
// MessageId: ERROR_SECTOR_NOT_FOUND
//
// MessageText:
//
// The drive cannot find the sector requested.
//


//
// MessageId: ERROR_OUT_OF_PAPER
//
// MessageText:
//
// The printer is out of paper.
//


//
// MessageId: ERROR_WRITE_FAULT
//
// MessageText:
//
// The system cannot write to the specified device.
//


//
// MessageId: ERROR_READ_FAULT
//
// MessageText:
//
// The system cannot read from the specified device.
//


//
// MessageId: ERROR_GEN_FAILURE
//
// MessageText:
//
// A device attached to the system is not functioning.
//


//
// MessageId: ERROR_SHARING_VIOLATION
//
// MessageText:
//
// The process cannot access the file because it is being used by another process.
//


//
// MessageId: ERROR_LOCK_VIOLATION
//
// MessageText:
//
// The process cannot access the file because another process has locked a portion of the file.
//


//
// MessageId: ERROR_WRONG_DISK
//
// MessageText:
//
// The wrong diskette is in the drive.
// Insert %2 (Volume Serial Number: %3) into drive %1.
//


//
// MessageId: ERROR_SHARING_BUFFER_EXCEEDED
//
// MessageText:
//
// Too many files opened for sharing.
//


//
// MessageId: ERROR_HANDLE_EOF
//
// MessageText:
//
// Reached the end of the file.
//


//
// MessageId: ERROR_HANDLE_DISK_FULL
//
// MessageText:
//
// The disk is full.
//


//
// MessageId: ERROR_NOT_SUPPORTED
//
// MessageText:
//
// The request is not supported.
//


//
// MessageId: ERROR_REM_NOT_LIST
//
// MessageText:
//
// Windows cannot find the network path. Verify that the network path is correct and the destination computer is not busy or turned off. If Windows still cannot find the network path, contact your network administrator.
//


//
// MessageId: ERROR_DUP_NAME
//
// MessageText:
//
// You were not connected because a duplicate name exists on the network. If joining a domain, go to System in Control Panel to change the computer name and try again.  If joining a workgroup, choose another workgroup name.
//


//
// MessageId: ERROR_BAD_NETPATH
//
// MessageText:
//
// The network path was not found.
//


//
// MessageId: ERROR_NETWORK_BUSY
//
// MessageText:
//
// The network is busy.
//


//
// MessageId: ERROR_DEV_NOT_EXIST
//
// MessageText:
//
// The specified network resource or device is no longer available.
//


//
// MessageId: ERROR_TOO_MANY_CMDS
//
// MessageText:
//
// The network BIOS command limit has been reached.
//


//
// MessageId: ERROR_ADAP_HDW_ERR
//
// MessageText:
//
// A network adapter hardware error occurred.
//


//
// MessageId: ERROR_BAD_NET_RESP
//
// MessageText:
//
// The specified server cannot perform the requested operation.
//


//
// MessageId: ERROR_UNEXP_NET_ERR
//
// MessageText:
//
// An unexpected network error occurred.
//


//
// MessageId: ERROR_BAD_REM_ADAP
//
// MessageText:
//
// The remote adapter is not compatible.
//


//
// MessageId: ERROR_PRINTQ_FULL
//
// MessageText:
//
// The printer queue is full.
//


//
// MessageId: ERROR_NO_SPOOL_SPACE
//
// MessageText:
//
// Space to store the file waiting to be printed is not available on the server.
//


//
// MessageId: ERROR_PRINT_CANCELLED
//
// MessageText:
//
// Your file waiting to be printed was deleted.
//


//
// MessageId: ERROR_NETNAME_DELETED
//
// MessageText:
//
// The specified network name is no longer available.
//


//
// MessageId: ERROR_NETWORK_ACCESS_DENIED
//
// MessageText:
//
// Network access is denied.
//


//
// MessageId: ERROR_BAD_DEV_TYPE
//
// MessageText:
//
// The network resource type is not correct.
//


//
// MessageId: ERROR_BAD_NET_NAME
//
// MessageText:
//
// The network name cannot be found.
//


//
// MessageId: ERROR_TOO_MANY_NAMES
//
// MessageText:
//
// The name limit for the local computer network adapter card was exceeded.
//


//
// MessageId: ERROR_TOO_MANY_SESS
//
// MessageText:
//
// The network BIOS session limit was exceeded.
//


//
// MessageId: ERROR_SHARING_PAUSED
//
// MessageText:
//
// The remote server has been paused or is in the process of being started.
//


//
// MessageId: ERROR_REQ_NOT_ACCEP
//
// MessageText:
//
// No more connections can be made to this remote computer at this time because there are already as many connections as the computer can accept.
//


//
// MessageId: ERROR_REDIR_PAUSED
//
// MessageText:
//
// The specified printer or disk device has been paused.
//


//
// MessageId: ERROR_FILE_EXISTS
//
// MessageText:
//
// The file exists.
//


//
// MessageId: ERROR_CANNOT_MAKE
//
// MessageText:
//
// The directory or file cannot be created.
//


//
// MessageId: ERROR_FAIL_I24
//
// MessageText:
//
// Fail on INT 24.
//


//
// MessageId: ERROR_OUT_OF_STRUCTURES
//
// MessageText:
//
// Storage to process this request is not available.
//


//
// MessageId: ERROR_ALREADY_ASSIGNED
//
// MessageText:
//
// The local device name is already in use.
//


//
// MessageId: ERROR_INVALID_PASSWORD
//
// MessageText:
//
// The specified network password is not correct.
//


//
// MessageId: ERROR_INVALID_PARAMETER
//
// MessageText:
//
// The parameter is incorrect.
//


//
// MessageId: ERROR_NET_WRITE_FAULT
//
// MessageText:
//
// A write fault occurred on the network.
//


//
// MessageId: ERROR_NO_PROC_SLOTS
//
// MessageText:
//
// The system cannot start another process at this time.
//


//
// MessageId: ERROR_TOO_MANY_SEMAPHORES
//
// MessageText:
//
// Cannot create another system semaphore.
//


//
// MessageId: ERROR_EXCL_SEM_ALREADY_OWNED
//
// MessageText:
//
// The exclusive semaphore is owned by another process.
//


//
// MessageId: ERROR_SEM_IS_SET
//
// MessageText:
//
// The semaphore is set and cannot be closed.
//


//
// MessageId: ERROR_TOO_MANY_SEM_REQUESTS
//
// MessageText:
//
// The semaphore cannot be set again.
//


//
// MessageId: ERROR_INVALID_AT_INTERRUPT_TIME
//
// MessageText:
//
// Cannot request exclusive semaphores at interrupt time.
//


//
// MessageId: ERROR_SEM_OWNER_DIED
//
// MessageText:
//
// The previous ownership of this semaphore has ended.
//


//
// MessageId: ERROR_SEM_USER_LIMIT
//
// MessageText:
//
// Insert the diskette for drive %1.
//


//
// MessageId: ERROR_DISK_CHANGE
//
// MessageText:
//
// The program stopped because an alternate diskette was not inserted.
//


//
// MessageId: ERROR_DRIVE_LOCKED
//
// MessageText:
//
// The disk is in use or locked by another process.
//


//
// MessageId: ERROR_BROKEN_PIPE
//
// MessageText:
//
// The pipe has been ended.
//


//
// MessageId: ERROR_OPEN_FAILED
//
// MessageText:
//
// The system cannot open the device or file specified.
//


//
// MessageId: ERROR_BUFFER_OVERFLOW
//
// MessageText:
//
// The file name is too long.
//


//
// MessageId: ERROR_DISK_FULL
//
// MessageText:
//
// There is not enough space on the disk.
//


//
// MessageId: ERROR_NO_MORE_SEARCH_HANDLES
//
// MessageText:
//
// No more internal file identifiers available.
//


//
// MessageId: ERROR_INVALID_TARGET_HANDLE
//
// MessageText:
//
// The target internal file identifier is incorrect.
//


//
// MessageId: ERROR_INVALID_CATEGORY
//
// MessageText:
//
// The IOCTL call made by the application program is not correct.
//


//
// MessageId: ERROR_INVALID_VERIFY_SWITCH
//
// MessageText:
//
// The verify-on-write switch parameter value is not correct.
//


//
// MessageId: ERROR_BAD_DRIVER_LEVEL
//
// MessageText:
//
// The system does not support the command requested.
//


//
// MessageId: ERROR_CALL_NOT_IMPLEMENTED
//
// MessageText:
//
// This function is not supported on this system.
//


//
// MessageId: ERROR_SEM_TIMEOUT
//
// MessageText:
//
// The semaphore timeout period has expired.
//


//
// MessageId: ERROR_INSUFFICIENT_BUFFER
//
// MessageText:
//
// The data area passed to a system call is too small.
//


//
// MessageId: ERROR_INVALID_NAME
//
// MessageText:
//
// The filename, directory name, or volume label syntax is incorrect.
//


//
// MessageId: ERROR_INVALID_LEVEL
//
// MessageText:
//
// The system call level is not correct.
//


//
// MessageId: ERROR_NO_VOLUME_LABEL
//
// MessageText:
//
// The disk has no volume label.
//


//
// MessageId: ERROR_MOD_NOT_FOUND
//
// MessageText:
//
// The specified module could not be found.
//


//
// MessageId: ERROR_PROC_NOT_FOUND
//
// MessageText:
//
// The specified procedure could not be found.
//


//
// MessageId: ERROR_WAIT_NO_CHILDREN
//
// MessageText:
//
// There are no child processes to wait for.
//


//
// MessageId: ERROR_CHILD_NOT_COMPLETE
//
// MessageText:
//
// The %1 application cannot be run in Win32 mode.
//


//
// MessageId: ERROR_DIRECT_ACCESS_HANDLE
//
// MessageText:
//
// Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.
//


//
// MessageId: ERROR_NEGATIVE_SEEK
//
// MessageText:
//
// An attempt was made to move the file pointer before the beginning of the file.
//


//
// MessageId: ERROR_SEEK_ON_DEVICE
//
// MessageText:
//
// The file pointer cannot be set on the specified device or file.
//


//
// MessageId: ERROR_IS_JOIN_TARGET
//
// MessageText:
//
// A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.
//


//
// MessageId: ERROR_IS_JOINED
//
// MessageText:
//
// An attempt was made to use a JOIN or SUBST command on a drive that has already been joined.
//


//
// MessageId: ERROR_IS_SUBSTED
//
// MessageText:
//
// An attempt was made to use a JOIN or SUBST command on a drive that has already been substituted.
//


//
// MessageId: ERROR_NOT_JOINED
//
// MessageText:
//
// The system tried to delete the JOIN of a drive that is not joined.
//


//
// MessageId: ERROR_NOT_SUBSTED
//
// MessageText:
//
// The system tried to delete the substitution of a drive that is not substituted.
//


//
// MessageId: ERROR_JOIN_TO_JOIN
//
// MessageText:
//
// The system tried to join a drive to a directory on a joined drive.
//


//
// MessageId: ERROR_SUBST_TO_SUBST
//
// MessageText:
//
// The system tried to substitute a drive to a directory on a substituted drive.
//


//
// MessageId: ERROR_JOIN_TO_SUBST
//
// MessageText:
//
// The system tried to join a drive to a directory on a substituted drive.
//


//
// MessageId: ERROR_SUBST_TO_JOIN
//
// MessageText:
//
// The system tried to SUBST a drive to a directory on a joined drive.
//


//
// MessageId: ERROR_BUSY_DRIVE
//
// MessageText:
//
// The system cannot perform a JOIN or SUBST at this time.
//


//
// MessageId: ERROR_SAME_DRIVE
//
// MessageText:
//
// The system cannot join or substitute a drive to or for a directory on the same drive.
//


//
// MessageId: ERROR_DIR_NOT_ROOT
//
// MessageText:
//
// The directory is not a subdirectory of the root directory.
//


//
// MessageId: ERROR_DIR_NOT_EMPTY
//
// MessageText:
//
// The directory is not empty.
//


//
// MessageId: ERROR_IS_SUBST_PATH
//
// MessageText:
//
// The path specified is being used in a substitute.
//


//
// MessageId: ERROR_IS_JOIN_PATH
//
// MessageText:
//
// Not enough resources are available to process this command.
//


//
// MessageId: ERROR_PATH_BUSY
//
// MessageText:
//
// The path specified cannot be used at this time.
//


//
// MessageId: ERROR_IS_SUBST_TARGET
//
// MessageText:
//
// An attempt was made to join or substitute a drive for which a directory on the drive is the target of a previous substitute.
//


//
// MessageId: ERROR_SYSTEM_TRACE
//
// MessageText:
//
// System trace information was not specified in your CONFIG.SYS file, or tracing is disallowed.
//


//
// MessageId: ERROR_INVALID_EVENT_COUNT
//
// MessageText:
//
// The number of specified semaphore events for DosMuxSemWait is not correct.
//


//
// MessageId: ERROR_TOO_MANY_MUXWAITERS
//
// MessageText:
//
// DosMuxSemWait did not execute; too many semaphores are already set.
//


//
// MessageId: ERROR_INVALID_LIST_FORMAT
//
// MessageText:
//
// The DosMuxSemWait list is not correct.
//


//
// MessageId: ERROR_LABEL_TOO_LONG
//
// MessageText:
//
// The volume label you entered exceeds the label character limit of the target file system.
//


//
// MessageId: ERROR_TOO_MANY_TCBS
//
// MessageText:
//
// Cannot create another thread.
//


//
// MessageId: ERROR_SIGNAL_REFUSED
//
// MessageText:
//
// The recipient process has refused the signal.
//


//
// MessageId: ERROR_DISCARDED
//
// MessageText:
//
// The segment is already discarded and cannot be locked.
//


//
// MessageId: ERROR_NOT_LOCKED
//
// MessageText:
//
// The segment is already unlocked.
//


//
// MessageId: ERROR_BAD_THREADID_ADDR
//
// MessageText:
//
// The address for the thread ID is not correct.
//


//
// MessageId: ERROR_BAD_ARGUMENTS
//
// MessageText:
//
// One or more arguments are not correct.
//


//
// MessageId: ERROR_BAD_PATHNAME
//
// MessageText:
//
// The specified path is invalid.
//


//
// MessageId: ERROR_SIGNAL_PENDING
//
// MessageText:
//
// A signal is already pending.
//


//
// MessageId: ERROR_MAX_THRDS_REACHED
//
// MessageText:
//
// No more threads can be created in the system.
//


//
// MessageId: ERROR_LOCK_FAILED
//
// MessageText:
//
// Unable to lock a region of a file.
//


//
// MessageId: ERROR_BUSY
//
// MessageText:
//
// The requested resource is in use.
//


//
// MessageId: ERROR_CANCEL_VIOLATION
//
// MessageText:
//
// A lock request was not outstanding for the supplied cancel region.
//


//
// MessageId: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED
//
// MessageText:
//
// The file system does not support atomic changes to the lock type.
//


//
// MessageId: ERROR_INVALID_SEGMENT_NUMBER
//
// MessageText:
//
// The system detected a segment number that was not correct.
//


//
// MessageId: ERROR_INVALID_ORDINAL
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_ALREADY_EXISTS
//
// MessageText:
//
// Cannot create a file when that file already exists.
//


//
// MessageId: ERROR_INVALID_FLAG_NUMBER
//
// MessageText:
//
// The flag passed is not correct.
//


//
// MessageId: ERROR_SEM_NOT_FOUND
//
// MessageText:
//
// The specified system semaphore name was not found.
//


//
// MessageId: ERROR_INVALID_STARTING_CODESEG
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_INVALID_STACKSEG
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_INVALID_MODULETYPE
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_INVALID_EXE_SIGNATURE
//
// MessageText:
//
// Cannot run %1 in Win32 mode.
//


//
// MessageId: ERROR_EXE_MARKED_INVALID
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_BAD_EXE_FORMAT
//
// MessageText:
//
// %1 is not a valid Win32 application.
//


//
// MessageId: ERROR_ITERATED_DATA_EXCEEDS_64k
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_INVALID_MINALLOCSIZE
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_DYNLINK_FROM_INVALID_RING
//
// MessageText:
//
// The operating system cannot run this application program.
//


//
// MessageId: ERROR_IOPL_NOT_ENABLED
//
// MessageText:
//
// The operating system is not presently configured to run this application.
//


//
// MessageId: ERROR_INVALID_SEGDPL
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_AUTODATASEG_EXCEEDS_64k
//
// MessageText:
//
// The operating system cannot run this application program.
//


//
// MessageId: ERROR_RING2SEG_MUST_BE_MOVABLE
//
// MessageText:
//
// The code segment cannot be greater than or equal to 64K.
//


//
// MessageId: ERROR_RELOC_CHAIN_XEEDS_SEGLIM
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_INFLOOP_IN_RELOC_CHAIN
//
// MessageText:
//
// The operating system cannot run %1.
//


//
// MessageId: ERROR_ENVVAR_NOT_FOUND
//
// MessageText:
//
// The system could not find the environment option that was entered.
//


//
// MessageId: ERROR_NO_SIGNAL_SENT
//
// MessageText:
//
// No process in the command subtree has a signal handler.
//


//
// MessageId: ERROR_FILENAME_EXCED_RANGE
//
// MessageText:
//
// The filename or extension is too long.
//


//
// MessageId: ERROR_RING2_STACK_IN_USE
//
// MessageText:
//
// The ring 2 stack is in use.
//


//
// MessageId: ERROR_META_EXPANSION_TOO_LONG
//
// MessageText:
//
// The global filename characters, * or ?, are entered incorrectly or too many global filename characters are specified.
//


//
// MessageId: ERROR_INVALID_SIGNAL_NUMBER
//
// MessageText:
//
// The signal being posted is not correct.
//


//
// MessageId: ERROR_THREAD_1_INACTIVE
//
// MessageText:
//
// The signal handler cannot be set.
//


//
// MessageId: ERROR_LOCKED
//
// MessageText:
//
// The segment is locked and cannot be reallocated.
//


//
// MessageId: ERROR_TOO_MANY_MODULES
//
// MessageText:
//
// Too many dynamic-link modules are attached to this program or dynamic-link module.
//


//
// MessageId: ERROR_NESTING_NOT_ALLOWED
//
// MessageText:
//
// Cannot nest calls to LoadModule.
//


//
// MessageId: ERROR_EXE_MACHINE_TYPE_MISMATCH
//
// MessageText:
//
// This version of %1 is not compatible with the version of Windows you're running. Check your computer's system information to see whether you need a x86 (32-bit) or x64 (64-bit) version of the program, and then contact the software publisher.
//


//
// MessageId: ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY
//
// MessageText:
//
// The image file %1 is signed, unable to modify.
//


//
// MessageId: ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY
//
// MessageText:
//
// The image file %1 is strong signed, unable to modify.
//


//
// MessageId: ERROR_FILE_CHECKED_OUT
//
// MessageText:
//
// This file is checked out or locked for editing by another user.
//


//
// MessageId: ERROR_CHECKOUT_REQUIRED
//
// MessageText:
//
// The file must be checked out before saving changes.
//


//
// MessageId: ERROR_BAD_FILE_TYPE
//
// MessageText:
//
// The file type being saved or retrieved has been blocked.
//


//
// MessageId: ERROR_FILE_TOO_LARGE
//
// MessageText:
//
// The file size exceeds the limit allowed and cannot be saved.
//


//
// MessageId: ERROR_FORMS_AUTH_REQUIRED
//
// MessageText:
//
// Access Denied. Before opening files in this location, you must first browse to the web site and select the option to login automatically.
//


//
// MessageId: ERROR_VIRUS_INFECTED
//
// MessageText:
//
// Operation did not complete successfully because the file contains a virus.
//


//
// MessageId: ERROR_VIRUS_DELETED
//
// MessageText:
//
// This file contains a virus and cannot be opened. Due to the nature of this virus, the file has been removed from this location.
//


//
// MessageId: ERROR_PIPE_LOCAL
//
// MessageText:
//
// The pipe is local.
//


//
// MessageId: ERROR_BAD_PIPE
//
// MessageText:
//
// The pipe state is invalid.
//


//
// MessageId: ERROR_PIPE_BUSY
//
// MessageText:
//
// All pipe instances are busy.
//


//
// MessageId: ERROR_NO_DATA
//
// MessageText:
//
// The pipe is being closed.
//


//
// MessageId: ERROR_PIPE_NOT_CONNECTED
//
// MessageText:
//
// No process is on the other end of the pipe.
//


//
// MessageId: ERROR_MORE_DATA
//
// MessageText:
//
// More data is available.
//


//
// MessageId: ERROR_VC_DISCONNECTED
//
// MessageText:
//
// The session was canceled.
//


//
// MessageId: ERROR_INVALID_EA_NAME
//
// MessageText:
//
// The specified extended attribute name was invalid.
//


//
// MessageId: ERROR_EA_LIST_INCONSISTENT
//
// MessageText:
//
// The extended attributes are inconsistent.
//


//
// MessageId: WAIT_TIMEOUT
//
// MessageText:
//
// The wait operation timed out.
//


//
// MessageId: ERROR_NO_MORE_ITEMS
//
// MessageText:
//
// No more data is available.
//


//
// MessageId: ERROR_CANNOT_COPY
//
// MessageText:
//
// The copy functions cannot be used.
//


//
// MessageId: ERROR_DIRECTORY
//
// MessageText:
//
// The directory name is invalid.
//


//
// MessageId: ERROR_EAS_DIDNT_FIT
//
// MessageText:
//
// The extended attributes did not fit in the buffer.
//


//
// MessageId: ERROR_EA_FILE_CORRUPT
//
// MessageText:
//
// The extended attribute file on the mounted file system is corrupt.
//


//
// MessageId: ERROR_EA_TABLE_FULL
//
// MessageText:
//
// The extended attribute table file is full.
//


//
// MessageId: ERROR_INVALID_EA_HANDLE
//
// MessageText:
//
// The specified extended attribute handle is invalid.
//


//
// MessageId: ERROR_EAS_NOT_SUPPORTED
//
// MessageText:
//
// The mounted file system does not support extended attributes.
//


//
// MessageId: ERROR_NOT_OWNER
//
// MessageText:
//
// Attempt to release mutex not owned by caller.
//


//
// MessageId: ERROR_TOO_MANY_POSTS
//
// MessageText:
//
// Too many posts were made to a semaphore.
//


//
// MessageId: ERROR_PARTIAL_COPY
//
// MessageText:
//
// Only part of a ReadProcessMemory or WriteProcessMemory request was completed.
//


//
// MessageId: ERROR_OPLOCK_NOT_GRANTED
//
// MessageText:
//
// The oplock request is denied.
//


//
// MessageId: ERROR_INVALID_OPLOCK_PROTOCOL
//
// MessageText:
//
// An invalid oplock acknowledgment was received by the system.
//


//
// MessageId: ERROR_DISK_TOO_FRAGMENTED
//
// MessageText:
//
// The volume is too fragmented to complete this operation.
//


//
// MessageId: ERROR_DELETE_PENDING
//
// MessageText:
//
// The file cannot be opened because it is in the process of being deleted.
//


//
// MessageId: ERROR_MR_MID_NOT_FOUND
//
// MessageText:
//
// The system cannot find message text for message number 0x%1 in the message file for %2.
//


//
// MessageId: ERROR_SCOPE_NOT_FOUND
//
// MessageText:
//
// The scope specified was not found.
//


//
// MessageId: ERROR_FAIL_NOACTION_REBOOT
//
// MessageText:
//
// No action was taken as a system reboot is required.
//


//
// MessageId: ERROR_FAIL_SHUTDOWN
//
// MessageText:
//
// The shutdown operation failed.
//


//
// MessageId: ERROR_FAIL_RESTART
//
// MessageText:
//
// The restart operation failed.
//


//
// MessageId: ERROR_MAX_SESSIONS_REACHED
//
// MessageText:
//
// The maximum number of sessions has been reached.
//


//
// MessageId: ERROR_THREAD_MODE_ALREADY_BACKGROUND
//
// MessageText:
//
// The thread is already in background processing mode.
//


//
// MessageId: ERROR_THREAD_MODE_NOT_BACKGROUND
//
// MessageText:
//
// The thread is not in background processing mode.
//


//
// MessageId: ERROR_PROCESS_MODE_ALREADY_BACKGROUND
//
// MessageText:
//
// The process is already in background processing mode.
//


//
// MessageId: ERROR_PROCESS_MODE_NOT_BACKGROUND
//
// MessageText:
//
// The process is not in background processing mode.
//


//
// MessageId: ERROR_INVALID_ADDRESS
//
// MessageText:
//
// Attempt to access invalid address.
//


//
// MessageId: ERROR_USER_PROFILE_LOAD
//
// MessageText:
//
// User profile cannot be loaded.
//


//
// MessageId: ERROR_ARITHMETIC_OVERFLOW
//
// MessageText:
//
// Arithmetic result exceeded 32 bits.
//


//
// MessageId: ERROR_PIPE_CONNECTED
//
// MessageText:
//
// There is a process on other end of the pipe.
//


//
// MessageId: ERROR_PIPE_LISTENING
//
// MessageText:
//
// Waiting for a process to open the other end of the pipe.
//


//
// MessageId: ERROR_VERIFIER_STOP
//
// MessageText:
//
// Application verifier has found an error in the current process.
//


//
// MessageId: ERROR_ABIOS_ERROR
//
// MessageText:
//
// An error occurred in the ABIOS subsystem.
//


//
// MessageId: ERROR_WX86_WARNING
//
// MessageText:
//
// A warning occurred in the WX86 subsystem.
//


//
// MessageId: ERROR_WX86_ERROR
//
// MessageText:
//
// An error occurred in the WX86 subsystem.
//


//
// MessageId: ERROR_TIMER_NOT_CANCELED
//
// MessageText:
//
// An attempt was made to cancel or set a timer that has an associated APC and the subject thread is not the thread that originally set the timer with an associated APC routine.
//


//
// MessageId: ERROR_UNWIND
//
// MessageText:
//
// Unwind exception code.
//


//
// MessageId: ERROR_BAD_STACK
//
// MessageText:
//
// An invalid or unaligned stack was encountered during an unwind operation.
//


//
// MessageId: ERROR_INVALID_UNWIND_TARGET
//
// MessageText:
//
// An invalid unwind target was encountered during an unwind operation.
//


//
// MessageId: ERROR_INVALID_PORT_ATTRIBUTES
//
// MessageText:
//
// Invalid Object Attributes specified to NtCreatePort or invalid Port Attributes specified to NtConnectPort
//


//
// MessageId: ERROR_PORT_MESSAGE_TOO_LONG
//
// MessageText:
//
// Length of message passed to NtRequestPort or NtRequestWaitReplyPort was longer than the maximum message allowed by the port.
//


//
// MessageId: ERROR_INVALID_QUOTA_LOWER
//
// MessageText:
//
// An attempt was made to lower a quota limit below the current usage.
//


//
// MessageId: ERROR_DEVICE_ALREADY_ATTACHED
//
// MessageText:
//
// An attempt was made to attach to a device that was already attached to another device.
//


//
// MessageId: ERROR_INSTRUCTION_MISALIGNMENT
//
// MessageText:
//
// An attempt was made to execute an instruction at an unaligned address and the host system does not support unaligned instruction references.
//


//
// MessageId: ERROR_PROFILING_NOT_STARTED
//
// MessageText:
//
// Profiling not started.
//


//
// MessageId: ERROR_PROFILING_NOT_STOPPED
//
// MessageText:
//
// Profiling not stopped.
//


//
// MessageId: ERROR_COULD_NOT_INTERPRET
//
// MessageText:
//
// The passed ACL did not contain the minimum required information.
//


//
// MessageId: ERROR_PROFILING_AT_LIMIT
//
// MessageText:
//
// The number of active profiling objects is at the maximum and no more may be started.
//


//
// MessageId: ERROR_CANT_WAIT
//
// MessageText:
//
// Used to indicate that an operation cannot continue without blocking for I/O.
//


//
// MessageId: ERROR_CANT_TERMINATE_SELF
//
// MessageText:
//
// Indicates that a thread attempted to terminate itself by default (called NtTerminateThread with NULL) and it was the last thread in the current process.
//


//
// MessageId: ERROR_UNEXPECTED_MM_CREATE_ERR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//


//
// MessageId: ERROR_UNEXPECTED_MM_MAP_ERROR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//


//
// MessageId: ERROR_UNEXPECTED_MM_EXTEND_ERR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//


//
// MessageId: ERROR_BAD_FUNCTION_TABLE
//
// MessageText:
//
// A malformed function table was encountered during an unwind operation.
//


//
// MessageId: ERROR_NO_GUID_TRANSLATION
//
// MessageText:
//
// Indicates that an attempt was made to assign protection to a file system file or directory and one of the SIDs in the security descriptor could not be translated into a GUID that could be stored by the file system.
// This causes the protection attempt to fail, which may cause a file creation attempt to fail.
//


//
// MessageId: ERROR_INVALID_LDT_SIZE
//
// MessageText:
//
// Indicates that an attempt was made to grow an LDT by setting its size, or that the size was not an even number of selectors.
//


//
// MessageId: ERROR_INVALID_LDT_OFFSET
//
// MessageText:
//
// Indicates that the starting value for the LDT information was not an integral multiple of the selector size.
//


//
// MessageId: ERROR_INVALID_LDT_DESCRIPTOR
//
// MessageText:
//
// Indicates that the user supplied an invalid descriptor when trying to set up Ldt descriptors.
//


//
// MessageId: ERROR_TOO_MANY_THREADS
//
// MessageText:
//
// Indicates a process has too many threads to perform the requested action. For example, assignment of a primary token may only be performed when a process has zero or one threads.
//


//
// MessageId: ERROR_THREAD_NOT_IN_PROCESS
//
// MessageText:
//
// An attempt was made to operate on a thread within a specific process, but the thread specified is not in the process specified.
//


//
// MessageId: ERROR_PAGEFILE_QUOTA_EXCEEDED
//
// MessageText:
//
// Page file quota was exceeded.
//


//
// MessageId: ERROR_LOGON_SERVER_CONFLICT
//
// MessageText:
//
// The Netlogon service cannot start because another Netlogon service running in the domain conflicts with the specified role.
//


//
// MessageId: ERROR_SYNCHRONIZATION_REQUIRED
//
// MessageText:
//
// The SAM database on a Windows Server is significantly out of synchronization with the copy on the Domain Controller. A complete synchronization is required.
//


//
// MessageId: ERROR_NET_OPEN_FAILED
//
// MessageText:
//
// The NtCreateFile API failed. This error should never be returned to an application, it is a place holder for the Windows Lan Manager Redirector to use in its internal error mapping routines.
//


//
// MessageId: ERROR_IO_PRIVILEGE_FAILED
//
// MessageText:
//
// {Privilege Failed}
// The I/O permissions for the process could not be changed.
//


//
// MessageId: ERROR_CONTROL_C_EXIT
//
// MessageText:
//
// {Application Exit by CTRL+C}
// The application terminated as a result of a CTRL+C.
//


//
// MessageId: ERROR_MISSING_SYSTEMFILE
//
// MessageText:
//
// {Missing System File}
// The required system file %hs is bad or missing.
//


//
// MessageId: ERROR_UNHANDLED_EXCEPTION
//
// MessageText:
//
// {Application Error}
// The exception %s (0x%08lx) occurred in the application at location 0x%08lx.
//


//
// MessageId: ERROR_APP_INIT_FAILURE
//
// MessageText:
//
// {Application Error}
// The application failed to initialize properly (0x%lx). Click OK to terminate the application.
//


//
// MessageId: ERROR_PAGEFILE_CREATE_FAILED
//
// MessageText:
//
// {Unable to Create Paging File}
// The creation of the paging file %hs failed (%lx). The requested size was %ld.
//


//
// MessageId: ERROR_INVALID_IMAGE_HASH
//
// MessageText:
//
// Windows cannot verify the digital signature for this file. A recent hardware or software change might have installed a file that is signed incorrectly or damaged, or that might be malicious software from an unknown source.
//


//
// MessageId: ERROR_NO_PAGEFILE
//
// MessageText:
//
// {No Paging File Specified}
// No paging file was specified in the system configuration.
//


//
// MessageId: ERROR_ILLEGAL_FLOAT_CONTEXT
//
// MessageText:
//
// {EXCEPTION}
// A real-mode application issued a floating-point instruction and floating-point hardware is not present.
//


//
// MessageId: ERROR_NO_EVENT_PAIR
//
// MessageText:
//
// An event pair synchronization operation was performed using the thread specific client/server event pair object, but no event pair object was associated with the thread.
//


//
// MessageId: ERROR_DOMAIN_CTRLR_CONFIG_ERROR
//
// MessageText:
//
// A Windows Server has an incorrect configuration.
//


//
// MessageId: ERROR_ILLEGAL_CHARACTER
//
// MessageText:
//
// An illegal character was encountered. For a multi-byte character set this includes a lead byte without a succeeding trail byte. For the Unicode character set this includes the characters 0xFFFF and 0xFFFE.
//


//
// MessageId: ERROR_UNDEFINED_CHARACTER
//
// MessageText:
//
// The Unicode character is not defined in the Unicode character set installed on the system.
//


//
// MessageId: ERROR_FLOPPY_VOLUME
//
// MessageText:
//
// The paging file cannot be created on a floppy diskette.
//


//
// MessageId: ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT
//
// MessageText:
//
// The system BIOS failed to connect a system interrupt to the device or bus for which the device is connected.
//


//
// MessageId: ERROR_BACKUP_CONTROLLER
//
// MessageText:
//
// This operation is only allowed for the Primary Domain Controller of the domain.
//


//
// MessageId: ERROR_MUTANT_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to acquire a mutant such that its maximum count would have been exceeded.
//


//
// MessageId: ERROR_FS_DRIVER_REQUIRED
//
// MessageText:
//
// A volume has been accessed for which a file system driver is required that has not yet been loaded.
//


//
// MessageId: ERROR_CANNOT_LOAD_REGISTRY_FILE
//
// MessageText:
//
// {Registry File Failure}
// The registry cannot load the hive (file):
// %hs
// or its log or alternate.
// It is corrupt, absent, or not writable.
//


//
// MessageId: ERROR_DEBUG_ATTACH_FAILED
//
// MessageText:
//
// {Unexpected Failure in DebugActiveProcess}
// An unexpected failure occurred while processing a DebugActiveProcess API request. You may choose OK to terminate the process, or Cancel to ignore the error.
//


//
// MessageId: ERROR_SYSTEM_PROCESS_TERMINATED
//
// MessageText:
//
// {Fatal System Error}
// The %hs system process terminated unexpectedly with a status of 0x%08x (0x%08x 0x%08x).
// The system has been shut down.
//


//
// MessageId: ERROR_DATA_NOT_ACCEPTED
//
// MessageText:
//
// {Data Not Accepted}
// The TDI client could not handle the data received during an indication.
//


//
// MessageId: ERROR_VDM_HARD_ERROR
//
// MessageText:
//
// NTVDM encountered a hard error.
//


//
// MessageId: ERROR_DRIVER_CANCEL_TIMEOUT
//
// MessageText:
//
// {Cancel Timeout}
// The driver %hs failed to complete a cancelled I/O request in the allotted time.
//


//
// MessageId: ERROR_REPLY_MESSAGE_MISMATCH
//
// MessageText:
//
// {Reply Message Mismatch}
// An attempt was made to reply to an LPC message, but the thread specified by the client ID in the message was not waiting on that message.
//


//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs. The data has been lost.
// This error may be caused by a failure of your computer hardware or network connection. Please try to save this file elsewhere.
//


//
// MessageId: ERROR_CLIENT_SERVER_PARAMETERS_INVALID
//
// MessageText:
//
// The parameter(s) passed to the server in the client/server shared memory window were invalid. Too much data may have been put in the shared memory window.
//


//
// MessageId: ERROR_NOT_TINY_STREAM
//
// MessageText:
//
// The stream is not a tiny stream.
//


//
// MessageId: ERROR_STACK_OVERFLOW_READ
//
// MessageText:
//
// The request must be handled by the stack overflow code.
//


//
// MessageId: ERROR_CONVERT_TO_LARGE
//
// MessageText:
//
// Internal OFS status codes indicating how an allocation operation is handled. Either it is retried after the containing onode is moved or the extent stream is converted to a large stream.
//


//
// MessageId: ERROR_FOUND_OUT_OF_SCOPE
//
// MessageText:
//
// The attempt to find the object found an object matching by ID on the volume but it is out of the scope of the handle used for the operation.
//


//
// MessageId: ERROR_ALLOCATE_BUCKET
//
// MessageText:
//
// The bucket array must be grown. Retry transaction after doing so.
//


//
// MessageId: ERROR_MARSHALL_OVERFLOW
//
// MessageText:
//
// The user/kernel marshalling buffer has overflowed.
//


//
// MessageId: ERROR_INVALID_VARIANT
//
// MessageText:
//
// The supplied variant structure contains invalid data.
//


//
// MessageId: ERROR_BAD_COMPRESSION_BUFFER
//
// MessageText:
//
// The specified buffer contains ill-formed data.
//


//
// MessageId: ERROR_AUDIT_FAILED
//
// MessageText:
//
// {Audit Failed}
// An attempt to generate a security audit failed.
//


//
// MessageId: ERROR_TIMER_RESOLUTION_NOT_SET
//
// MessageText:
//
// The timer resolution was not previously set by the current process.
//


//
// MessageId: ERROR_INSUFFICIENT_LOGON_INFO
//
// MessageText:
//
// There is insufficient account information to log you on.
//


//
// MessageId: ERROR_BAD_DLL_ENTRYPOINT
//
// MessageText:
//
// {Invalid DLL Entrypoint}
// The dynamic link library %hs is not written correctly. The stack pointer has been left in an inconsistent state.
// The entrypoint should be declared as WINAPI or STDCALL. Select YES to fail the DLL load. Select NO to continue execution. Selecting NO may cause the application to operate incorrectly.
//


//
// MessageId: ERROR_BAD_SERVICE_ENTRYPOINT
//
// MessageText:
//
// {Invalid Service Callback Entrypoint}
// The %hs service is not written correctly. The stack pointer has been left in an inconsistent state.
// The callback entrypoint should be declared as WINAPI or STDCALL. Selecting OK will cause the service to continue operation. However, the service process may operate incorrectly.
//


//
// MessageId: ERROR_IP_ADDRESS_CONFLICT1
//
// MessageText:
//
// There is an IP address conflict with another system on the network
//


//
// MessageId: ERROR_IP_ADDRESS_CONFLICT2
//
// MessageText:
//
// There is an IP address conflict with another system on the network
//


//
// MessageId: ERROR_REGISTRY_QUOTA_LIMIT
//
// MessageText:
//
// {Low On Registry Space}
// The system has reached the maximum size allowed for the system part of the registry. Additional storage requests will be ignored.
//


//
// MessageId: ERROR_NO_CALLBACK_ACTIVE
//
// MessageText:
//
// A callback return system service cannot be executed when no callback is active.
//


//
// MessageId: ERROR_PWD_TOO_SHORT
//
// MessageText:
//
// The password provided is too short to meet the policy of your user account.
// Please choose a longer password.
//


//
// MessageId: ERROR_PWD_TOO_RECENT
//
// MessageText:
//
// The policy of your user account does not allow you to change passwords too frequently.
// This is done to prevent users from changing back to a familiar, but potentially discovered, password.
// If you feel your password has been compromised then please contact your administrator immediately to have a new one assigned.
//


//
// MessageId: ERROR_PWD_HISTORY_CONFLICT
//
// MessageText:
//
// You have attempted to change your password to one that you have used in the past.
// The policy of your user account does not allow this. Please select a password that you have not previously used.
//


//
// MessageId: ERROR_UNSUPPORTED_COMPRESSION
//
// MessageText:
//
// The specified compression format is unsupported.
//


//
// MessageId: ERROR_INVALID_HW_PROFILE
//
// MessageText:
//
// The specified hardware profile configuration is invalid.
//


//
// MessageId: ERROR_INVALID_PLUGPLAY_DEVICE_PATH
//
// MessageText:
//
// The specified Plug and Play registry device path is invalid.
//


//
// MessageId: ERROR_QUOTA_LIST_INCONSISTENT
//
// MessageText:
//
// The specified quota list is internally inconsistent with its descriptor.
//


//
// MessageId: ERROR_EVALUATION_EXPIRATION
//
// MessageText:
//
// {Windows Evaluation Notification}
// The evaluation period for this installation of Windows has expired. This system will shutdown in 1 hour. To restore access to this installation of Windows, please upgrade this installation using a licensed distribution of this product.
//


//
// MessageId: ERROR_ILLEGAL_DLL_RELOCATION
//
// MessageText:
//
// {Illegal System DLL Relocation}
// The system DLL %hs was relocated in memory. The application will not run properly.
// The relocation occurred because the DLL %hs occupied an address range reserved for Windows system DLLs. The vendor supplying the DLL should be contacted for a new DLL.
//


//
// MessageId: ERROR_DLL_INIT_FAILED_LOGOFF
//
// MessageText:
//
// {DLL Initialization Failed}
// The application failed to initialize because the window station is shutting down.
//


//
// MessageId: ERROR_VALIDATE_CONTINUE
//
// MessageText:
//
// The validation process needs to continue on to the next step.
//


//
// MessageId: ERROR_NO_MORE_MATCHES
//
// MessageText:
//
// There are no more matches for the current index enumeration.
//


//
// MessageId: ERROR_RANGE_LIST_CONFLICT
//
// MessageText:
//
// The range could not be added to the range list because of a conflict.
//


//
// MessageId: ERROR_SERVER_SID_MISMATCH
//
// MessageText:
//
// The server process is running under a SID different than that required by client.
//


//
// MessageId: ERROR_CANT_ENABLE_DENY_ONLY
//
// MessageText:
//
// A group marked use for deny only  cannot be enabled.
//


//
// MessageId: ERROR_FLOAT_MULTIPLE_FAULTS
//
// MessageText:
//
// {EXCEPTION}
// Multiple floating point faults.
//


//
// MessageId: ERROR_FLOAT_MULTIPLE_TRAPS
//
// MessageText:
//
// {EXCEPTION}
// Multiple floating point traps.
//


//
// MessageId: ERROR_NOINTERFACE
//
// MessageText:
//
// The requested interface is not supported.
//


//
// MessageId: ERROR_DRIVER_FAILED_SLEEP
//
// MessageText:
//
// {System Standby Failed}
// The driver %hs does not support standby mode. Updating this driver may allow the system to go to standby mode.
//


//
// MessageId: ERROR_CORRUPT_SYSTEM_FILE
//
// MessageText:
//
// The system file %1 has become corrupt and has been replaced.
//


//
// MessageId: ERROR_COMMITMENT_MINIMUM
//
// MessageText:
//
// {Virtual Memory Minimum Too Low}
// Your system is low on virtual memory. Windows is increasing the size of your virtual memory paging file.
// During this process, memory requests for some applications may be denied. For more information, see Help.
//


//
// MessageId: ERROR_PNP_RESTART_ENUMERATION
//
// MessageText:
//
// A device was removed so enumeration must be restarted.
//


//
// MessageId: ERROR_SYSTEM_IMAGE_BAD_SIGNATURE
//
// MessageText:
//
// {Fatal System Error}
// The system image %s is not properly signed.
// The file has been replaced with the signed file.
// The system has been shut down.
//


//
// MessageId: ERROR_PNP_REBOOT_REQUIRED
//
// MessageText:
//
// Device will not start without a reboot.
//


//
// MessageId: ERROR_INSUFFICIENT_POWER
//
// MessageText:
//
// There is not enough power to complete the requested operation.
//


//
// MessageId: ERROR_MULTIPLE_FAULT_VIOLATION
//
// MessageText:
//
//  ERROR_MULTIPLE_FAULT_VIOLATION
//


//
// MessageId: ERROR_SYSTEM_SHUTDOWN
//
// MessageText:
//
// The system is in the process of shutting down.
//


//
// MessageId: ERROR_PORT_NOT_SET
//
// MessageText:
//
// An attempt to remove a processes DebugPort was made, but a port was not already associated with the process.
//


//
// MessageId: ERROR_DS_VERSION_CHECK_FAILURE
//
// MessageText:
//
// This version of Windows is not compatible with the behavior version of directory forest, domain or domain controller.
//


//
// MessageId: ERROR_RANGE_NOT_FOUND
//
// MessageText:
//
// The specified range could not be found in the range list.
//


//
// MessageId: ERROR_NOT_SAFE_MODE_DRIVER
//
// MessageText:
//
// The driver was not loaded because the system is booting into safe mode.
//


//
// MessageId: ERROR_FAILED_DRIVER_ENTRY
//
// MessageText:
//
// The driver was not loaded because it failed it's initialization call.
//


//
// MessageId: ERROR_DEVICE_ENUMERATION_ERROR
//
// MessageText:
//
// The "%hs" encountered an error while applying power or reading the device configuration.
// This may be caused by a failure of your hardware or by a poor connection.
//


//
// MessageId: ERROR_MOUNT_POINT_NOT_RESOLVED
//
// MessageText:
//
// The create operation failed because the name contained at least one mount point which resolves to a volume to which the specified device object is not attached.
//


//
// MessageId: ERROR_INVALID_DEVICE_OBJECT_PARAMETER
//
// MessageText:
//
// The device object parameter is either not a valid device object or is not attached to the volume specified by the file name.
//


//
// MessageId: ERROR_MCA_OCCURED
//
// MessageText:
//
// A Machine Check Error has occurred. Please check the system eventlog for additional information.
//


//
// MessageId: ERROR_DRIVER_DATABASE_ERROR
//
// MessageText:
//
// There was error [%2] processing the driver database.
//


//
// MessageId: ERROR_SYSTEM_HIVE_TOO_LARGE
//
// MessageText:
//
// System hive size has exceeded its limit.
//


//
// MessageId: ERROR_DRIVER_FAILED_PRIOR_UNLOAD
//
// MessageText:
//
// The driver could not be loaded because a previous version of the driver is still in memory.
//


//
// MessageId: ERROR_VOLSNAP_PREPARE_HIBERNATE
//
// MessageText:
//
// {Volume Shadow Copy Service}
// Please wait while the Volume Shadow Copy Service prepares volume %hs for hibernation.
//


//
// MessageId: ERROR_HIBERNATION_FAILURE
//
// MessageText:
//
// The system has failed to hibernate (The error code is %hs). Hibernation will be disabled until the system is restarted.
//


//
// MessageId: ERROR_FILE_SYSTEM_LIMITATION
//
// MessageText:
//
// The requested operation could not be completed due to a file system limitation
//


//
// MessageId: ERROR_ASSERTION_FAILURE
//
// MessageText:
//
// An assertion failure has occurred.
//


//
// MessageId: ERROR_ACPI_ERROR
//
// MessageText:
//
// An error occurred in the ACPI subsystem.
//


//
// MessageId: ERROR_WOW_ASSERTION
//
// MessageText:
//
// WOW Assertion Error.
//


//
// MessageId: ERROR_PNP_BAD_MPS_TABLE
//
// MessageText:
//
// A device is missing in the system BIOS MPS table. This device will not be used.
// Please contact your system vendor for system BIOS update.
//


//
// MessageId: ERROR_PNP_TRANSLATION_FAILED
//
// MessageText:
//
// A translator failed to translate resources.
//


//
// MessageId: ERROR_PNP_IRQ_TRANSLATION_FAILED
//
// MessageText:
//
// A IRQ translator failed to translate resources.
//


//
// MessageId: ERROR_PNP_INVALID_ID
//
// MessageText:
//
// Driver %2 returned invalid ID for a child device (%3).
//


//
// MessageId: ERROR_WAKE_SYSTEM_DEBUGGER
//
// MessageText:
//
// {Kernel Debugger Awakened}
// the system debugger was awakened by an interrupt.
//


//
// MessageId: ERROR_HANDLES_CLOSED
//
// MessageText:
//
// {Handles Closed}
// Handles to objects have been automatically closed as a result of the requested operation.
//


//
// MessageId: ERROR_EXTRANEOUS_INFORMATION
//
// MessageText:
//
// {Too Much Information}
// The specified access control list (ACL) contained more information than was expected.
//


//
// MessageId: ERROR_RXACT_COMMIT_NECESSARY
//
// MessageText:
//
// This warning level status indicates that the transaction state already exists for the registry sub-tree, but that a transaction commit was previously aborted.
// The commit has NOT been completed, but has not been rolled back either (so it may still be committed if desired).
//


//
// MessageId: ERROR_MEDIA_CHECK
//
// MessageText:
//
// {Media Changed}
// The media may have changed.
//


//
// MessageId: ERROR_GUID_SUBSTITUTION_MADE
//
// MessageText:
//
// {GUID Substitution}
// During the translation of a global identifier (GUID) to a Windows security ID (SID), no administratively-defined GUID prefix was found.
// A substitute prefix was used, which will not compromise system security.
// However, this may provide a more restrictive access than intended.
//


//
// MessageId: ERROR_STOPPED_ON_SYMLINK
//
// MessageText:
//
// The create operation stopped after reaching a symbolic link
//


//
// MessageId: ERROR_LONGJUMP
//
// MessageText:
//
// A long jump has been executed.
//


//
// MessageId: ERROR_PLUGPLAY_QUERY_VETOED
//
// MessageText:
//
// The Plug and Play query operation was not successful.
//


//
// MessageId: ERROR_UNWIND_CONSOLIDATE
//
// MessageText:
//
// A frame consolidation has been executed.
//


//
// MessageId: ERROR_REGISTRY_HIVE_RECOVERED
//
// MessageText:
//
// {Registry Hive Recovered}
// Registry hive (file):
// %hs
// was corrupted and it has been recovered. Some data might have been lost.
//


//
// MessageId: ERROR_DLL_MIGHT_BE_INSECURE
//
// MessageText:
//
// The application is attempting to run executable code from the module %hs. This may be insecure. An alternative, %hs, is available. Should the application use the secure module %hs?
//


//
// MessageId: ERROR_DLL_MIGHT_BE_INCOMPATIBLE
//
// MessageText:
//
// The application is loading executable code from the module %hs. This is secure, but may be incompatible with previous releases of the operating system. An alternative, %hs, is available. Should the application use the secure module %hs?
//


//
// MessageId: ERROR_DBG_EXCEPTION_NOT_HANDLED
//
// MessageText:
//
// Debugger did not handle the exception.
//


//
// MessageId: ERROR_DBG_REPLY_LATER
//
// MessageText:
//
// Debugger will reply later.
//


//
// MessageId: ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE
//
// MessageText:
//
// Debugger cannot provide handle.
//


//
// MessageId: ERROR_DBG_TERMINATE_THREAD
//
// MessageText:
//
// Debugger terminated thread.
//


//
// MessageId: ERROR_DBG_TERMINATE_PROCESS
//
// MessageText:
//
// Debugger terminated process.
//


//
// MessageId: ERROR_DBG_CONTROL_C
//
// MessageText:
//
// Debugger got control C.
//


//
// MessageId: ERROR_DBG_PRINTEXCEPTION_C
//
// MessageText:
//
// Debugger printed exception on control C.
//


//
// MessageId: ERROR_DBG_RIPEXCEPTION
//
// MessageText:
//
// Debugger received RIP exception.
//


//
// MessageId: ERROR_DBG_CONTROL_BREAK
//
// MessageText:
//
// Debugger received control break.
//


//
// MessageId: ERROR_DBG_COMMAND_EXCEPTION
//
// MessageText:
//
// Debugger command communication exception.
//


//
// MessageId: ERROR_OBJECT_NAME_EXISTS
//
// MessageText:
//
// {Object Exists}
// An attempt was made to create an object and the object name already existed.
//


//
// MessageId: ERROR_THREAD_WAS_SUSPENDED
//
// MessageText:
//
// {Thread Suspended}
// A thread termination occurred while the thread was suspended. The thread was resumed, and termination proceeded.
//


//
// MessageId: ERROR_IMAGE_NOT_AT_BASE
//
// MessageText:
//
// {Image Relocated}
// An image file could not be mapped at the address specified in the image file. Local fixups must be performed on this image.
//


//
// MessageId: ERROR_RXACT_STATE_CREATED
//
// MessageText:
//
// This informational level status indicates that a specified registry sub-tree transaction state did not yet exist and had to be created.
//


//
// MessageId: ERROR_SEGMENT_NOTIFICATION
//
// MessageText:
//
// {Segment Load}
// A virtual DOS machine (VDM) is loading, unloading, or moving an MS-DOS or Win16 program segment image.
// An exception is raised so a debugger can load, unload or track symbols and breakpoints within these 16-bit segments.
//


//
// MessageId: ERROR_BAD_CURRENT_DIRECTORY
//
// MessageText:
//
// {Invalid Current Directory}
// The process cannot switch to the startup current directory %hs.
// Select OK to set current directory to %hs, or select CANCEL to exit.
//


//
// MessageId: ERROR_FT_READ_RECOVERY_FROM_BACKUP
//
// MessageText:
//
// {Redundant Read}
// To satisfy a read request, the NT fault-tolerant file system successfully read the requested data from a redundant copy.
// This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was unable to reassign the failing area of the device.
//


//
// MessageId: ERROR_FT_WRITE_RECOVERY
//
// MessageText:
//
// {Redundant Write}
// To satisfy a write request, the NT fault-tolerant file system successfully wrote a redundant copy of the information.
// This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was not able to reassign the failing area of the device.
//


//
// MessageId: ERROR_IMAGE_MACHINE_TYPE_MISMATCH
//
// MessageText:
//
// {Machine Type Mismatch}
// The image file %hs is valid, but is for a machine type other than the current machine. Select OK to continue, or CANCEL to fail the DLL load.
//


//
// MessageId: ERROR_RECEIVE_PARTIAL
//
// MessageText:
//
// {Partial Data Received}
// The network transport returned partial data to its client. The remaining data will be sent later.
//


//
// MessageId: ERROR_RECEIVE_EXPEDITED
//
// MessageText:
//
// {Expedited Data Received}
// The network transport returned data to its client that was marked as expedited by the remote system.
//


//
// MessageId: ERROR_RECEIVE_PARTIAL_EXPEDITED
//
// MessageText:
//
// {Partial Expedited Data Received}
// The network transport returned partial data to its client and this data was marked as expedited by the remote system. The remaining data will be sent later.
//


//
// MessageId: ERROR_EVENT_DONE
//
// MessageText:
//
// {TDI Event Done}
// The TDI indication has completed successfully.
//


//
// MessageId: ERROR_EVENT_PENDING
//
// MessageText:
//
// {TDI Event Pending}
// The TDI indication has entered the pending state.
//


//
// MessageId: ERROR_CHECKING_FILE_SYSTEM
//
// MessageText:
//
// Checking file system on %wZ
//


//
// MessageId: ERROR_FATAL_APP_EXIT
//
// MessageText:
//
// {Fatal Application Exit}
// %hs
//


//
// MessageId: ERROR_PREDEFINED_HANDLE
//
// MessageText:
//
// The specified registry key is referenced by a predefined handle.
//


//
// MessageId: ERROR_WAS_UNLOCKED
//
// MessageText:
//
// {Page Unlocked}
// The page protection of a locked page was changed to 'No Access' and the page was unlocked from memory and from the process.
//


//
// MessageId: ERROR_SERVICE_NOTIFICATION
//
// MessageText:
//
// %hs
//


//
// MessageId: ERROR_WAS_LOCKED
//
// MessageText:
//
// {Page Locked}
// One of the pages to lock was already locked.
//


//
// MessageId: ERROR_LOG_HARD_ERROR
//
// MessageText:
//
// Application popup: %1 : %2
//


//
// MessageId: ERROR_ALREADY_WIN32
//
// MessageText:
//
//  ERROR_ALREADY_WIN32
//


//
// MessageId: ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE
//
// MessageText:
//
// {Machine Type Mismatch}
// The image file %hs is valid, but is for a machine type other than the current machine.
//


//
// MessageId: ERROR_NO_YIELD_PERFORMED
//
// MessageText:
//
// A yield execution was performed and no thread was available to run.
//


//
// MessageId: ERROR_TIMER_RESUME_IGNORED
//
// MessageText:
//
// The resumable flag to a timer API was ignored.
//


//
// MessageId: ERROR_ARBITRATION_UNHANDLED
//
// MessageText:
//
// The arbiter has deferred arbitration of these resources to its parent
//


//
// MessageId: ERROR_CARDBUS_NOT_SUPPORTED
//
// MessageText:
//
// The inserted CardBus device cannot be started because of a configuration error on "%hs".
//


//
// MessageId: ERROR_MP_PROCESSOR_MISMATCH
//
// MessageText:
//
// The CPUs in this multiprocessor system are not all the same revision level. To use all processors the operating system restricts itself to the features of the least capable processor in the system. Should problems occur with this system, contact the CPU manufacturer to see if this mix of processors is supported.
//


//
// MessageId: ERROR_HIBERNATED
//
// MessageText:
//
// The system was put into hibernation.
//


//
// MessageId: ERROR_RESUME_HIBERNATION
//
// MessageText:
//
// The system was resumed from hibernation.
//


//
// MessageId: ERROR_FIRMWARE_UPDATED
//
// MessageText:
//
// Windows has detected that the system firmware (BIOS) was updated [previous firmware date = %2, current firmware date %3].
//


//
// MessageId: ERROR_DRIVERS_LEAKING_LOCKED_PAGES
//
// MessageText:
//
// A device driver is leaking locked I/O pages causing system degradation. The system has automatically enabled tracking code in order to try and catch the culprit.
//


//
// MessageId: ERROR_WAKE_SYSTEM
//
// MessageText:
//
// The system has awoken
//


//
// MessageId: ERROR_WAIT_1
//
// MessageText:
//
//  ERROR_WAIT_1
//


//
// MessageId: ERROR_WAIT_2
//
// MessageText:
//
//  ERROR_WAIT_2
//


//
// MessageId: ERROR_WAIT_3
//
// MessageText:
//
//  ERROR_WAIT_3
//


//
// MessageId: ERROR_WAIT_63
//
// MessageText:
//
//  ERROR_WAIT_63
//


//
// MessageId: ERROR_ABANDONED_WAIT_0
//
// MessageText:
//
//  ERROR_ABANDONED_WAIT_0
//


//
// MessageId: ERROR_ABANDONED_WAIT_63
//
// MessageText:
//
//  ERROR_ABANDONED_WAIT_63
//


//
// MessageId: ERROR_USER_APC
//
// MessageText:
//
//  ERROR_USER_APC
//


//
// MessageId: ERROR_KERNEL_APC
//
// MessageText:
//
//  ERROR_KERNEL_APC
//


//
// MessageId: ERROR_ALERTED
//
// MessageText:
//
//  ERROR_ALERTED
//


//
// MessageId: ERROR_ELEVATION_REQUIRED
//
// MessageText:
//
// The requested operation requires elevation.
//


//
// MessageId: ERROR_REPARSE
//
// MessageText:
//
// A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
//


//
// MessageId: ERROR_OPLOCK_BREAK_IN_PROGRESS
//
// MessageText:
//
// An open/create operation completed while an oplock break is underway.
//


//
// MessageId: ERROR_VOLUME_MOUNTED
//
// MessageText:
//
// A new volume has been mounted by a file system.
//


//
// MessageId: ERROR_RXACT_COMMITTED
//
// MessageText:
//
// This success level status indicates that the transaction state already exists for the registry sub-tree, but that a transaction commit was previously aborted.
// The commit has now been completed.
//


//
// MessageId: ERROR_NOTIFY_CLEANUP
//
// MessageText:
//
// This indicates that a notify change request has been completed due to closing the handle which made the notify change request.
//


//
// MessageId: ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED
//
// MessageText:
//
// {Connect Failure on Primary Transport}
// An attempt was made to connect to the remote server %hs on the primary transport, but the connection failed.
// The computer WAS able to connect on a secondary transport.
//


//
// MessageId: ERROR_PAGE_FAULT_TRANSITION
//
// MessageText:
//
// Page fault was a transition fault.
//


//
// MessageId: ERROR_PAGE_FAULT_DEMAND_ZERO
//
// MessageText:
//
// Page fault was a demand zero fault.
//


//
// MessageId: ERROR_PAGE_FAULT_COPY_ON_WRITE
//
// MessageText:
//
// Page fault was a demand zero fault.
//


//
// MessageId: ERROR_PAGE_FAULT_GUARD_PAGE
//
// MessageText:
//
// Page fault was a demand zero fault.
//


//
// MessageId: ERROR_PAGE_FAULT_PAGING_FILE
//
// MessageText:
//
// Page fault was satisfied by reading from a secondary storage device.
//


//
// MessageId: ERROR_CACHE_PAGE_LOCKED
//
// MessageText:
//
// Cached page was locked during operation.
//


//
// MessageId: ERROR_CRASH_DUMP
//
// MessageText:
//
// Crash dump exists in paging file.
//


//
// MessageId: ERROR_BUFFER_ALL_ZEROS
//
// MessageText:
//
// Specified buffer contains all zeros.
//


//
// MessageId: ERROR_REPARSE_OBJECT
//
// MessageText:
//
// A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
//


//
// MessageId: ERROR_RESOURCE_REQUIREMENTS_CHANGED
//
// MessageText:
//
// The device has succeeded a query-stop and its resource requirements have changed.
//


//
// MessageId: ERROR_TRANSLATION_COMPLETE
//
// MessageText:
//
// The translator has translated these resources into the global space and no further translations should be performed.
//


//
// MessageId: ERROR_NOTHING_TO_TERMINATE
//
// MessageText:
//
// A process being terminated has no threads to terminate.
//


//
// MessageId: ERROR_PROCESS_NOT_IN_JOB
//
// MessageText:
//
// The specified process is not part of a job.
//


//
// MessageId: ERROR_PROCESS_IN_JOB
//
// MessageText:
//
// The specified process is part of a job.
//


//
// MessageId: ERROR_VOLSNAP_HIBERNATE_READY
//
// MessageText:
//
// {Volume Shadow Copy Service}
// The system is now ready for hibernation.
//


//
// MessageId: ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY
//
// MessageText:
//
// A file system or file system filter driver has successfully completed an FsFilter operation.
//


//
// MessageId: ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED
//
// MessageText:
//
// The specified interrupt vector was already connected.
//


//
// MessageId: ERROR_INTERRUPT_STILL_CONNECTED
//
// MessageText:
//
// The specified interrupt vector is still connected.
//


//
// MessageId: ERROR_WAIT_FOR_OPLOCK
//
// MessageText:
//
// An operation is blocked waiting for an oplock.
//


//
// MessageId: ERROR_DBG_EXCEPTION_HANDLED
//
// MessageText:
//
// Debugger handled exception
//


//
// MessageId: ERROR_DBG_CONTINUE
//
// MessageText:
//
// Debugger continued
//


//
// MessageId: ERROR_CALLBACK_POP_STACK
//
// MessageText:
//
// An exception occurred in a user mode callback and the kernel callback frame should be removed.
//


//
// MessageId: ERROR_COMPRESSION_DISABLED
//
// MessageText:
//
// Compression is disabled for this volume.
//


//
// MessageId: ERROR_CANTFETCHBACKWARDS
//
// MessageText:
//
// The data provider cannot fetch backwards through a result set.
//


//
// MessageId: ERROR_CANTSCROLLBACKWARDS
//
// MessageText:
//
// The data provider cannot scroll backwards through a result set.
//


//
// MessageId: ERROR_ROWSNOTRELEASED
//
// MessageText:
//
// The data provider requires that previously fetched data is released before asking for more data.
//


//
// MessageId: ERROR_BAD_ACCESSOR_FLAGS
//
// MessageText:
//
// The data provider was not able to intrepret the flags set for a column binding in an accessor.
//


//
// MessageId: ERROR_ERRORS_ENCOUNTERED
//
// MessageText:
//
// One or more errors occurred while processing the request.
//


//
// MessageId: ERROR_NOT_CAPABLE
//
// MessageText:
//
// The implementation is not capable of performing the request.
//


//
// MessageId: ERROR_REQUEST_OUT_OF_SEQUENCE
//
// MessageText:
//
// The client of a component requested an operation which is not valid given the state of the component instance.
//


//
// MessageId: ERROR_VERSION_PARSE_ERROR
//
// MessageText:
//
// A version number could not be parsed.
//


//
// MessageId: ERROR_BADSTARTPOSITION
//
// MessageText:
//
// The iterator's start position is invalid.
//


//
// MessageId: ERROR_MEMORY_HARDWARE
//
// MessageText:
//
// The hardware has reported an uncorrectable memory error.
//


//
// MessageId: ERROR_DISK_REPAIR_DISABLED
//
// MessageText:
//
// The attempted operation required self healing to be enabled.
//


//
// MessageId: ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE
//
// MessageText:
//
// The Desktop heap encountered an error while allocating session memory.
// There is more information in the system event log.
//


//
// MessageId: ERROR_SYSTEM_POWERSTATE_TRANSITION
//
// MessageText:
//
// The system powerstate is transitioning from %2 to %3.
//


//
// MessageId: ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION
//
// MessageText:
//
// The system powerstate is transitioning from %2 to %3 but could enter %4.
//


//
// MessageId: ERROR_MCA_EXCEPTION
//
// MessageText:
//
// A thread is getting dispatched with MCA EXCEPTION because of MCA.
//


//
// MessageId: ERROR_ACCESS_AUDIT_BY_POLICY
//
// MessageText:
//
// Access to %1 is monitored by policy rule %2.
//


//
// MessageId: ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by policy rule %2.
//


//
// MessageId: ERROR_ABANDON_HIBERFILE
//
// MessageText:
//
// A valid hibernation file has been invalidated and should be abandoned.
//


//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error may be caused by network connectivity issues. Please try to save this file elsewhere.
//


//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error was returned by the server on which the file exists. Please try to save this file elsewhere.
//


//
// MessageId: ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error may be caused if the device has been removed or the media is write-protected.
//


//
// MessageId: ERROR_BAD_MCFG_TABLE
//
// MessageText:
//
// The resources required for this device conflict with the MCFG table.
//


//
// MessageId: ERROR_EA_ACCESS_DENIED
//
// MessageText:
//
// Access to the extended attribute was denied.
//


//
// MessageId: ERROR_OPERATION_ABORTED
//
// MessageText:
//
// The I/O operation has been aborted because of either a thread exit or an application request.
//


//
// MessageId: ERROR_IO_INCOMPLETE
//
// MessageText:
//
// Overlapped I/O event is not in a signaled state.
//


//
// MessageId: ERROR_IO_PENDING
//
// MessageText:
//
// Overlapped I/O operation is in progress.
//


//
// MessageId: ERROR_NOACCESS
//
// MessageText:
//
// Invalid access to memory location.
//


//
// MessageId: ERROR_SWAPERROR
//
// MessageText:
//
// Error performing inpage operation.
//


//
// MessageId: ERROR_STACK_OVERFLOW
//
// MessageText:
//
// Recursion too deep; the stack overflowed.
//


//
// MessageId: ERROR_INVALID_MESSAGE
//
// MessageText:
//
// The window cannot act on the sent message.
//


//
// MessageId: ERROR_CAN_NOT_COMPLETE
//
// MessageText:
//
// Cannot complete this function.
//


//
// MessageId: ERROR_INVALID_FLAGS
//
// MessageText:
//
// Invalid flags.
//


//
// MessageId: ERROR_UNRECOGNIZED_VOLUME
//
// MessageText:
//
// The volume does not contain a recognized file system.
// Please make sure that all required file system drivers are loaded and that the volume is not corrupted.
//


//
// MessageId: ERROR_FILE_INVALID
//
// MessageText:
//
// The volume for a file has been externally altered so that the opened file is no longer valid.
//


//
// MessageId: ERROR_FULLSCREEN_MODE
//
// MessageText:
//
// The requested operation cannot be performed in full-screen mode.
//


//
// MessageId: ERROR_NO_TOKEN
//
// MessageText:
//
// An attempt was made to reference a token that does not exist.
//


//
// MessageId: ERROR_BADDB
//
// MessageText:
//
// The configuration registry database is corrupt.
//


//
// MessageId: ERROR_BADKEY
//
// MessageText:
//
// The configuration registry key is invalid.
//


//
// MessageId: ERROR_CANTOPEN
//
// MessageText:
//
// The configuration registry key could not be opened.
//


//
// MessageId: ERROR_CANTREAD
//
// MessageText:
//
// The configuration registry key could not be read.
//


//
// MessageId: ERROR_CANTWRITE
//
// MessageText:
//
// The configuration registry key could not be written.
//


//
// MessageId: ERROR_REGISTRY_RECOVERED
//
// MessageText:
//
// One of the files in the registry database had to be recovered by use of a log or alternate copy. The recovery was successful.
//


//
// MessageId: ERROR_REGISTRY_CORRUPT
//
// MessageText:
//
// The registry is corrupted. The structure of one of the files containing registry data is corrupted, or the system's memory image of the file is corrupted, or the file could not be recovered because the alternate copy or log was absent or corrupted.
//


//
// MessageId: ERROR_REGISTRY_IO_FAILED
//
// MessageText:
//
// An I/O operation initiated by the registry failed unrecoverably. The registry could not read in, or write out, or flush, one of the files that contain the system's image of the registry.
//


//
// MessageId: ERROR_NOT_REGISTRY_FILE
//
// MessageText:
//
// The system has attempted to load or restore a file into the registry, but the specified file is not in a registry file format.
//


//
// MessageId: ERROR_KEY_DELETED
//
// MessageText:
//
// Illegal operation attempted on a registry key that has been marked for deletion.
//


//
// MessageId: ERROR_NO_LOG_SPACE
//
// MessageText:
//
// System could not allocate the required space in a registry log.
//


//
// MessageId: ERROR_KEY_HAS_CHILDREN
//
// MessageText:
//
// Cannot create a symbolic link in a registry key that already has subkeys or values.
//


//
// MessageId: ERROR_CHILD_MUST_BE_VOLATILE
//
// MessageText:
//
// Cannot create a stable subkey under a volatile parent key.
//


//
// MessageId: ERROR_NOTIFY_ENUM_DIR
//
// MessageText:
//
// A notify change request is being completed and the information is not being returned in the caller's buffer. The caller now needs to enumerate the files to find the changes.
//


//
// MessageId: ERROR_DEPENDENT_SERVICES_RUNNING
//
// MessageText:
//
// A stop control has been sent to a service that other running services are dependent on.
//


//
// MessageId: ERROR_INVALID_SERVICE_CONTROL
//
// MessageText:
//
// The requested control is not valid for this service.
//


//
// MessageId: ERROR_SERVICE_REQUEST_TIMEOUT
//
// MessageText:
//
// The service did not respond to the start or control request in a timely fashion.
//


//
// MessageId: ERROR_SERVICE_NO_THREAD
//
// MessageText:
//
// A thread could not be created for the service.
//


//
// MessageId: ERROR_SERVICE_DATABASE_LOCKED
//
// MessageText:
//
// The service database is locked.
//


//
// MessageId: ERROR_SERVICE_ALREADY_RUNNING
//
// MessageText:
//
// An instance of the service is already running.
//


//
// MessageId: ERROR_INVALID_SERVICE_ACCOUNT
//
// MessageText:
//
// The account name is invalid or does not exist, or the password is invalid for the account name specified.
//


//
// MessageId: ERROR_SERVICE_DISABLED
//
// MessageText:
//
// The service cannot be started, either because it is disabled or because it has no enabled devices associated with it.
//


//
// MessageId: ERROR_CIRCULAR_DEPENDENCY
//
// MessageText:
//
// Circular service dependency was specified.
//


//
// MessageId: ERROR_SERVICE_DOES_NOT_EXIST
//
// MessageText:
//
// The specified service does not exist as an installed service.
//


//
// MessageId: ERROR_SERVICE_CANNOT_ACCEPT_CTRL
//
// MessageText:
//
// The service cannot accept control messages at this time.
//


//
// MessageId: ERROR_SERVICE_NOT_ACTIVE
//
// MessageText:
//
// The service has not been started.
//


//
// MessageId: ERROR_FAILED_SERVICE_CONTROLLER_CONNECT
//
// MessageText:
//
// The service process could not connect to the service controller.
//


//
// MessageId: ERROR_EXCEPTION_IN_SERVICE
//
// MessageText:
//
// An exception occurred in the service when handling the control request.
//


//
// MessageId: ERROR_DATABASE_DOES_NOT_EXIST
//
// MessageText:
//
// The database specified does not exist.
//


//
// MessageId: ERROR_SERVICE_SPECIFIC_ERROR
//
// MessageText:
//
// The service has returned a service-specific error code.
//


//
// MessageId: ERROR_PROCESS_ABORTED
//
// MessageText:
//
// The process terminated unexpectedly.
//


//
// MessageId: ERROR_SERVICE_DEPENDENCY_FAIL
//
// MessageText:
//
// The dependency service or group failed to start.
//


//
// MessageId: ERROR_SERVICE_LOGON_FAILED
//
// MessageText:
//
// The service did not start due to a logon failure.
//


//
// MessageId: ERROR_SERVICE_START_HANG
//
// MessageText:
//
// After starting, the service hung in a start-pending state.
//


//
// MessageId: ERROR_INVALID_SERVICE_LOCK
//
// MessageText:
//
// The specified service database lock is invalid.
//


//
// MessageId: ERROR_SERVICE_MARKED_FOR_DELETE
//
// MessageText:
//
// The specified service has been marked for deletion.
//


//
// MessageId: ERROR_SERVICE_EXISTS
//
// MessageText:
//
// The specified service already exists.
//


//
// MessageId: ERROR_ALREADY_RUNNING_LKG
//
// MessageText:
//
// The system is currently running with the last-known-good configuration.
//


//
// MessageId: ERROR_SERVICE_DEPENDENCY_DELETED
//
// MessageText:
//
// The dependency service does not exist or has been marked for deletion.
//


//
// MessageId: ERROR_BOOT_ALREADY_ACCEPTED
//
// MessageText:
//
// The current boot has already been accepted for use as the last-known-good control set.
//


//
// MessageId: ERROR_SERVICE_NEVER_STARTED
//
// MessageText:
//
// No attempts to start the service have been made since the last boot.
//


//
// MessageId: ERROR_DUPLICATE_SERVICE_NAME
//
// MessageText:
//
// The name is already in use as either a service name or a service display name.
//


//
// MessageId: ERROR_DIFFERENT_SERVICE_ACCOUNT
//
// MessageText:
//
// The account specified for this service is different from the account specified for other services running in the same process.
//


//
// MessageId: ERROR_CANNOT_DETECT_DRIVER_FAILURE
//
// MessageText:
//
// Failure actions can only be set for Win32 services, not for drivers.
//


//
// MessageId: ERROR_CANNOT_DETECT_PROCESS_ABORT
//
// MessageText:
//
// This service runs in the same process as the service control manager.
// Therefore, the service control manager cannot take action if this service's process terminates unexpectedly.
//


//
// MessageId: ERROR_NO_RECOVERY_PROGRAM
//
// MessageText:
//
// No recovery program has been configured for this service.
//


//
// MessageId: ERROR_SERVICE_NOT_IN_EXE
//
// MessageText:
//
// The executable program that this service is configured to run in does not implement the service.
//


//
// MessageId: ERROR_NOT_SAFEBOOT_SERVICE
//
// MessageText:
//
// This service cannot be started in Safe Mode
//


//
// MessageId: ERROR_END_OF_MEDIA
//
// MessageText:
//
// The physical end of the tape has been reached.
//


//
// MessageId: ERROR_FILEMARK_DETECTED
//
// MessageText:
//
// A tape access reached a filemark.
//


//
// MessageId: ERROR_BEGINNING_OF_MEDIA
//
// MessageText:
//
// The beginning of the tape or a partition was encountered.
//


//
// MessageId: ERROR_SETMARK_DETECTED
//
// MessageText:
//
// A tape access reached the end of a set of files.
//


//
// MessageId: ERROR_NO_DATA_DETECTED
//
// MessageText:
//
// No more data is on the tape.
//


//
// MessageId: ERROR_PARTITION_FAILURE
//
// MessageText:
//
// Tape could not be partitioned.
//


//
// MessageId: ERROR_INVALID_BLOCK_LENGTH
//
// MessageText:
//
// When accessing a new tape of a multivolume partition, the current block size is incorrect.
//


//
// MessageId: ERROR_DEVICE_NOT_PARTITIONED
//
// MessageText:
//
// Tape partition information could not be found when loading a tape.
//


//
// MessageId: ERROR_UNABLE_TO_LOCK_MEDIA
//
// MessageText:
//
// Unable to lock the media eject mechanism.
//


//
// MessageId: ERROR_UNABLE_TO_UNLOAD_MEDIA
//
// MessageText:
//
// Unable to unload the media.
//


//
// MessageId: ERROR_MEDIA_CHANGED
//
// MessageText:
//
// The media in the drive may have changed.
//


//
// MessageId: ERROR_BUS_RESET
//
// MessageText:
//
// The I/O bus was reset.
//


//
// MessageId: ERROR_NO_MEDIA_IN_DRIVE
//
// MessageText:
//
// No media in drive.
//


//
// MessageId: ERROR_NO_UNICODE_TRANSLATION
//
// MessageText:
//
// No mapping for the Unicode character exists in the target multi-byte code page.
//


//
// MessageId: ERROR_DLL_INIT_FAILED
//
// MessageText:
//
// A dynamic link library (DLL) initialization routine failed.
//


//
// MessageId: ERROR_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// A system shutdown is in progress.
//


//
// MessageId: ERROR_NO_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// Unable to abort the system shutdown because no shutdown was in progress.
//


//
// MessageId: ERROR_IO_DEVICE
//
// MessageText:
//
// The request could not be performed because of an I/O device error.
//


//
// MessageId: ERROR_SERIAL_NO_DEVICE
//
// MessageText:
//
// No serial device was successfully initialized. The serial driver will unload.
//


//
// MessageId: ERROR_IRQ_BUSY
//
// MessageText:
//
// Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other device that uses that IRQ was already opened.
//


//
// MessageId: ERROR_MORE_WRITES
//
// MessageText:
//
// A serial I/O operation was completed by another write to the serial port.
// (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
//


//
// MessageId: ERROR_COUNTER_TIMEOUT
//
// MessageText:
//
// A serial I/O operation completed because the timeout period expired.
// (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)
//


//
// MessageId: ERROR_FLOPPY_ID_MARK_NOT_FOUND
//
// MessageText:
//
// No ID address mark was found on the floppy disk.
//


//
// MessageId: ERROR_FLOPPY_WRONG_CYLINDER
//
// MessageText:
//
// Mismatch between the floppy disk sector ID field and the floppy disk controller track address.
//


//
// MessageId: ERROR_FLOPPY_UNKNOWN_ERROR
//
// MessageText:
//
// The floppy disk controller reported an error that is not recognized by the floppy disk driver.
//


//
// MessageId: ERROR_FLOPPY_BAD_REGISTERS
//
// MessageText:
//
// The floppy disk controller returned inconsistent results in its registers.
//


//
// MessageId: ERROR_DISK_RECALIBRATE_FAILED
//
// MessageText:
//
// While accessing the hard disk, a recalibrate operation failed, even after retries.
//


//
// MessageId: ERROR_DISK_OPERATION_FAILED
//
// MessageText:
//
// While accessing the hard disk, a disk operation failed even after retries.
//


//
// MessageId: ERROR_DISK_RESET_FAILED
//
// MessageText:
//
// While accessing the hard disk, a disk controller reset was needed, but even that failed.
//


//
// MessageId: ERROR_EOM_OVERFLOW
//
// MessageText:
//
// Physical end of tape encountered.
//


//
// MessageId: ERROR_NOT_ENOUGH_SERVER_MEMORY
//
// MessageText:
//
// Not enough server storage is available to process this command.
//


//
// MessageId: ERROR_POSSIBLE_DEADLOCK
//
// MessageText:
//
// A potential deadlock condition has been detected.
//


//
// MessageId: ERROR_MAPPED_ALIGNMENT
//
// MessageText:
//
// The base address or the file offset specified does not have the proper alignment.
//


//
// MessageId: ERROR_SET_POWER_STATE_VETOED
//
// MessageText:
//
// An attempt to change the system power state was vetoed by another application or driver.
//


//
// MessageId: ERROR_SET_POWER_STATE_FAILED
//
// MessageText:
//
// The system BIOS failed an attempt to change the system power state.
//


//
// MessageId: ERROR_TOO_MANY_LINKS
//
// MessageText:
//
// An attempt was made to create more links on a file than the file system supports.
//


//
// MessageId: ERROR_OLD_WIN_VERSION
//
// MessageText:
//
// The specified program requires a newer version of Windows.
//


//
// MessageId: ERROR_APP_WRONG_OS
//
// MessageText:
//
// The specified program is not a Windows or MS-DOS program.
//


//
// MessageId: ERROR_SINGLE_INSTANCE_APP
//
// MessageText:
//
// Cannot start more than one instance of the specified program.
//


//
// MessageId: ERROR_RMODE_APP
//
// MessageText:
//
// The specified program was written for an earlier version of Windows.
//


//
// MessageId: ERROR_INVALID_DLL
//
// MessageText:
//
// One of the library files needed to run this application is damaged.
//


//
// MessageId: ERROR_NO_ASSOCIATION
//
// MessageText:
//
// No application is associated with the specified file for this operation.
//


//
// MessageId: ERROR_DDE_FAIL
//
// MessageText:
//
// An error occurred in sending the command to the application.
//


//
// MessageId: ERROR_DLL_NOT_FOUND
//
// MessageText:
//
// One of the library files needed to run this application cannot be found.
//


//
// MessageId: ERROR_NO_MORE_USER_HANDLES
//
// MessageText:
//
// The current process has used all of its system allowance of handles for Window Manager objects.
//


//
// MessageId: ERROR_MESSAGE_SYNC_ONLY
//
// MessageText:
//
// The message can be used only with synchronous operations.
//


//
// MessageId: ERROR_SOURCE_ELEMENT_EMPTY
//
// MessageText:
//
// The indicated source element has no media.
//


//
// MessageId: ERROR_DESTINATION_ELEMENT_FULL
//
// MessageText:
//
// The indicated destination element already contains media.
//


//
// MessageId: ERROR_ILLEGAL_ELEMENT_ADDRESS
//
// MessageText:
//
// The indicated element does not exist.
//


//
// MessageId: ERROR_MAGAZINE_NOT_PRESENT
//
// MessageText:
//
// The indicated element is part of a magazine that is not present.
//


//
// MessageId: ERROR_DEVICE_REINITIALIZATION_NEEDED
//
// MessageText:
//
// The indicated device requires reinitialization due to hardware errors.
//


//
// MessageId: ERROR_DEVICE_REQUIRES_CLEANING
//
// MessageText:
//
// The device has indicated that cleaning is required before further operations are attempted.
//


//
// MessageId: ERROR_DEVICE_DOOR_OPEN
//
// MessageText:
//
// The device has indicated that its door is open.
//


//
// MessageId: ERROR_DEVICE_NOT_CONNECTED
//
// MessageText:
//
// The device is not connected.
//


//
// MessageId: ERROR_NOT_FOUND
//
// MessageText:
//
// Element not found.
//


//
// MessageId: ERROR_NO_MATCH
//
// MessageText:
//
// There was no match for the specified key in the index.
//


//
// MessageId: ERROR_SET_NOT_FOUND
//
// MessageText:
//
// The property set specified does not exist on the object.
//


//
// MessageId: ERROR_POINT_NOT_FOUND
//
// MessageText:
//
// The point passed to GetMouseMovePoints is not in the buffer.
//


//
// MessageId: ERROR_NO_TRACKING_SERVICE
//
// MessageText:
//
// The tracking (workstation) service is not running.
//


//
// MessageId: ERROR_NO_VOLUME_ID
//
// MessageText:
//
// The Volume ID could not be found.
//


//
// MessageId: ERROR_UNABLE_TO_REMOVE_REPLACED
//
// MessageText:
//
// Unable to remove the file to be replaced.
//


//
// MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT
//
// MessageText:
//
// Unable to move the replacement file to the file to be replaced. The file to be replaced has retained its original name.
//


//
// MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT_2
//
// MessageText:
//
// Unable to move the replacement file to the file to be replaced. The file to be replaced has been renamed using the backup name.
//


//
// MessageId: ERROR_JOURNAL_DELETE_IN_PROGRESS
//
// MessageText:
//
// The volume change journal is being deleted.
//


//
// MessageId: ERROR_JOURNAL_NOT_ACTIVE
//
// MessageText:
//
// The volume change journal is not active.
//


//
// MessageId: ERROR_POTENTIAL_FILE_FOUND
//
// MessageText:
//
// A file was found, but it may not be the correct file.
//


//
// MessageId: ERROR_JOURNAL_ENTRY_DELETED
//
// MessageText:
//
// The journal entry has been deleted from the journal.
//


//
// MessageId: ERROR_SHUTDOWN_IS_SCHEDULED
//
// MessageText:
//
// A system shutdown has already been scheduled.
//


//
// MessageId: ERROR_SHUTDOWN_USERS_LOGGED_ON
//
// MessageText:
//
// The system shutdown cannot be initiated because there are other users logged on to the computer.
//


//
// MessageId: ERROR_BAD_DEVICE
//
// MessageText:
//
// The specified device name is invalid.
//


//
// MessageId: ERROR_CONNECTION_UNAVAIL
//
// MessageText:
//
// The device is not currently connected but it is a remembered connection.
//


//
// MessageId: ERROR_DEVICE_ALREADY_REMEMBERED
//
// MessageText:
//
// The local device name has a remembered connection to another network resource.
//


//
// MessageId: ERROR_NO_NET_OR_BAD_PATH
//
// MessageText:
//
// The network path was either typed incorrectly, does not exist, or the network provider is not currently available. Please try retyping the path or contact your network administrator.
//


//
// MessageId: ERROR_BAD_PROVIDER
//
// MessageText:
//
// The specified network provider name is invalid.
//


//
// MessageId: ERROR_CANNOT_OPEN_PROFILE
//
// MessageText:
//
// Unable to open the network connection profile.
//


//
// MessageId: ERROR_BAD_PROFILE
//
// MessageText:
//
// The network connection profile is corrupted.
//


//
// MessageId: ERROR_NOT_CONTAINER
//
// MessageText:
//
// Cannot enumerate a noncontainer.
//


//
// MessageId: ERROR_EXTENDED_ERROR
//
// MessageText:
//
// An extended error has occurred.
//


//
// MessageId: ERROR_INVALID_GROUPNAME
//
// MessageText:
//
// The format of the specified group name is invalid.
//


//
// MessageId: ERROR_INVALID_COMPUTERNAME
//
// MessageText:
//
// The format of the specified computer name is invalid.
//


//
// MessageId: ERROR_INVALID_EVENTNAME
//
// MessageText:
//
// The format of the specified event name is invalid.
//


//
// MessageId: ERROR_INVALID_DOMAINNAME
//
// MessageText:
//
// The format of the specified domain name is invalid.
//


//
// MessageId: ERROR_INVALID_SERVICENAME
//
// MessageText:
//
// The format of the specified service name is invalid.
//


//
// MessageId: ERROR_INVALID_NETNAME
//
// MessageText:
//
// The format of the specified network name is invalid.
//


//
// MessageId: ERROR_INVALID_SHARENAME
//
// MessageText:
//
// The format of the specified share name is invalid.
//


//
// MessageId: ERROR_INVALID_PASSWORDNAME
//
// MessageText:
//
// The format of the specified password is invalid.
//


//
// MessageId: ERROR_INVALID_MESSAGENAME
//
// MessageText:
//
// The format of the specified message name is invalid.
//


//
// MessageId: ERROR_INVALID_MESSAGEDEST
//
// MessageText:
//
// The format of the specified message destination is invalid.
//


//
// MessageId: ERROR_SESSION_CREDENTIAL_CONFLICT
//
// MessageText:
//
// Multiple connections to a server or shared resource by the same user, using more than one user name, are not allowed. Disconnect all previous connections to the server or shared resource and try again.
//


//
// MessageId: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.
//


//
// MessageId: ERROR_DUP_DOMAINNAME
//
// MessageText:
//
// The workgroup or domain name is already in use by another computer on the network.
//


//
// MessageId: ERROR_NO_NETWORK
//
// MessageText:
//
// The network is not present or not started.
//


//
// MessageId: ERROR_CANCELLED
//
// MessageText:
//
// The operation was canceled by the user.
//


//
// MessageId: ERROR_USER_MAPPED_FILE
//
// MessageText:
//
// The requested operation cannot be performed on a file with a user-mapped section open.
//


//
// MessageId: ERROR_CONNECTION_REFUSED
//
// MessageText:
//
// The remote computer refused the network connection.
//


//
// MessageId: ERROR_GRACEFUL_DISCONNECT
//
// MessageText:
//
// The network connection was gracefully closed.
//


//
// MessageId: ERROR_ADDRESS_ALREADY_ASSOCIATED
//
// MessageText:
//
// The network transport endpoint already has an address associated with it.
//


//
// MessageId: ERROR_ADDRESS_NOT_ASSOCIATED
//
// MessageText:
//
// An address has not yet been associated with the network endpoint.
//


//
// MessageId: ERROR_CONNECTION_INVALID
//
// MessageText:
//
// An operation was attempted on a nonexistent network connection.
//


//
// MessageId: ERROR_CONNECTION_ACTIVE
//
// MessageText:
//
// An invalid operation was attempted on an active network connection.
//


//
// MessageId: ERROR_NETWORK_UNREACHABLE
//
// MessageText:
//
// The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//


//
// MessageId: ERROR_HOST_UNREACHABLE
//
// MessageText:
//
// The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//


//
// MessageId: ERROR_PROTOCOL_UNREACHABLE
//
// MessageText:
//
// The network location cannot be reached. For information about network troubleshooting, see Windows Help.
//


//
// MessageId: ERROR_PORT_UNREACHABLE
//
// MessageText:
//
// No service is operating at the destination network endpoint on the remote system.
//


//
// MessageId: ERROR_REQUEST_ABORTED
//
// MessageText:
//
// The request was aborted.
//


//
// MessageId: ERROR_CONNECTION_ABORTED
//
// MessageText:
//
// The network connection was aborted by the local system.
//


//
// MessageId: ERROR_RETRY
//
// MessageText:
//
// The operation could not be completed. A retry should be performed.
//


//
// MessageId: ERROR_CONNECTION_COUNT_LIMIT
//
// MessageText:
//
// A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.
//


//
// MessageId: ERROR_LOGIN_TIME_RESTRICTION
//
// MessageText:
//
// Attempting to log in during an unauthorized time of day for this account.
//


//
// MessageId: ERROR_LOGIN_WKSTA_RESTRICTION
//
// MessageText:
//
// The account is not authorized to log in from this station.
//


//
// MessageId: ERROR_INCORRECT_ADDRESS
//
// MessageText:
//
// The network address could not be used for the operation requested.
//


//
// MessageId: ERROR_ALREADY_REGISTERED
//
// MessageText:
//
// The service is already registered.
//


//
// MessageId: ERROR_SERVICE_NOT_FOUND
//
// MessageText:
//
// The specified service does not exist.
//


//
// MessageId: ERROR_NOT_AUTHENTICATED
//
// MessageText:
//
// The operation being requested was not performed because the user has not been authenticated.
//


//
// MessageId: ERROR_NOT_LOGGED_ON
//
// MessageText:
//
// The operation being requested was not performed because the user has not logged on to the network.
// The specified service does not exist.
//


//
// MessageId: ERROR_CONTINUE
//
// MessageText:
//
// Continue with work in progress.
//


//
// MessageId: ERROR_ALREADY_INITIALIZED
//
// MessageText:
//
// An attempt was made to perform an initialization operation when initialization has already been completed.
//


//
// MessageId: ERROR_NO_MORE_DEVICES
//
// MessageText:
//
// No more local devices.
//


//
// MessageId: ERROR_NO_SUCH_SITE
//
// MessageText:
//
// The specified site does not exist.
//


//
// MessageId: ERROR_DOMAIN_CONTROLLER_EXISTS
//
// MessageText:
//
// A domain controller with the specified name already exists.
//


//
// MessageId: ERROR_ONLY_IF_CONNECTED
//
// MessageText:
//
// This operation is supported only when you are connected to the server.
//


//
// MessageId: ERROR_OVERRIDE_NOCHANGES
//
// MessageText:
//
// The group policy framework should call the extension even if there are no changes.
//


//
// MessageId: ERROR_BAD_USER_PROFILE
//
// MessageText:
//
// The specified user does not have a valid profile.
//


//
// MessageId: ERROR_NOT_SUPPORTED_ON_SBS
//
// MessageText:
//
// This operation is not supported on a computer running Windows Server 2003 for Small Business Server
//


//
// MessageId: ERROR_SERVER_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// The server machine is shutting down.
//


//
// MessageId: ERROR_HOST_DOWN
//
// MessageText:
//
// The remote system is not available. For information about network troubleshooting, see Windows Help.
//


//
// MessageId: ERROR_NON_ACCOUNT_SID
//
// MessageText:
//
// The security identifier provided is not from an account domain.
//


//
// MessageId: ERROR_NON_DOMAIN_SID
//
// MessageText:
//
// The security identifier provided does not have a domain component.
//


//
// MessageId: ERROR_APPHELP_BLOCK
//
// MessageText:
//
// AppHelp dialog canceled thus preventing the application from starting.
//


//
// MessageId: ERROR_ACCESS_DISABLED_BY_POLICY
//
// MessageText:
//
// This program is blocked by group policy. For more information, contact your system administrator.
//


//
// MessageId: ERROR_REG_NAT_CONSUMPTION
//
// MessageText:
//
// A program attempt to use an invalid register value. Normally caused by an uninitialized register. This error is Itanium specific.
//


//
// MessageId: ERROR_CSCSHARE_OFFLINE
//
// MessageText:
//
// The share is currently offline or does not exist.
//


//
// MessageId: ERROR_PKINIT_FAILURE
//
// MessageText:
//
// The kerberos protocol encountered an error while validating the KDC certificate during smartcard logon. There is more information in the system event log.
//


//
// MessageId: ERROR_SMARTCARD_SUBSYSTEM_FAILURE
//
// MessageText:
//
// The kerberos protocol encountered an error while attempting to utilize the smartcard subsystem.
//


//
// MessageId: ERROR_DOWNGRADE_DETECTED
//
// MessageText:
//
// The system detected a possible attempt to compromise security. Please ensure that you can contact the server that authenticated you.
//


//
// Do not use ID's 1266 - 1270 as the symbolicNames have been moved to SEC_E_*
//
//
// MessageId: ERROR_MACHINE_LOCKED
//
// MessageText:
//
// The machine is locked and cannot be shut down without the force option.
//


//
// MessageId: ERROR_CALLBACK_SUPPLIED_INVALID_DATA
//
// MessageText:
//
// An application-defined callback gave invalid data when called.
//


//
// MessageId: ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED
//
// MessageText:
//
// The group policy framework should call the extension in the synchronous foreground policy refresh.
//


//
// MessageId: ERROR_DRIVER_BLOCKED
//
// MessageText:
//
// This driver has been blocked from loading
//


//
// MessageId: ERROR_INVALID_IMPORT_OF_NON_DLL
//
// MessageText:
//
// A dynamic link library (DLL) referenced a module that was neither a DLL nor the process's executable image.
//


//
// MessageId: ERROR_ACCESS_DISABLED_WEBBLADE
//
// MessageText:
//
// Windows cannot open this program since it has been disabled.
//


//
// MessageId: ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER
//
// MessageText:
//
// Windows cannot open this program because the license enforcement system has been tampered with or become corrupted.
//


//
// MessageId: ERROR_RECOVERY_FAILURE
//
// MessageText:
//
// A transaction recover failed.
//


//
// MessageId: ERROR_ALREADY_FIBER
//
// MessageText:
//
// The current thread has already been converted to a fiber.
//


//
// MessageId: ERROR_ALREADY_THREAD
//
// MessageText:
//
// The current thread has already been converted from a fiber.
//


//
// MessageId: ERROR_STACK_BUFFER_OVERRUN
//
// MessageText:
//
// The system detected an overrun of a stack-based buffer in this application. This overrun could potentially allow a malicious user to gain control of this application.
//


//
// MessageId: ERROR_PARAMETER_QUOTA_EXCEEDED
//
// MessageText:
//
// Data present in one of the parameters is more than the function can operate on.
//


//
// MessageId: ERROR_DEBUGGER_INACTIVE
//
// MessageText:
//
// An attempt to do an operation on a debug object failed because the object is in the process of being deleted.
//


//
// MessageId: ERROR_DELAY_LOAD_FAILED
//
// MessageText:
//
// An attempt to delay-load a .dll or get a function address in a delay-loaded .dll failed.
//


//
// MessageId: ERROR_VDM_DISALLOWED
//
// MessageText:
//
// %1 is a 16-bit application. You do not have permissions to execute 16-bit applications. Check your permissions with your system administrator.
//


//
// MessageId: ERROR_UNIDENTIFIED_ERROR
//
// MessageText:
//
// Insufficient information exists to identify the cause of failure.
//


//
// MessageId: ERROR_INVALID_CRUNTIME_PARAMETER
//
// MessageText:
//
// The parameter passed to a C runtime function is incorrect.
//


//
// MessageId: ERROR_BEYOND_VDL
//
// MessageText:
//
// The operation occurred beyond the valid data length of the file.
//


//
// MessageId: ERROR_INCOMPATIBLE_SERVICE_SID_TYPE
//
// MessageText:
//
// The service start failed since one or more services in the same process have an incompatible service SID type setting. A service with restricted service SID type can only coexist in the same process with other services with a restricted SID type. If the service SID type for this service was just configured, the hosting process must be restarted in order to start this service.
//


//
// MessageId: ERROR_DRIVER_PROCESS_TERMINATED
//
// MessageText:
//
// The process hosting the driver for this device has been terminated.
//


//
// MessageId: ERROR_IMPLEMENTATION_LIMIT
//
// MessageText:
//
// An operation attempted to exceed an implementation-defined limit.
//


//
// MessageId: ERROR_PROCESS_IS_PROTECTED
//
// MessageText:
//
// Either the target process, or the target thread's containing process, is a protected process.
//


//
// MessageId: ERROR_SERVICE_NOTIFY_CLIENT_LAGGING
//
// MessageText:
//
// The service notification client is lagging too far behind the current state of services in the machine.
//


//
// MessageId: ERROR_DISK_QUOTA_EXCEEDED
//
// MessageText:
//
// The requested file operation failed because the storage quota was exceeded.
// To free up disk space, move files to a different location or delete unnecessary files. For more information, contact your system administrator.
//


//
// MessageId: ERROR_CONTENT_BLOCKED
//
// MessageText:
//
// The requested file operation failed because the storage policy blocks that type of file. For more information, contact your system administrator.
//


//
// MessageId: ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE
//
// MessageText:
//
// A privilege that the service requires to function properly does not exist in the service account configuration.
// You may use the Services Microsoft Management Console (MMC) snap-in (services.msc) and the Local Security Settings MMC snap-in (secpol.msc) to view the service configuration and the account configuration.
//



///////////////////////////////////////////////////
//                                               //
//             SECURITY Error codes              //
//                                               //
//                 1299 to 1399                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_LABEL
//
// MessageText:
//
// Indicates a particular Security ID may not be assigned as the label of an object.
//


//
// MessageId: ERROR_NOT_ALL_ASSIGNED
//
// MessageText:
//
// Not all privileges or groups referenced are assigned to the caller.
//


//
// MessageId: ERROR_SOME_NOT_MAPPED
//
// MessageText:
//
// Some mapping between account names and security IDs was not done.
//


//
// MessageId: ERROR_NO_QUOTAS_FOR_ACCOUNT
//
// MessageText:
//
// No system quota limits are specifically set for this account.
//


//
// MessageId: ERROR_LOCAL_USER_SESSION_KEY
//
// MessageText:
//
// No encryption key is available. A well-known encryption key was returned.
//


//
// MessageId: ERROR_NULL_LM_PASSWORD
//
// MessageText:
//
// The password is too complex to be converted to a LAN Manager password. The LAN Manager password returned is a NULL string.
//


//
// MessageId: ERROR_UNKNOWN_REVISION
//
// MessageText:
//
// The revision level is unknown.
//


//
// MessageId: ERROR_REVISION_MISMATCH
//
// MessageText:
//
// Indicates two revision levels are incompatible.
//


//
// MessageId: ERROR_INVALID_OWNER
//
// MessageText:
//
// This security ID may not be assigned as the owner of this object.
//


//
// MessageId: ERROR_INVALID_PRIMARY_GROUP
//
// MessageText:
//
// This security ID may not be assigned as the primary group of an object.
//


//
// MessageId: ERROR_NO_IMPERSONATION_TOKEN
//
// MessageText:
//
// An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating a client.
//


//
// MessageId: ERROR_CANT_DISABLE_MANDATORY
//
// MessageText:
//
// The group may not be disabled.
//


//
// MessageId: ERROR_NO_LOGON_SERVERS
//
// MessageText:
//
// There are currently no logon servers available to service the logon request.
//


//
// MessageId: ERROR_NO_SUCH_LOGON_SESSION
//
// MessageText:
//
// A specified logon session does not exist. It may already have been terminated.
//


//
// MessageId: ERROR_NO_SUCH_PRIVILEGE
//
// MessageText:
//
// A specified privilege does not exist.
//


//
// MessageId: ERROR_PRIVILEGE_NOT_HELD
//
// MessageText:
//
// A required privilege is not held by the client.
//


//
// MessageId: ERROR_INVALID_ACCOUNT_NAME
//
// MessageText:
//
// The name provided is not a properly formed account name.
//


//
// MessageId: ERROR_USER_EXISTS
//
// MessageText:
//
// The specified account already exists.
//


//
// MessageId: ERROR_NO_SUCH_USER
//
// MessageText:
//
// The specified account does not exist.
//


//
// MessageId: ERROR_GROUP_EXISTS
//
// MessageText:
//
// The specified group already exists.
//


//
// MessageId: ERROR_NO_SUCH_GROUP
//
// MessageText:
//
// The specified group does not exist.
//


//
// MessageId: ERROR_MEMBER_IN_GROUP
//
// MessageText:
//
// Either the specified user account is already a member of the specified group, or the specified group cannot be deleted because it contains a member.
//


//
// MessageId: ERROR_MEMBER_NOT_IN_GROUP
//
// MessageText:
//
// The specified user account is not a member of the specified group account.
//


//
// MessageId: ERROR_LAST_ADMIN
//
// MessageText:
//
// The last remaining administration account cannot be disabled or deleted.
//


//
// MessageId: ERROR_WRONG_PASSWORD
//
// MessageText:
//
// Unable to update the password. The value provided as the current password is incorrect.
//


//
// MessageId: ERROR_ILL_FORMED_PASSWORD
//
// MessageText:
//
// Unable to update the password. The value provided for the new password contains values that are not allowed in passwords.
//


//
// MessageId: ERROR_PASSWORD_RESTRICTION
//
// MessageText:
//
// Unable to update the password. The value provided for the new password does not meet the length, complexity, or history requirements of the domain.
//


//
// MessageId: ERROR_LOGON_FAILURE
//
// MessageText:
//
// Logon failure: unknown user name or bad password.
//


//
// MessageId: ERROR_ACCOUNT_RESTRICTION
//
// MessageText:
//
// Logon failure: user account restriction. Possible reasons are blank passwords not allowed, logon hour restrictions, or a policy restriction has been enforced.
//


//
// MessageId: ERROR_INVALID_LOGON_HOURS
//
// MessageText:
//
// Logon failure: account logon time restriction violation.
//


//
// MessageId: ERROR_INVALID_WORKSTATION
//
// MessageText:
//
// Logon failure: user not allowed to log on to this computer.
//


//
// MessageId: ERROR_PASSWORD_EXPIRED
//
// MessageText:
//
// Logon failure: the specified account password has expired.
//


//
// MessageId: ERROR_ACCOUNT_DISABLED
//
// MessageText:
//
// Logon failure: account currently disabled.
//


//
// MessageId: ERROR_NONE_MAPPED
//
// MessageText:
//
// No mapping between account names and security IDs was done.
//


//
// MessageId: ERROR_TOO_MANY_LUIDS_REQUESTED
//
// MessageText:
//
// Too many local user identifiers (LUIDs) were requested at one time.
//


//
// MessageId: ERROR_LUIDS_EXHAUSTED
//
// MessageText:
//
// No more local user identifiers (LUIDs) are available.
//


//
// MessageId: ERROR_INVALID_SUB_AUTHORITY
//
// MessageText:
//
// The subauthority part of a security ID is invalid for this particular use.
//


//
// MessageId: ERROR_INVALID_ACL
//
// MessageText:
//
// The access control list (ACL) structure is invalid.
//


//
// MessageId: ERROR_INVALID_SID
//
// MessageText:
//
// The security ID structure is invalid.
//


//
// MessageId: ERROR_INVALID_SECURITY_DESCR
//
// MessageText:
//
// The security descriptor structure is invalid.
//


//
// MessageId: ERROR_BAD_INHERITANCE_ACL
//
// MessageText:
//
// The inherited access control list (ACL) or access control entry (ACE) could not be built.
//


//
// MessageId: ERROR_SERVER_DISABLED
//
// MessageText:
//
// The server is currently disabled.
//


//
// MessageId: ERROR_SERVER_NOT_DISABLED
//
// MessageText:
//
// The server is currently enabled.
//


//
// MessageId: ERROR_INVALID_ID_AUTHORITY
//
// MessageText:
//
// The value provided was an invalid value for an identifier authority.
//


//
// MessageId: ERROR_ALLOTTED_SPACE_EXCEEDED
//
// MessageText:
//
// No more memory is available for security information updates.
//


//
// MessageId: ERROR_INVALID_GROUP_ATTRIBUTES
//
// MessageText:
//
// The specified attributes are invalid, or incompatible with the attributes for the group as a whole.
//


//
// MessageId: ERROR_BAD_IMPERSONATION_LEVEL
//
// MessageText:
//
// Either a required impersonation level was not provided, or the provided impersonation level is invalid.
//


//
// MessageId: ERROR_CANT_OPEN_ANONYMOUS
//
// MessageText:
//
// Cannot open an anonymous level security token.
//


//
// MessageId: ERROR_BAD_VALIDATION_CLASS
//
// MessageText:
//
// The validation information class requested was invalid.
//


//
// MessageId: ERROR_BAD_TOKEN_TYPE
//
// MessageText:
//
// The type of the token is inappropriate for its attempted use.
//


//
// MessageId: ERROR_NO_SECURITY_ON_OBJECT
//
// MessageText:
//
// Unable to perform a security operation on an object that has no associated security.
//


//
// MessageId: ERROR_CANT_ACCESS_DOMAIN_INFO
//
// MessageText:
//
// Configuration information could not be read from the domain controller, either because the machine is unavailable, or access has been denied.
//


//
// MessageId: ERROR_INVALID_SERVER_STATE
//
// MessageText:
//
// The security account manager (SAM) or local security authority (LSA) server was in the wrong state to perform the security operation.
//


//
// MessageId: ERROR_INVALID_DOMAIN_STATE
//
// MessageText:
//
// The domain was in the wrong state to perform the security operation.
//


//
// MessageId: ERROR_INVALID_DOMAIN_ROLE
//
// MessageText:
//
// This operation is only allowed for the Primary Domain Controller of the domain.
//


//
// MessageId: ERROR_NO_SUCH_DOMAIN
//
// MessageText:
//
// The specified domain either does not exist or could not be contacted.
//


//
// MessageId: ERROR_DOMAIN_EXISTS
//
// MessageText:
//
// The specified domain already exists.
//


//
// MessageId: ERROR_DOMAIN_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to exceed the limit on the number of domains per server.
//


//
// MessageId: ERROR_INTERNAL_DB_CORRUPTION
//
// MessageText:
//
// Unable to complete the requested operation because of either a catastrophic media failure or a data structure corruption on the disk.
//


//
// MessageId: ERROR_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred.
//


//
// MessageId: ERROR_GENERIC_NOT_MAPPED
//
// MessageText:
//
// Generic access types were contained in an access mask which should already be mapped to nongeneric types.
//


//
// MessageId: ERROR_BAD_DESCRIPTOR_FORMAT
//
// MessageText:
//
// A security descriptor is not in the right format (absolute or self-relative).
//


//
// MessageId: ERROR_NOT_LOGON_PROCESS
//
// MessageText:
//
// The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.
//


//
// MessageId: ERROR_LOGON_SESSION_EXISTS
//
// MessageText:
//
// Cannot start a new logon session with an ID that is already in use.
//


//
// MessageId: ERROR_NO_SUCH_PACKAGE
//
// MessageText:
//
// A specified authentication package is unknown.
//


//
// MessageId: ERROR_BAD_LOGON_SESSION_STATE
//
// MessageText:
//
// The logon session is not in a state that is consistent with the requested operation.
//


//
// MessageId: ERROR_LOGON_SESSION_COLLISION
//
// MessageText:
//
// The logon session ID is already in use.
//


//
// MessageId: ERROR_INVALID_LOGON_TYPE
//
// MessageText:
//
// A logon request contained an invalid logon type value.
//


//
// MessageId: ERROR_CANNOT_IMPERSONATE
//
// MessageText:
//
// Unable to impersonate using a named pipe until data has been read from that pipe.
//


//
// MessageId: ERROR_RXACT_INVALID_STATE
//
// MessageText:
//
// The transaction state of a registry subtree is incompatible with the requested operation.
//


//
// MessageId: ERROR_RXACT_COMMIT_FAILURE
//
// MessageText:
//
// An internal security database corruption has been encountered.
//


//
// MessageId: ERROR_SPECIAL_ACCOUNT
//
// MessageText:
//
// Cannot perform this operation on built-in accounts.
//


//
// MessageId: ERROR_SPECIAL_GROUP
//
// MessageText:
//
// Cannot perform this operation on this built-in special group.
//


//
// MessageId: ERROR_SPECIAL_USER
//
// MessageText:
//
// Cannot perform this operation on this built-in special user.
//


//
// MessageId: ERROR_MEMBERS_PRIMARY_GROUP
//
// MessageText:
//
// The user cannot be removed from a group because the group is currently the user's primary group.
//


//
// MessageId: ERROR_TOKEN_ALREADY_IN_USE
//
// MessageText:
//
// The token is already in use as a primary token.
//


//
// MessageId: ERROR_NO_SUCH_ALIAS
//
// MessageText:
//
// The specified local group does not exist.
//


//
// MessageId: ERROR_MEMBER_NOT_IN_ALIAS
//
// MessageText:
//
// The specified account name is not a member of the group.
//


//
// MessageId: ERROR_MEMBER_IN_ALIAS
//
// MessageText:
//
// The specified account name is already a member of the group.
//


//
// MessageId: ERROR_ALIAS_EXISTS
//
// MessageText:
//
// The specified local group already exists.
//


//
// MessageId: ERROR_LOGON_NOT_GRANTED
//
// MessageText:
//
// Logon failure: the user has not been granted the requested logon type at this computer.
//


//
// MessageId: ERROR_TOO_MANY_SECRETS
//
// MessageText:
//
// The maximum number of secrets that may be stored in a single system has been exceeded.
//


//
// MessageId: ERROR_SECRET_TOO_LONG
//
// MessageText:
//
// The length of a secret exceeds the maximum length allowed.
//


//
// MessageId: ERROR_INTERNAL_DB_ERROR
//
// MessageText:
//
// The local security authority database contains an internal inconsistency.
//


//
// MessageId: ERROR_TOO_MANY_CONTEXT_IDS
//
// MessageText:
//
// During a logon attempt, the user's security context accumulated too many security IDs.
//


//
// MessageId: ERROR_LOGON_TYPE_NOT_GRANTED
//
// MessageText:
//
// Logon failure: the user has not been granted the requested logon type at this computer.
//


//
// MessageId: ERROR_NT_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
// A cross-encrypted password is necessary to change a user password.
//


//
// MessageId: ERROR_NO_SUCH_MEMBER
//
// MessageText:
//
// A member could not be added to or removed from the local group because the member does not exist.
//


//
// MessageId: ERROR_INVALID_MEMBER
//
// MessageText:
//
// A new member could not be added to a local group because the member has the wrong account type.
//


//
// MessageId: ERROR_TOO_MANY_SIDS
//
// MessageText:
//
// Too many security IDs have been specified.
//


//
// MessageId: ERROR_LM_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
// A cross-encrypted password is necessary to change this user password.
//


//
// MessageId: ERROR_NO_INHERITANCE
//
// MessageText:
//
// Indicates an ACL contains no inheritable components.
//


//
// MessageId: ERROR_FILE_CORRUPT
//
// MessageText:
//
// The file or directory is corrupted and unreadable.
//


//
// MessageId: ERROR_DISK_CORRUPT
//
// MessageText:
//
// The disk structure is corrupted and unreadable.
//


//
// MessageId: ERROR_NO_USER_SESSION_KEY
//
// MessageText:
//
// There is no user session key for the specified logon session.
//


//
// MessageId: ERROR_LICENSE_QUOTA_EXCEEDED
//
// MessageText:
//
// The service being accessed is licensed for a particular number of connections.
// No more connections can be made to the service at this time because there are already as many connections as the service can accept.
//


//
// MessageId: ERROR_WRONG_TARGET_NAME
//
// MessageText:
//
// Logon Failure: The target account name is incorrect.
//


//
// MessageId: ERROR_MUTUAL_AUTH_FAILED
//
// MessageText:
//
// Mutual Authentication failed. The server's password is out of date at the domain controller.
//


//
// MessageId: ERROR_TIME_SKEW
//
// MessageText:
//
// There is a time and/or date difference between the client and server.
//


//
// MessageId: ERROR_CURRENT_DOMAIN_NOT_ALLOWED
//
// MessageText:
//
// This operation cannot be performed on the current domain.
//



///////////////////////////////////////////////////
//                                               //
//              WinUser Error codes              //
//                                               //
//                 1400 to 1499                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_WINDOW_HANDLE
//
// MessageText:
//
// Invalid window handle.
//


//
// MessageId: ERROR_INVALID_MENU_HANDLE
//
// MessageText:
//
// Invalid menu handle.
//


//
// MessageId: ERROR_INVALID_CURSOR_HANDLE
//
// MessageText:
//
// Invalid cursor handle.
//


//
// MessageId: ERROR_INVALID_ACCEL_HANDLE
//
// MessageText:
//
// Invalid accelerator table handle.
//


//
// MessageId: ERROR_INVALID_HOOK_HANDLE
//
// MessageText:
//
// Invalid hook handle.
//


//
// MessageId: ERROR_INVALID_DWP_HANDLE
//
// MessageText:
//
// Invalid handle to a multiple-window position structure.
//


//
// MessageId: ERROR_TLW_WITH_WSCHILD
//
// MessageText:
//
// Cannot create a top-level child window.
//


//
// MessageId: ERROR_CANNOT_FIND_WND_CLASS
//
// MessageText:
//
// Cannot find window class.
//


//
// MessageId: ERROR_WINDOW_OF_OTHER_THREAD
//
// MessageText:
//
// Invalid window; it belongs to other thread.
//


//
// MessageId: ERROR_HOTKEY_ALREADY_REGISTERED
//
// MessageText:
//
// Hot key is already registered.
//


//
// MessageId: ERROR_CLASS_ALREADY_EXISTS
//
// MessageText:
//
// Class already exists.
//


//
// MessageId: ERROR_CLASS_DOES_NOT_EXIST
//
// MessageText:
//
// Class does not exist.
//


//
// MessageId: ERROR_CLASS_HAS_WINDOWS
//
// MessageText:
//
// Class still has open windows.
//


//
// MessageId: ERROR_INVALID_INDEX
//
// MessageText:
//
// Invalid index.
//


//
// MessageId: ERROR_INVALID_ICON_HANDLE
//
// MessageText:
//
// Invalid icon handle.
//


//
// MessageId: ERROR_PRIVATE_DIALOG_INDEX
//
// MessageText:
//
// Using private DIALOG window words.
//


//
// MessageId: ERROR_LISTBOX_ID_NOT_FOUND
//
// MessageText:
//
// The list box identifier was not found.
//


//
// MessageId: ERROR_NO_WILDCARD_CHARACTERS
//
// MessageText:
//
// No wildcards were found.
//


//
// MessageId: ERROR_CLIPBOARD_NOT_OPEN
//
// MessageText:
//
// Thread does not have a clipboard open.
//


//
// MessageId: ERROR_HOTKEY_NOT_REGISTERED
//
// MessageText:
//
// Hot key is not registered.
//


//
// MessageId: ERROR_WINDOW_NOT_DIALOG
//
// MessageText:
//
// The window is not a valid dialog window.
//


//
// MessageId: ERROR_CONTROL_ID_NOT_FOUND
//
// MessageText:
//
// Control ID not found.
//


//
// MessageId: ERROR_INVALID_COMBOBOX_MESSAGE
//
// MessageText:
//
// Invalid message for a combo box because it does not have an edit control.
//


//
// MessageId: ERROR_WINDOW_NOT_COMBOBOX
//
// MessageText:
//
// The window is not a combo box.
//


//
// MessageId: ERROR_INVALID_EDIT_HEIGHT
//
// MessageText:
//
// Height must be less than 256.
//


//
// MessageId: ERROR_DC_NOT_FOUND
//
// MessageText:
//
// Invalid device context (DC) handle.
//


//
// MessageId: ERROR_INVALID_HOOK_FILTER
//
// MessageText:
//
// Invalid hook procedure type.
//


//
// MessageId: ERROR_INVALID_FILTER_PROC
//
// MessageText:
//
// Invalid hook procedure.
//


//
// MessageId: ERROR_HOOK_NEEDS_HMOD
//
// MessageText:
//
// Cannot set nonlocal hook without a module handle.
//


//
// MessageId: ERROR_GLOBAL_ONLY_HOOK
//
// MessageText:
//
// This hook procedure can only be set globally.
//


//
// MessageId: ERROR_JOURNAL_HOOK_SET
//
// MessageText:
//
// The journal hook procedure is already installed.
//


//
// MessageId: ERROR_HOOK_NOT_INSTALLED
//
// MessageText:
//
// The hook procedure is not installed.
//


//
// MessageId: ERROR_INVALID_LB_MESSAGE
//
// MessageText:
//
// Invalid message for single-selection list box.
//


//
// MessageId: ERROR_SETCOUNT_ON_BAD_LB
//
// MessageText:
//
// LB_SETCOUNT sent to non-lazy list box.
//


//
// MessageId: ERROR_LB_WITHOUT_TABSTOPS
//
// MessageText:
//
// This list box does not support tab stops.
//


//
// MessageId: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD
//
// MessageText:
//
// Cannot destroy object created by another thread.
//


//
// MessageId: ERROR_CHILD_WINDOW_MENU
//
// MessageText:
//
// Child windows cannot have menus.
//


//
// MessageId: ERROR_NO_SYSTEM_MENU
//
// MessageText:
//
// The window does not have a system menu.
//


//
// MessageId: ERROR_INVALID_MSGBOX_STYLE
//
// MessageText:
//
// Invalid message box style.
//


//
// MessageId: ERROR_INVALID_SPI_VALUE
//
// MessageText:
//
// Invalid system-wide (SPI_*) parameter.
//


//
// MessageId: ERROR_SCREEN_ALREADY_LOCKED
//
// MessageText:
//
// Screen already locked.
//


//
// MessageId: ERROR_HWNDS_HAVE_DIFF_PARENT
//
// MessageText:
//
// All handles to windows in a multiple-window position structure must have the same parent.
//


//
// MessageId: ERROR_NOT_CHILD_WINDOW
//
// MessageText:
//
// The window is not a child window.
//


//
// MessageId: ERROR_INVALID_GW_COMMAND
//
// MessageText:
//
// Invalid GW_* command.
//


//
// MessageId: ERROR_INVALID_THREAD_ID
//
// MessageText:
//
// Invalid thread identifier.
//


//
// MessageId: ERROR_NON_MDICHILD_WINDOW
//
// MessageText:
//
// Cannot process a message from a window that is not a multiple document interface (MDI) window.
//


//
// MessageId: ERROR_POPUP_ALREADY_ACTIVE
//
// MessageText:
//
// Popup menu already active.
//


//
// MessageId: ERROR_NO_SCROLLBARS
//
// MessageText:
//
// The window does not have scroll bars.
//


//
// MessageId: ERROR_INVALID_SCROLLBAR_RANGE
//
// MessageText:
//
// Scroll bar range cannot be greater than MAXLONG.
//


//
// MessageId: ERROR_INVALID_SHOWWIN_COMMAND
//
// MessageText:
//
// Cannot show or remove the window in the way specified.
//


//
// MessageId: ERROR_NO_SYSTEM_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the requested service.
//


//
// MessageId: ERROR_NONPAGED_SYSTEM_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the requested service.
//


//
// MessageId: ERROR_PAGED_SYSTEM_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the requested service.
//


//
// MessageId: ERROR_WORKING_SET_QUOTA
//
// MessageText:
//
// Insufficient quota to complete the requested service.
//


//
// MessageId: ERROR_PAGEFILE_QUOTA
//
// MessageText:
//
// Insufficient quota to complete the requested service.
//


//
// MessageId: ERROR_COMMITMENT_LIMIT
//
// MessageText:
//
// The paging file is too small for this operation to complete.
//


//
// MessageId: ERROR_MENU_ITEM_NOT_FOUND
//
// MessageText:
//
// A menu item was not found.
//


//
// MessageId: ERROR_INVALID_KEYBOARD_HANDLE
//
// MessageText:
//
// Invalid keyboard layout handle.
//


//
// MessageId: ERROR_HOOK_TYPE_NOT_ALLOWED
//
// MessageText:
//
// Hook type not allowed.
//


//
// MessageId: ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION
//
// MessageText:
//
// This operation requires an interactive window station.
//


//
// MessageId: ERROR_TIMEOUT
//
// MessageText:
//
// This operation returned because the timeout period expired.
//


//
// MessageId: ERROR_INVALID_MONITOR_HANDLE
//
// MessageText:
//
// Invalid monitor handle.
//


//
// MessageId: ERROR_INCORRECT_SIZE
//
// MessageText:
//
//  Incorrect size argument.
//


//
// MessageId: ERROR_SYMLINK_CLASS_DISABLED
//
// MessageText:
//
// The symbolic link cannot be followed because its type is disabled.
//


//
// MessageId: ERROR_SYMLINK_NOT_SUPPORTED
//
// MessageText:
//
// This application does not support the current operation on symbolic links.
//


//
// MessageId: ERROR_XML_PARSE_ERROR
//
// MessageText:
//
// Windows was unable to parse the requested XML data.
//


//
// MessageId: ERROR_XMLDSIG_ERROR
//
// MessageText:
//
// An error was encountered while processing an XML digital signature.
//


//
// MessageId: ERROR_RESTART_APPLICATION
//
// MessageText:
//
// This application must be restarted.
//


//
// MessageId: ERROR_WRONG_COMPARTMENT
//
// MessageText:
//
// The caller made the connection request in the wrong routing compartment.
//


//
// MessageId: ERROR_AUTHIP_FAILURE
//
// MessageText:
//
// There was an AuthIP failure when attempting to connect to the remote host.
//



///////////////////////////////////////////////////
//                                               //
//             EventLog Error codes              //
//                                               //
//                 1500 to 1549                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_EVENTLOG_FILE_CORRUPT
//
// MessageText:
//
// The event log file is corrupted.
//


//
// MessageId: ERROR_EVENTLOG_CANT_START
//
// MessageText:
//
// No event log file could be opened, so the event logging service did not start.
//


//
// MessageId: ERROR_LOG_FILE_FULL
//
// MessageText:
//
// The event log file is full.
//


//
// MessageId: ERROR_EVENTLOG_FILE_CHANGED
//
// MessageText:
//
// The event log file has changed between read operations.
//



///////////////////////////////////////////////////
//                                               //
//            Class Scheduler Error codes        //
//                                               //
//                 1550 to 1599                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_TASK_NAME
//
// MessageText:
//
// The specified task name is invalid.
//


//
// MessageId: ERROR_INVALID_TASK_INDEX
//
// MessageText:
//
// The specified task index is invalid.
//


//
// MessageId: ERROR_THREAD_ALREADY_IN_TASK
//
// MessageText:
//
// The specified thread is already joining a task.
//



///////////////////////////////////////////////////
//                                               //
//                MSI Error codes                //
//                                               //
//                 1600 to 1699                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INSTALL_SERVICE_FAILURE
//
// MessageText:
//
// The Windows Installer Service could not be accessed. This can occur if the Windows Installer is not correctly installed. Contact your support personnel for assistance.
//


//
// MessageId: ERROR_INSTALL_USEREXIT
//
// MessageText:
//
// User cancelled installation.
//


//
// MessageId: ERROR_INSTALL_FAILURE
//
// MessageText:
//
// Fatal error during installation.
//


//
// MessageId: ERROR_INSTALL_SUSPEND
//
// MessageText:
//
// Installation suspended, incomplete.
//


//
// MessageId: ERROR_UNKNOWN_PRODUCT
//
// MessageText:
//
// This action is only valid for products that are currently installed.
//


//
// MessageId: ERROR_UNKNOWN_FEATURE
//
// MessageText:
//
// Feature ID not registered.
//


//
// MessageId: ERROR_UNKNOWN_COMPONENT
//
// MessageText:
//
// Component ID not registered.
//


//
// MessageId: ERROR_UNKNOWN_PROPERTY
//
// MessageText:
//
// Unknown property.
//


//
// MessageId: ERROR_INVALID_HANDLE_STATE
//
// MessageText:
//
// Handle is in an invalid state.
//


//
// MessageId: ERROR_BAD_CONFIGURATION
//
// MessageText:
//
// The configuration data for this product is corrupt. Contact your support personnel.
//


//
// MessageId: ERROR_INDEX_ABSENT
//
// MessageText:
//
// Component qualifier not present.
//


//
// MessageId: ERROR_INSTALL_SOURCE_ABSENT
//
// MessageText:
//
// The installation source for this product is not available. Verify that the source exists and that you can access it.
//


//
// MessageId: ERROR_INSTALL_PACKAGE_VERSION
//
// MessageText:
//
// This installation package cannot be installed by the Windows Installer service. You must install a Windows service pack that contains a newer version of the Windows Installer service.
//


//
// MessageId: ERROR_PRODUCT_UNINSTALLED
//
// MessageText:
//
// Product is uninstalled.
//


//
// MessageId: ERROR_BAD_QUERY_SYNTAX
//
// MessageText:
//
// SQL query syntax invalid or unsupported.
//


//
// MessageId: ERROR_INVALID_FIELD
//
// MessageText:
//
// Record field does not exist.
//


//
// MessageId: ERROR_DEVICE_REMOVED
//
// MessageText:
//
// The device has been removed.
//


//
// MessageId: ERROR_INSTALL_ALREADY_RUNNING
//
// MessageText:
//
// Another installation is already in progress. Complete that installation before proceeding with this install.
//


//
// MessageId: ERROR_INSTALL_PACKAGE_OPEN_FAILED
//
// MessageText:
//
// This installation package could not be opened. Verify that the package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer package.
//


//
// MessageId: ERROR_INSTALL_PACKAGE_INVALID
//
// MessageText:
//
// This installation package could not be opened. Contact the application vendor to verify that this is a valid Windows Installer package.
//


//
// MessageId: ERROR_INSTALL_UI_FAILURE
//
// MessageText:
//
// There was an error starting the Windows Installer service user interface. Contact your support personnel.
//


//
// MessageId: ERROR_INSTALL_LOG_FAILURE
//
// MessageText:
//
// Error opening installation log file. Verify that the specified log file location exists and that you can write to it.
//


//
// MessageId: ERROR_INSTALL_LANGUAGE_UNSUPPORTED
//
// MessageText:
//
// The language of this installation package is not supported by your system.
//


//
// MessageId: ERROR_INSTALL_TRANSFORM_FAILURE
//
// MessageText:
//
// Error applying transforms. Verify that the specified transform paths are valid.
//


//
// MessageId: ERROR_INSTALL_PACKAGE_REJECTED
//
// MessageText:
//
// This installation is forbidden by system policy. Contact your system administrator.
//


//
// MessageId: ERROR_FUNCTION_NOT_CALLED
//
// MessageText:
//
// Function could not be executed.
//


//
// MessageId: ERROR_FUNCTION_FAILED
//
// MessageText:
//
// Function failed during execution.
//


//
// MessageId: ERROR_INVALID_TABLE
//
// MessageText:
//
// Invalid or unknown table specified.
//


//
// MessageId: ERROR_DATATYPE_MISMATCH
//
// MessageText:
//
// Data supplied is of wrong type.
//


//
// MessageId: ERROR_UNSUPPORTED_TYPE
//
// MessageText:
//
// Data of this type is not supported.
//


//
// MessageId: ERROR_CREATE_FAILED
//
// MessageText:
//
// The Windows Installer service failed to start. Contact your support personnel.
//


//
// MessageId: ERROR_INSTALL_TEMP_UNWRITABLE
//
// MessageText:
//
// The Temp folder is on a drive that is full or is inaccessible. Free up space on the drive or verify that you have write permission on the Temp folder.
//


//
// MessageId: ERROR_INSTALL_PLATFORM_UNSUPPORTED
//
// MessageText:
//
// This installation package is not supported by this processor type. Contact your product vendor.
//


//
// MessageId: ERROR_INSTALL_NOTUSED
//
// MessageText:
//
// Component not used on this computer.
//


//
// MessageId: ERROR_PATCH_PACKAGE_OPEN_FAILED
//
// MessageText:
//
// This update package could not be opened. Verify that the update package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer update package.
//


//
// MessageId: ERROR_PATCH_PACKAGE_INVALID
//
// MessageText:
//
// This update package could not be opened. Contact the application vendor to verify that this is a valid Windows Installer update package.
//


//
// MessageId: ERROR_PATCH_PACKAGE_UNSUPPORTED
//
// MessageText:
//
// This update package cannot be processed by the Windows Installer service. You must install a Windows service pack that contains a newer version of the Windows Installer service.
//


//
// MessageId: ERROR_PRODUCT_VERSION
//
// MessageText:
//
// Another version of this product is already installed. Installation of this version cannot continue. To configure or remove the existing version of this product, use Add/Remove Programs on the Control Panel.
//


//
// MessageId: ERROR_INVALID_COMMAND_LINE
//
// MessageText:
//
// Invalid command line argument. Consult the Windows Installer SDK for detailed command line help.
//


//
// MessageId: ERROR_INSTALL_REMOTE_DISALLOWED
//
// MessageText:
//
// Only administrators have permission to add, remove, or configure server software during a Terminal services remote session. If you want to install or configure software on the server, contact your network administrator.
//


//
// MessageId: ERROR_SUCCESS_REBOOT_INITIATED
//
// MessageText:
//
// The requested operation completed successfully. The system will be restarted so the changes can take effect.
//


//
// MessageId: ERROR_PATCH_TARGET_NOT_FOUND
//
// MessageText:
//
// The upgrade cannot be installed by the Windows Installer service because the program to be upgraded may be missing, or the upgrade may update a different version of the program. Verify that the program to be upgraded exists on your computer and that you have the correct upgrade.
//


//
// MessageId: ERROR_PATCH_PACKAGE_REJECTED
//
// MessageText:
//
// The update package is not permitted by software restriction policy.
//


//
// MessageId: ERROR_INSTALL_TRANSFORM_REJECTED
//
// MessageText:
//
// One or more customizations are not permitted by software restriction policy.
//


//
// MessageId: ERROR_INSTALL_REMOTE_PROHIBITED
//
// MessageText:
//
// The Windows Installer does not permit installation from a Remote Desktop Connection.
//


//
// MessageId: ERROR_PATCH_REMOVAL_UNSUPPORTED
//
// MessageText:
//
// Uninstallation of the update package is not supported.
//


//
// MessageId: ERROR_UNKNOWN_PATCH
//
// MessageText:
//
// The update is not applied to this product.
//


//
// MessageId: ERROR_PATCH_NO_SEQUENCE
//
// MessageText:
//
// No valid sequence could be found for the set of updates.
//


//
// MessageId: ERROR_PATCH_REMOVAL_DISALLOWED
//
// MessageText:
//
// Update removal was disallowed by policy.
//


//
// MessageId: ERROR_INVALID_PATCH_XML
//
// MessageText:
//
// The XML update data is invalid.
//


//
// MessageId: ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT
//
// MessageText:
//
// Windows Installer does not permit updating of managed advertised products. At least one feature of the product must be installed before applying the update.
//


//
// MessageId: ERROR_INSTALL_SERVICE_SAFEBOOT
//
// MessageText:
//
// The Windows Installer service is not accessible in Safe Mode. Please try again when your computer is not in Safe Mode or you can use System Restore to return your machine to a previous good state.
//



///////////////////////////////////////////////////
//                                               //
//               RPC Error codes                 //
//                                               //
//                 1700 to 1999                  //
///////////////////////////////////////////////////

//
// MessageId: RPC_S_INVALID_STRING_BINDING
//
// MessageText:
//
// The string binding is invalid.
//


//
// MessageId: RPC_S_WRONG_KIND_OF_BINDING
//
// MessageText:
//
// The binding handle is not the correct type.
//


//
// MessageId: RPC_S_INVALID_BINDING
//
// MessageText:
//
// The binding handle is invalid.
//


//
// MessageId: RPC_S_PROTSEQ_NOT_SUPPORTED
//
// MessageText:
//
// The RPC protocol sequence is not supported.
//


//
// MessageId: RPC_S_INVALID_RPC_PROTSEQ
//
// MessageText:
//
// The RPC protocol sequence is invalid.
//


//
// MessageId: RPC_S_INVALID_STRING_UUID
//
// MessageText:
//
// The string universal unique identifier (UUID) is invalid.
//


//
// MessageId: RPC_S_INVALID_ENDPOINT_FORMAT
//
// MessageText:
//
// The endpoint format is invalid.
//


//
// MessageId: RPC_S_INVALID_NET_ADDR
//
// MessageText:
//
// The network address is invalid.
//


//
// MessageId: RPC_S_NO_ENDPOINT_FOUND
//
// MessageText:
//
// No endpoint was found.
//


//
// MessageId: RPC_S_INVALID_TIMEOUT
//
// MessageText:
//
// The timeout value is invalid.
//


//
// MessageId: RPC_S_OBJECT_NOT_FOUND
//
// MessageText:
//
// The object universal unique identifier (UUID) was not found.
//


//
// MessageId: RPC_S_ALREADY_REGISTERED
//
// MessageText:
//
// The object universal unique identifier (UUID) has already been registered.
//


//
// MessageId: RPC_S_TYPE_ALREADY_REGISTERED
//
// MessageText:
//
// The type universal unique identifier (UUID) has already been registered.
//


//
// MessageId: RPC_S_ALREADY_LISTENING
//
// MessageText:
//
// The RPC server is already listening.
//


//
// MessageId: RPC_S_NO_PROTSEQS_REGISTERED
//
// MessageText:
//
// No protocol sequences have been registered.
//


//
// MessageId: RPC_S_NOT_LISTENING
//
// MessageText:
//
// The RPC server is not listening.
//


//
// MessageId: RPC_S_UNKNOWN_MGR_TYPE
//
// MessageText:
//
// The manager type is unknown.
//


//
// MessageId: RPC_S_UNKNOWN_IF
//
// MessageText:
//
// The interface is unknown.
//


//
// MessageId: RPC_S_NO_BINDINGS
//
// MessageText:
//
// There are no bindings.
//


//
// MessageId: RPC_S_NO_PROTSEQS
//
// MessageText:
//
// There are no protocol sequences.
//


//
// MessageId: RPC_S_CANT_CREATE_ENDPOINT
//
// MessageText:
//
// The endpoint cannot be created.
//


//
// MessageId: RPC_S_OUT_OF_RESOURCES
//
// MessageText:
//
// Not enough resources are available to complete this operation.
//


//
// MessageId: RPC_S_SERVER_UNAVAILABLE
//
// MessageText:
//
// The RPC server is unavailable.
//


//
// MessageId: RPC_S_SERVER_TOO_BUSY
//
// MessageText:
//
// The RPC server is too busy to complete this operation.
//


//
// MessageId: RPC_S_INVALID_NETWORK_OPTIONS
//
// MessageText:
//
// The network options are invalid.
//


//
// MessageId: RPC_S_NO_CALL_ACTIVE
//
// MessageText:
//
// There are no remote procedure calls active on this thread.
//


//
// MessageId: RPC_S_CALL_FAILED
//
// MessageText:
//
// The remote procedure call failed.
//


//
// MessageId: RPC_S_CALL_FAILED_DNE
//
// MessageText:
//
// The remote procedure call failed and did not execute.
//


//
// MessageId: RPC_S_PROTOCOL_ERROR
//
// MessageText:
//
// A remote procedure call (RPC) protocol error occurred.
//


//
// MessageId: RPC_S_PROXY_ACCESS_DENIED
//
// MessageText:
//
// Access to the HTTP proxy is denied.
//


//
// MessageId: RPC_S_UNSUPPORTED_TRANS_SYN
//
// MessageText:
//
// The transfer syntax is not supported by the RPC server.
//


//
// MessageId: RPC_S_UNSUPPORTED_TYPE
//
// MessageText:
//
// The universal unique identifier (UUID) type is not supported.
//


//
// MessageId: RPC_S_INVALID_TAG
//
// MessageText:
//
// The tag is invalid.
//


//
// MessageId: RPC_S_INVALID_BOUND
//
// MessageText:
//
// The array bounds are invalid.
//


//
// MessageId: RPC_S_NO_ENTRY_NAME
//
// MessageText:
//
// The binding does not contain an entry name.
//


//
// MessageId: RPC_S_INVALID_NAME_SYNTAX
//
// MessageText:
//
// The name syntax is invalid.
//


//
// MessageId: RPC_S_UNSUPPORTED_NAME_SYNTAX
//
// MessageText:
//
// The name syntax is not supported.
//


//
// MessageId: RPC_S_UUID_NO_ADDRESS
//
// MessageText:
//
// No network address is available to use to construct a universal unique identifier (UUID).
//


//
// MessageId: RPC_S_DUPLICATE_ENDPOINT
//
// MessageText:
//
// The endpoint is a duplicate.
//


//
// MessageId: RPC_S_UNKNOWN_AUTHN_TYPE
//
// MessageText:
//
// The authentication type is unknown.
//


//
// MessageId: RPC_S_MAX_CALLS_TOO_SMALL
//
// MessageText:
//
// The maximum number of calls is too small.
//


//
// MessageId: RPC_S_STRING_TOO_LONG
//
// MessageText:
//
// The string is too long.
//


//
// MessageId: RPC_S_PROTSEQ_NOT_FOUND
//
// MessageText:
//
// The RPC protocol sequence was not found.
//


//
// MessageId: RPC_S_PROCNUM_OUT_OF_RANGE
//
// MessageText:
//
// The procedure number is out of range.
//


//
// MessageId: RPC_S_BINDING_HAS_NO_AUTH
//
// MessageText:
//
// The binding does not contain any authentication information.
//


//
// MessageId: RPC_S_UNKNOWN_AUTHN_SERVICE
//
// MessageText:
//
// The authentication service is unknown.
//


//
// MessageId: RPC_S_UNKNOWN_AUTHN_LEVEL
//
// MessageText:
//
// The authentication level is unknown.
//


//
// MessageId: RPC_S_INVALID_AUTH_IDENTITY
//
// MessageText:
//
// The security context is invalid.
//


//
// MessageId: RPC_S_UNKNOWN_AUTHZ_SERVICE
//
// MessageText:
//
// The authorization service is unknown.
//


//
// MessageId: EPT_S_INVALID_ENTRY
//
// MessageText:
//
// The entry is invalid.
//


//
// MessageId: EPT_S_CANT_PERFORM_OP
//
// MessageText:
//
// The server endpoint cannot perform the operation.
//


//
// MessageId: EPT_S_NOT_REGISTERED
//
// MessageText:
//
// There are no more endpoints available from the endpoint mapper.
//


//
// MessageId: RPC_S_NOTHING_TO_EXPORT
//
// MessageText:
//
// No interfaces have been exported.
//


//
// MessageId: RPC_S_INCOMPLETE_NAME
//
// MessageText:
//
// The entry name is incomplete.
//


//
// MessageId: RPC_S_INVALID_VERS_OPTION
//
// MessageText:
//
// The version option is invalid.
//


//
// MessageId: RPC_S_NO_MORE_MEMBERS
//
// MessageText:
//
// There are no more members.
//


//
// MessageId: RPC_S_NOT_ALL_OBJS_UNEXPORTED
//
// MessageText:
//
// There is nothing to unexport.
//


//
// MessageId: RPC_S_INTERFACE_NOT_FOUND
//
// MessageText:
//
// The interface was not found.
//


//
// MessageId: RPC_S_ENTRY_ALREADY_EXISTS
//
// MessageText:
//
// The entry already exists.
//


//
// MessageId: RPC_S_ENTRY_NOT_FOUND
//
// MessageText:
//
// The entry is not found.
//


//
// MessageId: RPC_S_NAME_SERVICE_UNAVAILABLE
//
// MessageText:
//
// The name service is unavailable.
//


//
// MessageId: RPC_S_INVALID_NAF_ID
//
// MessageText:
//
// The network address family is invalid.
//


//
// MessageId: RPC_S_CANNOT_SUPPORT
//
// MessageText:
//
// The requested operation is not supported.
//


//
// MessageId: RPC_S_NO_CONTEXT_AVAILABLE
//
// MessageText:
//
// No security context is available to allow impersonation.
//


//
// MessageId: RPC_S_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred in a remote procedure call (RPC).
//


//
// MessageId: RPC_S_ZERO_DIVIDE
//
// MessageText:
//
// The RPC server attempted an integer division by zero.
//


//
// MessageId: RPC_S_ADDRESS_ERROR
//
// MessageText:
//
// An addressing error occurred in the RPC server.
//


//
// MessageId: RPC_S_FP_DIV_ZERO
//
// MessageText:
//
// A floating-point operation at the RPC server caused a division by zero.
//


//
// MessageId: RPC_S_FP_UNDERFLOW
//
// MessageText:
//
// A floating-point underflow occurred at the RPC server.
//


//
// MessageId: RPC_S_FP_OVERFLOW
//
// MessageText:
//
// A floating-point overflow occurred at the RPC server.
//


//
// MessageId: RPC_X_NO_MORE_ENTRIES
//
// MessageText:
//
// The list of RPC servers available for the binding of auto handles has been exhausted.
//


//
// MessageId: RPC_X_SS_CHAR_TRANS_OPEN_FAIL
//
// MessageText:
//
// Unable to open the character translation table file.
//


//
// MessageId: RPC_X_SS_CHAR_TRANS_SHORT_FILE
//
// MessageText:
//
// The file containing the character translation table has fewer than 512 bytes.
//


//
// MessageId: RPC_X_SS_IN_NULL_CONTEXT
//
// MessageText:
//
// A null context handle was passed from the client to the host during a remote procedure call.
//


//
// MessageId: RPC_X_SS_CONTEXT_DAMAGED
//
// MessageText:
//
// The context handle changed during a remote procedure call.
//


//
// MessageId: RPC_X_SS_HANDLES_MISMATCH
//
// MessageText:
//
// The binding handles passed to a remote procedure call do not match.
//


//
// MessageId: RPC_X_SS_CANNOT_GET_CALL_HANDLE
//
// MessageText:
//
// The stub is unable to get the remote procedure call handle.
//


//
// MessageId: RPC_X_NULL_REF_POINTER
//
// MessageText:
//
// A null reference pointer was passed to the stub.
//


//
// MessageId: RPC_X_ENUM_VALUE_OUT_OF_RANGE
//
// MessageText:
//
// The enumeration value is out of range.
//


//
// MessageId: RPC_X_BYTE_COUNT_TOO_SMALL
//
// MessageText:
//
// The byte count is too small.
//


//
// MessageId: RPC_X_BAD_STUB_DATA
//
// MessageText:
//
// The stub received bad data.
//


//
// MessageId: ERROR_INVALID_USER_BUFFER
//
// MessageText:
//
// The supplied user buffer is not valid for the requested operation.
//


//
// MessageId: ERROR_UNRECOGNIZED_MEDIA
//
// MessageText:
//
// The disk media is not recognized. It may not be formatted.
//


//
// MessageId: ERROR_NO_TRUST_LSA_SECRET
//
// MessageText:
//
// The workstation does not have a trust secret.
//


//
// MessageId: ERROR_NO_TRUST_SAM_ACCOUNT
//
// MessageText:
//
// The security database on the server does not have a computer account for this workstation trust relationship.
//


//
// MessageId: ERROR_TRUSTED_DOMAIN_FAILURE
//
// MessageText:
//
// The trust relationship between the primary domain and the trusted domain failed.
//


//
// MessageId: ERROR_TRUSTED_RELATIONSHIP_FAILURE
//
// MessageText:
//
// The trust relationship between this workstation and the primary domain failed.
//


//
// MessageId: ERROR_TRUST_FAILURE
//
// MessageText:
//
// The network logon failed.
//


//
// MessageId: RPC_S_CALL_IN_PROGRESS
//
// MessageText:
//
// A remote procedure call is already in progress for this thread.
//


//
// MessageId: ERROR_NETLOGON_NOT_STARTED
//
// MessageText:
//
// An attempt was made to logon, but the network logon service was not started.
//


//
// MessageId: ERROR_ACCOUNT_EXPIRED
//
// MessageText:
//
// The user's account has expired.
//


//
// MessageId: ERROR_REDIRECTOR_HAS_OPEN_HANDLES
//
// MessageText:
//
// The redirector is in use and cannot be unloaded.
//


//
// MessageId: ERROR_PRINTER_DRIVER_ALREADY_INSTALLED
//
// MessageText:
//
// The specified printer driver is already installed.
//


//
// MessageId: ERROR_UNKNOWN_PORT
//
// MessageText:
//
// The specified port is unknown.
//


//
// MessageId: ERROR_UNKNOWN_PRINTER_DRIVER
//
// MessageText:
//
// The printer driver is unknown.
//


//
// MessageId: ERROR_UNKNOWN_PRINTPROCESSOR
//
// MessageText:
//
// The print processor is unknown.
//


//
// MessageId: ERROR_INVALID_SEPARATOR_FILE
//
// MessageText:
//
// The specified separator file is invalid.
//


//
// MessageId: ERROR_INVALID_PRIORITY
//
// MessageText:
//
// The specified priority is invalid.
//


//
// MessageId: ERROR_INVALID_PRINTER_NAME
//
// MessageText:
//
// The printer name is invalid.
//


//
// MessageId: ERROR_PRINTER_ALREADY_EXISTS
//
// MessageText:
//
// The printer already exists.
//


//
// MessageId: ERROR_INVALID_PRINTER_COMMAND
//
// MessageText:
//
// The printer command is invalid.
//


//
// MessageId: ERROR_INVALID_DATATYPE
//
// MessageText:
//
// The specified datatype is invalid.
//


//
// MessageId: ERROR_INVALID_ENVIRONMENT
//
// MessageText:
//
// The environment specified is invalid.
//


//
// MessageId: RPC_S_NO_MORE_BINDINGS
//
// MessageText:
//
// There are no more bindings.
//


//
// MessageId: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is an interdomain trust account. Use your global user account or local user account to access this server.
//


//
// MessageId: ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is a computer account. Use your global user account or local user account to access this server.
//


//
// MessageId: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is a server trust account. Use your global user account or local user account to access this server.
//


//
// MessageId: ERROR_DOMAIN_TRUST_INCONSISTENT
//
// MessageText:
//
// The name or security ID (SID) of the domain specified is inconsistent with the trust information for that domain.
//


//
// MessageId: ERROR_SERVER_HAS_OPEN_HANDLES
//
// MessageText:
//
// The server is in use and cannot be unloaded.
//


//
// MessageId: ERROR_RESOURCE_DATA_NOT_FOUND
//
// MessageText:
//
// The specified image file did not contain a resource section.
//


//
// MessageId: ERROR_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
// The specified resource type cannot be found in the image file.
//


//
// MessageId: ERROR_RESOURCE_NAME_NOT_FOUND
//
// MessageText:
//
// The specified resource name cannot be found in the image file.
//


//
// MessageId: ERROR_RESOURCE_LANG_NOT_FOUND
//
// MessageText:
//
// The specified resource language ID cannot be found in the image file.
//


//
// MessageId: ERROR_NOT_ENOUGH_QUOTA
//
// MessageText:
//
// Not enough quota is available to process this command.
//


//
// MessageId: RPC_S_NO_INTERFACES
//
// MessageText:
//
// No interfaces have been registered.
//


//
// MessageId: RPC_S_CALL_CANCELLED
//
// MessageText:
//
// The remote procedure call was cancelled.
//


//
// MessageId: RPC_S_BINDING_INCOMPLETE
//
// MessageText:
//
// The binding handle does not contain all required information.
//


//
// MessageId: RPC_S_COMM_FAILURE
//
// MessageText:
//
// A communications failure occurred during a remote procedure call.
//


//
// MessageId: RPC_S_UNSUPPORTED_AUTHN_LEVEL
//
// MessageText:
//
// The requested authentication level is not supported.
//


//
// MessageId: RPC_S_NO_PRINC_NAME
//
// MessageText:
//
// No principal name registered.
//


//
// MessageId: RPC_S_NOT_RPC_ERROR
//
// MessageText:
//
// The error specified is not a valid Windows RPC error code.
//


//
// MessageId: RPC_S_UUID_LOCAL_ONLY
//
// MessageText:
//
// A UUID that is valid only on this computer has been allocated.
//


//
// MessageId: RPC_S_SEC_PKG_ERROR
//
// MessageText:
//
// A security package specific error occurred.
//


//
// MessageId: RPC_S_NOT_CANCELLED
//
// MessageText:
//
// Thread is not canceled.
//


//
// MessageId: RPC_X_INVALID_ES_ACTION
//
// MessageText:
//
// Invalid operation on the encoding/decoding handle.
//


//
// MessageId: RPC_X_WRONG_ES_VERSION
//
// MessageText:
//
// Incompatible version of the serializing package.
//


//
// MessageId: RPC_X_WRONG_STUB_VERSION
//
// MessageText:
//
// Incompatible version of the RPC stub.
//


//
// MessageId: RPC_X_INVALID_PIPE_OBJECT
//
// MessageText:
//
// The RPC pipe object is invalid or corrupted.
//


//
// MessageId: RPC_X_WRONG_PIPE_ORDER
//
// MessageText:
//
// An invalid operation was attempted on an RPC pipe object.
//


//
// MessageId: RPC_X_WRONG_PIPE_VERSION
//
// MessageText:
//
// Unsupported RPC pipe version.
//


//
// MessageId: RPC_S_GROUP_MEMBER_NOT_FOUND
//
// MessageText:
//
// The group member was not found.
//


//
// MessageId: EPT_S_CANT_CREATE
//
// MessageText:
//
// The endpoint mapper database entry could not be created.
//


//
// MessageId: RPC_S_INVALID_OBJECT
//
// MessageText:
//
// The object universal unique identifier (UUID) is the nil UUID.
//


//
// MessageId: ERROR_INVALID_TIME
//
// MessageText:
//
// The specified time is invalid.
//


//
// MessageId: ERROR_INVALID_FORM_NAME
//
// MessageText:
//
// The specified form name is invalid.
//


//
// MessageId: ERROR_INVALID_FORM_SIZE
//
// MessageText:
//
// The specified form size is invalid.
//


//
// MessageId: ERROR_ALREADY_WAITING
//
// MessageText:
//
// The specified printer handle is already being waited on
//


//
// MessageId: ERROR_PRINTER_DELETED
//
// MessageText:
//
// The specified printer has been deleted.
//


//
// MessageId: ERROR_INVALID_PRINTER_STATE
//
// MessageText:
//
// The state of the printer is invalid.
//


//
// MessageId: ERROR_PASSWORD_MUST_CHANGE
//
// MessageText:
//
// The user's password must be changed before logging on the first time.
//


//
// MessageId: ERROR_DOMAIN_CONTROLLER_NOT_FOUND
//
// MessageText:
//
// Could not find the domain controller for this domain.
//


//
// MessageId: ERROR_ACCOUNT_LOCKED_OUT
//
// MessageText:
//
// The referenced account is currently locked out and may not be logged on to.
//


//
// MessageId: OR_INVALID_OXID
//
// MessageText:
//
// The object exporter specified was not found.
//


//
// MessageId: OR_INVALID_OID
//
// MessageText:
//
// The object specified was not found.
//


//
// MessageId: OR_INVALID_SET
//
// MessageText:
//
// The object resolver set specified was not found.
//


//
// MessageId: RPC_S_SEND_INCOMPLETE
//
// MessageText:
//
// Some data remains to be sent in the request buffer.
//


//
// MessageId: RPC_S_INVALID_ASYNC_HANDLE
//
// MessageText:
//
// Invalid asynchronous remote procedure call handle.
//


//
// MessageId: RPC_S_INVALID_ASYNC_CALL
//
// MessageText:
//
// Invalid asynchronous RPC call handle for this operation.
//


//
// MessageId: RPC_X_PIPE_CLOSED
//
// MessageText:
//
// The RPC pipe object has already been closed.
//


//
// MessageId: RPC_X_PIPE_DISCIPLINE_ERROR
//
// MessageText:
//
// The RPC call completed before all pipes were processed.
//


//
// MessageId: RPC_X_PIPE_EMPTY
//
// MessageText:
//
// No more data is available from the RPC pipe.
//


//
// MessageId: ERROR_NO_SITENAME
//
// MessageText:
//
// No site name is available for this machine.
//


//
// MessageId: ERROR_CANT_ACCESS_FILE
//
// MessageText:
//
// The file cannot be accessed by the system.
//


//
// MessageId: ERROR_CANT_RESOLVE_FILENAME
//
// MessageText:
//
// The name of the file cannot be resolved by the system.
//


//
// MessageId: RPC_S_ENTRY_TYPE_MISMATCH
//
// MessageText:
//
// The entry is not of the expected type.
//


//
// MessageId: RPC_S_NOT_ALL_OBJS_EXPORTED
//
// MessageText:
//
// Not all object UUIDs could be exported to the specified entry.
//


//
// MessageId: RPC_S_INTERFACE_NOT_EXPORTED
//
// MessageText:
//
// Interface could not be exported to the specified entry.
//


//
// MessageId: RPC_S_PROFILE_NOT_ADDED
//
// MessageText:
//
// The specified profile entry could not be added.
//


//
// MessageId: RPC_S_PRF_ELT_NOT_ADDED
//
// MessageText:
//
// The specified profile element could not be added.
//


//
// MessageId: RPC_S_PRF_ELT_NOT_REMOVED
//
// MessageText:
//
// The specified profile element could not be removed.
//


//
// MessageId: RPC_S_GRP_ELT_NOT_ADDED
//
// MessageText:
//
// The group element could not be added.
//


//
// MessageId: RPC_S_GRP_ELT_NOT_REMOVED
//
// MessageText:
//
// The group element could not be removed.
//


//
// MessageId: ERROR_KM_DRIVER_BLOCKED
//
// MessageText:
//
// The printer driver is not compatible with a policy enabled on your computer that blocks NT 4.0 drivers.
//


//
// MessageId: ERROR_CONTEXT_EXPIRED
//
// MessageText:
//
// The context has expired and can no longer be used.
//


//
// MessageId: ERROR_PER_USER_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The current user's delegated trust creation quota has been exceeded.
//


//
// MessageId: ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The total delegated trust creation quota has been exceeded.
//


//
// MessageId: ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The current user's delegated trust deletion quota has been exceeded.
//


//
// MessageId: ERROR_AUTHENTICATION_FIREWALL_FAILED
//
// MessageText:
//
// Logon Failure: The machine you are logging onto is protected by an authentication firewall. The specified account is not allowed to authenticate to the machine.
//


//
// MessageId: ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED
//
// MessageText:
//
// Remote connections to the Print Spooler are blocked by a policy set on your machine.
//


//
// MessageId: ERROR_NTLM_BLOCKED
//
// MessageText:
//
// Logon Failure: Authentication failed because NTLM authentication has been disabled. 
//



///////////////////////////////////////////////////
//                                               //
//              OpenGL Error codes               //
//                                               //
//                 2000 to 2009                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_PIXEL_FORMAT
//
// MessageText:
//
// The pixel format is invalid.
//


//
// MessageId: ERROR_BAD_DRIVER
//
// MessageText:
//
// The specified driver is invalid.
//


//
// MessageId: ERROR_INVALID_WINDOW_STYLE
//
// MessageText:
//
// The window style or class attribute is invalid for this operation.
//


//
// MessageId: ERROR_METAFILE_NOT_SUPPORTED
//
// MessageText:
//
// The requested metafile operation is not supported.
//


//
// MessageId: ERROR_TRANSFORM_NOT_SUPPORTED
//
// MessageText:
//
// The requested transformation operation is not supported.
//


//
// MessageId: ERROR_CLIPPING_NOT_SUPPORTED
//
// MessageText:
//
// The requested clipping operation is not supported.
//



///////////////////////////////////////////////////
//                                               //
//       Image Color Management Error codes      //
//                                               //
//                 2010 to 2049                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_CMM
//
// MessageText:
//
// The specified color management module is invalid.
//


//
// MessageId: ERROR_INVALID_PROFILE
//
// MessageText:
//
// The specified color profile is invalid.
//


//
// MessageId: ERROR_TAG_NOT_FOUND
//
// MessageText:
//
// The specified tag was not found.
//


//
// MessageId: ERROR_TAG_NOT_PRESENT
//
// MessageText:
//
// A required tag is not present.
//


//
// MessageId: ERROR_DUPLICATE_TAG
//
// MessageText:
//
// The specified tag is already present.
//


//
// MessageId: ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE
//
// MessageText:
//
// The specified color profile is not associated with the specified device.
//


//
// MessageId: ERROR_PROFILE_NOT_FOUND
//
// MessageText:
//
// The specified color profile was not found.
//


//
// MessageId: ERROR_INVALID_COLORSPACE
//
// MessageText:
//
// The specified color space is invalid.
//


//
// MessageId: ERROR_ICM_NOT_ENABLED
//
// MessageText:
//
// Image Color Management is not enabled.
//


//
// MessageId: ERROR_DELETING_ICM_XFORM
//
// MessageText:
//
// There was an error while deleting the color transform.
//


//
// MessageId: ERROR_INVALID_TRANSFORM
//
// MessageText:
//
// The specified color transform is invalid.
//


//
// MessageId: ERROR_COLORSPACE_MISMATCH
//
// MessageText:
//
// The specified transform does not match the bitmap's color space.
//


//
// MessageId: ERROR_INVALID_COLORINDEX
//
// MessageText:
//
// The specified named color index is not present in the profile.
//


//
// MessageId: ERROR_PROFILE_DOES_NOT_MATCH_DEVICE
//
// MessageText:
//
// The specified profile is intended for a device of a different type than the specified device.
//



///////////////////////////////////////////////////
//                                               //
//             Winnet32 Error codes              //
//                                               //
//                 2100 to 2999                  //
//                                               //
// The range 2100 through 2999 is reserved for   //
// network status codes. See lmerr.h for a       //
// complete listing                              //
///////////////////////////////////////////////////

//
// MessageId: ERROR_CONNECTED_OTHER_PASSWORD
//
// MessageText:
//
// The network connection was made successfully, but the user had to be prompted for a password other than the one originally specified.
//


//
// MessageId: ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT
//
// MessageText:
//
// The network connection was made successfully using default credentials.
//


//
// MessageId: ERROR_BAD_USERNAME
//
// MessageText:
//
// The specified username is invalid.
//


//
// MessageId: ERROR_NOT_CONNECTED
//
// MessageText:
//
// This network connection does not exist.
//


//
// MessageId: ERROR_OPEN_FILES
//
// MessageText:
//
// This network connection has files open or requests pending.
//


//
// MessageId: ERROR_ACTIVE_CONNECTIONS
//
// MessageText:
//
// Active connections still exist.
//


//
// MessageId: ERROR_DEVICE_IN_USE
//
// MessageText:
//
// The device is in use by an active process and cannot be disconnected.
//



///////////////////////////////////////////////////
//                                               //
//           Win32 Spooler Error codes           //
//                                               //
//                 3000 to 3049                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_UNKNOWN_PRINT_MONITOR
//
// MessageText:
//
// The specified print monitor is unknown.
//


//
// MessageId: ERROR_PRINTER_DRIVER_IN_USE
//
// MessageText:
//
// The specified printer driver is currently in use.
//


//
// MessageId: ERROR_SPOOL_FILE_NOT_FOUND
//
// MessageText:
//
// The spool file was not found.
//


//
// MessageId: ERROR_SPL_NO_STARTDOC
//
// MessageText:
//
// A StartDocPrinter call was not issued.
//


//
// MessageId: ERROR_SPL_NO_ADDJOB
//
// MessageText:
//
// An AddJob call was not issued.
//


//
// MessageId: ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED
//
// MessageText:
//
// The specified print processor has already been installed.
//


//
// MessageId: ERROR_PRINT_MONITOR_ALREADY_INSTALLED
//
// MessageText:
//
// The specified print monitor has already been installed.
//


//
// MessageId: ERROR_INVALID_PRINT_MONITOR
//
// MessageText:
//
// The specified print monitor does not have the required functions.
//


//
// MessageId: ERROR_PRINT_MONITOR_IN_USE
//
// MessageText:
//
// The specified print monitor is currently in use.
//


//
// MessageId: ERROR_PRINTER_HAS_JOBS_QUEUED
//
// MessageText:
//
// The requested operation is not allowed when there are jobs queued to the printer.
//


//
// MessageId: ERROR_SUCCESS_REBOOT_REQUIRED
//
// MessageText:
//
// The requested operation is successful. Changes will not be effective until the system is rebooted.
//


//
// MessageId: ERROR_SUCCESS_RESTART_REQUIRED
//
// MessageText:
//
// The requested operation is successful. Changes will not be effective until the service is restarted.
//


//
// MessageId: ERROR_PRINTER_NOT_FOUND
//
// MessageText:
//
// No printers were found.
//


//
// MessageId: ERROR_PRINTER_DRIVER_WARNED
//
// MessageText:
//
// The printer driver is known to be unreliable.
//


//
// MessageId: ERROR_PRINTER_DRIVER_BLOCKED
//
// MessageText:
//
// The printer driver is known to harm the system.
//


//
// MessageId: ERROR_PRINTER_DRIVER_PACKAGE_IN_USE
//
// MessageText:
//
// The specified printer driver package is currently in use.
//


//
// MessageId: ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND
//
// MessageText:
//
// Unable to find a core driver package that is required by the printer driver package.
//


//
// MessageId: ERROR_FAIL_REBOOT_REQUIRED
//
// MessageText:
//
// The requested operation failed. A system reboot is required to roll back changes made.
//


//
// MessageId: ERROR_FAIL_REBOOT_INITIATED
//
// MessageText:
//
// The requested operation failed. A system reboot has been initiated to roll back changes made.
//


//
// MessageId: ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED
//
// MessageText:
//
// The specified printer driver was not found on the system and needs to be downloaded.
//


//
// MessageId: ERROR_PRINT_JOB_RESTART_REQUIRED
//
// MessageText:
//
// The requested print job has failed to print. A print system update requires the job to be resubmitted.
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 3050 to 3899                  //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//                IO Error Codes                 //
//                                               //
//                 3900 to 3999                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_IO_REISSUE_AS_CACHED
//
// MessageText:
//
// Reissue the given operation as a cached IO operation
//




///////////////////////////////////////////////////
//                                               //
//                Wins Error codes               //
//                                               //
//                 4000 to 4049                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_WINS_INTERNAL
//
// MessageText:
//
// WINS encountered an error while processing the command.
//


//
// MessageId: ERROR_CAN_NOT_DEL_LOCAL_WINS
//
// MessageText:
//
// The local WINS cannot be deleted.
//


//
// MessageId: ERROR_STATIC_INIT
//
// MessageText:
//
// The importation from the file failed.
//


//
// MessageId: ERROR_INC_BACKUP
//
// MessageText:
//
// The backup failed. Was a full backup done before?
//


//
// MessageId: ERROR_FULL_BACKUP
//
// MessageText:
//
// The backup failed. Check the directory to which you are backing the database.
//


//
// MessageId: ERROR_REC_NON_EXISTENT
//
// MessageText:
//
// The name does not exist in the WINS database.
//


//
// MessageId: ERROR_RPL_NOT_ALLOWED
//
// MessageText:
//
// Replication with a nonconfigured partner is not allowed.
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4050 to 4099                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//               DHCP Error codes                //
//                                               //
//                 4100 to 4149                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_DHCP_ADDRESS_CONFLICT
//
// MessageText:
//
// The DHCP client has obtained an IP address that is already in use on the network. The local interface will be disabled until the DHCP client can obtain a new address.
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4150 to 4199                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//               WMI Error codes                 //
//                                               //
//                 4200 to 4249                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_WMI_GUID_NOT_FOUND
//
// MessageText:
//
// The GUID passed was not recognized as valid by a WMI data provider.
//


//
// MessageId: ERROR_WMI_INSTANCE_NOT_FOUND
//
// MessageText:
//
// The instance name passed was not recognized as valid by a WMI data provider.
//


//
// MessageId: ERROR_WMI_ITEMID_NOT_FOUND
//
// MessageText:
//
// The data item ID passed was not recognized as valid by a WMI data provider.
//


//
// MessageId: ERROR_WMI_TRY_AGAIN
//
// MessageText:
//
// The WMI request could not be completed and should be retried.
//


//
// MessageId: ERROR_WMI_DP_NOT_FOUND
//
// MessageText:
//
// The WMI data provider could not be located.
//


//
// MessageId: ERROR_WMI_UNRESOLVED_INSTANCE_REF
//
// MessageText:
//
// The WMI data provider references an instance set that has not been registered.
//


//
// MessageId: ERROR_WMI_ALREADY_ENABLED
//
// MessageText:
//
// The WMI data block or event notification has already been enabled.
//


//
// MessageId: ERROR_WMI_GUID_DISCONNECTED
//
// MessageText:
//
// The WMI data block is no longer available.
//


//
// MessageId: ERROR_WMI_SERVER_UNAVAILABLE
//
// MessageText:
//
// The WMI data service is not available.
//


//
// MessageId: ERROR_WMI_DP_FAILED
//
// MessageText:
//
// The WMI data provider failed to carry out the request.
//


//
// MessageId: ERROR_WMI_INVALID_MOF
//
// MessageText:
//
// The WMI MOF information is not valid.
//


//
// MessageId: ERROR_WMI_INVALID_REGINFO
//
// MessageText:
//
// The WMI registration information is not valid.
//


//
// MessageId: ERROR_WMI_ALREADY_DISABLED
//
// MessageText:
//
// The WMI data block or event notification has already been disabled.
//


//
// MessageId: ERROR_WMI_READ_ONLY
//
// MessageText:
//
// The WMI data item or data block is read only.
//


//
// MessageId: ERROR_WMI_SET_FAILURE
//
// MessageText:
//
// The WMI data item or data block could not be changed.
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4250 to 4299                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//        RSM (Media Services) Error codes       //
//                                               //
//                 4300 to 4349                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_MEDIA
//
// MessageText:
//
// The media identifier does not represent a valid medium.
//


//
// MessageId: ERROR_INVALID_LIBRARY
//
// MessageText:
//
// The library identifier does not represent a valid library.
//


//
// MessageId: ERROR_INVALID_MEDIA_POOL
//
// MessageText:
//
// The media pool identifier does not represent a valid media pool.
//


//
// MessageId: ERROR_DRIVE_MEDIA_MISMATCH
//
// MessageText:
//
// The drive and medium are not compatible or exist in different libraries.
//


//
// MessageId: ERROR_MEDIA_OFFLINE
//
// MessageText:
//
// The medium currently exists in an offline library and must be online to perform this operation.
//


//
// MessageId: ERROR_LIBRARY_OFFLINE
//
// MessageText:
//
// The operation cannot be performed on an offline library.
//


//
// MessageId: ERROR_EMPTY
//
// MessageText:
//
// The library, drive, or media pool is empty.
//


//
// MessageId: ERROR_NOT_EMPTY
//
// MessageText:
//
// The library, drive, or media pool must be empty to perform this operation.
//


//
// MessageId: ERROR_MEDIA_UNAVAILABLE
//
// MessageText:
//
// No media is currently available in this media pool or library.
//


//
// MessageId: ERROR_RESOURCE_DISABLED
//
// MessageText:
//
// A resource required for this operation is disabled.
//


//
// MessageId: ERROR_INVALID_CLEANER
//
// MessageText:
//
// The media identifier does not represent a valid cleaner.
//


//
// MessageId: ERROR_UNABLE_TO_CLEAN
//
// MessageText:
//
// The drive cannot be cleaned or does not support cleaning.
//


//
// MessageId: ERROR_OBJECT_NOT_FOUND
//
// MessageText:
//
// The object identifier does not represent a valid object.
//


//
// MessageId: ERROR_DATABASE_FAILURE
//
// MessageText:
//
// Unable to read from or write to the database.
//


//
// MessageId: ERROR_DATABASE_FULL
//
// MessageText:
//
// The database is full.
//


//
// MessageId: ERROR_MEDIA_INCOMPATIBLE
//
// MessageText:
//
// The medium is not compatible with the device or media pool.
//


//
// MessageId: ERROR_RESOURCE_NOT_PRESENT
//
// MessageText:
//
// The resource required for this operation does not exist.
//


//
// MessageId: ERROR_INVALID_OPERATION
//
// MessageText:
//
// The operation identifier is not valid.
//


//
// MessageId: ERROR_MEDIA_NOT_AVAILABLE
//
// MessageText:
//
// The media is not mounted or ready for use.
//


//
// MessageId: ERROR_DEVICE_NOT_AVAILABLE
//
// MessageText:
//
// The device is not ready for use.
//


//
// MessageId: ERROR_REQUEST_REFUSED
//
// MessageText:
//
// The operator or administrator has refused the request.
//


//
// MessageId: ERROR_INVALID_DRIVE_OBJECT
//
// MessageText:
//
// The drive identifier does not represent a valid drive.
//


//
// MessageId: ERROR_LIBRARY_FULL
//
// MessageText:
//
// Library is full. No slot is available for use.
//


//
// MessageId: ERROR_MEDIUM_NOT_ACCESSIBLE
//
// MessageText:
//
// The transport cannot access the medium.
//


//
// MessageId: ERROR_UNABLE_TO_LOAD_MEDIUM
//
// MessageText:
//
// Unable to load the medium into the drive.
//


//
// MessageId: ERROR_UNABLE_TO_INVENTORY_DRIVE
//
// MessageText:
//
// Unable to retrieve the drive status.
//


//
// MessageId: ERROR_UNABLE_TO_INVENTORY_SLOT
//
// MessageText:
//
// Unable to retrieve the slot status.
//


//
// MessageId: ERROR_UNABLE_TO_INVENTORY_TRANSPORT
//
// MessageText:
//
// Unable to retrieve status about the transport.
//


//
// MessageId: ERROR_TRANSPORT_FULL
//
// MessageText:
//
// Cannot use the transport because it is already in use.
//


//
// MessageId: ERROR_CONTROLLING_IEPORT
//
// MessageText:
//
// Unable to open or close the inject/eject port.
//


//
// MessageId: ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA
//
// MessageText:
//
// Unable to eject the medium because it is in a drive.
//


//
// MessageId: ERROR_CLEANER_SLOT_SET
//
// MessageText:
//
// A cleaner slot is already reserved.
//


//
// MessageId: ERROR_CLEANER_SLOT_NOT_SET
//
// MessageText:
//
// A cleaner slot is not reserved.
//


//
// MessageId: ERROR_CLEANER_CARTRIDGE_SPENT
//
// MessageText:
//
// The cleaner cartridge has performed the maximum number of drive cleanings.
//


//
// MessageId: ERROR_UNEXPECTED_OMID
//
// MessageText:
//
// Unexpected on-medium identifier.
//


//
// MessageId: ERROR_CANT_DELETE_LAST_ITEM
//
// MessageText:
//
// The last remaining item in this group or resource cannot be deleted.
//


//
// MessageId: ERROR_MESSAGE_EXCEEDS_MAX_SIZE
//
// MessageText:
//
// The message provided exceeds the maximum size allowed for this parameter.
//


//
// MessageId: ERROR_VOLUME_CONTAINS_SYS_FILES
//
// MessageText:
//
// The volume contains system or paging files.
//


//
// MessageId: ERROR_INDIGENOUS_TYPE
//
// MessageText:
//
// The media type cannot be removed from this library since at least one drive in the library reports it can support this media type.
//


//
// MessageId: ERROR_NO_SUPPORTING_DRIVES
//
// MessageText:
//
// This offline media cannot be mounted on this system since no enabled drives are present which can be used.
//


//
// MessageId: ERROR_CLEANER_CARTRIDGE_INSTALLED
//
// MessageText:
//
// A cleaner cartridge is present in the tape library.
//


//
// MessageId: ERROR_IEPORT_FULL
//
// MessageText:
//
// Cannot use the ieport because it is not empty.
//



///////////////////////////////////////////////////
//                                               //
//       Remote Storage Service Error codes      //
//                                               //
//                 4350 to 4389                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_FILE_OFFLINE
//
// MessageText:
//
// This file is currently not available for use on this computer.
//


//
// MessageId: ERROR_REMOTE_STORAGE_NOT_ACTIVE
//
// MessageText:
//
// The remote storage service is not operational at this time.
//


//
// MessageId: ERROR_REMOTE_STORAGE_MEDIA_ERROR
//
// MessageText:
//
// The remote storage service encountered a media error.
//



///////////////////////////////////////////////////
//                                               //
//           Reparse Point Error codes           //
//                                               //
//                 4390 to 4399                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_NOT_A_REPARSE_POINT
//
// MessageText:
//
// The file or directory is not a reparse point.
//


//
// MessageId: ERROR_REPARSE_ATTRIBUTE_CONFLICT
//
// MessageText:
//
// The reparse point attribute cannot be set because it conflicts with an existing attribute.
//


//
// MessageId: ERROR_INVALID_REPARSE_DATA
//
// MessageText:
//
// The data present in the reparse point buffer is invalid.
//


//
// MessageId: ERROR_REPARSE_TAG_INVALID
//
// MessageText:
//
// The tag present in the reparse point buffer is invalid.
//


//
// MessageId: ERROR_REPARSE_TAG_MISMATCH
//
// MessageText:
//
// There is a mismatch between the tag specified in the request and the tag present in the reparse point.
// 
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4400 to 4499                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//    Single Instance Store (SIS) Error codes    //
//                                               //
//                 4500 to 4549                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_VOLUME_NOT_SIS_ENABLED
//
// MessageText:
//
// Single Instance Storage is not available on this volume.
//


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 4550 to 4599                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//             Cluster Error codes               //
//                                               //
//                 5000 to 5999                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_DEPENDENT_RESOURCE_EXISTS
//
// MessageText:
//
// The operation cannot be completed because other resources are dependent on this resource.
//


//
// MessageId: ERROR_DEPENDENCY_NOT_FOUND
//
// MessageText:
//
// The cluster resource dependency cannot be found.
//


//
// MessageId: ERROR_DEPENDENCY_ALREADY_EXISTS
//
// MessageText:
//
// The cluster resource cannot be made dependent on the specified resource because it is already dependent.
//


//
// MessageId: ERROR_RESOURCE_NOT_ONLINE
//
// MessageText:
//
// The cluster resource is not online.
//


//
// MessageId: ERROR_HOST_NODE_NOT_AVAILABLE
//
// MessageText:
//
// A cluster node is not available for this operation.
//


//
// MessageId: ERROR_RESOURCE_NOT_AVAILABLE
//
// MessageText:
//
// The cluster resource is not available.
//


//
// MessageId: ERROR_RESOURCE_NOT_FOUND
//
// MessageText:
//
// The cluster resource could not be found.
//


//
// MessageId: ERROR_SHUTDOWN_CLUSTER
//
// MessageText:
//
// The cluster is being shut down.
//


//
// MessageId: ERROR_CANT_EVICT_ACTIVE_NODE
//
// MessageText:
//
// A cluster node cannot be evicted from the cluster unless the node is down or it is the last node.
//


//
// MessageId: ERROR_OBJECT_ALREADY_EXISTS
//
// MessageText:
//
// The object already exists.
//


//
// MessageId: ERROR_OBJECT_IN_LIST
//
// MessageText:
//
// The object is already in the list.
//


//
// MessageId: ERROR_GROUP_NOT_AVAILABLE
//
// MessageText:
//
// The cluster group is not available for any new requests.
//


//
// MessageId: ERROR_GROUP_NOT_FOUND
//
// MessageText:
//
// The cluster group could not be found.
//


//
// MessageId: ERROR_GROUP_NOT_ONLINE
//
// MessageText:
//
// The operation could not be completed because the cluster group is not online.
//


//
// MessageId: ERROR_HOST_NODE_NOT_RESOURCE_OWNER
//
// MessageText:
//
// The operation failed because either the specified cluster node is not the owner of the resource, or the node
// is not a possible owner of the resource.
//


//
// MessageId: ERROR_HOST_NODE_NOT_GROUP_OWNER
//
// MessageText:
//
// The operation failed because either the specified cluster node is not the owner of the group, or the node
// is not a possible owner of the group.
//


//
// MessageId: ERROR_RESMON_CREATE_FAILED
//
// MessageText:
//
// The cluster resource could not be created in the specified resource monitor.
//


//
// MessageId: ERROR_RESMON_ONLINE_FAILED
//
// MessageText:
//
// The cluster resource could not be brought online by the resource monitor.
//


//
// MessageId: ERROR_RESOURCE_ONLINE
//
// MessageText:
//
// The operation could not be completed because the cluster resource is online.
//


//
// MessageId: ERROR_QUORUM_RESOURCE
//
// MessageText:
//
// The cluster resource could not be deleted or brought offline because it is the quorum resource.
//


//
// MessageId: ERROR_NOT_QUORUM_CAPABLE
//
// MessageText:
//
// The cluster could not make the specified resource a quorum resource because it is not capable of being a quorum resource.
//


//
// MessageId: ERROR_CLUSTER_SHUTTING_DOWN
//
// MessageText:
//
// The cluster software is shutting down.
//


//
// MessageId: ERROR_INVALID_STATE
//
// MessageText:
//
// The group or resource is not in the correct state to perform the requested operation.
//


//
// MessageId: ERROR_RESOURCE_PROPERTIES_STORED
//
// MessageText:
//
// The properties were stored but not all changes will take effect until the next time the resource is brought online.
//


//
// MessageId: ERROR_NOT_QUORUM_CLASS
//
// MessageText:
//
// The cluster could not make the specified resource a quorum resource because it does not belong to a shared storage class.
//


//
// MessageId: ERROR_CORE_RESOURCE
//
// MessageText:
//
// The cluster resource could not be deleted since it is a core resource.
//


//
// MessageId: ERROR_QUORUM_RESOURCE_ONLINE_FAILED
//
// MessageText:
//
// The quorum resource failed to come online.
//


//
// MessageId: ERROR_QUORUMLOG_OPEN_FAILED
//
// MessageText:
//
// The quorum log could not be created or mounted successfully.
//


//
// MessageId: ERROR_CLUSTERLOG_CORRUPT
//
// MessageText:
//
// The cluster log is corrupt.
//


//
// MessageId: ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE
//
// MessageText:
//
// The record could not be written to the cluster log since it exceeds the maximum size.
//


//
// MessageId: ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE
//
// MessageText:
//
// The cluster log exceeds its maximum size.
//


//
// MessageId: ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND
//
// MessageText:
//
// No checkpoint record was found in the cluster log.
//


//
// MessageId: ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE
//
// MessageText:
//
// The minimum required disk space needed for logging is not available.
//


//
// MessageId: ERROR_QUORUM_OWNER_ALIVE
//
// MessageText:
//
// The cluster node failed to take control of the quorum resource because the resource is owned by another active node.
//


//
// MessageId: ERROR_NETWORK_NOT_AVAILABLE
//
// MessageText:
//
// A cluster network is not available for this operation.
//


//
// MessageId: ERROR_NODE_NOT_AVAILABLE
//
// MessageText:
//
// A cluster node is not available for this operation.
//


//
// MessageId: ERROR_ALL_NODES_NOT_AVAILABLE
//
// MessageText:
//
// All cluster nodes must be running to perform this operation.
//


//
// MessageId: ERROR_RESOURCE_FAILED
//
// MessageText:
//
// A cluster resource failed.
//


//
// MessageId: ERROR_CLUSTER_INVALID_NODE
//
// MessageText:
//
// The cluster node is not valid.
//


//
// MessageId: ERROR_CLUSTER_NODE_EXISTS
//
// MessageText:
//
// The cluster node already exists.
//


//
// MessageId: ERROR_CLUSTER_JOIN_IN_PROGRESS
//
// MessageText:
//
// A node is in the process of joining the cluster.
//


//
// MessageId: ERROR_CLUSTER_NODE_NOT_FOUND
//
// MessageText:
//
// The cluster node was not found.
//


//
// MessageId: ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND
//
// MessageText:
//
// The cluster local node information was not found.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_EXISTS
//
// MessageText:
//
// The cluster network already exists.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND
//
// MessageText:
//
// The cluster network was not found.
//


//
// MessageId: ERROR_CLUSTER_NETINTERFACE_EXISTS
//
// MessageText:
//
// The cluster network interface already exists.
//


//
// MessageId: ERROR_CLUSTER_NETINTERFACE_NOT_FOUND
//
// MessageText:
//
// The cluster network interface was not found.
//


//
// MessageId: ERROR_CLUSTER_INVALID_REQUEST
//
// MessageText:
//
// The cluster request is not valid for this object.
//


//
// MessageId: ERROR_CLUSTER_INVALID_NETWORK_PROVIDER
//
// MessageText:
//
// The cluster network provider is not valid.
//


//
// MessageId: ERROR_CLUSTER_NODE_DOWN
//
// MessageText:
//
// The cluster node is down.
//


//
// MessageId: ERROR_CLUSTER_NODE_UNREACHABLE
//
// MessageText:
//
// The cluster node is not reachable.
//


//
// MessageId: ERROR_CLUSTER_NODE_NOT_MEMBER
//
// MessageText:
//
// The cluster node is not a member of the cluster.
//


//
// MessageId: ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS
//
// MessageText:
//
// A cluster join operation is not in progress.
//


//
// MessageId: ERROR_CLUSTER_INVALID_NETWORK
//
// MessageText:
//
// The cluster network is not valid.
//


//
// MessageId: ERROR_CLUSTER_NODE_UP
//
// MessageText:
//
// The cluster node is up.
//


//
// MessageId: ERROR_CLUSTER_IPADDR_IN_USE
//
// MessageText:
//
// The cluster IP address is already in use.
//


//
// MessageId: ERROR_CLUSTER_NODE_NOT_PAUSED
//
// MessageText:
//
// The cluster node is not paused.
//


//
// MessageId: ERROR_CLUSTER_NO_SECURITY_CONTEXT
//
// MessageText:
//
// No cluster security context is available.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_INTERNAL
//
// MessageText:
//
// The cluster network is not configured for internal cluster communication.
//


//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_UP
//
// MessageText:
//
// The cluster node is already up.
//


//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_DOWN
//
// MessageText:
//
// The cluster node is already down.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_ALREADY_ONLINE
//
// MessageText:
//
// The cluster network is already online.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE
//
// MessageText:
//
// The cluster network is already offline.
//


//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_MEMBER
//
// MessageText:
//
// The cluster node is already a member of the cluster.
//


//
// MessageId: ERROR_CLUSTER_LAST_INTERNAL_NETWORK
//
// MessageText:
//
// The cluster network is the only one configured for internal cluster communication between two or more active cluster nodes. The internal communication capability cannot be removed from the network.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS
//
// MessageText:
//
// One or more cluster resources depend on the network to provide service to clients. The client access capability cannot be removed from the network.
//


//
// MessageId: ERROR_INVALID_OPERATION_ON_QUORUM
//
// MessageText:
//
// This operation cannot be performed on the cluster resource as it the quorum resource. You may not bring the quorum resource offline or modify its possible owners list.
//


//
// MessageId: ERROR_DEPENDENCY_NOT_ALLOWED
//
// MessageText:
//
// The cluster quorum resource is not allowed to have any dependencies.
//


//
// MessageId: ERROR_CLUSTER_NODE_PAUSED
//
// MessageText:
//
// The cluster node is paused.
//


//
// MessageId: ERROR_NODE_CANT_HOST_RESOURCE
//
// MessageText:
//
// The cluster resource cannot be brought online. The owner node cannot run this resource.
//


//
// MessageId: ERROR_CLUSTER_NODE_NOT_READY
//
// MessageText:
//
// The cluster node is not ready to perform the requested operation.
//


//
// MessageId: ERROR_CLUSTER_NODE_SHUTTING_DOWN
//
// MessageText:
//
// The cluster node is shutting down.
//


//
// MessageId: ERROR_CLUSTER_JOIN_ABORTED
//
// MessageText:
//
// The cluster join operation was aborted.
//


//
// MessageId: ERROR_CLUSTER_INCOMPATIBLE_VERSIONS
//
// MessageText:
//
// The cluster join operation failed due to incompatible software versions between the joining node and its sponsor.
//


//
// MessageId: ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED
//
// MessageText:
//
// This resource cannot be created because the cluster has reached the limit on the number of resources it can monitor.
//


//
// MessageId: ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED
//
// MessageText:
//
// The system configuration changed during the cluster join or form operation. The join or form operation was aborted.
//


//
// MessageId: ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
// The specified resource type was not found.
//


//
// MessageId: ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED
//
// MessageText:
//
// The specified node does not support a resource of this type. This may be due to version inconsistencies or due to the absence of the resource DLL on this node.
//


//
// MessageId: ERROR_CLUSTER_RESNAME_NOT_FOUND
//
// MessageText:
//
// The specified resource name is not supported by this resource DLL. This may be due to a bad (or changed) name supplied to the resource DLL.
//


//
// MessageId: ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED
//
// MessageText:
//
// No authentication package could be registered with the RPC server.
//


//
// MessageId: ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST
//
// MessageText:
//
// You cannot bring the group online because the owner of the group is not in the preferred list for the group. To change the owner node for the group, move the group.
//


//
// MessageId: ERROR_CLUSTER_DATABASE_SEQMISMATCH
//
// MessageText:
//
// The join operation failed because the cluster database sequence number has changed or is incompatible with the locker node. This may happen during a join operation if the cluster database was changing during the join.
//


//
// MessageId: ERROR_RESMON_INVALID_STATE
//
// MessageText:
//
// The resource monitor will not allow the fail operation to be performed while the resource is in its current state. This may happen if the resource is in a pending state.
//


//
// MessageId: ERROR_CLUSTER_GUM_NOT_LOCKER
//
// MessageText:
//
// A non locker code got a request to reserve the lock for making global updates.
//


//
// MessageId: ERROR_QUORUM_DISK_NOT_FOUND
//
// MessageText:
//
// The quorum disk could not be located by the cluster service.
//


//
// MessageId: ERROR_DATABASE_BACKUP_CORRUPT
//
// MessageText:
//
// The backed up cluster database is possibly corrupt.
//


//
// MessageId: ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT
//
// MessageText:
//
// A DFS root already exists in this cluster node.
//


//
// MessageId: ERROR_RESOURCE_PROPERTY_UNCHANGEABLE
//
// MessageText:
//
// An attempt to modify a resource property failed because it conflicts with another existing property.
//


/*
 Codes from 4300 through 5889 overlap with codes in ds\published\inc\apperr2.w.
 Do not add any more error codes in that range.
*/
//
// MessageId: ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE
//
// MessageText:
//
// An operation was attempted that is incompatible with the current membership state of the node.
//


//
// MessageId: ERROR_CLUSTER_QUORUMLOG_NOT_FOUND
//
// MessageText:
//
// The quorum resource does not contain the quorum log.
//


//
// MessageId: ERROR_CLUSTER_MEMBERSHIP_HALT
//
// MessageText:
//
// The membership engine requested shutdown of the cluster service on this node.
//


//
// MessageId: ERROR_CLUSTER_INSTANCE_ID_MISMATCH
//
// MessageText:
//
// The join operation failed because the cluster instance ID of the joining node does not match the cluster instance ID of the sponsor node.
//


//
// MessageId: ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP
//
// MessageText:
//
// A matching cluster network for the specified IP address could not be found.
//


//
// MessageId: ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH
//
// MessageText:
//
// The actual data type of the property did not match the expected data type of the property.
//


//
// MessageId: ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP
//
// MessageText:
//
// The cluster node was evicted from the cluster successfully, but the node was not cleaned up. To determine what cleanup steps failed and how to recover, see the Failover Clustering application event log using Event Viewer.
//


//
// MessageId: ERROR_CLUSTER_PARAMETER_MISMATCH
//
// MessageText:
//
// Two or more parameter values specified for a resource's properties are in conflict.
//


//
// MessageId: ERROR_NODE_CANNOT_BE_CLUSTERED
//
// MessageText:
//
// This computer cannot be made a member of a cluster.
//


//
// MessageId: ERROR_CLUSTER_WRONG_OS_VERSION
//
// MessageText:
//
// This computer cannot be made a member of a cluster because it does not have the correct version of Windows installed.
//


//
// MessageId: ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME
//
// MessageText:
//
// A cluster cannot be created with the specified cluster name because that cluster name is already in use. Specify a different name for the cluster.
//


//
// MessageId: ERROR_CLUSCFG_ALREADY_COMMITTED
//
// MessageText:
//
// The cluster configuration action has already been committed.
//


//
// MessageId: ERROR_CLUSCFG_ROLLBACK_FAILED
//
// MessageText:
//
// The cluster configuration action could not be rolled back.
//


//
// MessageId: ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT
//
// MessageText:
//
// The drive letter assigned to a system disk on one node conflicted with the drive letter assigned to a disk on another node.
//


//
// MessageId: ERROR_CLUSTER_OLD_VERSION
//
// MessageText:
//
// One or more nodes in the cluster are running a version of Windows that does not support this operation.
//


//
// MessageId: ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME
//
// MessageText:
//
// The name of the corresponding computer account doesn't match the Network Name for this resource.
//


//
// MessageId: ERROR_CLUSTER_NO_NET_ADAPTERS
//
// MessageText:
//
// No network adapters are available.
//


//
// MessageId: ERROR_CLUSTER_POISONED
//
// MessageText:
//
// The cluster node has been poisoned.
//


//
// MessageId: ERROR_CLUSTER_GROUP_MOVING
//
// MessageText:
//
// The group is unable to accept the request since it is moving to another node.
//


//
// MessageId: ERROR_CLUSTER_RESOURCE_TYPE_BUSY
//
// MessageText:
//
// The resource type cannot accept the request since is too busy performing another operation.
//


//
// MessageId: ERROR_RESOURCE_CALL_TIMED_OUT
//
// MessageText:
//
// The call to the cluster resource DLL timed out.
//


//
// MessageId: ERROR_INVALID_CLUSTER_IPV6_ADDRESS
//
// MessageText:
//
// The address is not valid for an IPv6 Address resource. A global IPv6 address is required, and it must match a cluster network. Compatibility addresses are not permitted.
//


//
// MessageId: ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION
//
// MessageText:
//
// An internal cluster error occurred. A call to an invalid function was attempted.
//


//
// MessageId: ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS
//
// MessageText:
//
// A parameter value is out of acceptable range.
//


//
// MessageId: ERROR_CLUSTER_PARTIAL_SEND
//
// MessageText:
//
// A network error occurred while sending data to another node in the cluster. The number of bytes transmitted was less than required.
//


//
// MessageId: ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION
//
// MessageText:
//
// An invalid cluster registry operation was attempted.
//


//
// MessageId: ERROR_CLUSTER_INVALID_STRING_TERMINATION
//
// MessageText:
//
// An input string of characters is not properly terminated.
//


//
// MessageId: ERROR_CLUSTER_INVALID_STRING_FORMAT
//
// MessageText:
//
// An input string of characters is not in a valid format for the data it represents.
//


//
// MessageId: ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS
//
// MessageText:
//
// An internal cluster error occurred. A cluster database transaction was attempted while a transaction was already in progress.
//


//
// MessageId: ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS
//
// MessageText:
//
// An internal cluster error occurred. There was an attempt to commit a cluster database transaction while no transaction was in progress.
//


//
// MessageId: ERROR_CLUSTER_NULL_DATA
//
// MessageText:
//
// An internal cluster error occurred. Data was not properly initialized.
//


//
// MessageId: ERROR_CLUSTER_PARTIAL_READ
//
// MessageText:
//
// An error occurred while reading from a stream of data. An unexpected number of bytes was returned.
//


//
// MessageId: ERROR_CLUSTER_PARTIAL_WRITE
//
// MessageText:
//
// An error occurred while writing to a stream of data. The required number of bytes could not be written.
//


//
// MessageId: ERROR_CLUSTER_CANT_DESERIALIZE_DATA
//
// MessageText:
//
// An error occurred while deserializing a stream of cluster data.
//


//
// MessageId: ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT
//
// MessageText:
//
// One or more property values for this resource are in conflict with one or more property values associated with its dependent resource(s).
//


//
// MessageId: ERROR_CLUSTER_NO_QUORUM
//
// MessageText:
//
// A quorum of cluster nodes was not present to form a cluster.
//


//
// MessageId: ERROR_CLUSTER_INVALID_IPV6_NETWORK
//
// MessageText:
//
// The cluster network is not valid for an IPv6 Address resource, or it does not match the configured address.
//


//
// MessageId: ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK
//
// MessageText:
//
// The cluster network is not valid for an IPv6 Tunnel resource. Check the configuration of the IP Address resource on which the IPv6 Tunnel resource depends.
//


//
// MessageId: ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP
//
// MessageText:
//
// Quorum resource cannot reside in the Available Storage group.
//


//
// MessageId: ERROR_DEPENDENCY_TREE_TOO_COMPLEX
//
// MessageText:
//
// The dependencies for this resource are nested too deeply.
//


//
// MessageId: ERROR_EXCEPTION_IN_RESOURCE_CALL
//
// MessageText:
//
// The call into the resource DLL raised an unhandled exception.
//


//
// MessageId: ERROR_CLUSTER_RHS_FAILED_INITIALIZATION
//
// MessageText:
//
// The RHS process failed to initialize.
//


//
// MessageId: ERROR_CLUSTER_NOT_INSTALLED
//
// MessageText:
//
// The Failover Clustering feature is not installed on this node.
//


//
// MessageId: ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE
//
// MessageText:
//
// The resources must be online on the same node for this operation
//



///////////////////////////////////////////////////
//                                               //
//               EFS Error codes                 //
//                                               //
//                 6000 to 6099                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_ENCRYPTION_FAILED
//
// MessageText:
//
// The specified file could not be encrypted.
//


//
// MessageId: ERROR_DECRYPTION_FAILED
//
// MessageText:
//
// The specified file could not be decrypted.
//


//
// MessageId: ERROR_FILE_ENCRYPTED
//
// MessageText:
//
// The specified file is encrypted and the user does not have the ability to decrypt it.
//


//
// MessageId: ERROR_NO_RECOVERY_POLICY
//
// MessageText:
//
// There is no valid encryption recovery policy configured for this system.
//


//
// MessageId: ERROR_NO_EFS
//
// MessageText:
//
// The required encryption driver is not loaded for this system.
//


//
// MessageId: ERROR_WRONG_EFS
//
// MessageText:
//
// The file was encrypted with a different encryption driver than is currently loaded.
//


//
// MessageId: ERROR_NO_USER_KEYS
//
// MessageText:
//
// There are no EFS keys defined for the user.
//


//
// MessageId: ERROR_FILE_NOT_ENCRYPTED
//
// MessageText:
//
// The specified file is not encrypted.
//


//
// MessageId: ERROR_NOT_EXPORT_FORMAT
//
// MessageText:
//
// The specified file is not in the defined EFS export format.
//


//
// MessageId: ERROR_FILE_READ_ONLY
//
// MessageText:
//
// The specified file is read only.
//


//
// MessageId: ERROR_DIR_EFS_DISALLOWED
//
// MessageText:
//
// The directory has been disabled for encryption.
//


//
// MessageId: ERROR_EFS_SERVER_NOT_TRUSTED
//
// MessageText:
//
// The server is not trusted for remote encryption operation.
//


//
// MessageId: ERROR_BAD_RECOVERY_POLICY
//
// MessageText:
//
// Recovery policy configured for this system contains invalid recovery certificate.
//


//
// MessageId: ERROR_EFS_ALG_BLOB_TOO_BIG
//
// MessageText:
//
// The encryption algorithm used on the source file needs a bigger key buffer than the one on the destination file.
//


//
// MessageId: ERROR_VOLUME_NOT_SUPPORT_EFS
//
// MessageText:
//
// The disk partition does not support file encryption.
//


//
// MessageId: ERROR_EFS_DISABLED
//
// MessageText:
//
// This machine is disabled for file encryption.
//


//
// MessageId: ERROR_EFS_VERSION_NOT_SUPPORT
//
// MessageText:
//
// A newer system is required to decrypt this encrypted file.
//


//
// MessageId: ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE
//
// MessageText:
//
// The remote server sent an invalid response for a file being opened with Client Side Encryption.
//


//
// MessageId: ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER
//
// MessageText:
//
// Client Side Encryption is not supported by the remote server even though it claims to support it.
//


//
// MessageId: ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE
//
// MessageText:
//
// File is encrypted and should be opened in Client Side Encryption mode.
//


//
// MessageId: ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE
//
// MessageText:
//
// A new encrypted file is being created and a $EFS needs to be provided.
//


//
// MessageId: ERROR_CS_ENCRYPTION_FILE_NOT_CSE
//
// MessageText:
//
// The SMB client requested a CSE FSCTL on a non-CSE file.
//



///////////////////////////////////////////////////
//                                               //
//              BROWSER Error codes              //
//                                               //
//                 6100 to 6199                  //
///////////////////////////////////////////////////

// This message number is for historical purposes and cannot be changed or re-used.
//
// MessageId: ERROR_NO_BROWSER_SERVERS_FOUND
//
// MessageText:
//
// The list of servers for this workgroup is not currently available
//



///////////////////////////////////////////////////
//                                               //
//            Task Scheduler Error codes         //
//            NET START must understand          //
//                                               //
//                 6200 to 6249                  //
///////////////////////////////////////////////////

//
// MessageId: SCHED_E_SERVICE_NOT_LOCALSYSTEM
//
// MessageText:
//
// The Task Scheduler service must be configured to run in the System account to function properly. Individual tasks may be configured to run in other accounts.
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 6250 to 6599                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//         Common Log (CLFS) Error codes         //
//                                               //
//                 6600 to 6699                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_LOG_SECTOR_INVALID
//
// MessageText:
//
// Log service encountered an invalid log sector.
//


//
// MessageId: ERROR_LOG_SECTOR_PARITY_INVALID
//
// MessageText:
//
// Log service encountered a log sector with invalid block parity.
//


//
// MessageId: ERROR_LOG_SECTOR_REMAPPED
//
// MessageText:
//
// Log service encountered a remapped log sector.
//


//
// MessageId: ERROR_LOG_BLOCK_INCOMPLETE
//
// MessageText:
//
// Log service encountered a partial or incomplete log block.
//


//
// MessageId: ERROR_LOG_INVALID_RANGE
//
// MessageText:
//
// Log service encountered an attempt access data outside the active log range.
//


//
// MessageId: ERROR_LOG_BLOCKS_EXHAUSTED
//
// MessageText:
//
// Log service user marshalling buffers are exhausted.
//


//
// MessageId: ERROR_LOG_READ_CONTEXT_INVALID
//
// MessageText:
//
// Log service encountered an attempt read from a marshalling area with an invalid read context.
//


//
// MessageId: ERROR_LOG_RESTART_INVALID
//
// MessageText:
//
// Log service encountered an invalid log restart area.
//


//
// MessageId: ERROR_LOG_BLOCK_VERSION
//
// MessageText:
//
// Log service encountered an invalid log block version.
//


//
// MessageId: ERROR_LOG_BLOCK_INVALID
//
// MessageText:
//
// Log service encountered an invalid log block.
//


//
// MessageId: ERROR_LOG_READ_MODE_INVALID
//
// MessageText:
//
// Log service encountered an attempt to read the log with an invalid read mode.
//


//
// MessageId: ERROR_LOG_NO_RESTART
//
// MessageText:
//
// Log service encountered a log stream with no restart area.
//


//
// MessageId: ERROR_LOG_METADATA_CORRUPT
//
// MessageText:
//
// Log service encountered a corrupted metadata file.
//


//
// MessageId: ERROR_LOG_METADATA_INVALID
//
// MessageText:
//
// Log service encountered a metadata file that could not be created by the log file system.
//


//
// MessageId: ERROR_LOG_METADATA_INCONSISTENT
//
// MessageText:
//
// Log service encountered a metadata file with inconsistent data.
//


//
// MessageId: ERROR_LOG_RESERVATION_INVALID
//
// MessageText:
//
// Log service encountered an attempt to erroneous allocate or dispose reservation space.
//


//
// MessageId: ERROR_LOG_CANT_DELETE
//
// MessageText:
//
// Log service cannot delete log file or file system container.
//


//
// MessageId: ERROR_LOG_CONTAINER_LIMIT_EXCEEDED
//
// MessageText:
//
// Log service has reached the maximum allowable containers allocated to a log file.
//


//
// MessageId: ERROR_LOG_START_OF_LOG
//
// MessageText:
//
// Log service has attempted to read or write backward past the start of the log.
//


//
// MessageId: ERROR_LOG_POLICY_ALREADY_INSTALLED
//
// MessageText:
//
// Log policy could not be installed because a policy of the same type is already present.
//


//
// MessageId: ERROR_LOG_POLICY_NOT_INSTALLED
//
// MessageText:
//
// Log policy in question was not installed at the time of the request.
//


//
// MessageId: ERROR_LOG_POLICY_INVALID
//
// MessageText:
//
// The installed set of policies on the log is invalid.
//


//
// MessageId: ERROR_LOG_POLICY_CONFLICT
//
// MessageText:
//
// A policy on the log in question prevented the operation from completing.
//


//
// MessageId: ERROR_LOG_PINNED_ARCHIVE_TAIL
//
// MessageText:
//
// Log space cannot be reclaimed because the log is pinned by the archive tail.
//


//
// MessageId: ERROR_LOG_RECORD_NONEXISTENT
//
// MessageText:
//
// Log record is not a record in the log file.
//


//
// MessageId: ERROR_LOG_RECORDS_RESERVED_INVALID
//
// MessageText:
//
// Number of reserved log records or the adjustment of the number of reserved log records is invalid.
//


//
// MessageId: ERROR_LOG_SPACE_RESERVED_INVALID
//
// MessageText:
//
// Reserved log space or the adjustment of the log space is invalid.
//


//
// MessageId: ERROR_LOG_TAIL_INVALID
//
// MessageText:
//
// An new or existing archive tail or base of the active log is invalid.
//


//
// MessageId: ERROR_LOG_FULL
//
// MessageText:
//
// Log space is exhausted.
//


//
// MessageId: ERROR_COULD_NOT_RESIZE_LOG
//
// MessageText:
//
// The log could not be set to the requested size.
//


//
// MessageId: ERROR_LOG_MULTIPLEXED
//
// MessageText:
//
// Log is multiplexed, no direct writes to the physical log is allowed.
//


//
// MessageId: ERROR_LOG_DEDICATED
//
// MessageText:
//
// The operation failed because the log is a dedicated log.
//


//
// MessageId: ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS
//
// MessageText:
//
// The operation requires an archive context.
//


//
// MessageId: ERROR_LOG_ARCHIVE_IN_PROGRESS
//
// MessageText:
//
// Log archival is in progress.
//


//
// MessageId: ERROR_LOG_EPHEMERAL
//
// MessageText:
//
// The operation requires a non-ephemeral log, but the log is ephemeral.
//


//
// MessageId: ERROR_LOG_NOT_ENOUGH_CONTAINERS
//
// MessageText:
//
// The log must have at least two containers before it can be read from or written to.
//


//
// MessageId: ERROR_LOG_CLIENT_ALREADY_REGISTERED
//
// MessageText:
//
// A log client has already registered on the stream.
//


//
// MessageId: ERROR_LOG_CLIENT_NOT_REGISTERED
//
// MessageText:
//
// A log client has not been registered on the stream.
//


//
// MessageId: ERROR_LOG_FULL_HANDLER_IN_PROGRESS
//
// MessageText:
//
// A request has already been made to handle the log full condition.
//


//
// MessageId: ERROR_LOG_CONTAINER_READ_FAILED
//
// MessageText:
//
// Log service enountered an error when attempting to read from a log container.
//


//
// MessageId: ERROR_LOG_CONTAINER_WRITE_FAILED
//
// MessageText:
//
// Log service enountered an error when attempting to write to a log container.
//


//
// MessageId: ERROR_LOG_CONTAINER_OPEN_FAILED
//
// MessageText:
//
// Log service enountered an error when attempting open a log container.
//


//
// MessageId: ERROR_LOG_CONTAINER_STATE_INVALID
//
// MessageText:
//
// Log service enountered an invalid container state when attempting a requested action.
//


//
// MessageId: ERROR_LOG_STATE_INVALID
//
// MessageText:
//
// Log service is not in the correct state to perform a requested action.
//


//
// MessageId: ERROR_LOG_PINNED
//
// MessageText:
//
// Log space cannot be reclaimed because the log is pinned.
//


//
// MessageId: ERROR_LOG_METADATA_FLUSH_FAILED
//
// MessageText:
//
// Log metadata flush failed.
//


//
// MessageId: ERROR_LOG_INCONSISTENT_SECURITY
//
// MessageText:
//
// Security on the log and its containers is inconsistent.
//


//
// MessageId: ERROR_LOG_APPENDED_FLUSH_FAILED
//
// MessageText:
//
// Records were appended to the log or reservation changes were made, but the log could not be flushed.
//


//
// MessageId: ERROR_LOG_PINNED_RESERVATION
//
// MessageText:
//
// The log is pinned due to reservation consuming most of the log space. Free some reserved records to make space available.
//



///////////////////////////////////////////////////
//                                               //
//           Transaction (KTM) Error codes       //
//                                               //
//                 6700 to 6799                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_INVALID_TRANSACTION
//
// MessageText:
//
// The transaction handle associated with this operation is not valid.
//


//
// MessageId: ERROR_TRANSACTION_NOT_ACTIVE
//
// MessageText:
//
// The requested operation was made in the context of a transaction that is no longer active.
//


//
// MessageId: ERROR_TRANSACTION_REQUEST_NOT_VALID
//
// MessageText:
//
// The requested operation is not valid on the Transaction object in its current state.
//


//
// MessageId: ERROR_TRANSACTION_NOT_REQUESTED
//
// MessageText:
//
// The caller has called a response API, but the response is not expected because the TM did not issue the corresponding request to the caller.
//


//
// MessageId: ERROR_TRANSACTION_ALREADY_ABORTED
//
// MessageText:
//
// It is too late to perform the requested operation, since the Transaction has already been aborted.
//


//
// MessageId: ERROR_TRANSACTION_ALREADY_COMMITTED
//
// MessageText:
//
// It is too late to perform the requested operation, since the Transaction has already been committed.
//


//
// MessageId: ERROR_TM_INITIALIZATION_FAILED
//
// MessageText:
//
// The Transaction Manager was unable to be successfully initialized. Transacted operations are not supported.
//


//
// MessageId: ERROR_RESOURCEMANAGER_READ_ONLY
//
// MessageText:
//
// The specified ResourceManager made no changes or updates to the resource under this transaction.
//


//
// MessageId: ERROR_TRANSACTION_NOT_JOINED
//
// MessageText:
//
// The resource manager has attempted to prepare a transaction that it has not successfully joined.
//


//
// MessageId: ERROR_TRANSACTION_SUPERIOR_EXISTS
//
// MessageText:
//
// The Transaction object already has a superior enlistment, and the caller attempted an operation that would have created a new superior. Only a single superior enlistment is allow.
//


//
// MessageId: ERROR_CRM_PROTOCOL_ALREADY_EXISTS
//
// MessageText:
//
// The RM tried to register a protocol that already exists.
//


//
// MessageId: ERROR_TRANSACTION_PROPAGATION_FAILED
//
// MessageText:
//
// The attempt to propagate the Transaction failed.
//


//
// MessageId: ERROR_CRM_PROTOCOL_NOT_FOUND
//
// MessageText:
//
// The requested propagation protocol was not registered as a CRM.
//


//
// MessageId: ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER
//
// MessageText:
//
// The buffer passed in to PushTransaction or PullTransaction is not in a valid format.
//


//
// MessageId: ERROR_CURRENT_TRANSACTION_NOT_VALID
//
// MessageText:
//
// The current transaction context associated with the thread is not a valid handle to a transaction object.
//


//
// MessageId: ERROR_TRANSACTION_NOT_FOUND
//
// MessageText:
//
// The specified Transaction object could not be opened, because it was not found.
//


//
// MessageId: ERROR_RESOURCEMANAGER_NOT_FOUND
//
// MessageText:
//
// The specified ResourceManager object could not be opened, because it was not found.
//


//
// MessageId: ERROR_ENLISTMENT_NOT_FOUND
//
// MessageText:
//
// The specified Enlistment object could not be opened, because it was not found.
//


//
// MessageId: ERROR_TRANSACTIONMANAGER_NOT_FOUND
//
// MessageText:
//
// The specified TransactionManager object could not be opened, because it was not found.
//


//
// MessageId: ERROR_TRANSACTIONMANAGER_NOT_ONLINE
//
// MessageText:
//
// The specified ResourceManager was unable to create an enlistment, because its associated TransactionManager is not online.
//


//
// MessageId: ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION
//
// MessageText:
//
// The specified TransactionManager was unable to create the objects contained in its logfile in the Ob namespace. Therefore, the TransactionManager was unable to recover.
//


//
// MessageId: ERROR_TRANSACTION_NOT_ROOT
//
// MessageText:
//
// The call to create a superior Enlistment on this Transaction object could not be completed, because the Transaction object specified for the enlistment is a subordinate branch of the Transaction.  Only the root of the Transactoin can be enlisted on as a superior.
//


//
// MessageId: ERROR_TRANSACTION_OBJECT_EXPIRED
//
// MessageText:
//
// Because the associated transaction manager or resource manager has been closed, the handle is no longer valid.
//


//
// MessageId: ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED
//
// MessageText:
//
// The specified operation could not be performed on this Superior enlistment, because the enlistment was not created with the corresponding completion response in the NotificationMask.
//


//
// MessageId: ERROR_TRANSACTION_RECORD_TOO_LONG
//
// MessageText:
//
// The specified operation could not be performed, because the record that would be logged was too long.  This can occur because of two conditions:  either there are too many Enlistments on this Transaction, or the combined RecoveryInformation being logged on behalf of those Enlistments is too long.
//


//
// MessageId: ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED
//
// MessageText:
//
// Implicit transaction are not supported.
//


//
// MessageId: ERROR_TRANSACTION_INTEGRITY_VIOLATED
//
// MessageText:
//
// The kernel transaction manager had to abort or forget the transaction because it blocked forward progress.
//



///////////////////////////////////////////////////
//                                               //
//        Transactional File Services (TxF)      //
//                  Error codes                  //
//                                               //
//                 6800 to 6899                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_TRANSACTIONAL_CONFLICT
//
// MessageText:
//
// The function attempted to use a name that is reserved for use by another transaction.
//


//
// MessageId: ERROR_RM_NOT_ACTIVE
//
// MessageText:
//
// Transaction support within the specified file system resource manager is not started or was shutdown due to an error.
//


//
// MessageId: ERROR_RM_METADATA_CORRUPT
//
// MessageText:
//
// The metadata of the RM has been corrupted. The RM will not function.
//


//
// MessageId: ERROR_DIRECTORY_NOT_RM
//
// MessageText:
//
// The specified directory does not contain a resource manager.
//


//
// MessageId: ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE
//
// MessageText:
//
// The remote server or share does not support transacted file operations.
//


//
// MessageId: ERROR_LOG_RESIZE_INVALID_SIZE
//
// MessageText:
//
// The requested log size is invalid.
//


//
// MessageId: ERROR_OBJECT_NO_LONGER_EXISTS
//
// MessageText:
//
// The object (file, stream, link) corresponding to the handle has been deleted by a Transaction Savepoint Rollback.
//


//
// MessageId: ERROR_STREAM_MINIVERSION_NOT_FOUND
//
// MessageText:
//
// The specified file miniversion was not found for this transacted file open.
//


//
// MessageId: ERROR_STREAM_MINIVERSION_NOT_VALID
//
// MessageText:
//
// The specified file miniversion was found but has been invalidated. Most likely cause is a transaction savepoint rollback.
//


//
// MessageId: ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION
//
// MessageText:
//
// A miniversion may only be opened in the context of the transaction that created it.
//


//
// MessageId: ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT
//
// MessageText:
//
// It is not possible to open a miniversion with modify access.
//


//
// MessageId: ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS
//
// MessageText:
//
// It is not possible to create any more miniversions for this stream.
//


//
// MessageId: ERROR_REMOTE_FILE_VERSION_MISMATCH
//
// MessageText:
//
// The remote server sent mismatching version number or Fid for a file opened with transactions.
//


//
// MessageId: ERROR_HANDLE_NO_LONGER_VALID
//
// MessageText:
//
// The handle has been invalidated by a transaction. The most likely cause is the presence of memory mapping on a file or an open handle when the transaction ended or rolled back to savepoint.
//


//
// MessageId: ERROR_NO_TXF_METADATA
//
// MessageText:
//
// There is no transaction metadata on the file.
//


//
// MessageId: ERROR_LOG_CORRUPTION_DETECTED
//
// MessageText:
//
// The log data is corrupt.
//


//
// MessageId: ERROR_CANT_RECOVER_WITH_HANDLE_OPEN
//
// MessageText:
//
// The file can't be recovered because there is a handle still open on it.
//


//
// MessageId: ERROR_RM_DISCONNECTED
//
// MessageText:
//
// The transaction outcome is unavailable because the resource manager responsible for it has disconnected.
//


//
// MessageId: ERROR_ENLISTMENT_NOT_SUPERIOR
//
// MessageText:
//
// The request was rejected because the enlistment in question is not a superior enlistment.
//


//
// MessageId: ERROR_RECOVERY_NOT_NEEDED
//
// MessageText:
//
// The transactional resource manager is already consistent. Recovery is not needed.
//


//
// MessageId: ERROR_RM_ALREADY_STARTED
//
// MessageText:
//
// The transactional resource manager has already been started.
//


//
// MessageId: ERROR_FILE_IDENTITY_NOT_PERSISTENT
//
// MessageText:
//
// The file cannot be opened transactionally, because its identity depends on the outcome of an unresolved transaction.
//


//
// MessageId: ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY
//
// MessageText:
//
// The operation cannot be performed because another transaction is depending on the fact that this property will not change.
//


//
// MessageId: ERROR_CANT_CROSS_RM_BOUNDARY
//
// MessageText:
//
// The operation would involve a single file with two transactional resource managers and is therefore not allowed.
//


//
// MessageId: ERROR_TXF_DIR_NOT_EMPTY
//
// MessageText:
//
// The $Txf directory must be empty for this operation to succeed.
//


//
// MessageId: ERROR_INDOUBT_TRANSACTIONS_EXIST
//
// MessageText:
//
// The operation would leave a transactional resource manager in an inconsistent state and is therefore not allowed.
//


//
// MessageId: ERROR_TM_VOLATILE
//
// MessageText:
//
// The operation could not be completed because the transaction manager does not have a log.
//


//
// MessageId: ERROR_ROLLBACK_TIMER_EXPIRED
//
// MessageText:
//
// A rollback could not be scheduled because a previously scheduled rollback has already executed or been queued for execution.
//


//
// MessageId: ERROR_TXF_ATTRIBUTE_CORRUPT
//
// MessageText:
//
// The transactional metadata attribute on the file or directory is corrupt and unreadable.
//


//
// MessageId: ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The encryption operation could not be completed because a transaction is active.
//


//
// MessageId: ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED
//
// MessageText:
//
// This object is not allowed to be opened in a transaction.
//


//
// MessageId: ERROR_LOG_GROWTH_FAILED
//
// MessageText:
//
// An attempt to create space in the transactional resource manager's log failed. The failure status has been recorded in the event log.
//


//
// MessageId: ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE
//
// MessageText:
//
// Memory mapping (creating a mapped section) a remote file under a transaction is not supported.
//


//
// MessageId: ERROR_TXF_METADATA_ALREADY_PRESENT
//
// MessageText:
//
// Transaction metadata is already present on this file and cannot be superseded.
//


//
// MessageId: ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET
//
// MessageText:
//
// A transaction scope could not be entered because the scope handler has not been initialized.
//


//
// MessageId: ERROR_TRANSACTION_REQUIRED_PROMOTION
//
// MessageText:
//
// Promotion was required in order to allow the resource manager to enlist, but the transaction was set to disallow it.
//


//
// MessageId: ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION
//
// MessageText:
//
// This file is open for modification in an unresolved transaction and may be opened for execute only by a transacted reader.
//


//
// MessageId: ERROR_TRANSACTIONS_NOT_FROZEN
//
// MessageText:
//
// The request to thaw frozen transactions was ignored because transactions had not previously been frozen.
//


//
// MessageId: ERROR_TRANSACTION_FREEZE_IN_PROGRESS
//
// MessageText:
//
// Transactions cannot be frozen because a freeze is already in progress.
//


//
// MessageId: ERROR_NOT_SNAPSHOT_VOLUME
//
// MessageText:
//
// The target volume is not a snapshot volume. This operation is only valid on a volume mounted as a snapshot.
//


//
// MessageId: ERROR_NO_SAVEPOINT_WITH_OPEN_FILES
//
// MessageText:
//
// The savepoint operation failed because files are open on the transaction. This is not permitted.
//


//
// MessageId: ERROR_DATA_LOST_REPAIR
//
// MessageText:
//
// Windows has discovered corruption in a file, and that file has since been repaired. Data loss may have occurred.
//


//
// MessageId: ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The sparse operation could not be completed because a transaction is active on the file.
//


//
// MessageId: ERROR_TM_IDENTITY_MISMATCH
//
// MessageText:
//
// The call to create a TransactionManager object failed because the Tm Identity stored in the logfile does not match the Tm Identity that was passed in as an argument.
//


//
// MessageId: ERROR_FLOATED_SECTION
//
// MessageText:
//
// I/O was attempted on a section object that has been floated as a result of a transaction ending. There is no valid data.
//


//
// MessageId: ERROR_CANNOT_ACCEPT_TRANSACTED_WORK
//
// MessageText:
//
// The transactional resource manager cannot currently accept transacted work due to a transient condition such as low resources.
//


//
// MessageId: ERROR_CANNOT_ABORT_TRANSACTIONS
//
// MessageText:
//
// The transactional resource manager had too many tranactions outstanding that could not be aborted. The transactional resource manger has been shut down.
//


//
// MessageId: ERROR_BAD_CLUSTERS
//
// MessageText:
//
// The operation could not be completed due to bad clusters on disk.
//


//
// MessageId: ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The compression operation could not be completed because a transaction is active on the file.
//


//
// MessageId: ERROR_VOLUME_DIRTY
//
// MessageText:
//
// The operation could not be completed because the volume is dirty.  Please run chkdsk and try again.
//


//
// MessageId: ERROR_NO_LINK_TRACKING_IN_TRANSACTION
//
// MessageText:
//
// The link tracking operation could not be completed because a transaction is active.
//


//
// MessageId: ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION
//
// MessageText:
//
// This operation cannot be performed in a transaction.
//



///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 6900 to 6999                  //
///////////////////////////////////////////////////

///////////////////////////////////////////////////
//                                               //
//          Terminal Server Error codes          //
//                                               //
//                 7000 to 7099                  //
///////////////////////////////////////////////////

//
// MessageId: ERROR_CTX_WINSTATION_NAME_INVALID
//
// MessageText:
//
// The specified session name is invalid.
//


//
// MessageId: ERROR_CTX_INVALID_PD
//
// MessageText:
//
// The specified protocol driver is invalid.
//


//
// MessageId: ERROR_CTX_PD_NOT_FOUND
//
// MessageText:
//
// The specified protocol driver was not found in the system path.
//


//
// MessageId: ERROR_CTX_WD_NOT_FOUND
//
// MessageText:
//
// The specified terminal connection driver was not found in the system path.
//


//
// MessageId: ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY
//
// MessageText:
//
// A registry key for event logging could not be created for this session.
//


//
// MessageId: ERROR_CTX_SERVICE_NAME_COLLISION
//
// MessageText:
//
// A service with the same name already exists on the system.
//


//
// MessageId: ERROR_CTX_CLOSE_PENDING
//
// MessageText:
//
// A close operation is pending on the session.
//


//
// MessageId: ERROR_CTX_NO_OUTBUF
//
// MessageText:
//
// There are no free output buffers available.
//


//
// MessageId: ERROR_CTX_MODEM_INF_NOT_FOUND
//
// MessageText:
//
// The MODEM.INF file was not found.
//


//
// MessageId: ERROR_CTX_INVALID_MODEMNAME
//
// MessageText:
//
// The modem name was not found in MODEM.INF.
//


//
// MessageId: ERROR_CTX_MODEM_RESPONSE_ERROR
//
// MessageText:
//
// The modem did not accept the command sent to it. Verify that the configured modem name matches the attached modem.
//


//
// MessageId: ERROR_CTX_MODEM_RESPONSE_TIMEOUT
//
// MessageText:
//
// The modem did not respond to the command sent to it. Verify that the modem is properly cabled and powered on.
//


//
// MessageId: ERROR_CTX_MODEM_RESPONSE_NO_CARRIER
//
// MessageText:
//
// Carrier detect has failed or carrier has been dropped due to disconnect.
//


//
// MessageId: ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE
//
// MessageText:
//
// Dial tone not detected within the required time. Verify that the phone cable is properly attached and functional.
//


//
// MessageId: ERROR_CTX_MODEM_RESPONSE_BUSY
//
// MessageText:
//
// Busy signal detected at remote site on callback.
//


//
// MessageId: ERROR_CTX_MODEM_RESPONSE_VOICE
//
// MessageText:
//
// Voice detected at remote site on callback.
//


//
// MessageId: ERROR_CTX_TD_ERROR
//
// MessageText:
//
// Transport driver error
//


//
// MessageId: ERROR_CTX_WINSTATION_NOT_FOUND
//
// MessageText:
//
// The specified session cannot be found.
//


//
// MessageId: ERROR_CTX_WINSTATION_ALREADY_EXISTS
//
// MessageText:
//
// The specified session name is already in use.
//


//
// MessageId: ERROR_CTX_WINSTATION_BUSY
//
// MessageText:
//
// The requested operation cannot be completed because the terminal connection is currently busy processing a connect, disconnect, reset, or delete operation.
//


//
// MessageId: ERROR_CTX_BAD_VIDEO_MODE
//
// MessageText:
//
// An attempt has been made to connect to a session whose video mode is not supported by the current client.
//


//
// MessageId: ERROR_CTX_GRAPHICS_INVALID
//
// MessageText:
//
// The application attempted to enable DOS graphics mode.
// DOS graphics mode is not supported.
//


//
// MessageId: ERROR_CTX_LOGON_DISABLED
//
// MessageText:
//
// Your interactive logon privilege has been disabled.
// Please contact your administrator.
//


//
// MessageId: ERROR_CTX_NOT_CONSOLE
//
// MessageText:
//
// The requested operation can be performed only on the system console.
// This is most often the result of a driver or system DLL requiring direct console access.
//


//
// MessageId: ERROR_CTX_CLIENT_QUERY_TIMEOUT
//
// MessageText:
//
// The client failed to respond to the server connect message.
//


//
// MessageId: ERROR_CTX_CONSOLE_DISCONNECT
//
// MessageText:
//
// Disconnecting the console session is not supported.
//


//
// MessageId: ERROR_CTX_CONSOLE_CONNECT
//
// MessageText:
//
// Reconnecting a disconnected session to the console is not supported.
//


//
// MessageId: ERROR_CTX_SHADOW_DENIED
//
// MessageText:
//
// The request to control another session remotely was denied.
//


//
// MessageId: ERROR_CTX_WINSTATION_ACCESS_DENIED
//
// MessageText:
//
// The requested session access is denied.
//


//
// MessageId: ERROR_CTX_INVALID_WD
//
// MessageText:
//
// The specified terminal connection driver is invalid.
//


//
// MessageId: ERROR_CTX_SHADOW_INVALID
//
// MessageText:
//
// The requested session cannot be controlled remotely.
// This may be because the session is disconnected or does not currently have a user logged on.
//


//
// MessageId: ERROR_CTX_SHADOW_DISABLED
//
// MessageText:
//
// The requested session is not configured to allow remote control.
//


//
// MessageId: ERROR_CTX_CLIENT_LICENSE_IN_USE
//
// MessageText:
//
// Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number is currently being used by another user.
// Please call your system administrator to obtain a unique license number.
//


//
// MessageId: ERROR_CTX_CLIENT_LICENSE_NOT_SET
//
// MessageText:
//
// Your request to connect to this Terminal Server has been rejected. Your Terminal Server client license number has not been entered for this copy of the Terminal Server client.
// Please contact your system administrator.
//


//
// MessageId: ERROR_CTX_LICENSE_NOT_AVAILABLE
//
// MessageText:
//
// The number of connections to this computer is limited and all connections are in use right now.
// Try connecting later or contact your system administrator.
//


//
// MessageId: ERROR_CTX_LICENSE_CLIENT_INVALID
//
// MessageText:
//
// The client you are using is not licensed to use this system. Your logon request is denied.
//


//
// MessageId: ERROR_CTX_LICENSE_EXPIRED
//
// MessageText:
//
// The system license has expired. Your logon request is denied.
//


//
// MessageId: ERROR_CTX_SHADOW_NOT_RUNNING
//
// MessageText:
//
// Remote control could not be terminated because the specified session is not currently being remotely controlled.
//


//
// MessageId: ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE
//
// MessageText:
//
// The remote control of the console was terminated because the display mode was changed. Changing the display mode in a remote control session is not supported.
//


//
// MessageId: ERROR_ACTIVATION_COUNT_EXCEEDED
//
// MessageText:
//
// Activation has already been reset the maximum number of times for this installation. Your activation timer will not be cleared.
//


//
// MessageId: ERROR_CTX_WINSTATIONS_DISABLED
//
// MessageText:
//
// Remote logins are currently disabled.
//


//
// MessageId: ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED
//
// MessageText:
//
// You do not have the proper encryption level to access this Session.
//


//
// MessageId: ERROR_CTX_SESSION_IN_USE
//
// MessageText:
//
// The user %s\\%s is currently logged on to this computer. Only the current user or an administrator can log on to this computer.
//


//
// MessageId: ERROR_CTX_NO_FORCE_LOGOFF
//
// MessageText:
//
// The user %s\\%s is already logged on to the console of this computer. You do not have permission to log in at this time. To resolve this issue, contact %s\\%s and have them log off.
//


//
// MessageId: ERROR_CTX_ACCOUNT_RESTRICTION
//
// MessageText:
//
// Unable to log you on because of an account restriction.
//


//
// MessageId: ERROR_RDP_PROTOCOL_ERROR
//
// MessageText:
//
// The RDP protocol component %2 detected an error in the protocol stream and has disconnected the client.
//


//
// MessageId: ERROR_CTX_CDM_CONNECT
//
// MessageText:
//
// The Client Drive Mapping Service Has Connected on Terminal Connection.
//


//
// MessageId: ERROR_CTX_CDM_DISCONNECT
//
// MessageText:
//
// The Client Drive Mapping Service Has Disconnected on Terminal Connection.
//


//
// MessageId: ERROR_CTX_SECURITY_LAYER_ERROR
//
// MessageText:
//
// The Terminal Server security layer detected an error in the protocol stream and has disconnected the client.
//


//
// MessageId: ERROR_TS_INCOMPATIBLE_SESSIONS
//
// MessageText:
//
// The target session is incompatible with the current session.
//


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                 7100 to 7499                  //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                                /
//           Traffic Control Error Codes          /
//                                                /
//                  7500 to 7999                  /
//                                                /
//            defined in: tcerror.h               /
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Active Directory Error codes        //
//                                               //
//                 8000 to 8999                  //
///////////////////////////////////////////////////

// *****************
// FACILITY_FILE_REPLICATION_SERVICE
// *****************
//
// MessageId: FRS_ERR_INVALID_API_SEQUENCE
//
// MessageText:
//
// The file replication service API was called incorrectly.
//


//
// MessageId: FRS_ERR_STARTING_SERVICE
//
// MessageText:
//
// The file replication service cannot be started.
//


//
// MessageId: FRS_ERR_STOPPING_SERVICE
//
// MessageText:
//
// The file replication service cannot be stopped.
//


//
// MessageId: FRS_ERR_INTERNAL_API
//
// MessageText:
//
// The file replication service API terminated the request.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_INTERNAL
//
// MessageText:
//
// The file replication service terminated the request.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_SERVICE_COMM
//
// MessageText:
//
// The file replication service cannot be contacted.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_INSUFFICIENT_PRIV
//
// MessageText:
//
// The file replication service cannot satisfy the request because the user has insufficient privileges.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_AUTHENTICATION
//
// MessageText:
//
// The file replication service cannot satisfy the request because authenticated RPC is not available.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_PARENT_INSUFFICIENT_PRIV
//
// MessageText:
//
// The file replication service cannot satisfy the request because the user has insufficient privileges on the domain controller.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_PARENT_AUTHENTICATION
//
// MessageText:
//
// The file replication service cannot satisfy the request because authenticated RPC is not available on the domain controller.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_CHILD_TO_PARENT_COMM
//
// MessageText:
//
// The file replication service cannot communicate with the file replication service on the domain controller.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_PARENT_TO_CHILD_COMM
//
// MessageText:
//
// The file replication service on the domain controller cannot communicate with the file replication service on this computer.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_SYSVOL_POPULATE
//
// MessageText:
//
// The file replication service cannot populate the system volume because of an internal error.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_SYSVOL_POPULATE_TIMEOUT
//
// MessageText:
//
// The file replication service cannot populate the system volume because of an internal timeout.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_SYSVOL_IS_BUSY
//
// MessageText:
//
// The file replication service cannot process the request. The system volume is busy with a previous request.
//


//
// MessageId: FRS_ERR_SYSVOL_DEMOTE
//
// MessageText:
//
// The file replication service cannot stop replicating the system volume because of an internal error.
// The event log may have more information.
//


//
// MessageId: FRS_ERR_INVALID_SERVICE_PARAMETER
//
// MessageText:
//
// The file replication service detected an invalid parameter.
//


// *****************
// FACILITY DIRECTORY SERVICE
// *****************

//
// MessageId: ERROR_DS_NOT_INSTALLED
//
// MessageText:
//
// An error occurred while installing the directory service. For more information, see the event log.
//


//
// MessageId: ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY
//
// MessageText:
//
// The directory service evaluated group memberships locally.
//


//
// MessageId: ERROR_DS_NO_ATTRIBUTE_OR_VALUE
//
// MessageText:
//
// The specified directory service attribute or value does not exist.
//


//
// MessageId: ERROR_DS_INVALID_ATTRIBUTE_SYNTAX
//
// MessageText:
//
// The attribute syntax specified to the directory service is invalid.
//


//
// MessageId: ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED
//
// MessageText:
//
// The attribute type specified to the directory service is not defined.
//


//
// MessageId: ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS
//
// MessageText:
//
// The specified directory service attribute or value already exists.
//


//
// MessageId: ERROR_DS_BUSY
//
// MessageText:
//
// The directory service is busy.
//


//
// MessageId: ERROR_DS_UNAVAILABLE
//
// MessageText:
//
// The directory service is unavailable.
//


//
// MessageId: ERROR_DS_NO_RIDS_ALLOCATED
//
// MessageText:
//
// The directory service was unable to allocate a relative identifier.
//


//
// MessageId: ERROR_DS_NO_MORE_RIDS
//
// MessageText:
//
// The directory service has exhausted the pool of relative identifiers.
//


//
// MessageId: ERROR_DS_INCORRECT_ROLE_OWNER
//
// MessageText:
//
// The requested operation could not be performed because the directory service is not the master for that type of operation.
//


//
// MessageId: ERROR_DS_RIDMGR_INIT_ERROR
//
// MessageText:
//
// The directory service was unable to initialize the subsystem that allocates relative identifiers.
//


//
// MessageId: ERROR_DS_OBJ_CLASS_VIOLATION
//
// MessageText:
//
// The requested operation did not satisfy one or more constraints associated with the class of the object.
//


//
// MessageId: ERROR_DS_CANT_ON_NON_LEAF
//
// MessageText:
//
// The directory service can perform the requested operation only on a leaf object.
//


//
// MessageId: ERROR_DS_CANT_ON_RDN
//
// MessageText:
//
// The directory service cannot perform the requested operation on the RDN attribute of an object.
//


//
// MessageId: ERROR_DS_CANT_MOD_OBJ_CLASS
//
// MessageText:
//
// The directory service detected an attempt to modify the object class of an object.
//


//
// MessageId: ERROR_DS_CROSS_DOM_MOVE_ERROR
//
// MessageText:
//
// The requested cross-domain move operation could not be performed.
//


//
// MessageId: ERROR_DS_GC_NOT_AVAILABLE
//
// MessageText:
//
// Unable to contact the global catalog server.
//


//
// MessageId: ERROR_SHARED_POLICY
//
// MessageText:
//
// The policy object is shared and can only be modified at the root.
//


//
// MessageId: ERROR_POLICY_OBJECT_NOT_FOUND
//
// MessageText:
//
// The policy object does not exist.
//


//
// MessageId: ERROR_POLICY_ONLY_IN_DS
//
// MessageText:
//
// The requested policy information is only in the directory service.
//


//
// MessageId: ERROR_PROMOTION_ACTIVE
//
// MessageText:
//
// A domain controller promotion is currently active.
//


//
// MessageId: ERROR_NO_PROMOTION_ACTIVE
//
// MessageText:
//
// A domain controller promotion is not currently active
//


// 8223 unused
//
// MessageId: ERROR_DS_OPERATIONS_ERROR
//
// MessageText:
//
// An operations error occurred.
//


//
// MessageId: ERROR_DS_PROTOCOL_ERROR
//
// MessageText:
//
// A protocol error occurred.
//


//
// MessageId: ERROR_DS_TIMELIMIT_EXCEEDED
//
// MessageText:
//
// The time limit for this request was exceeded.
//


//
// MessageId: ERROR_DS_SIZELIMIT_EXCEEDED
//
// MessageText:
//
// The size limit for this request was exceeded.
//


//
// MessageId: ERROR_DS_ADMIN_LIMIT_EXCEEDED
//
// MessageText:
//
// The administrative limit for this request was exceeded.
//


//
// MessageId: ERROR_DS_COMPARE_FALSE
//
// MessageText:
//
// The compare response was false.
//


//
// MessageId: ERROR_DS_COMPARE_TRUE
//
// MessageText:
//
// The compare response was true.
//


//
// MessageId: ERROR_DS_AUTH_METHOD_NOT_SUPPORTED
//
// MessageText:
//
// The requested authentication method is not supported by the server.
//


//
// MessageId: ERROR_DS_STRONG_AUTH_REQUIRED
//
// MessageText:
//
// A more secure authentication method is required for this server.
//


//
// MessageId: ERROR_DS_INAPPROPRIATE_AUTH
//
// MessageText:
//
// Inappropriate authentication.
//


//
// MessageId: ERROR_DS_AUTH_UNKNOWN
//
// MessageText:
//
// The authentication mechanism is unknown.
//


//
// MessageId: ERROR_DS_REFERRAL
//
// MessageText:
//
// A referral was returned from the server.
//


//
// MessageId: ERROR_DS_UNAVAILABLE_CRIT_EXTENSION
//
// MessageText:
//
// The server does not support the requested critical extension.
//


//
// MessageId: ERROR_DS_CONFIDENTIALITY_REQUIRED
//
// MessageText:
//
// This request requires a secure connection.
//


//
// MessageId: ERROR_DS_INAPPROPRIATE_MATCHING
//
// MessageText:
//
// Inappropriate matching.
//


//
// MessageId: ERROR_DS_CONSTRAINT_VIOLATION
//
// MessageText:
//
// A constraint violation occurred.
//


//
// MessageId: ERROR_DS_NO_SUCH_OBJECT
//
// MessageText:
//
// There is no such object on the server.
//


//
// MessageId: ERROR_DS_ALIAS_PROBLEM
//
// MessageText:
//
// There is an alias problem.
//


//
// MessageId: ERROR_DS_INVALID_DN_SYNTAX
//
// MessageText:
//
// An invalid dn syntax has been specified.
//


//
// MessageId: ERROR_DS_IS_LEAF
//
// MessageText:
//
// The object is a leaf object.
//


//
// MessageId: ERROR_DS_ALIAS_DEREF_PROBLEM
//
// MessageText:
//
// There is an alias dereferencing problem.
//


//
// MessageId: ERROR_DS_UNWILLING_TO_PERFORM
//
// MessageText:
//
// The server is unwilling to process the request.
//


//
// MessageId: ERROR_DS_LOOP_DETECT
//
// MessageText:
//
// A loop has been detected.
//


//
// MessageId: ERROR_DS_NAMING_VIOLATION
//
// MessageText:
//
// There is a naming violation.
//


//
// MessageId: ERROR_DS_OBJECT_RESULTS_TOO_LARGE
//
// MessageText:
//
// The result set is too large.
//


//
// MessageId: ERROR_DS_AFFECTS_MULTIPLE_DSAS
//
// MessageText:
//
// The operation affects multiple DSAs
//


//
// MessageId: ERROR_DS_SERVER_DOWN
//
// MessageText:
//
// The server is not operational.
//


//
// MessageId: ERROR_DS_LOCAL_ERROR
//
// MessageText:
//
// A local error has occurred.
//


//
// MessageId: ERROR_DS_ENCODING_ERROR
//
// MessageText:
//
// An encoding error has occurred.
//


//
// MessageId: ERROR_DS_DECODING_ERROR
//
// MessageText:
//
// A decoding error has occurred.
//


//
// MessageId: ERROR_DS_FILTER_UNKNOWN
//
// MessageText:
//
// The search filter cannot be recognized.
//


//
// MessageId: ERROR_DS_PARAM_ERROR
//
// MessageText:
//
// One or more parameters are illegal.
//


//
// MessageId: ERROR_DS_NOT_SUPPORTED
//
// MessageText:
//
// The specified method is not supported.
//


//
// MessageId: ERROR_DS_NO_RESULTS_RETURNED
//
// MessageText:
//
// No results were returned.
//


//
// MessageId: ERROR_DS_CONTROL_NOT_FOUND
//
// MessageText:
//
// The specified control is not supported by the server.
//


//
// MessageId: ERROR_DS_CLIENT_LOOP
//
// MessageText:
//
// A referral loop was detected by the client.
//


//
// MessageId: ERROR_DS_REFERRAL_LIMIT_EXCEEDED
//
// MessageText:
//
// The preset referral limit was exceeded.
//


//
// MessageId: ERROR_DS_SORT_CONTROL_MISSING
//
// MessageText:
//
// The search requires a SORT control.
//


//
// MessageId: ERROR_DS_OFFSET_RANGE_ERROR
//
// MessageText:
//
// The search results exceed the offset range specified.
//


//
// MessageId: ERROR_DS_ROOT_MUST_BE_NC
//
// MessageText:
//
// The root object must be the head of a naming context. The root object cannot have an instantiated parent.
//


//
// MessageId: ERROR_DS_ADD_REPLICA_INHIBITED
//
// MessageText:
//
// The add replica operation cannot be performed. The naming context must be writeable in order to create the replica.
//


//
// MessageId: ERROR_DS_ATT_NOT_DEF_IN_SCHEMA
//
// MessageText:
//
// A reference to an attribute that is not defined in the schema occurred.
//


//
// MessageId: ERROR_DS_MAX_OBJ_SIZE_EXCEEDED
//
// MessageText:
//
// The maximum size of an object has been exceeded.
//


//
// MessageId: ERROR_DS_OBJ_STRING_NAME_EXISTS
//
// MessageText:
//
// An attempt was made to add an object to the directory with a name that is already in use.
//


//
// MessageId: ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA
//
// MessageText:
//
// An attempt was made to add an object of a class that does not have an RDN defined in the schema.
//


//
// MessageId: ERROR_DS_RDN_DOESNT_MATCH_SCHEMA
//
// MessageText:
//
// An attempt was made to add an object using an RDN that is not the RDN defined in the schema.
//


//
// MessageId: ERROR_DS_NO_REQUESTED_ATTS_FOUND
//
// MessageText:
//
// None of the requested attributes were found on the objects.
//


//
// MessageId: ERROR_DS_USER_BUFFER_TO_SMALL
//
// MessageText:
//
// The user buffer is too small.
//


//
// MessageId: ERROR_DS_ATT_IS_NOT_ON_OBJ
//
// MessageText:
//
// The attribute specified in the operation is not present on the object.
//


//
// MessageId: ERROR_DS_ILLEGAL_MOD_OPERATION
//
// MessageText:
//
// Illegal modify operation. Some aspect of the modification is not permitted.
//


//
// MessageId: ERROR_DS_OBJ_TOO_LARGE
//
// MessageText:
//
// The specified object is too large.
//


//
// MessageId: ERROR_DS_BAD_INSTANCE_TYPE
//
// MessageText:
//
// The specified instance type is not valid.
//


//
// MessageId: ERROR_DS_MASTERDSA_REQUIRED
//
// MessageText:
//
// The operation must be performed at a master DSA.
//


//
// MessageId: ERROR_DS_OBJECT_CLASS_REQUIRED
//
// MessageText:
//
// The object class attribute must be specified.
//


//
// MessageId: ERROR_DS_MISSING_REQUIRED_ATT
//
// MessageText:
//
// A required attribute is missing.
//


//
// MessageId: ERROR_DS_ATT_NOT_DEF_FOR_CLASS
//
// MessageText:
//
// An attempt was made to modify an object to include an attribute that is not legal for its class.
//


//
// MessageId: ERROR_DS_ATT_ALREADY_EXISTS
//
// MessageText:
//
// The specified attribute is already present on the object.
//


// 8319 unused
//
// MessageId: ERROR_DS_CANT_ADD_ATT_VALUES
//
// MessageText:
//
// The specified attribute is not present, or has no values.
//


//
// MessageId: ERROR_DS_SINGLE_VALUE_CONSTRAINT
//
// MessageText:
//
// Multiple values were specified for an attribute that can have only one value.
//


//
// MessageId: ERROR_DS_RANGE_CONSTRAINT
//
// MessageText:
//
// A value for the attribute was not in the acceptable range of values.
//


//
// MessageId: ERROR_DS_ATT_VAL_ALREADY_EXISTS
//
// MessageText:
//
// The specified value already exists.
//


//
// MessageId: ERROR_DS_CANT_REM_MISSING_ATT
//
// MessageText:
//
// The attribute cannot be removed because it is not present on the object.
//


//
// MessageId: ERROR_DS_CANT_REM_MISSING_ATT_VAL
//
// MessageText:
//
// The attribute value cannot be removed because it is not present on the object.
//


//
// MessageId: ERROR_DS_ROOT_CANT_BE_SUBREF
//
// MessageText:
//
// The specified root object cannot be a subref.
//


//
// MessageId: ERROR_DS_NO_CHAINING
//
// MessageText:
//
// Chaining is not permitted.
//


//
// MessageId: ERROR_DS_NO_CHAINED_EVAL
//
// MessageText:
//
// Chained evaluation is not permitted.
//


//
// MessageId: ERROR_DS_NO_PARENT_OBJECT
//
// MessageText:
//
// The operation could not be performed because the object's parent is either uninstantiated or deleted.
//


//
// MessageId: ERROR_DS_PARENT_IS_AN_ALIAS
//
// MessageText:
//
// Having a parent that is an alias is not permitted. Aliases are leaf objects.
//


//
// MessageId: ERROR_DS_CANT_MIX_MASTER_AND_REPS
//
// MessageText:
//
// The object and parent must be of the same type, either both masters or both replicas.
//


//
// MessageId: ERROR_DS_CHILDREN_EXIST
//
// MessageText:
//
// The operation cannot be performed because child objects exist. This operation can only be performed on a leaf object.
//


//
// MessageId: ERROR_DS_OBJ_NOT_FOUND
//
// MessageText:
//
// Directory object not found.
//


//
// MessageId: ERROR_DS_ALIASED_OBJ_MISSING
//
// MessageText:
//
// The aliased object is missing.
//


//
// MessageId: ERROR_DS_BAD_NAME_SYNTAX
//
// MessageText:
//
// The object name has bad syntax.
//


//
// MessageId: ERROR_DS_ALIAS_POINTS_TO_ALIAS
//
// MessageText:
//
// It is not permitted for an alias to refer to another alias.
//


//
// MessageId: ERROR_DS_CANT_DEREF_ALIAS
//
// MessageText:
//
// The alias cannot be dereferenced.
//


//
// MessageId: ERROR_DS_OUT_OF_SCOPE
//
// MessageText:
//
// The operation is out of scope.
//


//
// MessageId: ERROR_DS_OBJECT_BEING_REMOVED
//
// MessageText:
//
// The operation cannot continue because the object is in the process of being removed.
//


//
// MessageId: ERROR_DS_CANT_DELETE_DSA_OBJ
//
// MessageText:
//
// The DSA object cannot be deleted.
//


//
// MessageId: ERROR_DS_GENERIC_ERROR
//
// MessageText:
//
// A directory service error has occurred.
//


//
// MessageId: ERROR_DS_DSA_MUST_BE_INT_MASTER
//
// MessageText:
//
// The operation can only be performed on an internal master DSA object.
//


//
// MessageId: ERROR_DS_CLASS_NOT_DSA
//
// MessageText:
//
// The object must be of class DSA.
//


//
// MessageId: ERROR_DS_INSUFF_ACCESS_RIGHTS
//
// MessageText:
//
// Insufficient access rights to perform the operation.
//


//
// MessageId: ERROR_DS_ILLEGAL_SUPERIOR
//
// MessageText:
//
// The object cannot be added because the parent is not on the list of possible superiors.
//


//
// MessageId: ERROR_DS_ATTRIBUTE_OWNED_BY_SAM
//
// MessageText:
//
// Access to the attribute is not permitted because the attribute is owned by the Security Accounts Manager (SAM).
//


//
// MessageId: ERROR_DS_NAME_TOO_MANY_PARTS
//
// MessageText:
//
// The name has too many parts.
//


//
// MessageId: ERROR_DS_NAME_TOO_LONG
//
// MessageText:
//
// The name is too long.
//


//
// MessageId: ERROR_DS_NAME_VALUE_TOO_LONG
//
// MessageText:
//
// The name value is too long.
//


//
// MessageId: ERROR_DS_NAME_UNPARSEABLE
//
// MessageText:
//
// The directory service encountered an error parsing a name.
//


//
// MessageId: ERROR_DS_NAME_TYPE_UNKNOWN
//
// MessageText:
//
// The directory service cannot get the attribute type for a name.
//


//
// MessageId: ERROR_DS_NOT_AN_OBJECT
//
// MessageText:
//
// The name does not identify an object; the name identifies a phantom.
//


//
// MessageId: ERROR_DS_SEC_DESC_TOO_SHORT
//
// MessageText:
//
// The security descriptor is too short.
//


//
// MessageId: ERROR_DS_SEC_DESC_INVALID
//
// MessageText:
//
// The security descriptor is invalid.
//


//
// MessageId: ERROR_DS_NO_DELETED_NAME
//
// MessageText:
//
// Failed to create name for deleted object.
//


//
// MessageId: ERROR_DS_SUBREF_MUST_HAVE_PARENT
//
// MessageText:
//
// The parent of a new subref must exist.
//


//
// MessageId: ERROR_DS_NCNAME_MUST_BE_NC
//
// MessageText:
//
// The object must be a naming context.
//


//
// MessageId: ERROR_DS_CANT_ADD_SYSTEM_ONLY
//
// MessageText:
//
// It is not permitted to add an attribute which is owned by the system.
//


//
// MessageId: ERROR_DS_CLASS_MUST_BE_CONCRETE
//
// MessageText:
//
// The class of the object must be structural; you cannot instantiate an abstract class.
//


//
// MessageId: ERROR_DS_INVALID_DMD
//
// MessageText:
//
// The schema object could not be found.
//


//
// MessageId: ERROR_DS_OBJ_GUID_EXISTS
//
// MessageText:
//
// A local object with this GUID (dead or alive) already exists.
//


//
// MessageId: ERROR_DS_NOT_ON_BACKLINK
//
// MessageText:
//
// The operation cannot be performed on a back link.
//


//
// MessageId: ERROR_DS_NO_CROSSREF_FOR_NC
//
// MessageText:
//
// The cross reference for the specified naming context could not be found.
//


//
// MessageId: ERROR_DS_SHUTTING_DOWN
//
// MessageText:
//
// The operation could not be performed because the directory service is shutting down.
//


//
// MessageId: ERROR_DS_UNKNOWN_OPERATION
//
// MessageText:
//
// The directory service request is invalid.
//


//
// MessageId: ERROR_DS_INVALID_ROLE_OWNER
//
// MessageText:
//
// The role owner attribute could not be read.
//


//
// MessageId: ERROR_DS_COULDNT_CONTACT_FSMO
//
// MessageText:
//
// The requested FSMO operation failed. The current FSMO holder could not be contacted.
//


//
// MessageId: ERROR_DS_CROSS_NC_DN_RENAME
//
// MessageText:
//
// Modification of a DN across a naming context is not permitted.
//


//
// MessageId: ERROR_DS_CANT_MOD_SYSTEM_ONLY
//
// MessageText:
//
// The attribute cannot be modified because it is owned by the system.
//


//
// MessageId: ERROR_DS_REPLICATOR_ONLY
//
// MessageText:
//
// Only the replicator can perform this function.
//


//
// MessageId: ERROR_DS_OBJ_CLASS_NOT_DEFINED
//
// MessageText:
//
// The specified class is not defined.
//


//
// MessageId: ERROR_DS_OBJ_CLASS_NOT_SUBCLASS
//
// MessageText:
//
// The specified class is not a subclass.
//


//
// MessageId: ERROR_DS_NAME_REFERENCE_INVALID
//
// MessageText:
//
// The name reference is invalid.
//


//
// MessageId: ERROR_DS_CROSS_REF_EXISTS
//
// MessageText:
//
// A cross reference already exists.
//


//
// MessageId: ERROR_DS_CANT_DEL_MASTER_CROSSREF
//
// MessageText:
//
// It is not permitted to delete a master cross reference.
//


//
// MessageId: ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD
//
// MessageText:
//
// Subtree notifications are only supported on NC heads.
//


//
// MessageId: ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX
//
// MessageText:
//
// Notification filter is too complex.
//


//
// MessageId: ERROR_DS_DUP_RDN
//
// MessageText:
//
// Schema update failed: duplicate RDN.
//


//
// MessageId: ERROR_DS_DUP_OID
//
// MessageText:
//
// Schema update failed: duplicate OID.
//


//
// MessageId: ERROR_DS_DUP_MAPI_ID
//
// MessageText:
//
// Schema update failed: duplicate MAPI identifier.
//


//
// MessageId: ERROR_DS_DUP_SCHEMA_ID_GUID
//
// MessageText:
//
// Schema update failed: duplicate schema-id GUID.
//


//
// MessageId: ERROR_DS_DUP_LDAP_DISPLAY_NAME
//
// MessageText:
//
// Schema update failed: duplicate LDAP display name.
//


//
// MessageId: ERROR_DS_SEMANTIC_ATT_TEST
//
// MessageText:
//
// Schema update failed: range-lower less than range upper.
//


//
// MessageId: ERROR_DS_SYNTAX_MISMATCH
//
// MessageText:
//
// Schema update failed: syntax mismatch.
//


//
// MessageId: ERROR_DS_EXISTS_IN_MUST_HAVE
//
// MessageText:
//
// Schema deletion failed: attribute is used in must-contain.
//


//
// MessageId: ERROR_DS_EXISTS_IN_MAY_HAVE
//
// MessageText:
//
// Schema deletion failed: attribute is used in may-contain.
//


//
// MessageId: ERROR_DS_NONEXISTENT_MAY_HAVE
//
// MessageText:
//
// Schema update failed: attribute in may-contain does not exist.
//


//
// MessageId: ERROR_DS_NONEXISTENT_MUST_HAVE
//
// MessageText:
//
// Schema update failed: attribute in must-contain does not exist.
//


//
// MessageId: ERROR_DS_AUX_CLS_TEST_FAIL
//
// MessageText:
//
// Schema update failed: class in aux-class list does not exist or is not an auxiliary class.
//


//
// MessageId: ERROR_DS_NONEXISTENT_POSS_SUP
//
// MessageText:
//
// Schema update failed: class in poss-superiors does not exist.
//


//
// MessageId: ERROR_DS_SUB_CLS_TEST_FAIL
//
// MessageText:
//
// Schema update failed: class in subclassof list does not exist or does not satisfy hierarchy rules.
//


//
// MessageId: ERROR_DS_BAD_RDN_ATT_ID_SYNTAX
//
// MessageText:
//
// Schema update failed: Rdn-Att-Id has wrong syntax.
//


//
// MessageId: ERROR_DS_EXISTS_IN_AUX_CLS
//
// MessageText:
//
// Schema deletion failed: class is used as auxiliary class.
//


//
// MessageId: ERROR_DS_EXISTS_IN_SUB_CLS
//
// MessageText:
//
// Schema deletion failed: class is used as sub class.
//


//
// MessageId: ERROR_DS_EXISTS_IN_POSS_SUP
//
// MessageText:
//
// Schema deletion failed: class is used as poss superior.
//


//
// MessageId: ERROR_DS_RECALCSCHEMA_FAILED
//
// MessageText:
//
// Schema update failed in recalculating validation cache.
//


//
// MessageId: ERROR_DS_TREE_DELETE_NOT_FINISHED
//
// MessageText:
//
// The tree deletion is not finished. The request must be made again to continue deleting the tree.
//


//
// MessageId: ERROR_DS_CANT_DELETE
//
// MessageText:
//
// The requested delete operation could not be performed.
//


//
// MessageId: ERROR_DS_ATT_SCHEMA_REQ_ID
//
// MessageText:
//
// Cannot read the governs class identifier for the schema record.
//


//
// MessageId: ERROR_DS_BAD_ATT_SCHEMA_SYNTAX
//
// MessageText:
//
// The attribute schema has bad syntax.
//


//
// MessageId: ERROR_DS_CANT_CACHE_ATT
//
// MessageText:
//
// The attribute could not be cached.
//


//
// MessageId: ERROR_DS_CANT_CACHE_CLASS
//
// MessageText:
//
// The class could not be cached.
//


//
// MessageId: ERROR_DS_CANT_REMOVE_ATT_CACHE
//
// MessageText:
//
// The attribute could not be removed from the cache.
//


//
// MessageId: ERROR_DS_CANT_REMOVE_CLASS_CACHE
//
// MessageText:
//
// The class could not be removed from the cache.
//


//
// MessageId: ERROR_DS_CANT_RETRIEVE_DN
//
// MessageText:
//
// The distinguished name attribute could not be read.
//


//
// MessageId: ERROR_DS_MISSING_SUPREF
//
// MessageText:
//
// No superior reference has been configured for the directory service. The directory service is therefore unable to issue referrals to objects outside this forest.
//


//
// MessageId: ERROR_DS_CANT_RETRIEVE_INSTANCE
//
// MessageText:
//
// The instance type attribute could not be retrieved.
//


//
// MessageId: ERROR_DS_CODE_INCONSISTENCY
//
// MessageText:
//
// An internal error has occurred.
//


//
// MessageId: ERROR_DS_DATABASE_ERROR
//
// MessageText:
//
// A database error has occurred.
//


//
// MessageId: ERROR_DS_GOVERNSID_MISSING
//
// MessageText:
//
// The attribute GOVERNSID is missing.
//


//
// MessageId: ERROR_DS_MISSING_EXPECTED_ATT
//
// MessageText:
//
// An expected attribute is missing.
//


//
// MessageId: ERROR_DS_NCNAME_MISSING_CR_REF
//
// MessageText:
//
// The specified naming context is missing a cross reference.
//


//
// MessageId: ERROR_DS_SECURITY_CHECKING_ERROR
//
// MessageText:
//
// A security checking error has occurred.
//


//
// MessageId: ERROR_DS_SCHEMA_NOT_LOADED
//
// MessageText:
//
// The schema is not loaded.
//


//
// MessageId: ERROR_DS_SCHEMA_ALLOC_FAILED
//
// MessageText:
//
// Schema allocation failed. Please check if the machine is running low on memory.
//


//
// MessageId: ERROR_DS_ATT_SCHEMA_REQ_SYNTAX
//
// MessageText:
//
// Failed to obtain the required syntax for the attribute schema.
//


//
// MessageId: ERROR_DS_GCVERIFY_ERROR
//
// MessageText:
//
// The global catalog verification failed. The global catalog is not available or does not support the operation. Some part of the directory is currently not available.
//


//
// MessageId: ERROR_DS_DRA_SCHEMA_MISMATCH
//
// MessageText:
//
// The replication operation failed because of a schema mismatch between the servers involved.
//


//
// MessageId: ERROR_DS_CANT_FIND_DSA_OBJ
//
// MessageText:
//
// The DSA object could not be found.
//


//
// MessageId: ERROR_DS_CANT_FIND_EXPECTED_NC
//
// MessageText:
//
// The naming context could not be found.
//


//
// MessageId: ERROR_DS_CANT_FIND_NC_IN_CACHE
//
// MessageText:
//
// The naming context could not be found in the cache.
//


//
// MessageId: ERROR_DS_CANT_RETRIEVE_CHILD
//
// MessageText:
//
// The child object could not be retrieved.
//


//
// MessageId: ERROR_DS_SECURITY_ILLEGAL_MODIFY
//
// MessageText:
//
// The modification was not permitted for security reasons.
//


//
// MessageId: ERROR_DS_CANT_REPLACE_HIDDEN_REC
//
// MessageText:
//
// The operation cannot replace the hidden record.
//


//
// MessageId: ERROR_DS_BAD_HIERARCHY_FILE
//
// MessageText:
//
// The hierarchy file is invalid.
//


//
// MessageId: ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED
//
// MessageText:
//
// The attempt to build the hierarchy table failed.
//


//
// MessageId: ERROR_DS_CONFIG_PARAM_MISSING
//
// MessageText:
//
// The directory configuration parameter is missing from the registry.
//


//
// MessageId: ERROR_DS_COUNTING_AB_INDICES_FAILED
//
// MessageText:
//
// The attempt to count the address book indices failed.
//


//
// MessageId: ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED
//
// MessageText:
//
// The allocation of the hierarchy table failed.
//


//
// MessageId: ERROR_DS_INTERNAL_FAILURE
//
// MessageText:
//
// The directory service encountered an internal failure.
//


//
// MessageId: ERROR_DS_UNKNOWN_ERROR
//
// MessageText:
//
// The directory service encountered an unknown failure.
//


//
// MessageId: ERROR_DS_ROOT_REQUIRES_CLASS_TOP
//
// MessageText:
//
// A root object requires a class of 'top'.
//


//
// MessageId: ERROR_DS_REFUSING_FSMO_ROLES
//
// MessageText:
//
// This directory server is shutting down, and cannot take ownership of new floating single-master operation roles.
//


//
// MessageId: ERROR_DS_MISSING_FSMO_SETTINGS
//
// MessageText:
//
// The directory service is missing mandatory configuration information, and is unable to determine the ownership of floating single-master operation roles.
//


//
// MessageId: ERROR_DS_UNABLE_TO_SURRENDER_ROLES
//
// MessageText:
//
// The directory service was unable to transfer ownership of one or more floating single-master operation roles to other servers.
//


//
// MessageId: ERROR_DS_DRA_GENERIC
//
// MessageText:
//
// The replication operation failed.
//


//
// MessageId: ERROR_DS_DRA_INVALID_PARAMETER
//
// MessageText:
//
// An invalid parameter was specified for this replication operation.
//


//
// MessageId: ERROR_DS_DRA_BUSY
//
// MessageText:
//
// The directory service is too busy to complete the replication operation at this time.
//


//
// MessageId: ERROR_DS_DRA_BAD_DN
//
// MessageText:
//
// The distinguished name specified for this replication operation is invalid.
//


//
// MessageId: ERROR_DS_DRA_BAD_NC
//
// MessageText:
//
// The naming context specified for this replication operation is invalid.
//


//
// MessageId: ERROR_DS_DRA_DN_EXISTS
//
// MessageText:
//
// The distinguished name specified for this replication operation already exists.
//


//
// MessageId: ERROR_DS_DRA_INTERNAL_ERROR
//
// MessageText:
//
// The replication system encountered an internal error.
//


//
// MessageId: ERROR_DS_DRA_INCONSISTENT_DIT
//
// MessageText:
//
// The replication operation encountered a database inconsistency.
//


//
// MessageId: ERROR_DS_DRA_CONNECTION_FAILED
//
// MessageText:
//
// The server specified for this replication operation could not be contacted.
//


//
// MessageId: ERROR_DS_DRA_BAD_INSTANCE_TYPE
//
// MessageText:
//
// The replication operation encountered an object with an invalid instance type.
//


//
// MessageId: ERROR_DS_DRA_OUT_OF_MEM
//
// MessageText:
//
// The replication operation failed to allocate memory.
//


//
// MessageId: ERROR_DS_DRA_MAIL_PROBLEM
//
// MessageText:
//
// The replication operation encountered an error with the mail system.
//


//
// MessageId: ERROR_DS_DRA_REF_ALREADY_EXISTS
//
// MessageText:
//
// The replication reference information for the target server already exists.
//


//
// MessageId: ERROR_DS_DRA_REF_NOT_FOUND
//
// MessageText:
//
// The replication reference information for the target server does not exist.
//


//
// MessageId: ERROR_DS_DRA_OBJ_IS_REP_SOURCE
//
// MessageText:
//
// The naming context cannot be removed because it is replicated to another server.
//


//
// MessageId: ERROR_DS_DRA_DB_ERROR
//
// MessageText:
//
// The replication operation encountered a database error.
//


//
// MessageId: ERROR_DS_DRA_NO_REPLICA
//
// MessageText:
//
// The naming context is in the process of being removed or is not replicated from the specified server.
//


//
// MessageId: ERROR_DS_DRA_ACCESS_DENIED
//
// MessageText:
//
// Replication access was denied.
//


//
// MessageId: ERROR_DS_DRA_NOT_SUPPORTED
//
// MessageText:
//
// The requested operation is not supported by this version of the directory service.
//


//
// MessageId: ERROR_DS_DRA_RPC_CANCELLED
//
// MessageText:
//
// The replication remote procedure call was cancelled.
//


//
// MessageId: ERROR_DS_DRA_SOURCE_DISABLED
//
// MessageText:
//
// The source server is currently rejecting replication requests.
//


//
// MessageId: ERROR_DS_DRA_SINK_DISABLED
//
// MessageText:
//
// The destination server is currently rejecting replication requests.
//


//
// MessageId: ERROR_DS_DRA_NAME_COLLISION
//
// MessageText:
//
// The replication operation failed due to a collision of object names.
//


//
// MessageId: ERROR_DS_DRA_SOURCE_REINSTALLED
//
// MessageText:
//
// The replication source has been reinstalled.
//


//
// MessageId: ERROR_DS_DRA_MISSING_PARENT
//
// MessageText:
//
// The replication operation failed because a required parent object is missing.
//


//
// MessageId: ERROR_DS_DRA_PREEMPTED
//
// MessageText:
//
// The replication operation was preempted.
//


//
// MessageId: ERROR_DS_DRA_ABANDON_SYNC
//
// MessageText:
//
// The replication synchronization attempt was abandoned because of a lack of updates.
//


//
// MessageId: ERROR_DS_DRA_SHUTDOWN
//
// MessageText:
//
// The replication operation was terminated because the system is shutting down.
//


//
// MessageId: ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET
//
// MessageText:
//
// Synchronization attempt failed because the destination DC is currently waiting to synchronize new partial attributes from source. This condition is normal if a recent schema change modified the partial attribute set. The destination partial attribute set is not a subset of source partial attribute set.
//


//
// MessageId: ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA
//
// MessageText:
//
// The replication synchronization attempt failed because a master replica attempted to sync from a partial replica.
//


//
// MessageId: ERROR_DS_DRA_EXTN_CONNECTION_FAILED
//
// MessageText:
//
// The server specified for this replication operation was contacted, but that server was unable to contact an additional server needed to complete the operation.
//


//
// MessageId: ERROR_DS_INSTALL_SCHEMA_MISMATCH
//
// MessageText:
//
// The version of the directory service schema of the source forest is not compatible with the version of directory service on this computer.
//


//
// MessageId: ERROR_DS_DUP_LINK_ID
//
// MessageText:
//
// Schema update failed: An attribute with the same link identifier already exists.
//


//
// MessageId: ERROR_DS_NAME_ERROR_RESOLVING
//
// MessageText:
//
// Name translation: Generic processing error.
//


//
// MessageId: ERROR_DS_NAME_ERROR_NOT_FOUND
//
// MessageText:
//
// Name translation: Could not find the name or insufficient right to see name.
//


//
// MessageId: ERROR_DS_NAME_ERROR_NOT_UNIQUE
//
// MessageText:
//
// Name translation: Input name mapped to more than one output name.
//


//
// MessageId: ERROR_DS_NAME_ERROR_NO_MAPPING
//
// MessageText:
//
// Name translation: Input name found, but not the associated output format.
//


//
// MessageId: ERROR_DS_NAME_ERROR_DOMAIN_ONLY
//
// MessageText:
//
// Name translation: Unable to resolve completely, only the domain was found.
//


//
// MessageId: ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING
//
// MessageText:
//
// Name translation: Unable to perform purely syntactical mapping at the client without going out to the wire.
//


//
// MessageId: ERROR_DS_CONSTRUCTED_ATT_MOD
//
// MessageText:
//
// Modification of a constructed attribute is not allowed.
//


//
// MessageId: ERROR_DS_WRONG_OM_OBJ_CLASS
//
// MessageText:
//
// The OM-Object-Class specified is incorrect for an attribute with the specified syntax.
//


//
// MessageId: ERROR_DS_DRA_REPL_PENDING
//
// MessageText:
//
// The replication request has been posted; waiting for reply.
//


//
// MessageId: ERROR_DS_DS_REQUIRED
//
// MessageText:
//
// The requested operation requires a directory service, and none was available.
//


//
// MessageId: ERROR_DS_INVALID_LDAP_DISPLAY_NAME
//
// MessageText:
//
// The LDAP display name of the class or attribute contains non-ASCII characters.
//


//
// MessageId: ERROR_DS_NON_BASE_SEARCH
//
// MessageText:
//
// The requested search operation is only supported for base searches.
//


//
// MessageId: ERROR_DS_CANT_RETRIEVE_ATTS
//
// MessageText:
//
// The search failed to retrieve attributes from the database.
//


//
// MessageId: ERROR_DS_BACKLINK_WITHOUT_LINK
//
// MessageText:
//
// The schema update operation tried to add a backward link attribute that has no corresponding forward link.
//


//
// MessageId: ERROR_DS_EPOCH_MISMATCH
//
// MessageText:
//
// Source and destination of a cross-domain move do not agree on the object's epoch number. Either source or destination does not have the latest version of the object.
//


//
// MessageId: ERROR_DS_SRC_NAME_MISMATCH
//
// MessageText:
//
// Source and destination of a cross-domain move do not agree on the object's current name. Either source or destination does not have the latest version of the object.
//


//
// MessageId: ERROR_DS_SRC_AND_DST_NC_IDENTICAL
//
// MessageText:
//
// Source and destination for the cross-domain move operation are identical. Caller should use local move operation instead of cross-domain move operation.
//


//
// MessageId: ERROR_DS_DST_NC_MISMATCH
//
// MessageText:
//
// Source and destination for a cross-domain move are not in agreement on the naming contexts in the forest. Either source or destination does not have the latest version of the Partitions container.
//


//
// MessageId: ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC
//
// MessageText:
//
// Destination of a cross-domain move is not authoritative for the destination naming context.
//


//
// MessageId: ERROR_DS_SRC_GUID_MISMATCH
//
// MessageText:
//
// Source and destination of a cross-domain move do not agree on the identity of the source object. Either source or destination does not have the latest version of the source object.
//


//
// MessageId: ERROR_DS_CANT_MOVE_DELETED_OBJECT
//
// MessageText:
//
// Object being moved across-domains is already known to be deleted by the destination server. The source server does not have the latest version of the source object.
//


//
// MessageId: ERROR_DS_PDC_OPERATION_IN_PROGRESS
//
// MessageText:
//
// Another operation which requires exclusive access to the PDC FSMO is already in progress.
//


//
// MessageId: ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD
//
// MessageText:
//
// A cross-domain move operation failed such that two versions of the moved object exist - one each in the source and destination domains. The destination object needs to be removed to restore the system to a consistent state.
//


//
// MessageId: ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION
//
// MessageText:
//
// This object may not be moved across domain boundaries either because cross-domain moves for this class are disallowed, or the object has some special characteristics, e.g.: trust account or restricted RID, which prevent its move.
//


//
// MessageId: ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS
//
// MessageText:
//
// Can't move objects with memberships across domain boundaries as once moved, this would violate the membership conditions of the account group. Remove the object from any account group memberships and retry.
//


//
// MessageId: ERROR_DS_NC_MUST_HAVE_NC_PARENT
//
// MessageText:
//
// A naming context head must be the immediate child of another naming context head, not of an interior node.
//


//
// MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE
//
// MessageText:
//
// The directory cannot validate the proposed naming context name because it does not hold a replica of the naming context above the proposed naming context. Please ensure that the domain naming master role is held by a server that is configured as a global catalog server, and that the server is up to date with its replication partners. (Applies only to Windows 2000 Domain Naming masters)
//


//
// MessageId: ERROR_DS_DST_DOMAIN_NOT_NATIVE
//
// MessageText:
//
// Destination domain must be in native mode.
//


//
// MessageId: ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER
//
// MessageText:
//
// The operation cannot be performed because the server does not have an infrastructure container in the domain of interest.
//


//
// MessageId: ERROR_DS_CANT_MOVE_ACCOUNT_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty account groups is not allowed.
//


//
// MessageId: ERROR_DS_CANT_MOVE_RESOURCE_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty resource groups is not allowed.
//


//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG
//
// MessageText:
//
// The search flags for the attribute are invalid. The ANR bit is valid only on attributes of Unicode or Teletex strings.
//


//
// MessageId: ERROR_DS_NO_TREE_DELETE_ABOVE_NC
//
// MessageText:
//
// Tree deletions starting at an object which has an NC head as a descendant are not allowed.
//


//
// MessageId: ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE
//
// MessageText:
//
// The directory service failed to lock a tree in preparation for a tree deletion because the tree was in use.
//


//
// MessageId: ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE
//
// MessageText:
//
// The directory service failed to identify the list of objects to delete while attempting a tree deletion.
//


//
// MessageId: ERROR_DS_SAM_INIT_FAILURE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error: %1.
// Error Status: 0x%2. Click OK to shut down the system and reboot into Directory Services Restore Mode. Check the event log for detailed information.
//


//
// MessageId: ERROR_DS_SENSITIVE_GROUP_VIOLATION
//
// MessageText:
//
// Only an administrator can modify the membership list of an administrative group.
//


//
// MessageId: ERROR_DS_CANT_MOD_PRIMARYGROUPID
//
// MessageText:
//
// Cannot change the primary group ID of a domain controller account.
//


//
// MessageId: ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD
//
// MessageText:
//
// An attempt is made to modify the base schema.
//


//
// MessageId: ERROR_DS_NONSAFE_SCHEMA_CHANGE
//
// MessageText:
//
// Adding a new mandatory attribute to an existing class, deleting a mandatory attribute from an existing class, or adding an optional attribute to the special class Top that is not a backlink attribute (directly or through inheritance, for example, by adding or deleting an auxiliary class) is not allowed.
//


//
// MessageId: ERROR_DS_SCHEMA_UPDATE_DISALLOWED
//
// MessageText:
//
// Schema update is not allowed on this DC because the DC is not the schema FSMO Role Owner.
//


//
// MessageId: ERROR_DS_CANT_CREATE_UNDER_SCHEMA
//
// MessageText:
//
// An object of this class cannot be created under the schema container. You can only create attribute-schema and class-schema objects under the schema container.
//


//
// MessageId: ERROR_DS_INSTALL_NO_SRC_SCH_VERSION
//
// MessageText:
//
// The replica/child install failed to get the objectVersion attribute on the schema container on the source DC. Either the attribute is missing on the schema container or the credentials supplied do not have permission to read it.
//


//
// MessageId: ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE
//
// MessageText:
//
// The replica/child install failed to read the objectVersion attribute in the SCHEMA section of the file schema.ini in the system32 directory.
//


//
// MessageId: ERROR_DS_INVALID_GROUP_TYPE
//
// MessageText:
//
// The specified group type is invalid.
//


//
// MessageId: ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
// You cannot nest global groups in a mixed domain if the group is security-enabled.
//


//
// MessageId: ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
// You cannot nest local groups in a mixed domain if the group is security-enabled.
//


//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
// A global group cannot have a local group as a member.
//


//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
// A global group cannot have a universal group as a member.
//


//
// MessageId: ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
// A universal group cannot have a local group as a member.
//


//
// MessageId: ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER
//
// MessageText:
//
// A global group cannot have a cross-domain member.
//


//
// MessageId: ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER
//
// MessageText:
//
// A local group cannot have another cross domain local group as a member.
//


//
// MessageId: ERROR_DS_HAVE_PRIMARY_MEMBERS
//
// MessageText:
//
// A group with primary members cannot change to a security-disabled group.
//


//
// MessageId: ERROR_DS_STRING_SD_CONVERSION_FAILED
//
// MessageText:
//
// The schema cache load failed to convert the string default SD on a class-schema object.
//


//
// MessageId: ERROR_DS_NAMING_MASTER_GC
//
// MessageText:
//
// Only DSAs configured to be Global Catalog servers should be allowed to hold the Domain Naming Master FSMO role. (Applies only to Windows 2000 servers)
//


//
// MessageId: ERROR_DS_DNS_LOOKUP_FAILURE
//
// MessageText:
//
// The DSA operation is unable to proceed because of a DNS lookup failure.
//


//
// MessageId: ERROR_DS_COULDNT_UPDATE_SPNS
//
// MessageText:
//
// While processing a change to the DNS Host Name for an object, the Service Principal Name values could not be kept in sync.
//


//
// MessageId: ERROR_DS_CANT_RETRIEVE_SD
//
// MessageText:
//
// The Security Descriptor attribute could not be read.
//


//
// MessageId: ERROR_DS_KEY_NOT_UNIQUE
//
// MessageText:
//
// The object requested was not found, but an object with that key was found.
//


//
// MessageId: ERROR_DS_WRONG_LINKED_ATT_SYNTAX
//
// MessageText:
//
// The syntax of the linked attribute being added is incorrect. Forward links can only have syntax 2.5.5.1, 2.5.5.7, and 2.5.5.14, and backlinks can only have syntax 2.5.5.1
//


//
// MessageId: ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD
//
// MessageText:
//
// Security Account Manager needs to get the boot password.
//


//
// MessageId: ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY
//
// MessageText:
//
// Security Account Manager needs to get the boot key from floppy disk.
//


//
// MessageId: ERROR_DS_CANT_START
//
// MessageText:
//
// Directory Service cannot start.
//


//
// MessageId: ERROR_DS_INIT_FAILURE
//
// MessageText:
//
// Directory Services could not start.
//


//
// MessageId: ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION
//
// MessageText:
//
// The connection between client and server requires packet privacy or better.
//


//
// MessageId: ERROR_DS_SOURCE_DOMAIN_IN_FOREST
//
// MessageText:
//
// The source domain may not be in the same forest as destination.
//


//
// MessageId: ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST
//
// MessageText:
//
// The destination domain must be in the forest.
//


//
// MessageId: ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED
//
// MessageText:
//
// The operation requires that destination domain auditing be enabled.
//


//
// MessageId: ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN
//
// MessageText:
//
// The operation couldn't locate a DC for the source domain.
//


//
// MessageId: ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER
//
// MessageText:
//
// The source object must be a group or user.
//


//
// MessageId: ERROR_DS_SRC_SID_EXISTS_IN_FOREST
//
// MessageText:
//
// The source object's SID already exists in destination forest.
//


//
// MessageId: ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH
//
// MessageText:
//
// The source and destination object must be of the same type.
//


//
// MessageId: ERROR_SAM_INIT_FAILURE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error: %1.
// Error Status: 0x%2. Click OK to shut down the system and reboot into Safe Mode. Check the event log for detailed information.
//


//
// MessageId: ERROR_DS_DRA_SCHEMA_INFO_SHIP
//
// MessageText:
//
// Schema information could not be included in the replication request.
//


//
// MessageId: ERROR_DS_DRA_SCHEMA_CONFLICT
//
// MessageText:
//
// The replication operation could not be completed due to a schema incompatibility.
//


//
// MessageId: ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT
//
// MessageText:
//
// The replication operation could not be completed due to a previous schema incompatibility.
//


//
// MessageId: ERROR_DS_DRA_OBJ_NC_MISMATCH
//
// MessageText:
//
// The replication update could not be applied because either the source or the destination has not yet received information regarding a recent cross-domain move operation.
//


//
// MessageId: ERROR_DS_NC_STILL_HAS_DSAS
//
// MessageText:
//
// The requested domain could not be deleted because there exist domain controllers that still host this domain.
//


//
// MessageId: ERROR_DS_GC_REQUIRED
//
// MessageText:
//
// The requested operation can be performed only on a global catalog server.
//


//
// MessageId: ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY
//
// MessageText:
//
// A local group can only be a member of other local groups in the same domain.
//


//
// MessageId: ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS
//
// MessageText:
//
// Foreign security principals cannot be members of universal groups.
//


//
// MessageId: ERROR_DS_CANT_ADD_TO_GC
//
// MessageText:
//
// The attribute is not allowed to be replicated to the GC because of security reasons.
//


//
// MessageId: ERROR_DS_NO_CHECKPOINT_WITH_PDC
//
// MessageText:
//
// The checkpoint with the PDC could not be taken because there too many modifications being processed currently.
//


//
// MessageId: ERROR_DS_SOURCE_AUDITING_NOT_ENABLED
//
// MessageText:
//
// The operation requires that source domain auditing be enabled.
//


//
// MessageId: ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC
//
// MessageText:
//
// Security principal objects can only be created inside domain naming contexts.
//


//
// MessageId: ERROR_DS_INVALID_NAME_FOR_SPN
//
// MessageText:
//
// A Service Principal Name (SPN) could not be constructed because the provided hostname is not in the necessary format.
//


//
// MessageId: ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS
//
// MessageText:
//
// A Filter was passed that uses constructed attributes.
//


//
// MessageId: ERROR_DS_UNICODEPWD_NOT_IN_QUOTES
//
// MessageText:
//
// The unicodePwd attribute value must be enclosed in double quotes.
//


//
// MessageId: ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
//
// MessageText:
//
// Your computer could not be joined to the domain. You have exceeded the maximum number of computer accounts you are allowed to create in this domain. Contact your system administrator to have this limit reset or increased.
//


//
// MessageId: ERROR_DS_MUST_BE_RUN_ON_DST_DC
//
// MessageText:
//
// For security reasons, the operation must be run on the destination DC.
//


//
// MessageId: ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER
//
// MessageText:
//
// For security reasons, the source DC must be NT4SP4 or greater.
//


//
// MessageId: ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ
//
// MessageText:
//
// Critical Directory Service System objects cannot be deleted during tree delete operations. The tree delete may have been partially performed.
//


//
// MessageId: ERROR_DS_INIT_FAILURE_CONSOLE
//
// MessageText:
//
// Directory Services could not start because of the following error: %1.
// Error Status: 0x%2. Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
//


//
// MessageId: ERROR_DS_SAM_INIT_FAILURE_CONSOLE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error: %1.
// Error Status: 0x%2. Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
//


//
// MessageId: ERROR_DS_FOREST_VERSION_TOO_HIGH
//
// MessageText:
//
// The version of the operating system installed is incompatible with the current forest functional level. You must upgrade to a new version of the operating system before this server can become a domain controller in this forest.
//


//
// MessageId: ERROR_DS_DOMAIN_VERSION_TOO_HIGH
//
// MessageText:
//
// The version of the operating system installed is incompatible with the current domain functional level. You must upgrade to a new version of the operating system before this server can become a domain controller in this domain.
//


//
// MessageId: ERROR_DS_FOREST_VERSION_TOO_LOW
//
// MessageText:
//
// The version of the operating system installed on this server no longer supports the current forest functional level. You must raise the forest functional level before this server can become a domain controller in this forest.
//


//
// MessageId: ERROR_DS_DOMAIN_VERSION_TOO_LOW
//
// MessageText:
//
// The version of the operating system installed on this server no longer supports the current domain functional level. You must raise the domain functional level before this server can become a domain controller in this domain.
//


//
// MessageId: ERROR_DS_INCOMPATIBLE_VERSION
//
// MessageText:
//
// The version of the operating system installed on this server is incompatible with the functional level of the domain or forest.
//


//
// MessageId: ERROR_DS_LOW_DSA_VERSION
//
// MessageText:
//
// The functional level of the domain (or forest) cannot be raised to the requested value, because there exist one or more domain controllers in the domain (or forest) that are at a lower incompatible functional level.
//


//
// MessageId: ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN
//
// MessageText:
//
// The forest functional level cannot be raised to the requested value since one or more domains are still in mixed domain mode. All domains in the forest must be in native mode, for you to raise the forest functional level.
//


//
// MessageId: ERROR_DS_NOT_SUPPORTED_SORT_ORDER
//
// MessageText:
//
// The sort order requested is not supported.
//


//
// MessageId: ERROR_DS_NAME_NOT_UNIQUE
//
// MessageText:
//
// The requested name already exists as a unique identifier.
//


//
// MessageId: ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4
//
// MessageText:
//
// The machine account was created pre-NT4. The account needs to be recreated.
//


//
// MessageId: ERROR_DS_OUT_OF_VERSION_STORE
//
// MessageText:
//
// The database is out of version store.
//


//
// MessageId: ERROR_DS_INCOMPATIBLE_CONTROLS_USED
//
// MessageText:
//
// Unable to continue operation because multiple conflicting controls were used.
//


//
// MessageId: ERROR_DS_NO_REF_DOMAIN
//
// MessageText:
//
// Unable to find a valid security descriptor reference domain for this partition.
//


//
// MessageId: ERROR_DS_RESERVED_LINK_ID
//
// MessageText:
//
// Schema update failed: The link identifier is reserved.
//


//
// MessageId: ERROR_DS_LINK_ID_NOT_AVAILABLE
//
// MessageText:
//
// Schema update failed: There are no link identifiers available.
//


//
// MessageId: ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
// An account group cannot have a universal group as a member.
//


//
// MessageId: ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE
//
// MessageText:
//
// Rename or move operations on naming context heads or read-only objects are not allowed.
//


//
// MessageId: ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC
//
// MessageText:
//
// Move operations on objects in the schema naming context are not allowed.
//


//
// MessageId: ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG
//
// MessageText:
//
// A system flag has been set on the object and does not allow the object to be moved or renamed.
//


//
// MessageId: ERROR_DS_MODIFYDN_WRONG_GRANDPARENT
//
// MessageText:
//
// This object is not allowed to change its grandparent container. Moves are not forbidden on this object, but are restricted to sibling containers.
//


//
// MessageId: ERROR_DS_NAME_ERROR_TRUST_REFERRAL
//
// MessageText:
//
// Unable to resolve completely, a referral to another forest is generated.
//


//
// MessageId: ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER
//
// MessageText:
//
// The requested action is not supported on standard server.
//


//
// MessageId: ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD
//
// MessageText:
//
// Could not access a partition of the directory service located on a remote server. Make sure at least one server is running for the partition in question.
//


//
// MessageId: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2
//
// MessageText:
//
// The directory cannot validate the proposed naming context (or partition) name because it does not hold a replica nor can it contact a replica of the naming context above the proposed naming context. Please ensure that the parent naming context is properly registered in DNS, and at least one replica of this naming context is reachable by the Domain Naming master.
//


//
// MessageId: ERROR_DS_THREAD_LIMIT_EXCEEDED
//
// MessageText:
//
// The thread limit for this request was exceeded.
//


//
// MessageId: ERROR_DS_NOT_CLOSEST
//
// MessageText:
//
// The Global catalog server is not in the closest site.
//


//
// MessageId: ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF
//
// MessageText:
//
// The DS cannot derive a service principal name (SPN) with which to mutually authenticate the target server because the corresponding server object in the local DS database has no serverReference attribute.
//


//
// MessageId: ERROR_DS_SINGLE_USER_MODE_FAILED
//
// MessageText:
//
// The Directory Service failed to enter single user mode.
//


//
// MessageId: ERROR_DS_NTDSCRIPT_SYNTAX_ERROR
//
// MessageText:
//
// The Directory Service cannot parse the script because of a syntax error.
//


//
// MessageId: ERROR_DS_NTDSCRIPT_PROCESS_ERROR
//
// MessageText:
//
// The Directory Service cannot process the script because of an error.
//


//
// MessageId: ERROR_DS_DIFFERENT_REPL_EPOCHS
//
// MessageText:
//
// The directory service cannot perform the requested operation because the servers
// involved are of different replication epochs (which is usually related to a
// domain rename that is in progress).
//


//
// MessageId: ERROR_DS_DRS_EXTENSIONS_CHANGED
//
// MessageText:
//
// The directory service binding must be renegotiated due to a change in the server
// extensions information.
//


//
// MessageId: ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR
//
// MessageText:
//
// Operation not allowed on a disabled cross ref.
//


//
// MessageId: ERROR_DS_NO_MSDS_INTID
//
// MessageText:
//
// Schema update failed: No values for msDS-IntId are available.
//


//
// MessageId: ERROR_DS_DUP_MSDS_INTID
//
// MessageText:
//
// Schema update failed: Duplicate msDS-INtId. Retry the operation.
//


//
// MessageId: ERROR_DS_EXISTS_IN_RDNATTID
//
// MessageText:
//
// Schema deletion failed: attribute is used in rDNAttID.
//


//
// MessageId: ERROR_DS_AUTHORIZATION_FAILED
//
// MessageText:
//
// The directory service failed to authorize the request.
//


//
// MessageId: ERROR_DS_INVALID_SCRIPT
//
// MessageText:
//
// The Directory Service cannot process the script because it is invalid.
//


//
// MessageId: ERROR_DS_REMOTE_CROSSREF_OP_FAILED
//
// MessageText:
//
// The remote create cross reference operation failed on the Domain Naming Master FSMO. The operation's error is in the extended data.
//


//
// MessageId: ERROR_DS_CROSS_REF_BUSY
//
// MessageText:
//
// A cross reference is in use locally with the same name.
//


//
// MessageId: ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN
//
// MessageText:
//
// The DS cannot derive a service principal name (SPN) with which to mutually authenticate the target server because the server's domain has been deleted from the forest.
//


//
// MessageId: ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC
//
// MessageText:
//
// Writeable NCs prevent this DC from demoting.
//


//
// MessageId: ERROR_DS_DUPLICATE_ID_FOUND
//
// MessageText:
//
// The requested object has a non-unique identifier and cannot be retrieved.
//


//
// MessageId: ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT
//
// MessageText:
//
// Insufficient attributes were given to create an object. This object may not exist because it may have been deleted and already garbage collected.
//


//
// MessageId: ERROR_DS_GROUP_CONVERSION_ERROR
//
// MessageText:
//
// The group cannot be converted due to attribute restrictions on the requested group type.
//


//
// MessageId: ERROR_DS_CANT_MOVE_APP_BASIC_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty basic application groups is not allowed.
//


//
// MessageId: ERROR_DS_CANT_MOVE_APP_QUERY_GROUP
//
// MessageText:
//
// Cross-domain move of non-empty query based application groups is not allowed.
//


//
// MessageId: ERROR_DS_ROLE_NOT_VERIFIED
//
// MessageText:
//
// The FSMO role ownership could not be verified because its directory partition has not replicated successfully with atleast one replication partner.
//


//
// MessageId: ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL
//
// MessageText:
//
// The target container for a redirection of a well known object container cannot already be a special container.
//


//
// MessageId: ERROR_DS_DOMAIN_RENAME_IN_PROGRESS
//
// MessageText:
//
// The Directory Service cannot perform the requested operation because a domain rename operation is in progress.
//


//
// MessageId: ERROR_DS_EXISTING_AD_CHILD_NC
//
// MessageText:
//
// The directory service detected a child partition below the requested partition name. The partition hierarchy must be created in a top down method.
//


//
// MessageId: ERROR_DS_REPL_LIFETIME_EXCEEDED
//
// MessageText:
//
// The directory service cannot replicate with this server because the time since the last replication with this server has exceeded the tombstone lifetime.
//


//
// MessageId: ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER
//
// MessageText:
//
// The requested operation is not allowed on an object under the system container.
//


//
// MessageId: ERROR_DS_LDAP_SEND_QUEUE_FULL
//
// MessageText:
//
// The LDAP servers network send queue has filled up because the client is not processing the results of it's requests fast enough. No more requests will be processed until the client catches up. If the client does not catch up then it will be disconnected.
//


//
// MessageId: ERROR_DS_DRA_OUT_SCHEDULE_WINDOW
//
// MessageText:
//
// The scheduled replication did not take place because the system was too busy to execute the request within the schedule window. The replication queue is overloaded. Consider reducing the number of partners or decreasing the scheduled replication frequency.
//


//
// MessageId: ERROR_DS_POLICY_NOT_KNOWN
//
// MessageText:
//
// At this time, it cannot be determined if the branch replication policy is available on the hub domain controller. Please retry at a later time to account for replication latencies.
//


//
// MessageId: ERROR_NO_SITE_SETTINGS_OBJECT
//
// MessageText:
//
// The site settings object for the specified site does not exist.
//


//
// MessageId: ERROR_NO_SECRETS
//
// MessageText:
//
// The local account store does not contain secret material for the specified account.
//


//
// MessageId: ERROR_NO_WRITABLE_DC_FOUND
//
// MessageText:
//
// Could not find a writable domain controller in the domain.
//


//
// MessageId: ERROR_DS_NO_SERVER_OBJECT
//
// MessageText:
//
// The server object for the domain controller does not exist.
//


//
// MessageId: ERROR_DS_NO_NTDSA_OBJECT
//
// MessageText:
//
// The NTDS Settings object for the domain controller does not exist.
//


//
// MessageId: ERROR_DS_NON_ASQ_SEARCH
//
// MessageText:
//
// The requested search operation is not supported for ASQ searches.
//


//
// MessageId: ERROR_DS_AUDIT_FAILURE
//
// MessageText:
//
// A required audit event could not be generated for the operation.
//


//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE
//
// MessageText:
//
// The search flags for the attribute are invalid. The subtree index bit is valid only on single valued attributes.
//


//
// MessageId: ERROR_DS_INVALID_SEARCH_FLAG_TUPLE
//
// MessageText:
//
// The search flags for the attribute are invalid. The tuple index bit is valid only on attributes of Unicode strings.
//


//
// MessageId: ERROR_DS_HIERARCHY_TABLE_TOO_DEEP
//
// MessageText:
//
// The address books are nested too deeply. Failed to build the hierarchy table.
//



///////////////////////////////////////////////////
//                                                /
//        End of Active Directory Error Codes     /
//                                                /
//                  8000 to  8999                 /
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//               DNS Error codes                 //
//                                               //
//                 9000 to 9999                  //
///////////////////////////////////////////////////

// =============================
// Facility DNS Error Messages
// =============================

//
//  DNS response codes.
//







// DNS_ERROR_RCODE_FORMAT_ERROR          0x00002329
//
// MessageId: DNS_ERROR_RCODE_FORMAT_ERROR
//
// MessageText:
//
// DNS server unable to interpret format.
//


// DNS_ERROR_RCODE_SERVER_FAILURE        0x0000232a
//
// MessageId: DNS_ERROR_RCODE_SERVER_FAILURE
//
// MessageText:
//
// DNS server failure.
//


// DNS_ERROR_RCODE_NAME_ERROR            0x0000232b
//
// MessageId: DNS_ERROR_RCODE_NAME_ERROR
//
// MessageText:
//
// DNS name does not exist.
//


// DNS_ERROR_RCODE_NOT_IMPLEMENTED       0x0000232c
//
// MessageId: DNS_ERROR_RCODE_NOT_IMPLEMENTED
//
// MessageText:
//
// DNS request not supported by name server.
//


// DNS_ERROR_RCODE_REFUSED               0x0000232d
//
// MessageId: DNS_ERROR_RCODE_REFUSED
//
// MessageText:
//
// DNS operation refused.
//


// DNS_ERROR_RCODE_YXDOMAIN              0x0000232e
//
// MessageId: DNS_ERROR_RCODE_YXDOMAIN
//
// MessageText:
//
// DNS name that ought not exist, does exist.
//


// DNS_ERROR_RCODE_YXRRSET               0x0000232f
//
// MessageId: DNS_ERROR_RCODE_YXRRSET
//
// MessageText:
//
// DNS RR set that ought not exist, does exist.
//


// DNS_ERROR_RCODE_NXRRSET               0x00002330
//
// MessageId: DNS_ERROR_RCODE_NXRRSET
//
// MessageText:
//
// DNS RR set that ought to exist, does not exist.
//


// DNS_ERROR_RCODE_NOTAUTH               0x00002331
//
// MessageId: DNS_ERROR_RCODE_NOTAUTH
//
// MessageText:
//
// DNS server not authoritative for zone.
//


// DNS_ERROR_RCODE_NOTZONE               0x00002332
//
// MessageId: DNS_ERROR_RCODE_NOTZONE
//
// MessageText:
//
// DNS name in update or prereq is not in zone.
//


// DNS_ERROR_RCODE_BADSIG                0x00002338
//
// MessageId: DNS_ERROR_RCODE_BADSIG
//
// MessageText:
//
// DNS signature failed to verify.
//


// DNS_ERROR_RCODE_BADKEY                0x00002339
//
// MessageId: DNS_ERROR_RCODE_BADKEY
//
// MessageText:
//
// DNS bad key.
//


// DNS_ERROR_RCODE_BADTIME               0x0000233a
//
// MessageId: DNS_ERROR_RCODE_BADTIME
//
// MessageText:
//
// DNS signature validity expired.
//





//
//  Packet format
//



// DNS_INFO_NO_RECORDS                   0x0000251d
//
// MessageId: DNS_INFO_NO_RECORDS
//
// MessageText:
//
// No records found for given DNS query.
//


// DNS_ERROR_BAD_PACKET                  0x0000251e
//
// MessageId: DNS_ERROR_BAD_PACKET
//
// MessageText:
//
// Bad DNS packet.
//


// DNS_ERROR_NO_PACKET                   0x0000251f
//
// MessageId: DNS_ERROR_NO_PACKET
//
// MessageText:
//
// No DNS packet.
//


// DNS_ERROR_RCODE                       0x00002520
//
// MessageId: DNS_ERROR_RCODE
//
// MessageText:
//
// DNS error, check rcode.
//


// DNS_ERROR_UNSECURE_PACKET             0x00002521
//
// MessageId: DNS_ERROR_UNSECURE_PACKET
//
// MessageText:
//
// Unsecured DNS packet.
//





//
//  General API errors
//







// DNS_ERROR_INVALID_TYPE                0x0000254f
//
// MessageId: DNS_ERROR_INVALID_TYPE
//
// MessageText:
//
// Invalid DNS type.
//


// DNS_ERROR_INVALID_IP_ADDRESS          0x00002550
//
// MessageId: DNS_ERROR_INVALID_IP_ADDRESS
//
// MessageText:
//
// Invalid IP address.
//


// DNS_ERROR_INVALID_PROPERTY            0x00002551
//
// MessageId: DNS_ERROR_INVALID_PROPERTY
//
// MessageText:
//
// Invalid property.
//


// DNS_ERROR_TRY_AGAIN_LATER             0x00002552
//
// MessageId: DNS_ERROR_TRY_AGAIN_LATER
//
// MessageText:
//
// Try DNS operation again later.
//


// DNS_ERROR_NOT_UNIQUE                  0x00002553
//
// MessageId: DNS_ERROR_NOT_UNIQUE
//
// MessageText:
//
// Record for given name and type is not unique.
//


// DNS_ERROR_NON_RFC_NAME                0x00002554
//
// MessageId: DNS_ERROR_NON_RFC_NAME
//
// MessageText:
//
// DNS name does not comply with RFC specifications.
//


// DNS_STATUS_FQDN                       0x00002555
//
// MessageId: DNS_STATUS_FQDN
//
// MessageText:
//
// DNS name is a fully-qualified DNS name.
//


// DNS_STATUS_DOTTED_NAME                0x00002556
//
// MessageId: DNS_STATUS_DOTTED_NAME
//
// MessageText:
//
// DNS name is dotted (multi-label).
//


// DNS_STATUS_SINGLE_PART_NAME           0x00002557
//
// MessageId: DNS_STATUS_SINGLE_PART_NAME
//
// MessageText:
//
// DNS name is a single-part name.
//


// DNS_ERROR_INVALID_NAME_CHAR           0x00002558
//
// MessageId: DNS_ERROR_INVALID_NAME_CHAR
//
// MessageText:
//
// DNS name contains an invalid character.
//


// DNS_ERROR_NUMERIC_NAME                0x00002559
//
// MessageId: DNS_ERROR_NUMERIC_NAME
//
// MessageText:
//
// DNS name is entirely numeric.
//


// DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER  0x0000255A
//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER
//
// MessageText:
//
// The operation requested is not permitted on a DNS root server.
//


// DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION  0x0000255B
//
// MessageId: DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION
//
// MessageText:
//
// The record could not be created because this part of the DNS namespace has been delegated to another server.
//


// DNS_ERROR_CANNOT_FIND_ROOT_HINTS  0x0000255C
//
// MessageId: DNS_ERROR_CANNOT_FIND_ROOT_HINTS
//
// MessageText:
//
// The DNS server could not find a set of root hints.
//


// DNS_ERROR_INCONSISTENT_ROOT_HINTS  0x0000255D
//
// MessageId: DNS_ERROR_INCONSISTENT_ROOT_HINTS
//
// MessageText:
//
// The DNS server found root hints but they were not consistent across all adapters.
//


// DNS_ERROR_DWORD_VALUE_TOO_SMALL    0x0000255E
//
// MessageId: DNS_ERROR_DWORD_VALUE_TOO_SMALL
//
// MessageText:
//
// The specified value is too small for this parameter.
//


// DNS_ERROR_DWORD_VALUE_TOO_LARGE    0x0000255F
//
// MessageId: DNS_ERROR_DWORD_VALUE_TOO_LARGE
//
// MessageText:
//
// The specified value is too large for this parameter.
//


// DNS_ERROR_BACKGROUND_LOADING       0x00002560
//
// MessageId: DNS_ERROR_BACKGROUND_LOADING
//
// MessageText:
//
// This operation is not allowed while the DNS server is loading zones in the background. Please try again later.
//


// DNS_ERROR_NOT_ALLOWED_ON_RODC      0x00002561
//
// MessageId: DNS_ERROR_NOT_ALLOWED_ON_RODC
//
// MessageText:
//
// The operation requested is not permitted on against a DNS server running on a read-only DC.
//


// DNS_ERROR_NOT_ALLOWED_UNDER_DNAME   0x00002562
//
// MessageId: DNS_ERROR_NOT_ALLOWED_UNDER_DNAME
//
// MessageText:
//
// No data is allowed to exist underneath a DNAME record.
//



//
//  Zone errors
//



// DNS_ERROR_ZONE_DOES_NOT_EXIST         0x00002581
//
// MessageId: DNS_ERROR_ZONE_DOES_NOT_EXIST
//
// MessageText:
//
// DNS zone does not exist.
//


// DNS_ERROR_NO_ZONE_INFO                0x00002582
//
// MessageId: DNS_ERROR_NO_ZONE_INFO
//
// MessageText:
//
// DNS zone information not available.
//


// DNS_ERROR_INVALID_ZONE_OPERATION      0x00002583
//
// MessageId: DNS_ERROR_INVALID_ZONE_OPERATION
//
// MessageText:
//
// Invalid operation for DNS zone.
//


// DNS_ERROR_ZONE_CONFIGURATION_ERROR    0x00002584
//
// MessageId: DNS_ERROR_ZONE_CONFIGURATION_ERROR
//
// MessageText:
//
// Invalid DNS zone configuration.
//


// DNS_ERROR_ZONE_HAS_NO_SOA_RECORD      0x00002585
//
// MessageId: DNS_ERROR_ZONE_HAS_NO_SOA_RECORD
//
// MessageText:
//
// DNS zone has no start of authority (SOA) record.
//


// DNS_ERROR_ZONE_HAS_NO_NS_RECORDS      0x00002586
//
// MessageId: DNS_ERROR_ZONE_HAS_NO_NS_RECORDS
//
// MessageText:
//
// DNS zone has no Name Server (NS) record.
//


// DNS_ERROR_ZONE_LOCKED                 0x00002587
//
// MessageId: DNS_ERROR_ZONE_LOCKED
//
// MessageText:
//
// DNS zone is locked.
//


// DNS_ERROR_ZONE_CREATION_FAILED        0x00002588
//
// MessageId: DNS_ERROR_ZONE_CREATION_FAILED
//
// MessageText:
//
// DNS zone creation failed.
//


// DNS_ERROR_ZONE_ALREADY_EXISTS         0x00002589
//
// MessageId: DNS_ERROR_ZONE_ALREADY_EXISTS
//
// MessageText:
//
// DNS zone already exists.
//


// DNS_ERROR_AUTOZONE_ALREADY_EXISTS     0x0000258a
//
// MessageId: DNS_ERROR_AUTOZONE_ALREADY_EXISTS
//
// MessageText:
//
// DNS automatic zone already exists.
//


// DNS_ERROR_INVALID_ZONE_TYPE           0x0000258b
//
// MessageId: DNS_ERROR_INVALID_ZONE_TYPE
//
// MessageText:
//
// Invalid DNS zone type.
//


// DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP 0x0000258c
//
// MessageId: DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP
//
// MessageText:
//
// Secondary DNS zone requires master IP address.
//


// DNS_ERROR_ZONE_NOT_SECONDARY          0x0000258d
//
// MessageId: DNS_ERROR_ZONE_NOT_SECONDARY
//
// MessageText:
//
// DNS zone not secondary.
//


// DNS_ERROR_NEED_SECONDARY_ADDRESSES    0x0000258e
//
// MessageId: DNS_ERROR_NEED_SECONDARY_ADDRESSES
//
// MessageText:
//
// Need secondary IP address.
//


// DNS_ERROR_WINS_INIT_FAILED            0x0000258f
//
// MessageId: DNS_ERROR_WINS_INIT_FAILED
//
// MessageText:
//
// WINS initialization failed.
//


// DNS_ERROR_NEED_WINS_SERVERS           0x00002590
//
// MessageId: DNS_ERROR_NEED_WINS_SERVERS
//
// MessageText:
//
// Need WINS servers.
//


// DNS_ERROR_NBSTAT_INIT_FAILED          0x00002591
//
// MessageId: DNS_ERROR_NBSTAT_INIT_FAILED
//
// MessageText:
//
// NBTSTAT initialization call failed.
//


// DNS_ERROR_SOA_DELETE_INVALID          0x00002592
//
// MessageId: DNS_ERROR_SOA_DELETE_INVALID
//
// MessageText:
//
// Invalid delete of start of authority (SOA)
//


// DNS_ERROR_FORWARDER_ALREADY_EXISTS    0x00002593
//
// MessageId: DNS_ERROR_FORWARDER_ALREADY_EXISTS
//
// MessageText:
//
// A conditional forwarding zone already exists for that name.
//


// DNS_ERROR_ZONE_REQUIRES_MASTER_IP     0x00002594
//
// MessageId: DNS_ERROR_ZONE_REQUIRES_MASTER_IP
//
// MessageText:
//
// This zone must be configured with one or more master DNS server IP addresses.
//


// DNS_ERROR_ZONE_IS_SHUTDOWN            0x00002595
//
// MessageId: DNS_ERROR_ZONE_IS_SHUTDOWN
//
// MessageText:
//
// The operation cannot be performed because this zone is shutdown.
//



//
//  Datafile errors
//



// DNS                                   0x000025b3
//
// MessageId: DNS_ERROR_PRIMARY_REQUIRES_DATAFILE
//
// MessageText:
//
// Primary DNS zone requires datafile.
//


// DNS                                   0x000025b4
//
// MessageId: DNS_ERROR_INVALID_DATAFILE_NAME
//
// MessageText:
//
// Invalid datafile name for DNS zone.
//


// DNS                                   0x000025b5
//
// MessageId: DNS_ERROR_DATAFILE_OPEN_FAILURE
//
// MessageText:
//
// Failed to open datafile for DNS zone.
//


// DNS                                   0x000025b6
//
// MessageId: DNS_ERROR_FILE_WRITEBACK_FAILED
//
// MessageText:
//
// Failed to write datafile for DNS zone.
//


// DNS                                   0x000025b7
//
// MessageId: DNS_ERROR_DATAFILE_PARSING
//
// MessageText:
//
// Failure while reading datafile for DNS zone.
//



//
//  Database errors
//



// DNS_ERROR_RECORD_DOES_NOT_EXIST       0x000025e5
//
// MessageId: DNS_ERROR_RECORD_DOES_NOT_EXIST
//
// MessageText:
//
// DNS record does not exist.
//


// DNS_ERROR_RECORD_FORMAT               0x000025e6
//
// MessageId: DNS_ERROR_RECORD_FORMAT
//
// MessageText:
//
// DNS record format error.
//


// DNS_ERROR_NODE_CREATION_FAILED        0x000025e7
//
// MessageId: DNS_ERROR_NODE_CREATION_FAILED
//
// MessageText:
//
// Node creation failure in DNS.
//


// DNS_ERROR_UNKNOWN_RECORD_TYPE         0x000025e8
//
// MessageId: DNS_ERROR_UNKNOWN_RECORD_TYPE
//
// MessageText:
//
// Unknown DNS record type.
//


// DNS_ERROR_RECORD_TIMED_OUT            0x000025e9
//
// MessageId: DNS_ERROR_RECORD_TIMED_OUT
//
// MessageText:
//
// DNS record timed out.
//


// DNS_ERROR_NAME_NOT_IN_ZONE            0x000025ea
//
// MessageId: DNS_ERROR_NAME_NOT_IN_ZONE
//
// MessageText:
//
// Name not in DNS zone.
//


// DNS_ERROR_CNAME_LOOP                  0x000025eb
//
// MessageId: DNS_ERROR_CNAME_LOOP
//
// MessageText:
//
// CNAME loop detected.
//


// DNS_ERROR_NODE_IS_CNAME               0x000025ec
//
// MessageId: DNS_ERROR_NODE_IS_CNAME
//
// MessageText:
//
// Node is a CNAME DNS record.
//


// DNS_ERROR_CNAME_COLLISION             0x000025ed
//
// MessageId: DNS_ERROR_CNAME_COLLISION
//
// MessageText:
//
// A CNAME record already exists for given name.
//


// DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT    0x000025ee
//
// MessageId: DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT
//
// MessageText:
//
// Record only at DNS zone root.
//


// DNS_ERROR_RECORD_ALREADY_EXISTS       0x000025ef
//
// MessageId: DNS_ERROR_RECORD_ALREADY_EXISTS
//
// MessageText:
//
// DNS record already exists.
//


// DNS_ERROR_SECONDARY_DATA              0x000025f0
//
// MessageId: DNS_ERROR_SECONDARY_DATA
//
// MessageText:
//
// Secondary DNS zone data error.
//


// DNS_ERROR_NO_CREATE_CACHE_DATA        0x000025f1
//
// MessageId: DNS_ERROR_NO_CREATE_CACHE_DATA
//
// MessageText:
//
// Could not create DNS cache data.
//


// DNS_ERROR_NAME_DOES_NOT_EXIST         0x000025f2
//
// MessageId: DNS_ERROR_NAME_DOES_NOT_EXIST
//
// MessageText:
//
// DNS name does not exist.
//


// DNS_WARNING_PTR_CREATE_FAILED         0x000025f3
//
// MessageId: DNS_WARNING_PTR_CREATE_FAILED
//
// MessageText:
//
// Could not create pointer (PTR) record.
//


// DNS_WARNING_DOMAIN_UNDELETED          0x000025f4
//
// MessageId: DNS_WARNING_DOMAIN_UNDELETED
//
// MessageText:
//
// DNS domain was undeleted.
//


// DNS_ERROR_DS_UNAVAILABLE              0x000025f5
//
// MessageId: DNS_ERROR_DS_UNAVAILABLE
//
// MessageText:
//
// The directory service is unavailable.
//


// DNS_ERROR_DS_ZONE_ALREADY_EXISTS      0x000025f6
//
// MessageId: DNS_ERROR_DS_ZONE_ALREADY_EXISTS
//
// MessageText:
//
// DNS zone already exists in the directory service.
//


// DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE      0x000025f7
//
// MessageId: DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE
//
// MessageText:
//
// DNS server not creating or reading the boot file for the directory service integrated DNS zone.
//


// DNS_ERROR_NODE_IS_DNAME               0x000025f8
//
// MessageId: DNS_ERROR_NODE_IS_DNAME
//
// MessageText:
//
// Node is a DNAME DNS record.
//


// DNS_ERROR_DNAME_COLLISION             0x000025f9
//
// MessageId: DNS_ERROR_DNAME_COLLISION
//
// MessageText:
//
// A DNAME record already exists for given name.
//


// DNS_ERROR_ALIAS_LOOP                  0x000025fa
//
// MessageId: DNS_ERROR_ALIAS_LOOP
//
// MessageText:
//
// An alias loop has been detected with either CNAME or DNAME records.
//



//
//  Operation errors
//



// DNS_INFO_AXFR_COMPLETE                0x00002617
//
// MessageId: DNS_INFO_AXFR_COMPLETE
//
// MessageText:
//
// DNS AXFR (zone transfer) complete.
//


// DNS_ERROR_AXFR                        0x00002618
//
// MessageId: DNS_ERROR_AXFR
//
// MessageText:
//
// DNS zone transfer failed.
//


// DNS_INFO_ADDED_LOCAL_WINS             0x00002619
//
// MessageId: DNS_INFO_ADDED_LOCAL_WINS
//
// MessageText:
//
// Added local WINS server.
//



//
//  Secure update
//



// DNS_STATUS_CONTINUE_NEEDED            0x00002649
//
// MessageId: DNS_STATUS_CONTINUE_NEEDED
//
// MessageText:
//
// Secure update call needs to continue update request.
//



//
//  Setup errors
//



// DNS_ERROR_NO_TCPIP                    0x0000267b
//
// MessageId: DNS_ERROR_NO_TCPIP
//
// MessageText:
//
// TCP/IP network protocol not installed.
//


// DNS_ERROR_NO_DNS_SERVERS              0x0000267c
//
// MessageId: DNS_ERROR_NO_DNS_SERVERS
//
// MessageText:
//
// No DNS servers configured for local system.
//



//
//  Directory partition (DP) errors
//



// DNS_ERROR_DP_DOES_NOT_EXIST           0x000026ad
//
// MessageId: DNS_ERROR_DP_DOES_NOT_EXIST
//
// MessageText:
//
// The specified directory partition does not exist.
//


// DNS_ERROR_DP_ALREADY_EXISTS           0x000026ae
//
// MessageId: DNS_ERROR_DP_ALREADY_EXISTS
//
// MessageText:
//
// The specified directory partition already exists.
//


// DNS_ERROR_DP_NOT_ENLISTED             0x000026af
//
// MessageId: DNS_ERROR_DP_NOT_ENLISTED
//
// MessageText:
//
// This DNS server is not enlisted in the specified directory partition.
//


// DNS_ERROR_DP_ALREADY_ENLISTED         0x000026b0
//
// MessageId: DNS_ERROR_DP_ALREADY_ENLISTED
//
// MessageText:
//
// This DNS server is already enlisted in the specified directory partition.
//


// DNS_ERROR_DP_NOT_AVAILABLE            0x000026b1
//
// MessageId: DNS_ERROR_DP_NOT_AVAILABLE
//
// MessageText:
//
// The directory partition is not available at this time. Please wait a few minutes and try again.
//


// DNS_ERROR_DP_FSMO_ERROR               0x000026b2
//
// MessageId: DNS_ERROR_DP_FSMO_ERROR
//
// MessageText:
//
// The application directory partition operation failed. The domain controller holding the domain naming master role is down or unable to service the request or is not running Windows Server 2003.
//



///////////////////////////////////////////////////
//                                               //
//             End of DNS Error Codes            //
//                                               //
//                  9000 to 9999                 //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//               WinSock Error Codes             //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////

//
// WinSock error codes are also defined in WinSock.h
// and WinSock2.h, hence the IFDEF
//


//
// MessageId: WSAEINTR
//
// MessageText:
//
// A blocking operation was interrupted by a call to WSACancelBlockingCall.
//


//
// MessageId: WSAEBADF
//
// MessageText:
//
// The file handle supplied is not valid.
//


//
// MessageId: WSAEACCES
//
// MessageText:
//
// An attempt was made to access a socket in a way forbidden by its access permissions.
//


//
// MessageId: WSAEFAULT
//
// MessageText:
//
// The system detected an invalid pointer address in attempting to use a pointer argument in a call.
//


//
// MessageId: WSAEINVAL
//
// MessageText:
//
// An invalid argument was supplied.
//


//
// MessageId: WSAEMFILE
//
// MessageText:
//
// Too many open sockets.
//


//
// MessageId: WSAEWOULDBLOCK
//
// MessageText:
//
// A non-blocking socket operation could not be completed immediately.
//


//
// MessageId: WSAEINPROGRESS
//
// MessageText:
//
// A blocking operation is currently executing.
//


//
// MessageId: WSAEALREADY
//
// MessageText:
//
// An operation was attempted on a non-blocking socket that already had an operation in progress.
//


//
// MessageId: WSAENOTSOCK
//
// MessageText:
//
// An operation was attempted on something that is not a socket.
//


//
// MessageId: WSAEDESTADDRREQ
//
// MessageText:
//
// A required address was omitted from an operation on a socket.
//


//
// MessageId: WSAEMSGSIZE
//
// MessageText:
//
// A message sent on a datagram socket was larger than the internal message buffer or some other network limit, or the buffer used to receive a datagram into was smaller than the datagram itself.
//


//
// MessageId: WSAEPROTOTYPE
//
// MessageText:
//
// A protocol was specified in the socket function call that does not support the semantics of the socket type requested.
//


//
// MessageId: WSAENOPROTOOPT
//
// MessageText:
//
// An unknown, invalid, or unsupported option or level was specified in a getsockopt or setsockopt call.
//


//
// MessageId: WSAEPROTONOSUPPORT
//
// MessageText:
//
// The requested protocol has not been configured into the system, or no implementation for it exists.
//


//
// MessageId: WSAESOCKTNOSUPPORT
//
// MessageText:
//
// The support for the specified socket type does not exist in this address family.
//


//
// MessageId: WSAEOPNOTSUPP
//
// MessageText:
//
// The attempted operation is not supported for the type of object referenced.
//


//
// MessageId: WSAEPFNOSUPPORT
//
// MessageText:
//
// The protocol family has not been configured into the system or no implementation for it exists.
//


//
// MessageId: WSAEAFNOSUPPORT
//
// MessageText:
//
// An address incompatible with the requested protocol was used.
//


//
// MessageId: WSAEADDRINUSE
//
// MessageText:
//
// Only one usage of each socket address (protocol/network address/port) is normally permitted.
//


//
// MessageId: WSAEADDRNOTAVAIL
//
// MessageText:
//
// The requested address is not valid in its context.
//


//
// MessageId: WSAENETDOWN
//
// MessageText:
//
// A socket operation encountered a dead network.
//


//
// MessageId: WSAENETUNREACH
//
// MessageText:
//
// A socket operation was attempted to an unreachable network.
//


//
// MessageId: WSAENETRESET
//
// MessageText:
//
// The connection has been broken due to keep-alive activity detecting a failure while the operation was in progress.
//


//
// MessageId: WSAECONNABORTED
//
// MessageText:
//
// An established connection was aborted by the software in your host machine.
//


//
// MessageId: WSAECONNRESET
//
// MessageText:
//
// An existing connection was forcibly closed by the remote host.
//


//
// MessageId: WSAENOBUFS
//
// MessageText:
//
// An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full.
//


//
// MessageId: WSAEISCONN
//
// MessageText:
//
// A connect request was made on an already connected socket.
//


//
// MessageId: WSAENOTCONN
//
// MessageText:
//
// A request to send or receive data was disallowed because the socket is not connected and (when sending on a datagram socket using a sendto call) no address was supplied.
//


//
// MessageId: WSAESHUTDOWN
//
// MessageText:
//
// A request to send or receive data was disallowed because the socket had already been shut down in that direction with a previous shutdown call.
//


//
// MessageId: WSAETOOMANYREFS
//
// MessageText:
//
// Too many references to some kernel object.
//


//
// MessageId: WSAETIMEDOUT
//
// MessageText:
//
// A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond.
//


//
// MessageId: WSAECONNREFUSED
//
// MessageText:
//
// No connection could be made because the target machine actively refused it.
//


//
// MessageId: WSAELOOP
//
// MessageText:
//
// Cannot translate name.
//


//
// MessageId: WSAENAMETOOLONG
//
// MessageText:
//
// Name component or name was too long.
//


//
// MessageId: WSAEHOSTDOWN
//
// MessageText:
//
// A socket operation failed because the destination host was down.
//


//
// MessageId: WSAEHOSTUNREACH
//
// MessageText:
//
// A socket operation was attempted to an unreachable host.
//


//
// MessageId: WSAENOTEMPTY
//
// MessageText:
//
// Cannot remove a directory that is not empty.
//


//
// MessageId: WSAEPROCLIM
//
// MessageText:
//
// A Windows Sockets implementation may have a limit on the number of applications that may use it simultaneously.
//


//
// MessageId: WSAEUSERS
//
// MessageText:
//
// Ran out of quota.
//


//
// MessageId: WSAEDQUOT
//
// MessageText:
//
// Ran out of disk quota.
//


//
// MessageId: WSAESTALE
//
// MessageText:
//
// File handle reference is no longer available.
//


//
// MessageId: WSAEREMOTE
//
// MessageText:
//
// Item is not available locally.
//


//
// MessageId: WSASYSNOTREADY
//
// MessageText:
//
// WSAStartup cannot function at this time because the underlying system it uses to provide network services is currently unavailable.
//


//
// MessageId: WSAVERNOTSUPPORTED
//
// MessageText:
//
// The Windows Sockets version requested is not supported.
//


//
// MessageId: WSANOTINITIALISED
//
// MessageText:
//
// Either the application has not called WSAStartup, or WSAStartup failed.
//


//
// MessageId: WSAEDISCON
//
// MessageText:
//
// Returned by WSARecv or WSARecvFrom to indicate the remote party has initiated a graceful shutdown sequence.
//


//
// MessageId: WSAENOMORE
//
// MessageText:
//
// No more results can be returned by WSALookupServiceNext.
//


//
// MessageId: WSAECANCELLED
//
// MessageText:
//
// A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
//


//
// MessageId: WSAEINVALIDPROCTABLE
//
// MessageText:
//
// The procedure call table is invalid.
//


//
// MessageId: WSAEINVALIDPROVIDER
//
// MessageText:
//
// The requested service provider is invalid.
//


//
// MessageId: WSAEPROVIDERFAILEDINIT
//
// MessageText:
//
// The requested service provider could not be loaded or initialized.
//


//
// MessageId: WSASYSCALLFAILURE
//
// MessageText:
//
// A system call that should never fail has failed.
//


//
// MessageId: WSASERVICE_NOT_FOUND
//
// MessageText:
//
// No such service is known. The service cannot be found in the specified name space.
//


//
// MessageId: WSATYPE_NOT_FOUND
//
// MessageText:
//
// The specified class was not found.
//


//
// MessageId: WSA_E_NO_MORE
//
// MessageText:
//
// No more results can be returned by WSALookupServiceNext.
//


//
// MessageId: WSA_E_CANCELLED
//
// MessageText:
//
// A call to WSALookupServiceEnd was made while this call was still processing. The call has been canceled.
//


//
// MessageId: WSAEREFUSED
//
// MessageText:
//
// A database query failed because it was actively refused.
//


//
// MessageId: WSAHOST_NOT_FOUND
//
// MessageText:
//
// No such host is known.
//


//
// MessageId: WSATRY_AGAIN
//
// MessageText:
//
// This is usually a temporary error during hostname resolution and means that the local server did not receive a response from an authoritative server.
//


//
// MessageId: WSANO_RECOVERY
//
// MessageText:
//
// A non-recoverable error occurred during a database lookup.
//


//
// MessageId: WSANO_DATA
//
// MessageText:
//
// The requested name is valid, but no data of the requested type was found.
//


//
// MessageId: WSA_QOS_RECEIVERS
//
// MessageText:
//
// At least one reserve has arrived.
//


//
// MessageId: WSA_QOS_SENDERS
//
// MessageText:
//
// At least one path has arrived.
//


//
// MessageId: WSA_QOS_NO_SENDERS
//
// MessageText:
//
// There are no senders.
//


//
// MessageId: WSA_QOS_NO_RECEIVERS
//
// MessageText:
//
// There are no receivers.
//


//
// MessageId: WSA_QOS_REQUEST_CONFIRMED
//
// MessageText:
//
// Reserve has been confirmed.
//


//
// MessageId: WSA_QOS_ADMISSION_FAILURE
//
// MessageText:
//
// Error due to lack of resources.
//


//
// MessageId: WSA_QOS_POLICY_FAILURE
//
// MessageText:
//
// Rejected for administrative reasons - bad credentials.
//


//
// MessageId: WSA_QOS_BAD_STYLE
//
// MessageText:
//
// Unknown or conflicting style.
//


//
// MessageId: WSA_QOS_BAD_OBJECT
//
// MessageText:
//
// Problem with some part of the filterspec or providerspecific buffer in general.
//


//
// MessageId: WSA_QOS_TRAFFIC_CTRL_ERROR
//
// MessageText:
//
// Problem with some part of the flowspec.
//


//
// MessageId: WSA_QOS_GENERIC_ERROR
//
// MessageText:
//
// General QOS error.
//


//
// MessageId: WSA_QOS_ESERVICETYPE
//
// MessageText:
//
// An invalid or unrecognized service type was found in the flowspec.
//


//
// MessageId: WSA_QOS_EFLOWSPEC
//
// MessageText:
//
// An invalid or inconsistent flowspec was found in the QOS structure.
//


//
// MessageId: WSA_QOS_EPROVSPECBUF
//
// MessageText:
//
// Invalid QOS provider-specific buffer.
//


//
// MessageId: WSA_QOS_EFILTERSTYLE
//
// MessageText:
//
// An invalid QOS filter style was used.
//


//
// MessageId: WSA_QOS_EFILTERTYPE
//
// MessageText:
//
// An invalid QOS filter type was used.
//


//
// MessageId: WSA_QOS_EFILTERCOUNT
//
// MessageText:
//
// An incorrect number of QOS FILTERSPECs were specified in the FLOWDESCRIPTOR.
//


//
// MessageId: WSA_QOS_EOBJLENGTH
//
// MessageText:
//
// An object with an invalid ObjectLength field was specified in the QOS provider-specific buffer.
//


//
// MessageId: WSA_QOS_EFLOWCOUNT
//
// MessageText:
//
// An incorrect number of flow descriptors was specified in the QOS structure.
//


//
// MessageId: WSA_QOS_EUNKOWNPSOBJ
//
// MessageText:
//
// An unrecognized object was found in the QOS provider-specific buffer.
//


//
// MessageId: WSA_QOS_EPOLICYOBJ
//
// MessageText:
//
// An invalid policy object was found in the QOS provider-specific buffer.
//


//
// MessageId: WSA_QOS_EFLOWDESC
//
// MessageText:
//
// An invalid QOS flow descriptor was found in the flow descriptor list.
//


//
// MessageId: WSA_QOS_EPSFLOWSPEC
//
// MessageText:
//
// An invalid or inconsistent flowspec was found in the QOS provider specific buffer.
//


//
// MessageId: WSA_QOS_EPSFILTERSPEC
//
// MessageText:
//
// An invalid FILTERSPEC was found in the QOS provider-specific buffer.
//


//
// MessageId: WSA_QOS_ESDMODEOBJ
//
// MessageText:
//
// An invalid shape discard mode object was found in the QOS provider specific buffer.
//


//
// MessageId: WSA_QOS_ESHAPERATEOBJ
//
// MessageText:
//
// An invalid shaping rate object was found in the QOS provider-specific buffer.
//


//
// MessageId: WSA_QOS_RESERVED_PETYPE
//
// MessageText:
//
// A reserved policy element was found in the QOS provider-specific buffer.
//


#line 19954 "c:\\program files\\microsoft sdks\\windows\\v6.0a\\include\\winerror.h"

///////////////////////////////////////////////////
//                                               //
//           End of WinSock Error Codes          //
//                                               //
//                 10000 to 11999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//                  Available                    //
//                                               //
//                12000 to 129999                //
///////////////////////////////////////////////////


///////////////////////////////////////////////////
//                                               //
//           Start of IPSec Error codes          //
//                                               //
//                 13000 to 13999                //
///////////////////////////////////////////////////

//
// MessageId: ERROR_IPSEC_QM_POLICY_EXISTS
//
// MessageText:
//
// The specified quick mode policy already exists.
//


//
// MessageId: ERROR_IPSEC_QM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified quick mode policy was not found.
//


//
// MessageId: ERROR_IPSEC_QM_POLICY_IN_USE
//
// MessageText:
//
// The specified quick mode policy is being used.
//


//
// MessageId: ERROR_IPSEC_MM_POLICY_EXISTS
//
// MessageText:
//
// The specified main mode policy already exists.
//


//
// MessageId: ERROR_IPSEC_MM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified main mode policy was not found
//


//
// MessageId: ERROR_IPSEC_MM_POLICY_IN_USE
//
// MessageText:
//
// The specified main mode policy is being used.
//


//
// MessageId: ERROR_IPSEC_MM_FILTER_EXISTS
//
// MessageText:
//
// The specified main mode filter already exists.
//


//
// MessageId: ERROR_IPSEC_MM_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified main mode filter was not found.
//


//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_EXISTS
//
// MessageText:
//
// The specified transport mode filter already exists.
//


//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified transport mode filter does not exist.
//


//
// MessageId: ERROR_IPSEC_MM_AUTH_EXISTS
//
// MessageText:
//
// The specified main mode authentication list exists.
//


//
// MessageId: ERROR_IPSEC_MM_AUTH_NOT_FOUND
//
// MessageText:
//
// The specified main mode authentication list was not found.
//


//
// MessageId: ERROR_IPSEC_MM_AUTH_IN_USE
//
// MessageText:
//
// The specified main mode authentication list is being used.
//


//
// MessageId: ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified default main mode policy was not found.
//


//
// MessageId: ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND
//
// MessageText:
//
// The specified default main mode authentication list was not found.
//


//
// MessageId: ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND
//
// MessageText:
//
// The specified default quick mode policy was not found.
//


//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_EXISTS
//
// MessageText:
//
// The specified tunnel mode filter exists.
//


//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND
//
// MessageText:
//
// The specified tunnel mode filter was not found.
//


//
// MessageId: ERROR_IPSEC_MM_FILTER_PENDING_DELETION
//
// MessageText:
//
// The Main Mode filter is pending deletion.
//


//
// MessageId: ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION
//
// MessageText:
//
// The transport filter is pending deletion.
//


//
// MessageId: ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION
//
// MessageText:
//
// The tunnel filter is pending deletion.
//


//
// MessageId: ERROR_IPSEC_MM_POLICY_PENDING_DELETION
//
// MessageText:
//
// The Main Mode policy is pending deletion.
//


//
// MessageId: ERROR_IPSEC_MM_AUTH_PENDING_DELETION
//
// MessageText:
//
// The Main Mode authentication bundle is pending deletion.
//


//
// MessageId: ERROR_IPSEC_QM_POLICY_PENDING_DELETION
//
// MessageText:
//
// The Quick Mode policy is pending deletion.
//


//
// MessageId: WARNING_IPSEC_MM_POLICY_PRUNED
//
// MessageText:
//
// The Main Mode policy was successfully added, but some of the requested offers are not supported.
//


//
// MessageId: WARNING_IPSEC_QM_POLICY_PRUNED
//
// MessageText:
//
// The Quick Mode policy was successfully added, but some of the requested offers are not supported.
//


//
// MessageId: ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
//
// MessageText:
//
//  ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
//


//
// MessageId: ERROR_IPSEC_IKE_AUTH_FAIL
//
// MessageText:
//
// IKE authentication credentials are unacceptable
//


//
// MessageId: ERROR_IPSEC_IKE_ATTRIB_FAIL
//
// MessageText:
//
// IKE security attributes are unacceptable
//


//
// MessageId: ERROR_IPSEC_IKE_NEGOTIATION_PENDING
//
// MessageText:
//
// IKE Negotiation in progress
//


//
// MessageId: ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR
//
// MessageText:
//
// General processing error
//


//
// MessageId: ERROR_IPSEC_IKE_TIMED_OUT
//
// MessageText:
//
// Negotiation timed out
//


//
// MessageId: ERROR_IPSEC_IKE_NO_CERT
//
// MessageText:
//
// IKE failed to find valid machine certificate. Contact your Network Security Administrator about installing a valid certificate in the appropriate Certificate Store.
//


//
// MessageId: ERROR_IPSEC_IKE_SA_DELETED
//
// MessageText:
//
// IKE SA deleted by peer before establishment completed
//


//
// MessageId: ERROR_IPSEC_IKE_SA_REAPED
//
// MessageText:
//
// IKE SA deleted before establishment completed
//


//
// MessageId: ERROR_IPSEC_IKE_MM_ACQUIRE_DROP
//
// MessageText:
//
// Negotiation request sat in Queue too long
//


//
// MessageId: ERROR_IPSEC_IKE_QM_ACQUIRE_DROP
//
// MessageText:
//
// Negotiation request sat in Queue too long
//


//
// MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_MM
//
// MessageText:
//
// Negotiation request sat in Queue too long
//


//
// MessageId: ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM
//
// MessageText:
//
// Negotiation request sat in Queue too long
//


//
// MessageId: ERROR_IPSEC_IKE_DROP_NO_RESPONSE
//
// MessageText:
//
// No response from peer
//


//
// MessageId: ERROR_IPSEC_IKE_MM_DELAY_DROP
//
// MessageText:
//
// Negotiation took too long
//


//
// MessageId: ERROR_IPSEC_IKE_QM_DELAY_DROP
//
// MessageText:
//
// Negotiation took too long
//


//
// MessageId: ERROR_IPSEC_IKE_ERROR
//
// MessageText:
//
// Unknown error occurred
//


//
// MessageId: ERROR_IPSEC_IKE_CRL_FAILED
//
// MessageText:
//
// Certificate Revocation Check failed
//


//
// MessageId: ERROR_IPSEC_IKE_INVALID_KEY_USAGE
//
// MessageText:
//
// Invalid certificate key usage
//


//
// MessageId: ERROR_IPSEC_IKE_INVALID_CERT_TYPE
//
// MessageText:
//
// Invalid certificate type
//


//
// MessageId: ERROR_IPSEC_IKE_NO_PRIVATE_KEY
//
// MessageText:
//
// IKE negotiation failed because the machine certificate used does not have a private key. IPsec certificates require a private key. Contact your Network Security administrator about replacing with a certificate that has a private key.
//


//
// MessageId: ERROR_IPSEC_IKE_DH_FAIL
//
// MessageText:
//
// Failure in Diffie-Helman computation
//


//
// MessageId: ERROR_IPSEC_IKE_INVALID_HEADER
//
// MessageText:
//
// Invalid header
//


//
// MessageId: ERROR_IPSEC_IKE_NO_POLICY
//
// MessageText:
//
// No policy configured
//


//
// MessageId: ERROR_IPSEC_IKE_INVALID_SIGNATURE
//
// MessageText:
//
// Failed to verify signature
//


//
// MessageId: ERROR_IPSEC_IKE_KERBEROS_ERROR
//
// MessageText:
//
// Failed to authenticate using kerberos
//


//
// MessageId: ERROR_IPSEC_IKE_NO_PUBLIC_KEY
//
// MessageText:
//
// Peer's certificate did not have a public key
//


// These must stay as a unit.
//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR
//
// MessageText:
//
// Error processing error payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_SA
//
// MessageText:
//
// Error processing SA payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_PROP
//
// MessageText:
//
// Error processing Proposal payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_TRANS
//
// MessageText:
//
// Error processing Transform payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_KE
//
// MessageText:
//
// Error processing KE payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_ID
//
// MessageText:
//
// Error processing ID payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT
//
// MessageText:
//
// Error processing Cert payload
//


//
// MessageId: ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ
//
// MessageText:
//
// Error processing Certificate Request payload
//


//
//
// MessageText: