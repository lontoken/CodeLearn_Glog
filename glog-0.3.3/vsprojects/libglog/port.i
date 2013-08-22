#line 1 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\port.cc"
/* Copyright (c) 2008, Google Inc.
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 * 
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Google Inc. nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * ---
 * Author: Craig Silverstein
 * Copied from google-perftools and modified by Shinichiro Hamaji
 */





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
#line 40 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\port.cc"
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







#line 46 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\vadefs.h"
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
#line 28 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdarg.h"





#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdarg.h"
#line 41 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\port.cc"
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

#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"


extern "C" {
#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"




#line 32 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

/* Define NULL pointer value */





#line 40 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"
#line 41 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string.h"

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
#line 42 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\port.cc"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\assert.h"
/***
*assert.h - define the assert macro
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       Defines the assert(exp) macro.
*       [ANSI/System V]
*
*       [Public]
*
****/

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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\assert.h"










extern "C" {
#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\assert.h"

__declspec(dllimport) void __cdecl _wassert([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Message, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_File, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned _Line);


}
#line 33 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\assert.h"



#line 37 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\assert.h"
#line 43 "e:\\opensource\\google-glog\\glog-0.3.3\\src\\windows\\port.cc"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\string"
// string standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\istream"
// istream standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"
// ostream standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"
// ios standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
// xlocnum internal header (from <locale>)
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\climits"
// climits standard header
#pragma once


#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
/* yvals.h values header for Microsoft C/C++ */
#pragma once



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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


#pragma pack(push,8)
#line 11 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"



 
  
 #line 17 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* Note on use of "deprecate":
 * Various places in this header and other headers use __declspec(deprecate) or macros that have the term DEPRECATE in them.
 * We use deprecate here ONLY to signal the compiler to emit a warning about these items. The use of deprecate
 * should NOT be taken to imply that any standard committee has deprecated these functions from the relevant standards.
 * In fact, these functions are NOT deprecated from the standard.
 *
 * Full details can be found in our documentation by searching for "Checked Iterators".
*/






























#line 57 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

#line 59 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
#line 60 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

		/* NAMING PROPERTIES */


		/* THREAD AND LOCALE CONTROL */




		/* THREAD-LOCAL STORAGE */

 
  

 

#line 77 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 
  
 #line 81 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 
  
 #line 85 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


 
#line 89 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


 
#line 93 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


 
#line 97 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"



#line 101 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


	
		
	

#line 108 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"







#line 116 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* _SECURE_CRT definitions */







/* _SECURE_SCL switches: default values */



#line 130 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* See note on use of deprecate at the top of this file */


#line 135 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"




#line 140 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

#line 142 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
#line 143 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"



#line 147 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* _SECURE_SCL switches: helper macros */
/* See note on use of deprecate at the top of this file */








#line 159 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"








#line 168 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/*
 * Assert in debug builds.
 * set errno and return
 *
 */
 



#line 179 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 





#line 187 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 




#line 194 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 
 

 #line 199 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 









 









// validation a la Secure CRT
 









 

 









 









 




 





 
 

 
















#line 285 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* _SECURE_VALIDATION is the name of the bool template argument used to define iterators
   with secure validation selectively turned on or off (for an example, see the std::list
   iterators). Notice that all the _SCL_SECURE_TRAITS_* validation macros are almost identical
   to the _SCL_SECURE_* macros defined above. The only difference is the:
        
        if (_SECURE_VALIDATION) { }

   statement, which will statically evaluate to true or false. With optimizations on, the
   compiler will optimize the check away.
 */
 

 

 

 










 










 










 










 









#line 357 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"











#line 369 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"
/***
*use_ansi.h - pragmas for ANSI Standard C++ libraries
*
*	Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This header is intended to force the use of the appropriate ANSI
*       Standard C++ libraries whenever it is included.
*
*       [Public]
*
****/

#pragma once












#pragma comment(lib,"msvcprtd")


#line 31 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"








#line 40 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"






#line 47 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"










#pragma comment(linker,"/manifestdependency:\"type='win32' "            \
        "name='" "Microsoft.VC90" ".DebugCRT' "         \
        "version='" "9.0.21022.8" "' "                           \
        "processorArchitecture='x86' "                                  \
        "publicKeyToken='" "1fc8b3b9a1e18e3b" "'\"")






#line 69 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"

#line 71 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"





































#line 109 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"







#line 117 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"

#line 119 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"

#line 121 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"

#line 123 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\use_ansi.h"
#line 371 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


 
#line 375 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"




#line 380 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* Define _CRTIMP2 */
 










/* Define _CRTIMP2_NCEEPURE */
 
  

#line 398 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
   
  #line 400 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
 #line 401 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"





/* Define _MRTIMP2 */
 










/* Define _MRTIMP2_NPURE */
 

   


#line 425 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
    
   #line 427 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 #line 429 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* Define _MRTIMP2_NCEE */
 
  

#line 435 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
   
  #line 437 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
 #line 438 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* Define _MRTIMP2_NCEEPURE */
 
  

#line 444 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
   
  #line 446 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
 #line 447 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

/* Define _MRTIMP2_NPURE_NCEEPURE */
 
  

#line 453 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
   
  #line 455 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
 #line 456 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 
  
 #line 460 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 
   


     
   #line 467 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
 #line 468 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


    
#line 472 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


  



		/* NAMESPACE */

 
  
  
  

/*
We use the stdext (standard extension) namespace to contain extensions that are not part of the current standard
*/
  
  
  

  





/* #define _GLOBAL_USING	*.h in global namespace, c* imports to std */

   
   
   
  #line 504 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

  
  
  
  

 












#line 524 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

 

 
namespace std {
typedef bool _Bool;
}
 #line 532 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

		/* VC++ COMPILER PARAMETERS */





		/* INTEGER PROPERTIES */






typedef __int64 _Longlong;
typedef unsigned __int64 _ULonglong;

		/* STDIO PROPERTIES */


 
  
 #line 555 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"





		/* MULTITHREAD PROPERTIES */
		/* LOCK MACROS */






 
namespace std {
		// CLASS _Lockit

// warning 4412 is benign here
#pragma warning(push)
#pragma warning(disable:4412)
class __declspec(dllimport) _Lockit
	{	// lock while object in existence -- MUST NEST
public:
  

    













#line 595 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
    explicit __thiscall _Lockit();	// set default lock
	explicit __thiscall _Lockit(int);	// set the lock
	__thiscall ~_Lockit();	// clear the lock
    #line 599 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

    static  void __cdecl _Lockit_ctor(int);
    static  void __cdecl _Lockit_dtor(int);

private:
    static  void __cdecl _Lockit_ctor(_Lockit *);
    static  void __cdecl _Lockit_ctor(_Lockit *, int);
    static  void __cdecl _Lockit_dtor(_Lockit *);

	 _Lockit(const _Lockit&);				// not defined
	_Lockit&  operator=(const _Lockit&);	// not defined

	int _Locktype;

  












#line 627 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

	};



























































































#line 721 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

class __declspec(dllimport) _Mutex
	{	// lock under program control
public:

  
    
    
















#line 746 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
    __thiscall _Mutex();
	__thiscall ~_Mutex();
	void __thiscall _Lock();
	void __thiscall _Unlock();
    #line 751 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

private:
    static  void __cdecl _Mutex_ctor(_Mutex *);
    static  void __cdecl _Mutex_dtor(_Mutex *);
    static  void __cdecl _Mutex_Lock(_Mutex *);
    static  void __cdecl _Mutex_Unlock(_Mutex *);

	 _Mutex(const _Mutex&);				// not defined
	_Mutex&  operator=(const _Mutex&);	// not defined
	void *_Mtx;

  







#line 771 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

	};

class __declspec(dllimport) _Init_locks
	{	// initialize mutexes
public:

 
    
    








#line 790 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"
    __thiscall _Init_locks();
	__thiscall ~_Init_locks();
    #line 793 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

private:
    static  void __cdecl _Init_locks_ctor(_Init_locks *);
    static  void __cdecl _Init_locks_dtor(_Init_locks *);

 







#line 807 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

	};
#pragma warning(pop)
}
 #line 812 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"





		/* MISCELLANEOUS MACROS AND TYPES */

__declspec(dllimport) void __cdecl _Atexit(void (__cdecl *)(void));

typedef int _Mbstatet;






  
  
 #pragma pack(pop)
#line 832 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"

#line 834 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\yvals.h"


/*
 * Copyright (c) 1992-2008 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.05:0009 */
#line 6 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\climits"

 #pragma warning(disable: 4514)

#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"
/***
*limits.h - implementation dependent values
*
*       Copyright (c) Microsoft Corporation.  All rights reserved.
*
*Purpose:
*       Contains defines for a number of implementation dependent values
*       which are commonly used in C programs.
*       [ANSI]
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"

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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 20 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"
















#line 37 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"



























/* minimum signed 64 bit value */

/* maximum signed 64 bit value */

/* maximum unsigned 64 bit value */









#line 79 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"






#line 86 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"
#line 87 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"


/* While waiting to the C standard committee to finalize the decision on RSIZE_MAX and rsize_t,
 * we define RSIZE_MAX as SIZE_MAX
 */


#line 95 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"
#line 96 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"
































#line 129 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\limits.h"
#line 10 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\climits"
#line 11 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\climits"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdio"
// cstdio standard header
#pragma once










 #line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
/***
*stdio.h - definitions/declarations for standard I/O routines
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file defines the structures, values, macros, and functions
*       used by the level 2 I/O ("standard I/O") routines.
*       [ANSI/System V]
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"




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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

/*
 * Currently, all MS C compilers for Win32 platforms default to 8 byte
 * alignment.
 */
#pragma pack(push,8)
#line 30 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


extern "C" {
#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


/* Buffered I/O macros */




/*
 * Default number of supported streams. _NFILE is confusing and obsolete, but
 * supported anyway for backwards compatibility.
 */




/*
 * Number of entries in _iob[] (declared below). Note that _NSTREAM_ must be
 * greater than or equal to _IOB_ENTRIES.
 */






struct _iobuf {
        char *_ptr;
        int   _cnt;
        char *_base;
        int   _flag;
        int   _file;
        int   _charbuf;
        int   _bufsiz;
        char *_tmpfname;
        };
typedef struct _iobuf FILE;

#line 72 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


/* Directory where temporary files may be created. */







#line 83 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

/* L_tmpnam = length of string _P_tmpdir
 *            + 1 if _P_tmpdir does not end in "/" or "\", else 0
 *            + 12 (for the filename string)
 *            + 1 (for the null terminator)
 * L_tmpnam_s = length of string _P_tmpdir
 *            + 1 if _P_tmpdir does not end in "/" or "\", else 0
 *            + 16 (for the filename string)
 *            + 1 (for the null terminator)
 */



#line 97 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"







/* Seek method constants */













#line 119 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

/* Define NULL pointer value */








/* Declare _iob[] array */


__declspec(dllimport) FILE * __cdecl __iob_func(void);
#line 134 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


/* Define file position type */







#line 145 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


/* At this point we could switch both to long long, but we won't do that till next version to avoid any potential compat issues */
typedef __int64 fpos_t;




#line 154 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
#line 155 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


#line 158 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"






#line 165 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

















/* constants used by _set_output_format */


/* Function prototypes */



[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _filbuf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File );
 __declspec(dllimport) int __cdecl _flsbuf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);




[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) FILE * __cdecl _fsopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ShFlag);
#line 197 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

__declspec(dllimport) void __cdecl clearerr([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);

 __declspec(dllimport) errno_t __cdecl clearerr_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File );
#line 202 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl fclose([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _fcloseall(void);




[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) FILE * __cdecl _fdopen([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _FileHandle, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode);
#line 210 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl feof([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] FILE * _File);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl ferror([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] FILE * _File);
 __declspec(dllimport) int __cdecl fflush([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl fgetc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _fgetchar(void);
 __declspec(dllimport) int __cdecl fgetpos([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File , [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] fpos_t * _Pos);
 __declspec(dllimport) char * __cdecl fgets([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _MaxCount, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);




[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _fileno([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] FILE * _File);
#line 224 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"




#line 229 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) char * __cdecl _tempnam([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _DirName, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _FilePrefix);



#line 235 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

 __declspec(dllimport) int __cdecl _flushall(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "fopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) FILE * __cdecl fopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode);

 __declspec(dllimport) errno_t __cdecl fopen_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Pre(Deref=2,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] FILE ** _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode);
#line 241 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl fprintf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);

 __declspec(dllimport) int __cdecl fprintf_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
#line 245 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl fputc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _fputchar([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch);
 __declspec(dllimport) int __cdecl fputs([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) size_t __cdecl fread([SA_Pre(Null=SA_No,WritableBytes="\n@""_ElementSize*_Count")] [SA_Pre(Deref=1,Valid=SA_No)] void * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _ElementSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);

 __declspec(dllimport) size_t __cdecl fread_s([SA_Pre(Null=SA_No,WritableBytes="\n@""_ElementSize*_Count")] [SA_Pre(Deref=1,Valid=SA_No)] void * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _ElementSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
#line 252 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "freopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) FILE * __cdecl freopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);

 __declspec(dllimport) errno_t __cdecl freopen_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Pre(Deref=2,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] FILE ** _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _OldFile);
#line 256 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "fscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl fscanf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _fscanf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
#pragma warning(push)
#pragma warning(disable:6530)

 __declspec(dllimport) int __cdecl fscanf_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, ...);
#line 263 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _fscanf_s_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl fsetpos([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const fpos_t * _Pos);
 __declspec(dllimport) int __cdecl fseek([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Offset, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Origin);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long __cdecl ftell([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);

 __declspec(dllimport) int __cdecl _fseeki64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] __int64 _Offset, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Origin);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64 __cdecl _ftelli64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);

 __declspec(dllimport) size_t __cdecl fwrite([SA_Pre(Null=SA_No,ValidElements="\n@""_Size*_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl getc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl getchar(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _getmaxstdio(void);

__declspec(dllimport) char * __cdecl gets_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _Size);
#line 278 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
extern "C++" { template <size_t _Size> inline char * __cdecl gets_s(char (&_Buffer)[_Size]) { return gets_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "gets_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl gets([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Null=SA_No,WritableElementsConst=((size_t)-1))] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Buffer);
[returnvalue:SA_Post(MustCheck=SA_Yes)] int __cdecl _getw([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);


__declspec(dllimport) void __cdecl perror([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _ErrMsg);
#line 285 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _pclose([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) FILE * __cdecl _popen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Command, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Mode);
 __declspec(dllimport) int __cdecl printf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);

 __declspec(dllimport) int __cdecl printf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
#line 291 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl putc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl putchar([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch);
 __declspec(dllimport) int __cdecl puts([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str);
 __declspec(dllimport) int __cdecl _putw([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Word, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);


[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl remove([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl rename([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _OldFilename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _NewFilename);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _unlink([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_unlink" ". See online help for details.")) __declspec(dllimport) int __cdecl unlink([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename);
#line 303 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
#line 304 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
__declspec(dllimport) void __cdecl rewind([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _rmtmp(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "scanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl scanf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_scanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _scanf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);

 __declspec(dllimport) int __cdecl scanf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, ...);
#line 311 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _scanf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "setvbuf" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void __cdecl setbuf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_Maybe,WritableElementsConst=512)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Post(ValidElementsConst=0)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buffer);
 __declspec(dllimport) int __cdecl _setmaxstdio([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Max);
 __declspec(dllimport) unsigned int __cdecl _set_output_format([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Format);
 __declspec(dllimport) unsigned int __cdecl _get_output_format(void);
 __declspec(dllimport) int __cdecl setvbuf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
 __declspec(dllimport) int __cdecl _snprintf_s([SA_Pre(Null=SA_No,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl _snprintf_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return _vsnprintf_s(_Dest, _Size, _MaxCount, _Format, _ArgList); } __pragma(warning(pop)); }

 __declspec(dllimport) int __cdecl sprintf_s([SA_Pre(Null=SA_No,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
#line 322 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl sprintf_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return vsprintf_s(_Dest, _Size, _Format, _ArgList); } __pragma(warning(pop)); }
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _scprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "sscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl sscanf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_sscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _sscanf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);

 __declspec(dllimport) int __cdecl sscanf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, ...);
#line 329 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _sscanf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snscanf([SA_Pre(Null=SA_No,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snscanf_l([SA_Pre(Null=SA_No,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _snscanf_s([SA_Pre(Null=SA_No,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, ...);
 __declspec(dllimport) int __cdecl _snscanf_s_l([SA_Pre(Null=SA_No,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "tmpfile_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) FILE * __cdecl tmpfile(void);

 __declspec(dllimport) errno_t __cdecl tmpfile_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No)] [SA_Post(Deref=2,Valid=SA_Yes)] FILE ** _File);
 __declspec(dllimport) errno_t __cdecl tmpnam_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _Size);
#line 339 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl tmpnam_s([SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char (&_Buf)[_Size]) { return tmpnam_s(_Buf, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "tmpnam_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl tmpnam([SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Buffer);
 __declspec(dllimport) int __cdecl ungetc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl vfprintf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl vfprintf_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
#line 346 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl vprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl vprintf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
#line 350 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "vsnprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl vsnprintf([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl vsnprintf_s([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
#line 354 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _vsnprintf_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
extern "C++" { template <size_t _Size> inline int __cdecl _vsnprintf_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _Args) { return _vsnprintf_s(_Dest, _Size, _MaxCount, _Format, _Args); } }
#pragma warning(push)
#pragma warning(disable:4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snprintf([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _vsnprintf([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _Args);
#pragma warning(pop)

__declspec(dllimport) int __cdecl vsprintf_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
#line 363 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
extern "C++" { template <size_t _Size> inline int __cdecl vsprintf_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _Args) { return vsprintf_s(_Dest, _Size, _Format, _Args); } }
#pragma warning(push)
#pragma warning(disable:4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "sprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl sprintf([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "vsprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl vsprintf([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _Args);
#pragma warning(pop)
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _vscprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
 __declspec(dllimport) int __cdecl _snprintf_c([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
 __declspec(dllimport) int __cdecl _vsnprintf_c([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char *_DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl _fprintf_p([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
 __declspec(dllimport) int __cdecl _printf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
 __declspec(dllimport) int __cdecl _sprintf_p([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
 __declspec(dllimport) int __cdecl _vfprintf_p([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vsprintf_p([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _scprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _vscprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, va_list _ArgList);
__declspec(dllimport) int __cdecl _set_printf_count_output([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value);
__declspec(dllimport) int __cdecl _get_printf_count_output();

 __declspec(dllimport) int __cdecl _printf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _printf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _printf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vprintf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(dllimport) int __cdecl _fprintf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _fprintf_p_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _fprintf_s_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vfprintf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vfprintf_p_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vfprintf_s_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_sprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _sprintf_l([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _sprintf_p_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _sprintf_s_l([SA_Pre(Null=SA_No,WritableBytes="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _vsprintf_l([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vsprintf_p_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char* _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale,  va_list _ArgList);
 __declspec(dllimport) int __cdecl _vsprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(dllimport) int __cdecl _scprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _scprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vscprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vscprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snprintf_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _snprintf_c_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _snprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _vsnprintf_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vsnprintf_c_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, const char *, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vsnprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const char* _Format,[SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);



/* wide function prototypes, also declared in wchar.h  */



#line 423 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"




[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) FILE * __cdecl _wfsopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ShFlag);
#line 429 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

 __declspec(dllimport) wint_t __cdecl fgetwc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) wint_t __cdecl _fgetwchar(void);
 __declspec(dllimport) wint_t __cdecl fputwc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) wint_t __cdecl _fputwchar([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl getwc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl getwchar(void);
 __declspec(dllimport) wint_t __cdecl putwc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) wint_t __cdecl putwchar([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch);
 __declspec(dllimport) wint_t __cdecl ungetwc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);

 __declspec(dllimport) wchar_t * __cdecl fgetws([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl fputws([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) wchar_t * __cdecl _getws_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline wchar_t * __cdecl _getws_s(wchar_t (&_String)[_Size]) { return _getws_s(_String, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_getws_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _getws([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_String);
 __declspec(dllimport) int __cdecl _putws([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str);

 __declspec(dllimport) int __cdecl fwprintf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);

 __declspec(dllimport) int __cdecl fwprintf_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
#line 451 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl wprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);

 __declspec(dllimport) int __cdecl wprintf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
#line 455 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _scwprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl vfwprintf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl vfwprintf_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
#line 460 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl vwprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl vwprintf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
#line 464 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


__declspec(dllimport) int __cdecl swprintf_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
#line 468 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl swprintf_s(wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return vswprintf_s(_Dest, _Size, _Format, _ArgList); } __pragma(warning(pop)); }

__declspec(dllimport) int __cdecl vswprintf_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
#line 472 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
extern "C++" { template <size_t _Size> inline int __cdecl vswprintf_s(wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _Args) { return vswprintf_s(_Dest, _Size, _Format, _Args); } }

 __declspec(dllimport) int __cdecl _swprintf_c([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _vswprintf_c([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl _snwprintf_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
extern "C++" { __pragma(warning(push)); __pragma(warning(disable: 4793)); template <size_t _Size> inline int __cdecl _snwprintf_s(wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...) { va_list _ArgList; ( _ArgList = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) ); return _vsnwprintf_s(_Dest, _Size, _Count, _Format, _ArgList); } __pragma(warning(pop)); }
 __declspec(dllimport) int __cdecl _vsnwprintf_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
extern "C++" { template <size_t _Size> inline int __cdecl _vsnwprintf_s(wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _Args) { return _vsnwprintf_s(_Dest, _Size, _Count, _Format, _Args); } }
#pragma warning(push)
#pragma warning(disable:4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snwprintf([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] wchar_t *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _vsnwprintf([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Maybe)] wchar_t *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _Args);
#pragma warning(pop)

 __declspec(dllimport) int __cdecl _fwprintf_p([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _wprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _vfwprintf_p([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vwprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
 __declspec(dllimport) int __cdecl _swprintf_p([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _vswprintf_p([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _scwprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _vscwprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl _wprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _wprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _wprintf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vwprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vwprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vwprintf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(dllimport) int __cdecl _fwprintf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _fwprintf_p_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _fwprintf_s_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vfwprintf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vfwprintf_p_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vfwprintf_s_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(dllimport) int __cdecl _swprintf_c_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _swprintf_p_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _swprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vswprintf_c_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vswprintf_p_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vswprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _scwprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _scwprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _vscwprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snwprintf_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _snwprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _vsnwprintf_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vsnwprintf_s_l([SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);










#line 535 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

/* we could end up with a double deprecation, disable warnings 4141 and 4996 */
#pragma warning(push)
#pragma warning(disable:4141 4996 4793)
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_swprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl _swprintf([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "vswprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl _vswprintf([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _Args);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "__swprintf_l_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl __swprintf_l( wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, _locale_t _Plocinfo, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vswprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(dllimport) int __cdecl __vswprintf_l( wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, _locale_t _Plocinfo, va_list _Args);
#pragma warning(pop)


#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"
/***
*swprintf.inl - inline definitions for (v)swprintf
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file contains the function definitions for (v)swprintf
*
*       [Public]
*
****/

#pragma once







#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"










#line 33 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"

#pragma warning( push )
#pragma warning( disable : 4793 4412 )
static __inline int swprintf(wchar_t * _String, size_t _Count, const wchar_t * _Format, ...)
{
    va_list _Arglist;
    int _Ret;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    _Ret = _vswprintf_c_l(_String, _Count, _Format, 0, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4412 )
static __inline int __cdecl vswprintf(wchar_t * _String, size_t _Count, const wchar_t * _Format, va_list _Ap)
{
    return _vswprintf_c_l(_String, _Count, _Format, 0, _Ap);
}
#pragma warning( pop )


#line 57 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"

#pragma warning( push )
#pragma warning( disable : 4793 4412 )
static __inline int _swprintf_l(wchar_t * _String, size_t _Count, const wchar_t * _Format, _locale_t _Plocinfo, ...)
{
    va_list _Arglist;
    int _Ret;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Plocinfo) ) + ( (sizeof(_Plocinfo) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    _Ret = _vswprintf_c_l(_String, _Count, _Format, _Plocinfo, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4412 )
static __inline int __cdecl _vswprintf_l(wchar_t * _String, size_t _Count, const wchar_t * _Format, _locale_t _Plocinfo, va_list _Ap)
{
    return _vswprintf_c_l(_String, _Count, _Format, _Plocinfo, _Ap);
}
#pragma warning( pop )


#pragma warning( push )
#pragma warning( disable : 4996 )

#pragma warning( push )
#pragma warning( disable : 4793 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "swprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __inline int swprintf([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _String, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...)
{
    va_list _Arglist;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Format) ) + ( (sizeof(_Format) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    int _Ret = _vswprintf(_String, _Format, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "vswprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __inline int __cdecl vswprintf([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _String, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _Ap)
{
    return _vswprintf(_String, _Format, _Ap);
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4793 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_swprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __inline int _swprintf_l([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _String, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, _locale_t _Plocinfo, ...)
{
    va_list _Arglist;
    ( _Arglist = (va_list)( &reinterpret_cast<const char &>(_Plocinfo) ) + ( (sizeof(_Plocinfo) + sizeof(int) - 1) & ~(sizeof(int) - 1) ) );
    int _Ret = __vswprintf_l(_String, _Format, _Plocinfo, _Arglist);
    ( _Arglist = (va_list)0 );
    return _Ret;
}
#pragma warning( pop )

#pragma warning( push )
#pragma warning( disable : 4141 )
extern "C++" __declspec(deprecated("swprintf has been changed to conform with the ISO C standard, adding an extra character count parameter. To use traditional Microsoft swprintf, set _CRT_NON_CONFORMING_SWPRINTFS.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vswprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __inline int __cdecl _vswprintf_l([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _String, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, _locale_t _Plocinfo, va_list _Ap)
{
    return __vswprintf_l(_String, _Format, _Plocinfo, _Ap);
}
#pragma warning( pop )

#pragma warning( pop )

#line 126 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"

#line 128 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"
#line 129 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\swprintf.inl"

#line 545 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
#line 546 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"













#line 560 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wtempnam([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Directory, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _FilePrefix);



#line 566 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _vscwprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, va_list _ArgList);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _vscwprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "fwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl fwscanf([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _fwscanf_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);

 __declspec(dllimport) int __cdecl fwscanf_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, ...);
#line 574 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _fwscanf_s_l([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "swscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl swscanf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_swscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _swscanf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);

 __declspec(dllimport) int __cdecl swscanf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, ...);
#line 580 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _swscanf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snwscanf([SA_Pre(Null=SA_No,ValidElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _snwscanf_l([SA_Pre(Null=SA_No,ValidElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _snwscanf_s([SA_Pre(Null=SA_No,ValidElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _snwscanf_s_l([SA_Pre(Null=SA_No,ValidElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "wscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl wscanf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _wscanf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);

 __declspec(dllimport) int __cdecl wscanf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, ...);
#line 590 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
 __declspec(dllimport) int __cdecl _wscanf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf_s")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
#pragma warning(pop)

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) FILE * __cdecl _wfdopen([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _FileHandle , [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wfopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) FILE * __cdecl _wfopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode);
 __declspec(dllimport) errno_t __cdecl _wfopen_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Pre(Deref=2,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] FILE ** _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wfreopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) FILE * __cdecl _wfreopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _OldFile);
 __declspec(dllimport) errno_t __cdecl _wfreopen_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Pre(Deref=2,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] FILE ** _File, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _OldFile);



__declspec(dllimport) void __cdecl _wperror([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ErrMsg);
#line 603 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) FILE * __cdecl _wpopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Command, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Mode);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wremove([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename);
 __declspec(dllimport) errno_t __cdecl _wtmpnam_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wtmpnam_s([SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size]) { return _wtmpnam_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wtmpnam_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wtmpnam([SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Buffer);

 __declspec(dllimport) wint_t __cdecl _fgetwc_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) wint_t __cdecl _fputwc_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) wint_t __cdecl _ungetwc_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);






#line 619 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"
inline wint_t __cdecl getwchar()
        {return (fgetwc((&__iob_func()[0]))); }   /* stdin */
inline wint_t __cdecl putwchar(wchar_t _C)
        {return (fputwc(_C, (&__iob_func()[1]))); }       /* stdout */
#line 624 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"










#line 635 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


#line 638 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


#line 641 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


/* Macro definitions */












#line 657 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"












__declspec(dllimport) void __cdecl _lock_file([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
__declspec(dllimport) void __cdecl _unlock_file([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);



#line 675 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


 __declspec(dllimport) int __cdecl _fclose_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _fflush_nolock([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) size_t __cdecl _fread_nolock([SA_Pre(Null=SA_No,WritableBytes="\n@""_ElementSize*_Count")] [SA_Pre(Deref=1,Valid=SA_No)] void * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _ElementSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) size_t __cdecl _fread_nolock_s([SA_Pre(Null=SA_No,WritableBytes="\n@""_ElementSize*_Count")] [SA_Pre(Deref=1,Valid=SA_No)] void * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _ElementSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _fseek_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Offset, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Origin);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long __cdecl _ftell_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _fseeki64_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] __int64 _Offset, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Origin);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64 __cdecl _ftelli64_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) size_t __cdecl _fwrite_nolock([SA_Pre(Null=SA_No,ValidBytes="\n@""_Size*_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(dllimport) int __cdecl _ungetc_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);












#line 700 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"



/* Non-ANSI names for compatibility */







#line 712 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_tempnam" ". See online help for details.")) __declspec(dllimport) char * __cdecl tempnam([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Directory, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _FilePrefix);



#line 718 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

 __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fcloseall" ". See online help for details.")) __declspec(dllimport) int __cdecl fcloseall(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fdopen" ". See online help for details.")) __declspec(dllimport) FILE * __cdecl fdopen([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _FileHandle, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Format);
 __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fgetchar" ". See online help for details.")) __declspec(dllimport) int __cdecl fgetchar(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fileno" ". See online help for details.")) __declspec(dllimport) int __cdecl fileno([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] FILE * _File);
 __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_flushall" ". See online help for details.")) __declspec(dllimport) int __cdecl flushall(void);
 __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fputchar" ". See online help for details.")) __declspec(dllimport) int __cdecl fputchar([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_getw" ". See online help for details.")) __declspec(dllimport) int __cdecl getw([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
 __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_putw" ". See online help for details.")) __declspec(dllimport) int __cdecl putw([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] FILE * _File);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_rmtmp" ". See online help for details.")) __declspec(dllimport) int __cdecl rmtmp(void);

#line 730 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


}
#line 734 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"


#pragma pack(pop)
#line 738 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

#line 740 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdio.h"

#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdio"
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdio"

// undef common macro overrides
 
 
 
 
 
 
 

 
 
 
 





typedef FILE _iobuf;


 
namespace std {
using ::_iobuf;

using ::size_t; using ::fpos_t; using ::FILE;
using ::clearerr; using ::fclose; using ::feof;
using ::ferror; using ::fflush; using ::fgetc;
using ::fgetpos; using ::fgets; using ::fopen;
using ::fprintf; using ::fputc; using ::fputs;
using ::fread; using ::freopen; using ::fscanf;
using ::fseek; using ::fsetpos; using ::ftell;
using ::fwrite; using ::getc; using ::getchar;
using ::gets; using ::perror;
using ::putc; using ::putchar;
using ::printf; using ::puts; using ::remove;
using ::rename; using ::rewind; using ::scanf;
using ::setbuf; using ::setvbuf; using ::sprintf;
using ::sscanf; using ::tmpfile; using ::tmpnam;
using ::ungetc; using ::vfprintf; using ::vprintf;
using ::vsprintf;


}
 #line 61 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdio"
#line 62 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdio"

#line 64 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdio"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 8 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdlib"
// cstdlib standard header
#pragma once










 #line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
/***
*stdlib.h - declarations/definitions for commonly used library functions
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This include file contains the function declarations for commonly
*       used library functions which either don't fit somewhere else, or,
*       cannot be declared in the normal place for other reasons.
*       [ANSI]
*
*       [Public]
*
****/


#pragma once
#line 19 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"




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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 24 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"



/*
 * Currently, all MS C compilers for Win32 platforms default to 8 byte
 * alignment.
 */
#pragma pack(push,8)
#line 33 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


extern "C" {
#line 37 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/* Define NULL pointer value */








/* Definition of the argument values for the exit() function */








typedef int (__cdecl * _onexit_t)(void);



#line 61 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"



#line 65 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


/* Non-ANSI name for compatibility */

#line 70 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


#line 73 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


/* Data structure definitions for div and ldiv runtimes. */



typedef struct _div_t {
        int quot;
        int rem;
} div_t;

typedef struct _ldiv_t {
        long quot;
        long rem;
} ldiv_t;


#line 91 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/*
 * structs used to fool the compiler into not generating floating point
 * instructions when copying and pushing [long] double values
 */





#pragma pack(4)
typedef struct {
    unsigned char ld[10];
} _LDOUBLE;
#pragma pack()













#line 120 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

typedef struct {
        double x;
} _CRT_DOUBLE;

typedef struct {
    float f;
} _CRT_FLOAT;

/* push and pop long, which is #defined as __int64 by a spec2k test */



typedef struct {
        /*
         * Assume there is a long double type
         */
        long double x;
} _LONGDOUBLE;



#pragma pack(4)
typedef struct {
    unsigned char ld12[12];
} _LDBL12;
#pragma pack()


#line 150 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/* Maximum value that can be returned by the rand function. */



/*
 * Maximum number of bytes in multi-byte character in the current locale
 * (also defined in ctype.h).
 */





#line 165 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

__declspec(dllimport) extern int __mb_cur_max;



#line 171 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
__declspec(dllimport) int __cdecl ___mb_cur_max_func(void);
__declspec(dllimport) int __cdecl ___mb_cur_max_l_func(_locale_t);
#line 174 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/* Minimum and maximum macros */




/*
 * Sizes for buffers used by the _makepath() and _splitpath() functions.
 * note that the sizes include space for 0-terminator
 */






/*
 * Argument values for _set_error_mode().
 */





/*
 * Argument values for _set_abort_behavior().
 */



/*
 * Sizes for buffers used by the getenv/putenv family of functions.
 */



/* a purecall handler procedure. Never returns normally */
typedef void (__cdecl *_purecall_handler)(void); 

/* establishes a purecall handler for the process */
__declspec(dllimport) _purecall_handler __cdecl _set_purecall_handler([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _purecall_handler _Handler);
__declspec(dllimport) _purecall_handler __cdecl _get_purecall_handler();
#line 217 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


extern "C++"
{




#line 226 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"







#line 234 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
}
#line 236 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


/* a invalid_arg handler procedure. */
typedef void (__cdecl *_invalid_parameter_handler)(const wchar_t *, const wchar_t *, const wchar_t *, unsigned int, uintptr_t); 

/* establishes a invalid_arg handler for the process */
__declspec(dllimport) _invalid_parameter_handler __cdecl _set_invalid_parameter_handler([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _invalid_parameter_handler _Handler);
__declspec(dllimport) _invalid_parameter_handler __cdecl _get_invalid_parameter_handler(void);
#line 245 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


extern "C++"
{




#line 254 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"






#line 261 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
}
#line 263 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/* External variable declarations */


__declspec(dllimport) extern int * __cdecl _errno(void);


errno_t __cdecl _set_errno([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value);
errno_t __cdecl _get_errno([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _Value);
#line 273 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

__declspec(dllimport) unsigned long * __cdecl __doserrno(void);


errno_t __cdecl _set_doserrno([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Value);
errno_t __cdecl _get_doserrno([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] unsigned long * _Value);

/* you can't modify this, but it is non-const for backcompat */
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "strerror" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char ** __cdecl __sys_errlist(void);


__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "strerror" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) int * __cdecl __sys_nerr(void);




__declspec(dllimport) int *          __cdecl __p___argc(void);
__declspec(dllimport) char ***       __cdecl __p___argv(void);
__declspec(dllimport) wchar_t ***    __cdecl __p___wargv(void);
__declspec(dllimport) char ***       __cdecl __p__environ(void);
__declspec(dllimport) wchar_t ***    __cdecl __p__wenviron(void);
__declspec(dllimport) char **        __cdecl __p__pgmptr(void);
__declspec(dllimport) wchar_t **     __cdecl __p__wpgmptr(void);


#line 299 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


__declspec(dllimport) extern int __argc;          /* count of cmd line args */
__declspec(dllimport) extern char ** __argv;      /* pointer to table of cmd line args */
__declspec(dllimport) extern wchar_t ** __wargv;  /* pointer to table of wide cmd line args */







#line 312 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"





__declspec(dllimport) extern char ** _environ;    /* pointer to environment table */
__declspec(dllimport) extern wchar_t ** _wenviron;    /* pointer to wide environment table */
#line 320 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_pgmptr" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) extern char * _pgmptr;      /* points to the module (EXE) name */
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_wpgmptr" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) extern wchar_t * _wpgmptr;  /* points to the module (EXE) wide name */














#line 338 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

errno_t __cdecl _get_pgmptr([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Pre(Deref=2,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _Value);
errno_t __cdecl _get_wpgmptr([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Pre(Deref=2,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _Value);



__declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_fmode" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) extern int _fmode;          /* default file translation mode */



#line 349 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

__declspec(dllimport) errno_t __cdecl _set_fmode([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode);
__declspec(dllimport) errno_t __cdecl _get_fmode([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PMode);

/* _countof helper */



#line 358 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
extern "C++"
{
template <typename _CountofType, size_t _SizeOfArray>
char (*__countof_helper( _CountofType (&_Array)[_SizeOfArray]))[_SizeOfArray];

}
#line 365 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
#line 366 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/* function prototypes */



__declspec(dllimport) __declspec(noreturn) void __cdecl exit([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Code);
__declspec(dllimport) __declspec(noreturn) void __cdecl _exit([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Code);
__declspec(dllimport) void __cdecl abort(void);
#line 375 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

__declspec(dllimport) unsigned int __cdecl _set_abort_behavior([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Flags, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Mask);



        int     __cdecl abs([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _X);
        long    __cdecl labs([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _X);
#line 383 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

        __int64    __cdecl _abs64(__int64);













#line 399 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"












#line 412 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
        int    __cdecl atexit(void (__cdecl *)(void));
#line 414 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double  __cdecl atof([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_String);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double  __cdecl _atof_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_String, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
#line 419 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport)  int    __cdecl atoi([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int    __cdecl _atoi_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long   __cdecl atol([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long   __cdecl _atol_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);



[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) void * __cdecl bsearch_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const void * _Key, [SA_Pre(Null=SA_No,ValidBytes="\n@""_NumOfElements * _SizeOfElements")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Base, 
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _NumOfElements, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int (__cdecl * _PtFuncCompare)(void *, const void *, const void *), void * _Context);
#line 430 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) void * __cdecl bsearch([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const void * _Key, [SA_Pre(Null=SA_No,ValidBytes="\n@""_NumOfElements * _SizeOfElements")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Base, 
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NumOfElements, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int (__cdecl * _PtFuncCompare)(const void *, const void *));


__declspec(dllimport) void __cdecl qsort_s([SA_Pre(Null=SA_No,WritableBytes="\n@""_NumOfElements* _SizeOfElements")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Base, 
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _NumOfElements, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int (__cdecl * _PtFuncCompare)(void *, const void *, const void *), void *_Context);
#line 439 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
__declspec(dllimport) void __cdecl qsort([SA_Pre(Null=SA_No,WritableBytes="\n@""_NumOfElements * _SizeOfElements")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Base, 
	[SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NumOfElements, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeOfElements, 
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int (__cdecl * _PtFuncCompare)(const void *, const void *));
#line 443 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned short __cdecl _byteswap_ushort([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned short _Short);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned long  __cdecl _byteswap_ulong ([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Long);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned __int64 __cdecl _byteswap_uint64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Int64);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) div_t  __cdecl div([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Numerator, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Denominator);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_dupenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char * __cdecl getenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _VarName);

 __declspec(dllimport) errno_t __cdecl getenv_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _ReturnSize, [SA_Pre(Null=SA_No,WritableElements="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _DstSize, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _VarName);
#line 451 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
extern "C++" { template <size_t _Size> inline errno_t __cdecl getenv_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _ReturnSize, char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _VarName) { return getenv_s(_ReturnSize, _Dest, _Size, _VarName); } }



#line 456 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

 __declspec(dllimport) errno_t __cdecl _dupenv_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes,WritableElements="*_PBufferSizeInBytes")] [SA_Post(Deref=2,Valid=SA_Yes)] char **_PBuffer, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PBufferSizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _VarName);



#line 462 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

 __declspec(dllimport) errno_t __cdecl _itoa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value, [SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _itoa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value, char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix) { return _itoa_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_itoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _itoa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
 __declspec(dllimport) errno_t __cdecl _i64toa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] __int64 _Val, [SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_i64toa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char * __cdecl _i64toa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] __int64 _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
 __declspec(dllimport) errno_t __cdecl _ui64toa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Val, [SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ui64toa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char * __cdecl _ui64toa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64 __cdecl _atoi64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _String);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64 __cdecl _atoi64_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _String, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64 __cdecl _strtoi64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _String, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64 __cdecl _strtoi64_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _String, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned __int64 __cdecl _strtoui64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _String, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned __int64 __cdecl _strtoui64_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _String, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int  _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) ldiv_t __cdecl ldiv([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Numerator, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Denominator);

extern "C++"
{
    inline ldiv_t  div([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _A1, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _A2)
    {
        return ldiv(_A1, _A2);
    }
}
#line 486 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
 __declspec(dllimport) errno_t __cdecl _ltoa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Val, [SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ltoa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Value, char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix) { return _ltoa_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ltoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _ltoa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Value, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int    __cdecl mblen([SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int    __cdecl _mblen_l([SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl _mbstrlen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl _mbstrlen_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl _mbstrnlen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t __cdecl _mbstrnlen_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
__declspec(dllimport) int    __cdecl mbtowc([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstCh, [SA_Pre(Null=SA_Maybe,ValidBytes="_SrcSizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _SrcCh, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SrcSizeInBytes);
__declspec(dllimport) int    __cdecl _mbtowc_l([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstCh, [SA_Pre(Null=SA_Maybe,ValidBytes="_SrcSizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _SrcCh, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SrcSizeInBytes, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
 __declspec(dllimport) errno_t __cdecl mbstowcs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="*_PtNumOfCharConverted")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,ValidElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _SrcBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount );
extern "C++" { template <size_t _Size> inline errno_t __cdecl mbstowcs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount) { return mbstowcs_s(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "mbstowcs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl mbstowcs([SA_Pre(Null=SA_Maybe,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);

 __declspec(dllimport) errno_t __cdecl _mbstowcs_s_l([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="*_PtNumOfCharConverted")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,ValidElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _SrcBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _mbstowcs_s_l([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale) { return _mbstowcs_s_l(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_mbstowcs_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl _mbstowcs_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int    __cdecl rand(void);


#line 509 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

 __declspec(dllimport) int    __cdecl _set_error_mode([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode);

__declspec(dllimport) void   __cdecl srand([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Seed);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double __cdecl strtod([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double __cdecl _strtod_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long   __cdecl strtol([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix );
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long   __cdecl _strtol_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *_Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char **_EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned long __cdecl strtoul([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned long __cdecl _strtoul_l(const char * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] char **_EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);


__declspec(dllimport) int __cdecl system([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Command);
#line 523 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
 __declspec(dllimport) errno_t __cdecl _ultoa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Val, [SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ultoa_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Value, char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix) { return _ultoa_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ultoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl _ultoa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Value, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "wctomb_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) int    __cdecl wctomb([SA_Pre(Null=SA_Maybe,WritableBytesConst=5)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _MbCh, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _WCh);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wctomb_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) int    __cdecl _wctomb_l([SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _MbCh, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _WCh, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

 __declspec(dllimport) errno_t __cdecl wctomb_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _SizeConverted, [SA_Pre(Null=SA_Maybe,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="*_SizeConverted")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _MbCh, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _WCh);
#line 531 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
 __declspec(dllimport) errno_t __cdecl _wctomb_s_l([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _SizeConverted, [SA_Pre(Null=SA_Maybe,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _MbCh, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _WCh, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
 __declspec(dllimport) errno_t __cdecl wcstombs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Pre(Null=SA_Maybe,WritableBytes="_DstSizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="*_PtNumOfCharConverted")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCountInBytes);
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcstombs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount) { return wcstombs_s(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcstombs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl wcstombs([SA_Pre(Null=SA_Maybe,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount);
 __declspec(dllimport) errno_t __cdecl _wcstombs_s_l([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Pre(Null=SA_Maybe,WritableBytes="_DstSizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="*_PtNumOfCharConverted")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCountInBytes, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wcstombs_s_l([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PtNumOfCharConverted, [SA_Pre(Null=SA_Maybe,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale) { return _wcstombs_s_l(_PtNumOfCharConverted, _Dest, _Size, _Source, _MaxCount, _Locale); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wcstombs_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl _wcstombs_l([SA_Pre(Null=SA_No,WritableElements="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Source, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _MaxCount, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

























#line 564 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


































#line 599 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_NumOfElements* _SizeOfElements")] __declspec(dllimport)  __declspec(noalias) __declspec(restrict)    void * __cdecl calloc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NumOfElements, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeOfElements);
__declspec(dllimport)                     __declspec(noalias)                                                                             void   __cdecl free([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Memory);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] __declspec(dllimport)  __declspec(noalias) __declspec(restrict)                              void * __cdecl malloc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                           void * __cdecl realloc([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_Count*_Size")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                       void * __cdecl _recalloc([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
__declspec(dllimport)                     __declspec(noalias)                                                                             void   __cdecl _aligned_free([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Memory);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                              void * __cdecl _aligned_malloc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                              void * __cdecl _aligned_offset_malloc([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                              void * __cdecl _aligned_realloc([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_Count*_Size")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                       void * __cdecl _aligned_recalloc([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                              void * __cdecl _aligned_offset_realloc([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_Count*_Size")] __declspec(dllimport) __declspec(noalias) __declspec(restrict)                       void * __cdecl _aligned_offset_recalloc([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport)                                                  size_t __cdecl _aligned_msize([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset);


















#line 631 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

#line 633 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"



/* wide function prototypes, also declared in wchar.h  */

 __declspec(dllimport) errno_t __cdecl _itow_s ([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _itow_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value, wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix) { return _itow_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_itow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _itow([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Value, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
 __declspec(dllimport) errno_t __cdecl _ltow_s ([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Val, [SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ltow_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Value, wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix) { return _ltow_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ltow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _ltow([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Value, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
 __declspec(dllimport) errno_t __cdecl _ultow_s ([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Val, [SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ultow_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Value, wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix) { return _ultow_s(_Value, _Dest, _Size, _Radix); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_ultow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _ultow([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Value, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double __cdecl wcstod([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double __cdecl _wcstod_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long   __cdecl wcstol([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long   __cdecl _wcstol_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t **_EndPtr, int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned long __cdecl wcstoul([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned long __cdecl _wcstoul_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t **_EndPtr, int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wdupenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) wchar_t * __cdecl _wgetenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _VarName);
 __declspec(dllimport) errno_t __cdecl _wgetenv_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _ReturnSize, [SA_Pre(Null=SA_No,WritableElements="_DstSizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DstSizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _VarName);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wgetenv_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _ReturnSize, wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _VarName) { return _wgetenv_s(_ReturnSize, _Dest, _Size, _VarName); } }




#line 661 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

 __declspec(dllimport) errno_t __cdecl _wdupenv_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes,WritableElements="*_BufferSizeInWords")] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t **_Buffer, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t *_BufferSizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_VarName);



#line 667 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"



__declspec(dllimport) int __cdecl _wsystem([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Command);
#line 672 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double __cdecl _wtof([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) double __cdecl _wtof_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wtoi([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wtoi_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long __cdecl _wtol([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) long __cdecl _wtol_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

 __declspec(dllimport) errno_t __cdecl _i64tow_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] __int64 _Val, [SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_i64tow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) wchar_t * __cdecl _i64tow([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] __int64 _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
 __declspec(dllimport) errno_t __cdecl _ui64tow_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Val, [SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ui64tow_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) wchar_t * __cdecl _ui64tow([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64   __cdecl _wtoi64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64   __cdecl _wtoi64_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64   __cdecl _wcstoi64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __int64   __cdecl _wcstoi64_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned __int64  __cdecl _wcstoui64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) unsigned __int64  __cdecl _wcstoui64_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_Str , [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _EndPtr, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);


#line 692 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"




/* 
Buffer size required to be passed to _gcvt, fcvt and other fp conversion routines
*/







#line 707 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) char * __cdecl _fullpath([SA_Pre(Null=SA_Maybe,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _FullPath, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Path, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes);





#line 715 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

 __declspec(dllimport) errno_t __cdecl _ecvt_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDights, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _ecvt_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Value, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign) { return _ecvt_s(_Dest, _Size, _Value, _NumOfDigits, _PtDec, _PtSign); } }
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ecvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char * __cdecl _ecvt([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign);
 __declspec(dllimport) errno_t __cdecl _fcvt_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _fcvt_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Value, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign) { return _fcvt_s(_Dest, _Size, _Value, _NumOfDigits, _PtDec, _PtSign); } }
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char * __cdecl _fcvt([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign);
__declspec(dllimport) errno_t __cdecl _gcvt_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _gcvt_s(char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Value, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits) { return _gcvt_s(_Dest, _Size, _Value, _NumOfDigits); } }
__declspec(dllimport) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_gcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) char * __cdecl _gcvt([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _atodbl([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _CRT_DOUBLE * _Result, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _atoldbl([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _LDOUBLE * _Result, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _atoflt([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _CRT_FLOAT * _Result, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _atodbl_l([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _CRT_DOUBLE * _Result, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _atoldbl_l([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _LDOUBLE * _Result, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _atoflt_l([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _CRT_FLOAT * _Result, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _Str, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned long __cdecl _lrotl([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Shift);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned long __cdecl _lrotr([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Shift);
 __declspec(dllimport) errno_t   __cdecl _makepath_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _PathResult, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Drive, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Dir, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Ext);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _makepath_s(char (&_Path)[_Size], [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Drive, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Dir, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Ext) { return _makepath_s(_Path, _Size, _Drive, _Dir, _Filename, _Ext); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_makepath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void __cdecl _makepath([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Path, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Drive, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Dir, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Ext);












#line 751 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"












#line 764 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
        _onexit_t __cdecl _onexit([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _onexit_t _Func);
#line 766 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"
        





#pragma warning (push)
#pragma warning (disable:6540) 
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int    __cdecl _putenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _EnvString);
 __declspec(dllimport) errno_t __cdecl _putenv_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Name, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Value);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned int __cdecl _rotl([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Shift);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned __int64 __cdecl _rotl64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Shift);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned int __cdecl _rotr([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Shift);
        [returnvalue:SA_Post(MustCheck=SA_Yes)] unsigned __int64 __cdecl _rotr64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned __int64 _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Shift);
#pragma warning (pop)

__declspec(dllimport) errno_t __cdecl _searchenv_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _EnvVar, [SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _ResultPath, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _searchenv_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _EnvVar, char (&_ResultPath)[_Size]) { return _searchenv_s(_Filename, _EnvVar, _ResultPath, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_searchenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void __cdecl _searchenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _EnvVar, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_ResultPath);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_splitpath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void   __cdecl _splitpath([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _FullPath, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Drive, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dir, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Filename, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Ext);
 __declspec(dllimport) errno_t  __cdecl _splitpath_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _FullPath, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_DriveSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Drive, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DriveSize, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_DirSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dir, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DirSize, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_FilenameSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _FilenameSize, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_ExtSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Ext, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _ExtSize);
extern "C++" { template <size_t _DriveSize, size_t _DirSize, size_t _NameSize, size_t _ExtSize> inline errno_t __cdecl _splitpath_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const char *_Dest, char (&_Drive)[_DriveSize], char (&_Dir)[_DirSize], char (&_Name)[_NameSize], char (&_Ext)[_ExtSize]) { return _splitpath_s(_Dest, _Drive, _DriveSize, _Dir, _DirSize, _Name, _NameSize, _Ext, _ExtSize); } }

__declspec(dllimport) void   __cdecl _swab([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Post(ValidElements="_SizeInBytes")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf1, [SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Post(ValidElements="_SizeInBytes")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf2, int _SizeInBytes);



/* wide function prototypes, also declared in wchar.h  */




#line 804 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wfullpath([SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _FullPath, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Path, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);



#line 810 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

 __declspec(dllimport) errno_t __cdecl _wmakepath_s([SA_Pre(Null=SA_No,WritableElements="_SIZE")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _PathResult, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SIZE, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Drive, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Dir, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Ext);        
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wmakepath_s(wchar_t (&_ResultPath)[_Size], [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Drive, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Dir, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Ext) { return _wmakepath_s(_ResultPath, _Size, _Drive, _Dir, _Filename, _Ext); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wmakepath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void __cdecl _wmakepath([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_ResultPath, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Drive, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Dir, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Ext);




[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int    __cdecl _wputenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _EnvString);
 __declspec(dllimport) errno_t __cdecl _wputenv_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Name, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Value);
__declspec(dllimport) errno_t __cdecl _wsearchenv_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _EnvVar, [SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _ResultPath, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wsearchenv_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _EnvVar, wchar_t (&_ResultPath)[_Size]) { return _wsearchenv_s(_Filename, _EnvVar, _ResultPath, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsearchenv_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void __cdecl _wsearchenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _EnvVar, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_ResultPath);
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsplitpath_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) void   __cdecl _wsplitpath([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _FullPath, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Drive, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dir, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Filename, [SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Ext);
__declspec(dllimport) errno_t __cdecl _wsplitpath_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _FullPath, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_DriveSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Drive, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DriveSize, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_DirSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dir, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _DirSize, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_FilenameSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _FilenameSize, 
		[SA_Pre(Null=SA_Maybe,WritableElements="_ExtSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Ext, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _ExtSize);
extern "C++" { template <size_t _DriveSize, size_t _DirSize, size_t _NameSize, size_t _ExtSize> inline errno_t __cdecl _wsplitpath_s([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const wchar_t *_Path, wchar_t (&_Drive)[_DriveSize], wchar_t (&_Dir)[_DirSize], wchar_t (&_Name)[_NameSize], wchar_t (&_Ext)[_ExtSize]) { return _wsplitpath_s(_Path, _Drive, _DriveSize, _Dir, _DirSize, _Name, _NameSize, _Ext, _ExtSize); } }


#line 834 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

/* The Win32 API SetErrorMode, Beep and Sleep should be used instead. */
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "SetErrorMode" " instead. See online help for details.")) __declspec(dllimport) void __cdecl _seterrormode([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "Beep" " instead. See online help for details.")) __declspec(dllimport) void __cdecl _beep([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned _Frequency, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned _Duration);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "Sleep" " instead. See online help for details.")) __declspec(dllimport) void __cdecl _sleep([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Duration);

#line 841 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"





/* Non-ANSI names for compatibility */










#pragma warning(push)
#pragma warning(disable: 4141)  
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_ecvt" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ecvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl ecvt([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_fcvt" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) char * __cdecl fcvt([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtDec, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _PtSign);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_gcvt" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fcvt_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))		__declspec(dllimport) char * __cdecl gcvt([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] double _Val, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NumOfDigits, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_itoa" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_itoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))		__declspec(dllimport) char * __cdecl itoa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_ltoa" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ltoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))		__declspec(dllimport) char * __cdecl ltoa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_putenv" ". See online help for details.")) __declspec(dllimport) int    __cdecl putenv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _EnvString);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_swab" ". See online help for details."))										__declspec(dllimport) void   __cdecl swab([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf1,[SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Buf2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInBytes);
__declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C++ conformant name: " "_ultoa" ". See online help for details.")) __declspec(deprecated("This function or variable may be unsafe. Consider using " "_ultoa_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details."))	__declspec(dllimport) char * __cdecl ultoa([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _Val, [SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dstbuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Radix);
#pragma warning(pop)
_onexit_t __cdecl onexit([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _onexit_t _Func);

#line 871 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

#line 873 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


}

#line 878 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"


#pragma pack(pop)
#line 882 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

#line 884 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdlib.h"

#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdlib"
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdlib"


 

namespace std {

using ::size_t; using ::div_t; using ::ldiv_t;

using ::abort; using ::abs; using ::atexit;
using ::atof; using ::atoi; using ::atol;
using ::bsearch; using ::calloc; using ::div;
using ::exit; using ::free; using ::getenv;
using ::labs; using ::ldiv; using ::malloc;
using ::mblen; using ::mbstowcs; using ::mbtowc;
using ::qsort; using ::rand; using ::realloc;
using ::srand; using ::strtod; using ::strtol;
using ::strtoul; using ::system;
using ::wcstombs; using ::wctomb;


}
 #line 37 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdlib"
#line 38 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdlib"

#line 40 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstdlib"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 9 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"
// streambuf standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"
// xiosbase internal header (from <ios>)
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
// xlocale internal header (from <locale>)
#pragma once




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstring"
// cstring standard header
#pragma once










 
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstring"

 
  
namespace std {
using ::size_t; using ::memchr; using ::memcmp;

using ::memcpy; using ::memmove; using ::memset;
using ::strcat; using ::strchr; using ::strcmp;
using ::strcoll; using ::strcpy; using ::strcspn;
using ::strerror; using ::strlen; using ::strncat;
using ::strncmp; using ::strncpy; using ::strpbrk;
using ::strrchr; using ::strspn; using ::strstr;
using ::strtok; using ::strxfrm;

}
  #line 31 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstring"
 #line 32 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstring"

#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstring"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 8 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"
// stdexcept standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"
// exception standard header for Microsoft
#pragma once




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"
// xstddef standard header
#pragma once







#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstddef"
// cstddef standard header
#pragma once










 #line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"
/***
*stddef.h - definitions/declarations for common constants, types, variables
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file contains definitions and declarations for some commonly
*       used constants, types, and variables.
*       [ANSI]
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"




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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"


extern "C" {
#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"

/* Define NULL pointer value */









/* Declare reference to errno */









/* Define offsetof macro */






#line 56 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"









#line 66 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"


__declspec(dllimport) extern unsigned long  __cdecl __threadid(void);

__declspec(dllimport) extern uintptr_t __cdecl __threadhandle(void);
#line 72 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"



}
#line 77 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"

#line 79 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stddef.h"
#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstddef"


 
namespace std {
using ::ptrdiff_t; using ::size_t;
}
 #line 21 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstddef"
#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstddef"

#line 24 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstddef"
#line 25 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cstddef"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 11 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"

namespace std {

		// EXCEPTION MACROS
 

 
 
 
 
 

 
 

 



 
 

 
 

 

















#line 60 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"

 

		// BITMASK MACROS
 

 

		// MISCELLANEOUS MACROS




 
 

 
 



#line 82 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"
  
 #line 84 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"

 
  
  
  
 #line 90 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"

		// TYPE DEFINITIONS
enum _Uninitialized
	{	// tag for suppressing initialization
	_Noinit};

 
  

struct _Bool_struct
	{	// define member just for its address
	int _Member;
	};

typedef int _Bool_struct::* _Bool_type;
 #line 106 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"
}

 #pragma warning(pop)
 #pragma pack(pop)
#line 111 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"

#line 113 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"
#line 114 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstddef"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 8 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 13 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"










namespace std {

  


  



  



}

 

 #line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"
/***
*eh.h - User include file for exception handling.
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       User include file for exception handling.
*
*       [Public]
*
****/


#pragma once
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"

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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"





/* Currently, all MS C compilers for Win32 platforms default to 8 byte 
 * alignment.
 */
#pragma pack(push,8)
#line 28 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"





/* terminate_handler is the standard name; terminate_function is supported for historical reasons */

typedef void (__cdecl *terminate_function)();
typedef void (__cdecl *terminate_handler)();
typedef void (__cdecl *unexpected_function)();
typedef void (__cdecl *unexpected_handler)();





#line 45 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"








struct _EXCEPTION_POINTERS;

typedef void (__cdecl *_se_translator_function)(unsigned int, struct _EXCEPTION_POINTERS*);
#line 57 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"

__declspec(dllimport) __declspec(noreturn) void __cdecl terminate(void);
__declspec(dllimport) void __cdecl unexpected(void);

__declspec(dllimport) int __cdecl _is_exception_typeof([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const type_info &_Type, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] struct _EXCEPTION_POINTERS * _ExceptionPtr);


/* only __clrcall versions provided by the MRT exist in pure */
__declspec(dllimport) terminate_function __cdecl set_terminate([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] terminate_function _NewPtFunc);
extern "C" __declspec(dllimport) terminate_function __cdecl _get_terminate(void);
__declspec(dllimport) unexpected_function __cdecl set_unexpected([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] unexpected_function _NewPtFunc);
extern "C" __declspec(dllimport) unexpected_function __cdecl _get_unexpected(void);
#line 70 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"


/* set_se_translator cannot be a managed implementation, and so cannot be called from _M_CEE_PURE code */
__declspec(dllimport) _se_translator_function __cdecl _set_se_translator([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _se_translator_function _NewPtFunc);
#line 75 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"
__declspec(dllimport) bool __cdecl __uncaught_exception();

/*
 * These overload helps in resolving NULL
 */











#pragma pack(pop)
#line 93 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"
#line 94 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"
#line 95 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\eh.h"
#line 41 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"
 #line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"
/***
*malloc.h - declarations and definitions for memory allocation functions
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       Contains the function declarations for memory allocation functions;
*       also defines manifest constants and types used by the heap routines.
*       [System V]
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"




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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"


/*
 * Currently, all MS C compilers for Win32 platforms default to 8 byte
 * alignment.
 */
#pragma pack(push,8)
#line 31 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"


extern "C" {
#line 35 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

/* Maximum heap request the heap manager will attempt */





#line 43 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

/* _STATIC_ASSERT is for enforcing boolean/integral conditions at compile time. */



#line 49 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

/* Constants for _heapchk/_heapset/_heapwalk routines */











typedef struct _heapinfo {
        int * _pentry;
        size_t _size;
        int _useflag;
        } _HEAPINFO;

#line 69 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

/* External variable declarations */


extern __declspec(deprecated("This function or variable may be unsafe. Consider using " "_get_amblksiz" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) unsigned int _amblksiz;



#line 78 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"




/* Function prototypes */






























#line 114 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

































#line 148 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

__declspec(dllimport) int     __cdecl _resetstkoflw (void);



__declspec(dllimport) unsigned long __cdecl _set_malloc_crt_max_wait([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned long _NewValue);








#line 163 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) void *  __cdecl _expand([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t  __cdecl _msize([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void * _Memory);




#line 171 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] void *          __cdecl _alloca([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) size_t  __cdecl _get_sbh_threshold(void);
__declspec(dllimport) int     __cdecl _set_sbh_threshold([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewValue);
__declspec(dllimport) errno_t __cdecl _set_amblksiz([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Value);
__declspec(dllimport) errno_t __cdecl _get_amblksiz([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _Value);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _heapadd([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void * _Memory, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _heapchk(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int     __cdecl _heapmin(void);
__declspec(dllimport) int     __cdecl _heapset([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Fill);
__declspec(dllimport)  int     __cdecl _heapwalk([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] _HEAPINFO * _EntryInfo);
__declspec(dllimport) size_t  __cdecl _heapused(size_t * _Used, size_t * _Commit);

__declspec(dllimport) intptr_t __cdecl _get_heap_handle(void);











#line 197 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

typedef char __static_assert_t[ (sizeof(unsigned int) <= 8) ];


#pragma warning(push)
#pragma warning(disable:6540)
__inline void *_MarkAllocaS([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)]  void *_Ptr, unsigned int _Marker)
{
    if (_Ptr)
    {
        *((unsigned int*)_Ptr) = _Marker;
        _Ptr = (char*)_Ptr + 8;
    }
    return _Ptr;
}
#pragma warning(pop)
#line 214 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"







#line 222 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"







#line 230 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"





/* _freea must be in the header so that its allocator matches _malloca */


__declspec(noalias) __inline void __cdecl _freea([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Memory)
{
    unsigned int _Marker;
    if (_Memory)
    {
        _Memory = (char*)_Memory - 8;
        _Marker = *(unsigned int *)_Memory;
        if (_Marker == 0xDDDD)
        {
            free(_Memory);
        }





#line 255 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"
    }
}
#line 258 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"
#line 259 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"


/* Non-ANSI names for compatibility */

#line 264 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

#line 266 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"






















}
#line 290 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"


#pragma pack(pop)
#line 294 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"

#line 296 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\malloc.h"
#line 42 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

 

#line 46 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

 


































typedef const char *__exString;
extern "C" [returnvalue:SA_Post(MustCheck=SA_Yes)] size_t __cdecl strlen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char *);

extern "C" __declspec(dllimport) errno_t __cdecl strcpy_s([SA_Pre(Null=SA_No,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Src);




#line 91 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

 namespace std {

class __declspec(dllimport) exception
	{	// base of all library exceptions
public:


































































































     exception();
     exception(const char *const&);
     exception(const char *const&, int);
     exception(const exception&);
    exception&  operator=(const exception&);
    virtual  ~exception();
    virtual const char *  what() const;
#line 203 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"
private:
	const char *_m_what;
	int _m_doFree;
	};

using ::set_terminate; using ::terminate_handler; using ::terminate; using ::set_unexpected; using ::unexpected_handler; using ::unexpected;

typedef void (__cdecl *_Prhand)(const exception&);




#line 216 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"
__declspec(dllimport) bool __cdecl uncaught_exception();
#line 218 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

}

 












































































































#line 331 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"


namespace std {


#line 337 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

		// CLASS bad_exception
class bad_exception : public exception
	{	// base of all bad exceptions
public:
	 bad_exception(const char *_Message = "bad exception")
		throw ()
		: exception(_Message)
		{	// construct from message string
		}

	virtual  ~bad_exception() throw ()
		{	// destroy the object
		}

 





#line 359 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

	};


static const char * _bad_alloc_Message = "bad allocation";

		// CLASS bad_alloc
class bad_alloc : public exception
	{	// base of all bad allocation exceptions
public:
	 bad_alloc(const char *_Message) throw ()
		: exception(_Message)
		{	// construct from message string
		}

	 bad_alloc() throw ()
		: exception(_bad_alloc_Message, 1)
		{	// construct from message string with no memory allocation
		}

	virtual  ~bad_alloc() throw ()
		{	// destroy the object
		}

 





#line 390 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

	};


}









#line 405 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"








 #pragma warning(pop)
 #pragma pack(pop)
#line 416 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

#line 418 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"
#line 419 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\exception"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
// xstring internal header (from <string>)
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"
// xmemory internal header (from <memory>)
#pragma once





#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"
// new standard header for Microsoft
#pragma once






 #pragma pack(push,8)
 #pragma warning(push,3)
 
#line 13 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

  








#line 24 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

namespace std {

		// SUPPORT TYPES
 
// handler for operator new failures



typedef void (__cdecl * new_handler) ();
#line 35 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"
 #line 36 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

 
struct nothrow_t
	{	// placement new tag type to suppress exceptions
	};

extern const nothrow_t nothrow;	// constant for placement new tag
 #line 44 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

		// FUNCTION AND OBJECT DECLARATIONS
__declspec(dllimport) new_handler __cdecl set_new_handler([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] new_handler)
	throw ();	// establish alternate new handler
}

		// new AND delete DECLARATIONS (NB: NOT IN std)
void __cdecl operator delete(void *) throw ();
#pragma warning (suppress: 4985)
[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] void *__cdecl operator new(size_t _Size) throw (...);

 
  
inline void *__cdecl operator new(size_t, void *_Where) throw ()
	{	// construct array with placement at _Where
	return (_Where);
	}

inline void __cdecl operator delete(void *, void *) throw ()
	{	// delete if placement new fails
	}
 #line 66 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

 
  
inline void *__cdecl operator new[](size_t, void *_Where) throw ()
	{	// construct array with placement at _Where
	return (_Where);
	}

inline void __cdecl operator delete[](void *, void *) throw ()
	{	// delete if placement array new fails
	}
 #line 78 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

void __cdecl operator delete[](void *) throw ();	// delete allocated array

[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] void *__cdecl operator new[](size_t _Size)
	throw (...);	// allocate array or throw exception

 
  
[returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] void *__cdecl operator new(size_t _Size, const std::nothrow_t&)
	throw ();

[returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] void *__cdecl operator new[](size_t _Size, const std::nothrow_t&)
	throw ();	// allocate array or return null pointer

void __cdecl operator delete(void *, const std::nothrow_t&)
	throw ();	// delete if nothrow new fails -- REPLACEABLE

void __cdecl operator delete[](void *, const std::nothrow_t&)
	throw ();	// delete if nothrow array new fails -- REPLACEABLE
 #line 98 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"


 
using std::new_handler;
 #line 103 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"


 
 #pragma warning(pop)
 #pragma pack(pop)
#line 109 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

#line 111 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"
#line 112 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\new"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 9 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
// xutility internal header
#pragma once




#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"
// utility standard header
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"
// iosfwd standard header
#pragma once





#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cwchar"
// cwchar standard header
#pragma once










 #line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
/***
*wchar.h - declarations for wide character functions
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file contains the types, macros and function declarations for
*       all wide character-related functions.  They may also be declared in
*       individual header files on a functional basis.
*       [ISO]
*
*       Note: keep in sync with ctype.h, stdio.h, stdlib.h, string.h, time.h.
*
*       [Public]
*
****/


#pragma once
#line 21 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"





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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


#pragma pack(push,8)
#line 31 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


extern "C" {
#line 35 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

/*
 *  According to the standard, WCHAR_MIN and WCHAR_MAX need to be
 *  "constant expressions suitable for use in #if preprocessing directives, 
 *  and this expression shall have the same type as would an expression that 
 *  is an object of the corresponding type converted according to the integer
 *  promotions".
 */































/* Declare _iob[] array */













typedef unsigned long _fsize_t; /* Could be 64 bits for Win32 */

#line 91 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



struct _wfinddata32_t {
        unsigned    attrib;
        __time32_t  time_create;    /* -1 for FAT file systems */
        __time32_t  time_access;    /* -1 for FAT file systems */
        __time32_t  time_write;
        _fsize_t    size;
        wchar_t     name[260];
};

struct _wfinddata32i64_t {
        unsigned    attrib;
        __time32_t  time_create;    /* -1 for FAT file systems */
        __time32_t  time_access;    /* -1 for FAT file systems */
        __time32_t  time_write;
        __int64     size;
        wchar_t     name[260];
};

struct _wfinddata64i32_t {
        unsigned    attrib;
        __time64_t  time_create;    /* -1 for FAT file systems */
        __time64_t  time_access;    /* -1 for FAT file systems */
        __time64_t  time_write;
        _fsize_t    size;
        wchar_t     name[260];
};

struct _wfinddata64_t {
        unsigned    attrib;
        __time64_t  time_create;    /* -1 for FAT file systems */
        __time64_t  time_access;    /* -1 for FAT file systems */
        __time64_t  time_write;
        __int64     size;
        wchar_t     name[260];
};



















#line 149 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


#line 152 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


/* define NULL pointer value */

















/* For backwards compatibility */









#line 183 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 185 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 186 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

__declspec(dllimport) const unsigned short * __cdecl __pctype_func(void);

__declspec(dllimport) extern const unsigned short *_pctype;


#line 193 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 194 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 195 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"





__declspec(dllimport) extern const unsigned short _wctype[];
#line 202 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

__declspec(dllimport) const wctype_t * __cdecl __pwctype_func(void);

__declspec(dllimport) extern const wctype_t *_pwctype;


#line 209 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 210 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 211 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

/* set bit masks for the possible character types */





                                /* vertical tab or form feed */









/* Function prototypes */



/* Character classification function prototypes */
/* also declared in ctype.h */

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


#line 277 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



/* also declared in direct.h */








#line 290 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wgetcwd([SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wgetdcwd([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Drive, [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords);
[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * __cdecl _wgetdcwd_nolock([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Drive, [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t * _DstBuf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords);





#line 300 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wchdir([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Path);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wmkdir([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Path);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wrmdir([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Path);


#line 307 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _waccess([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _AccessMode);
 __declspec(dllimport) errno_t __cdecl _waccess_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _AccessMode);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wchmod([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _wcreat([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _PermissionMode);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) intptr_t __cdecl _wfindfirst32([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata32_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wfindnext32([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] intptr_t _FindHandle, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata32_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wunlink([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wrename([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _OldFilename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _NewFilename);
__declspec(dllimport) errno_t __cdecl _wmktemp_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _TemplateName, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wmktemp_s(wchar_t (&_TemplateName)[_Size]) { return _wmktemp_s(_TemplateName, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wmktemp_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wmktemp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_TemplateName);

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) intptr_t __cdecl _wfindfirst32i64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata32i64_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) intptr_t __cdecl _wfindfirst64i32([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata64i32_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) intptr_t __cdecl _wfindfirst64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata64_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wfindnext32i64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] intptr_t _FindHandle, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata32i64_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wfindnext64i32([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] intptr_t _FindHandle, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata64i32_t * _FindData);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _wfindnext64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] intptr_t _FindHandle, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _wfinddata64_t * _FindData);

 __declspec(dllimport) errno_t __cdecl _wsopen_s([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _FileHandle, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _OpenFlag, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ShareFlag, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _PermissionFlag);






#line 337 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

/* these function do not validate pmode; use _sopen_s */
extern "C++" __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _wopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _OpenFlag, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _PermissionMode = 0);
extern "C++" __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wsopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _wsopen([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _OpenFlag, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ShareFlag, int _PermissionMode = 0);

#line 343 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


#line 346 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



/* wide function prototypes, also declared in wchar.h  */

 __declspec(dllimport) wchar_t * __cdecl _wsetlocale([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Category, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Locale);


#line 355 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



/* also declared in process.h */

__declspec(dllimport) intptr_t __cdecl _wexecl([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexecle([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexeclp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexeclpe([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wexecv([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wexecve([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _Env);
__declspec(dllimport) intptr_t __cdecl _wexecvp([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wexecvpe([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList, 
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _Env);
__declspec(dllimport) intptr_t __cdecl _wspawnl([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnle([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnlp([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnlpe([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ArgList, ...);
__declspec(dllimport) intptr_t __cdecl _wspawnv([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wspawnve([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _Env);
__declspec(dllimport) intptr_t __cdecl _wspawnvp([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList);
__declspec(dllimport) intptr_t __cdecl _wspawnvpe([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _ArgList,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * const * _Env);






#line 387 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


































#line 422 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


























#line 449 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 451 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"




/* define structure for returning status information */


typedef unsigned short _ino_t;      /* i-node number (not used on DOS) */

/* Non-ANSI name for compatibility */
typedef unsigned short ino_t;
#line 463 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 465 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


typedef unsigned int _dev_t;        /* device code */

/* Non-ANSI name for compatibility */
typedef unsigned int dev_t;
#line 472 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 474 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


typedef long _off_t;                /* file offset value */

/* Non-ANSI name for compatibility */
typedef long off_t;
#line 481 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 483 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



struct _stat32 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        _off_t     st_size;
        __time32_t st_atime;
        __time32_t st_mtime;
        __time32_t st_ctime;
        };


/* Non-ANSI names for compatibility */
struct stat {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        _off_t     st_size;
        time_t st_atime;
        time_t st_mtime;
        time_t st_ctime;
        };

#line 517 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

struct _stat32i64 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        __int64    st_size;
        __time32_t st_atime;
        __time32_t st_mtime;
        __time32_t st_ctime;
        };

struct _stat64i32 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        _off_t     st_size;
        __time64_t st_atime;
        __time64_t st_mtime;
        __time64_t st_ctime;
        };

struct _stat64 {
        _dev_t     st_dev;
        _ino_t     st_ino;
        unsigned short st_mode;
        short      st_nlink;
        short      st_uid;
        short      st_gid;
        _dev_t     st_rdev;
        __int64    st_size;
        __time64_t st_atime;
        __time64_t st_mtime;
        __time64_t st_ctime;
        };

/*
 * We have to have same name for structure and the fuction so as to do the
 * macro magic.we need the structure name and function name the same.
 */


















#line 583 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



#line 587 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



/* also declared in wchar.h */

__declspec(dllimport) int __cdecl _wstat32([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Name, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _stat32 * _Stat);

__declspec(dllimport) int __cdecl _wstat32i64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Name, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _stat32i64 * _Stat);
__declspec(dllimport) int __cdecl _wstat64i32([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Name, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _stat64i32 * _Stat);
__declspec(dllimport) int __cdecl _wstat64([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Name, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] struct _stat64 * _Stat);


#line 600 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 602 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"




/* wide function prototypes, also declared in conio.h */





 __declspec(dllimport) errno_t __cdecl _cgetws_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="*_SizeRead")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buffer, size_t _SizeInWords, [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _SizeRead);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _cgetws_s([SA_Post(Deref=1,Null=SA_No,ValidElements="*_Buffer")] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size], size_t * _Size) { return _cgetws_s(_Buffer, _Size, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_cgetws_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _cgetws([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Buffer);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl _getwch(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl _getwche(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl _putwch(wchar_t _WCh);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) wint_t __cdecl _ungetwch(wint_t _WCh);
 __declspec(dllimport) int __cdecl _cputws([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _String);
 __declspec(dllimport) int __cdecl _cwprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _cwprintf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_cwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _cwscanf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, ...);
 __declspec(deprecated("This function or variable may be unsafe. Consider using " "_cwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) int __cdecl _cwscanf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _cwscanf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _cwscanf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="scanf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
 __declspec(dllimport) int __cdecl _vcwprintf([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t *_Format, va_list _ArgList);
 __declspec(dllimport) int __cdecl _vcwprintf_s([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t *_Format, va_list _ArgList);

 __declspec(dllimport) int __cdecl _cwprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, ...);
 __declspec(dllimport) int __cdecl _vcwprintf_p([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t*  _Format, va_list _ArgList);

__declspec(dllimport) int __cdecl _cwprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
__declspec(dllimport) int __cdecl _cwprintf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
__declspec(dllimport) int __cdecl _vcwprintf_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t *_Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
__declspec(dllimport) int __cdecl _vcwprintf_s_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);
__declspec(dllimport) int __cdecl _cwprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, ...);
__declspec(dllimport) int __cdecl _vcwprintf_p_l([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale, va_list _ArgList);

 wint_t __cdecl _putwch_nolock(wchar_t _WCh);
[returnvalue:SA_Post(MustCheck=SA_Yes)] wint_t __cdecl _getwch_nolock(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] wint_t __cdecl _getwche_nolock(void);
 wint_t __cdecl _ungetwch_nolock(wint_t _WCh);






#line 650 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


#line 653 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"






























































































































































































































































































































#line 972 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"






















































































































































struct tm {
        int tm_sec;     /* seconds after the minute - [0,59] */
        int tm_min;     /* minutes after the hour - [0,59] */
        int tm_hour;    /* hours since midnight - [0,23] */
        int tm_mday;    /* day of the month - [1,31] */
        int tm_mon;     /* months since January - [0,11] */
        int tm_year;    /* years since 1900 */
        int tm_wday;    /* days since Sunday - [0,6] */
        int tm_yday;    /* days since January 1 - [0,365] */
        int tm_isdst;   /* daylight savings time flag */
        };

#line 1135 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"



/* wide function prototypes, also declared in time.h */
 
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wasctime_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wasctime([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const struct tm * _Tm);
__declspec(dllimport) errno_t __cdecl _wasctime_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElementsConst=26)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const struct tm * _Tm);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wasctime_s([SA_Post(Deref=1,Null=SA_No,ValidElementsConst=26)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const struct tm * _Time) { return _wasctime_s(_Buffer, _Size, _Time); } }

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wctime32_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wctime32([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const __time32_t *_Time);
__declspec(dllimport) errno_t __cdecl _wctime32_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElementsConst=26)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t* _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const __time32_t * _Time);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wctime32_s([SA_Post(Deref=1,Null=SA_No,ValidElementsConst=26)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const __time32_t * _Time) { return _wctime32_s(_Buffer, _Size, _Time); } }

__declspec(dllimport) size_t __cdecl wcsftime([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t * _Format,  [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const struct tm * _Tm);
__declspec(dllimport) size_t __cdecl _wcsftime_l([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_FormatString(Style="printf")] const wchar_t *_Format, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const struct tm *_Tm, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

__declspec(dllimport) errno_t __cdecl _wstrdate_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElementsConst=9)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wstrdate_s([SA_Post(Deref=1,Null=SA_No,ValidElementsConst=9)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size]) { return _wstrdate_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wstrdate_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wstrdate([SA_Pre(Null=SA_No,WritableElementsConst=9)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Buffer);

__declspec(dllimport) errno_t __cdecl _wstrtime_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElementsConst=9)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wstrtime_s([SA_Post(Deref=1,Null=SA_No,ValidElementsConst=9)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size]) { return _wstrtime_s(_Buffer, _Size); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wstrtime_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wstrtime([SA_Pre(Null=SA_No,WritableElementsConst=9)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Buffer);

__declspec(deprecated("This function or variable may be unsafe. Consider using " "_wctime64_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) wchar_t * __cdecl _wctime64([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const __time64_t * _Time);
__declspec(dllimport) errno_t __cdecl _wctime64_s([SA_Pre(Null=SA_No,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElementsConst=26)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t* _Buf, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const __time64_t *_Time);
extern "C++" { template <size_t _Size> inline errno_t __cdecl _wctime64_s([SA_Post(Deref=1,Null=SA_No,ValidElementsConst=26)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Buffer)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const __time64_t * _Time) { return _wctime64_s(_Buffer, _Size, _Time); } }


#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wtime.inl"
/***
*wtime.inl - inline definitions for wctime()
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file contains the definition of wctime().
*
*       [Public]
*
****/


#pragma once
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wtime.inl"







#line 24 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wtime.inl"





#pragma warning(push)
#pragma warning(disable:4996)















static __inline wchar_t * __cdecl _wctime(const time_t * _Time)
{
#pragma warning( push )
#pragma warning( disable : 4996 )
    return _wctime64(_Time);
#pragma warning( pop )
}

static __inline errno_t __cdecl _wctime_s(wchar_t *_Buffer, size_t _SizeInWords, const time_t * _Time)
{
    return _wctime64_s(_Buffer, _SizeInWords, _Time);
}
#line 59 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wtime.inl"

#pragma warning(pop)

#line 63 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wtime.inl"
#line 64 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wtime.inl"
#line 1165 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 1166 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


#line 1169 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


typedef int mbstate_t;
typedef wchar_t _Wint_t;

__declspec(dllimport) wint_t __cdecl btowc(int);
__declspec(dllimport) size_t __cdecl mbrlen([SA_Pre(Null=SA_Maybe,ValidBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes,
                              [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
__declspec(dllimport) size_t __cdecl mbrtowc([SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstCh, [SA_Pre(Null=SA_Maybe,ValidBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] const char * _SrcCh,
                               [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
__declspec(dllimport) errno_t __cdecl mbsrtowcs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t* _Retval, [SA_Pre(Null=SA_Maybe,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_Maybe)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] const char ** _PSrc, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
extern "C++" { template <size_t _Size> inline errno_t __cdecl mbsrtowcs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _Retval, [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_Maybe)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] const char ** _PSource, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State) { return mbsrtowcs_s(_Retval, _Dest, _Size, _PSource, _Count, _State); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "mbsrtowcs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl mbsrtowcs([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_Maybe)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] const char ** _PSrc, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] mbstate_t * _State);

__declspec(dllimport) errno_t __cdecl wcrtomb_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _Retval, [SA_Pre(Null=SA_Maybe,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Ch, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcrtomb_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _Retval, [SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Source, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State) { return wcrtomb_s(_Retval, _Dest, _Size, _Source, _State); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcrtomb_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl wcrtomb([SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _Source, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
__declspec(dllimport) errno_t __cdecl wcsrtombs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _Retval, [SA_Pre(Null=SA_Maybe,WritableBytes="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="*_Retval")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _Dst,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] const wchar_t ** _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
extern "C++" { template <size_t _Size> inline errno_t __cdecl wcsrtombs_s([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _Retval, [SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char (&_Dest)[_Size], [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] const wchar_t ** _PSrc, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State) { return wcsrtombs_s(_Retval, _Dest, _Size, _PSrc, _Count, _State); } }
__declspec(deprecated("This function or variable may be unsafe. Consider using " "wcsrtombs_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.")) __declspec(dllimport) size_t __cdecl wcsrtombs([SA_Pre(Null=SA_Maybe)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=2,Valid=SA_Yes)] [SA_Post(Deref=1,Null=SA_No,NullTerminated=SA_Yes)] [SA_Post(Deref=2,Valid=SA_Yes)] const wchar_t ** _PSource, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] mbstate_t * _State);
__declspec(dllimport) int __cdecl wctob([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wint_t _WCh);



/* memcpy and memmove are defined just for use in wmemcpy and wmemmove */


#line 1199 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
__declspec(dllimport)  void *  __cdecl memmove([SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_Size")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);
#line 1201 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
 void *  __cdecl memcpy([SA_Pre(Null=SA_Maybe,WritableBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_Size")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_Maybe,ValidBytes="_Size")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size);

__declspec(dllimport) errno_t __cdecl memcpy_s([SA_Pre(Null=SA_Maybe,WritableBytes="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_MaxCount")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _DstSize, [SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
__declspec(dllimport) errno_t __cdecl memmove_s([SA_Pre(Null=SA_Maybe,WritableBytes="_DstSize")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidBytes="_MaxCount")] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Dst, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _DstSize, [SA_Pre(Null=SA_Maybe,ValidBytes="_MaxCount")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Src, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _MaxCount);
#line 1206 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
__inline int __cdecl fwide([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] FILE * _F, int _M)
        {(void)_F; return (_M); }
__inline int __cdecl mbsinit([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const mbstate_t *_P)
        {return (_P == 0 || *_P == 0); }
__inline const wchar_t * __cdecl wmemchr([SA_Pre(Null=SA_No,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
        {for (; 0 < _N; ++_S, --_N)
                if (*_S == _C)
                        return (const wchar_t *)(_S);
        return (0); }
__inline int __cdecl wmemcmp([SA_Pre(Null=SA_No,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S1, [SA_Pre(Null=SA_No,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
        {for (; 0 < _N; ++_S1, ++_S2, --_N)
                if (*_S1 != *_S2)
                        return (*_S1 < *_S2 ? -1 : +1);
        return (0); }

__inline  wchar_t * __cdecl wmemcpy([SA_Pre(Null=SA_Maybe,WritableElements="_N")] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t *_S1, [SA_Pre(Null=SA_Maybe,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 4996 6386 )
            return (wchar_t *)memcpy(_S1, _S2, _N*sizeof(wchar_t));
#pragma warning( pop )
        }


__inline errno_t __cdecl wmemcpy_s([SA_Pre(Null=SA_Maybe,WritableElements="_N1")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_N")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_S1, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _N1, [SA_Pre(Null=SA_Maybe,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S2, rsize_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 6386 )
            return memcpy_s(_S1, _N1*sizeof(wchar_t), _S2, _N*sizeof(wchar_t));
        }
#pragma warning( pop )
#line 1238 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

__inline  wchar_t * __cdecl wmemmove([SA_Pre(Null=SA_Maybe,WritableElements="_N")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_N")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_S1, [SA_Pre(Null=SA_Maybe,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 4996 6386 )
#pragma warning( disable : 6387)
			/* prefast noise VSW 493303 */
            return (wchar_t *)memmove(_S1, _S2, _N*sizeof(wchar_t));
#pragma warning( pop )
        }


__inline errno_t __cdecl wmemmove_s([SA_Pre(Null=SA_Maybe,WritableElements="_N1")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_N")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_S1, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _N1, [SA_Pre(Null=SA_Maybe,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *_S2, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] rsize_t _N)
        {
#pragma warning( push )
#pragma warning( disable : 6386 )
            return memmove_s(_S1, _N1*sizeof(wchar_t), _S2, _N*sizeof(wchar_t));
#pragma warning( pop )
        }
#line 1258 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

__inline wchar_t * __cdecl wmemset([SA_Pre(Null=SA_No,WritableElements="_N")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_N")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_S, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
        {
            wchar_t *_Su = _S;
            for (; 0 < _N; ++_Su, --_N)
            {
                *_Su = _C;
            }
            return (_S);
        }


extern "C++" {
inline wchar_t * __cdecl wmemchr([SA_Pre(Null=SA_No,ValidElements="_N")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_S, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] wchar_t _C, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _N)
        { return (wchar_t *)wmemchr((const wchar_t *)_S, _C, _N); }
}
#line 1275 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"
#line 1276 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


}       /* end of extern "C" */
#line 1280 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"


#pragma pack(pop)
#line 1284 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 1286 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\wchar.h"

#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cwchar"
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cwchar"

typedef mbstate_t _Mbstatet;




typedef mbstate_t _Mbstatet;

 
namespace std {
using ::_Mbstatet;

using ::mbstate_t; using ::size_t;
using ::tm; using ::wint_t;


using ::btowc; using ::fgetwc; using ::fgetws; using ::fputwc;
using ::fputws; using ::fwide; using ::fwprintf;
using ::fwscanf; using ::getwc; using ::getwchar;
using ::mbrlen; using ::mbrtowc; using ::mbsrtowcs;
using ::mbsinit; using ::putwc; using ::putwchar;
using ::swprintf; using ::swscanf; using ::ungetwc;
using ::vfwprintf; using ::vswprintf; using ::vwprintf;
using ::wcrtomb; using ::wprintf; using ::wscanf;
using ::wcsrtombs; using ::wcstol; using ::wcscat;
using ::wcschr; using ::wcscmp; using ::wcscoll;
using ::wcscpy; using ::wcscspn; using ::wcslen;
using ::wcsncat; using ::wcsncmp; using ::wcsncpy;
using ::wcspbrk; using ::wcsrchr; using ::wcsspn;

using ::wcstod; using ::wcstoul; using ::wcsstr;

using ::wcstok; using ::wcsxfrm; using ::wctob;
using ::wmemchr; using ::wmemcmp; using ::wmemcpy;
using ::wmemmove; using ::wmemset; using ::wcsftime;


}
 #line 54 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cwchar"
#line 55 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cwchar"

#line 57 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\cwchar"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 9 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"
/***
*crtdbg.h - Supports debugging features of the C runtime library.
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       Support CRT debugging features.
*
*       [Public]
*
****/


#pragma once
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"





#pragma pack(push,8)
#line 25 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

/* Define NULL here since we depend on it and for back-compat
*/









extern "C" {
#line 39 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

 /****************************************************************************
 *
 * Debug Reporting
 *
 ***************************************************************************/

typedef void *_HFILE; /* file handle pointer */


















typedef int (__cdecl * _CRT_REPORT_HOOK)(int, char *, int *);
typedef int (__cdecl * _CRT_REPORT_HOOKW)(int, wchar_t *, int *);



#line 71 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"




#line 76 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"




 /****************************************************************************
 *
 * Heap
 *
 ***************************************************************************/

 /****************************************************************************
 *
 * Client-defined allocation hook
 *
 ***************************************************************************/






typedef int (__cdecl * _CRT_ALLOC_HOOK)(int, void *, size_t, int, long, const unsigned char *, int);


#line 101 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


#line 104 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

 /****************************************************************************
 *
 * Memory management
 *
 ***************************************************************************/

/*
 * Bit values for _crtDbgFlag flag:
 *
 * These bitflags control debug heap behavior.
 */








/*
 * Some bit values for _crtDbgFlag which correspond to frequencies for checking
 * the the heap.
 */



/*
We do not check the heap by default at this point because the cost was too high
for some applications. You can still turn this feature on manually.
*/








 /****************************************************************************
 *
 * Memory state
 *
 ***************************************************************************/

/* Memory block identification */








typedef void (__cdecl * _CRT_DUMP_CLIENT)(void *, size_t);


#line 162 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


#line 165 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

struct _CrtMemBlockHeader;
typedef struct _CrtMemState
{
        struct _CrtMemBlockHeader * pBlockHeader;
        size_t lCounts[5];
        size_t lSizes[5];
        size_t lHighWaterCount;
        size_t lTotalCount;
} _CrtMemState;


 /****************************************************************************
 *
 * Declarations, prototype and function-like macros
 *
 ***************************************************************************/

/* _STATIC_ASSERT is for enforcing boolean/integral conditions at compile time.
   Since it is purely a compile-time mechanism that generates no code, the check
   is left in even if _DEBUG is not defined. */


















































































































































 /****************************************************************************
 *
 * Debug ON
 * Debug ON
 * Debug ON
 *
 ***************************************************************************/


/* Define _MRTIMP */





/* Define _CRTIMP */









 /****************************************************************************
 *
 * Debug Reporting
 *
 ***************************************************************************/


__declspec(dllimport) extern long _crtAssertBusy;
#line 366 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


__declspec(dllimport) _CRT_REPORT_HOOK __cdecl _CrtGetReportHook(
    void
    );
#line 372 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

/* _CrtSetReportHook[[W]2]:
 * For IJW, we need 2 versions: 1 for clrcall and one for cdecl.
 * For pure and native, we just need clrcall and cdecl, respectively.
 */

__declspec(dllimport) _CRT_REPORT_HOOK __cdecl _CrtSetReportHook(
    [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _CRT_REPORT_HOOK _PFnNewHook
        );

__declspec(dllimport) int __cdecl _CrtSetReportHook2(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode,
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _CRT_REPORT_HOOK _PFnNewHook
        );

__declspec(dllimport) int __cdecl _CrtSetReportHookW2(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mode,
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _CRT_REPORT_HOOKW _PFnNewHook
        );


















#line 410 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"



























#line 438 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


__declspec(dllimport) int __cdecl _CrtSetReportMode(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ReportType,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ReportMode 
        );

__declspec(dllimport) _HFILE __cdecl _CrtSetReportFile(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ReportType,
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _HFILE _ReportFile 
        );

__declspec(dllimport) int __cdecl _CrtDbgReport(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ReportType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Linenumber,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _ModuleName,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Format,
        ...);

__declspec(dllimport) size_t __cdecl _CrtSetDebugFillThreshold(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewDebugFillThreshold
        );



#line 465 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"
__declspec(dllimport) int __cdecl _CrtDbgReportW(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ReportType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _ModuleName,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Format,
        ...);

/* Asserts */
/* We use !! below to ensure that any overloaded operators used to evaluate expr do not end up at operator || */







#line 483 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"



#line 487 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

/*
We retain _ASSERT_BASE solely for backwards compatibility with those who used it even though they
should not have done so since it was not documented. 
*/


#line 495 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

/* Reports with no file/line info */

















#line 515 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"





































/* Reports with file/line info */

















































#line 603 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

 /****************************************************************************
 *
 * Heap routines
 *
 ***************************************************************************/

















































__declspec(dllimport) extern long _crtBreakAlloc;      /* Break on this allocation */
#line 660 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

__declspec(dllimport) long __cdecl _CrtSetBreakAlloc(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] long _BreakAlloc 
        );

/*
 * Prototypes for malloc, free, realloc, etc are in malloc.h
 */

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] __declspec(dllimport) void * __cdecl _malloc_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_Count*_Size")] __declspec(dllimport) void * __cdecl _calloc_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Count,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) void * __cdecl _realloc_dbg(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_NumOfElements*_SizeOfElements")] __declspec(dllimport) void * __cdecl _recalloc_dbg
(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NumOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
);

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) void * __cdecl _expand_dbg(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

__declspec(dllimport) void __cdecl _free_dbg(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType
        );

__declspec(dllimport) size_t __cdecl _msize_dbg (
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType
        );

__declspec(dllimport) size_t __cdecl _aligned_msize_dbg (
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] __declspec(dllimport) void * __cdecl _aligned_malloc_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) void * __cdecl _aligned_realloc_dbg(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_NumOfElements*_SizeOfElements")] __declspec(dllimport) void * __cdecl _aligned_recalloc_dbg
(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NumOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
);

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_Size")] __declspec(dllimport) void * __cdecl _aligned_offset_malloc_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Size,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="_NewSize")] __declspec(dllimport) void * __cdecl _aligned_offset_realloc_dbg(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NewSize,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,WritableBytes="\n@""_NumOfElements*_SizeOfElements")] __declspec(dllimport) void * __cdecl _aligned_offset_recalloc_dbg
(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _NumOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeOfElements,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Alignment,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Offset,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
);

__declspec(dllimport) void __cdecl _aligned_free_dbg(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] void * _Memory
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) char * __cdecl _strdup_dbg(
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Str,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wcsdup_dbg(
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Str,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) char * __cdecl _tempnam_dbg(
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _DirName,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _FilePrefix,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wtempnam_dbg(
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _DirName,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _FilePrefix,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) char * __cdecl _fullpath_dbg(
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _FullPath, 
        [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Path, 
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInBytes,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wfullpath_dbg(
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _FullPath, 
        [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _Path, 
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _SizeInWords,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) char * __cdecl _getcwd_dbg(
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInBytes,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wgetcwd_dbg(
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) char * __cdecl _getdcwd_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Drive,
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInBytes,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] __declspec(dllimport) wchar_t * __cdecl _wgetdcwd_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Drive,
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] char * __cdecl _getdcwd_lk_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Drive,
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInBytes")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char * _DstBuf,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInBytes,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] [returnvalue:SA_Post(Null=SA_Maybe,NullTerminated=SA_Yes)] [returnvalue:SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * __cdecl _wgetdcwd_lk_dbg(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Drive,
        [SA_Pre(Null=SA_Maybe,WritableElements="_SizeInWords")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t * _DstBuf,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _SizeInWords,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

 __declspec(dllimport) errno_t __cdecl _dupenv_s_dbg(
        [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes,WritableElements="*_PBufferSizeInBytes")] [SA_Post(Deref=2,Valid=SA_Yes)] char ** _PBuffer,
        [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PBufferSizeInBytes,
        [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _VarName,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );

 __declspec(dllimport) errno_t __cdecl _wdupenv_s_dbg(
        [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe,NullTerminated=SA_Yes,WritableElements="*_PBufferSizeInWords")] [SA_Post(Deref=2,Valid=SA_Yes)] wchar_t ** _PBuffer,
        [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] size_t * _PBufferSizeInWords,
        [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t * _VarName,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _BlockType,
        [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Filename,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _LineNumber
        );









#line 910 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

 /****************************************************************************
 *
 * Client-defined allocation hook
 *
 ***************************************************************************/

__declspec(dllimport) _CRT_ALLOC_HOOK __cdecl _CrtGetAllocHook
(
    void
);
#line 922 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

/* _CrtSetAllocHook:
 * For IJW, we need 2 versions: 1 for clrcall and one for cdecl.
 * For pure and native, we just need clrcall and cdecl, respectively.
 */

__declspec(dllimport) _CRT_ALLOC_HOOK __cdecl _CrtSetAllocHook
(
    [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _CRT_ALLOC_HOOK _PfnNewHook
);








#line 941 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


















#line 960 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


 /****************************************************************************
 *
 * Memory management
 *
 ***************************************************************************/

/*
 * Bitfield flag that controls CRT heap behavior
 * Default setting is _CRTDBG_ALLOC_MEM_DF
 */


__declspec(dllimport) extern int _crtDbgFlag;
#line 976 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

__declspec(dllimport) int __cdecl _CrtCheckMemory(
        void
        );

__declspec(dllimport) int __cdecl _CrtSetDbgFlag(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _NewFlag
        );

__declspec(dllimport) void __cdecl _CrtDoForAllClientObjects(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] void (__cdecl *_PFn)(void *, void *),
        void * _Context
        );









#line 999 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _CrtIsValidPointer(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Ptr,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Bytes,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _ReadWrite
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _CrtIsValidHeapPointer(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _HeapPtr
        );

__declspec(dllimport) int __cdecl _CrtIsMemoryBlock(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Memory,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] unsigned int _Bytes,
        [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] long * _RequestNumber,
        [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] char ** _Filename,
        [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] int * _LineNumber
        );

[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(dllimport) int __cdecl _CrtReportBlockType(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const void * _Memory
        );


 /****************************************************************************
 *
 * Memory state
 *
 ***************************************************************************/


__declspec(dllimport) _CRT_DUMP_CLIENT __cdecl _CrtGetDumpClient
(
    void
);
#line 1035 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

/* _CrtSetDumpClient:
 * For IJW, we need 2 versions: 1 for clrcall and one for cdecl.
 * For pure and native, we just need clrcall and cdecl, respectively.
 */

__declspec(dllimport) _CRT_DUMP_CLIENT __cdecl _CrtSetDumpClient
(
    [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _CRT_DUMP_CLIENT _PFnNewDump
);









#line 1055 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"















#line 1071 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

__declspec(dllimport)  void __cdecl _CrtMemCheckpoint(
        [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _CrtMemState * _State
        );

__declspec(dllimport)  int __cdecl _CrtMemDifference(
        [SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] _CrtMemState * _State,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const _CrtMemState * _OldState,
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const _CrtMemState * _NewState
        );

__declspec(dllimport) void __cdecl _CrtMemDumpAllObjectsSince(
        [SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _CrtMemState * _State
        );

__declspec(dllimport) void __cdecl _CrtMemDumpStatistics(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const _CrtMemState * _State
        );

__declspec(dllimport) int __cdecl _CrtDumpMemoryLeaks(
        void
        );

__declspec(dllimport) int __cdecl _CrtSetCheckCount(
        [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _CheckCount
        );

__declspec(dllimport) int __cdecl _CrtGetCheckCount(
        void
        );

#line 1103 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


}



extern "C++" {












































 /****************************************************************************
 *
 * Debug ON
 * Debug ON
 * Debug ON
 *
 ***************************************************************************/
 
#pragma warning(suppress: 4985)
[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] void * __cdecl operator new[](size_t _Size);

[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] void * __cdecl operator new(
        size_t _Size,
        int,
        const char *,
        int
        );

#pragma warning(suppress: 4985)
[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] void * __cdecl operator new[](
        size_t _Size,
        int,
        const char *,
        int
        );


void __cdecl operator delete[](void *);

inline void __cdecl operator delete(void * _P, int, const char *, int)
        { ::operator delete(_P); }

inline void __cdecl operator delete[](void * _P, int, const char *, int)
        { ::operator delete[](_P); }
#line 1189 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"



















#line 1209 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

#line 1211 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

}

#line 1215 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

#line 1217 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"


#pragma pack(pop)
#line 1221 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

#line 1223 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\crtdbg.h"

#line 11 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"
namespace std {

		// STREAM POSITIONING TYPES (from <streambuf>)
 




typedef long streamoff;
typedef int streamsize;
 #line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

 

#line 31 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"


#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"
  
 #line 36 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"





extern __declspec(dllimport)  fpos_t _Fpz;
extern __declspec(dllimport)  const streamoff _BADOFF;
#line 44 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

		// TEMPLATE CLASS fpos (from <streambuf>)
template<class _Statetype>
	class fpos
	{	// store arbitrary file position
	typedef fpos<_Statetype> _Myt;

public:
	 fpos(streamoff _Off = 0)
		: _Myoff(_Off), _Fpos(0), _Mystate(_Stz)
		{	// construct with stream offset
		}

	 fpos(_Statetype _State, fpos_t _Fileposition)
		: _Myoff(0), _Fpos(_Fileposition), _Mystate(_State)
		{	// construct with conversion state and C file position
		}

	_Statetype  state() const
		{	// return conversion state
		return (_Mystate);
		}

	void  state(_Statetype _State)
		{	// set conversion state
		_Mystate = _State;
		}

	fpos_t  seekpos() const
		{	// return C file position
		return (_Fpos);
		}

	 operator streamoff() const
		{	// return offset
		return ((streamoff)(_Myoff + ((long)(_Fpos))));
		}

	streamoff  operator-(const _Myt& _Right) const
		{	// return difference of file positions as an offset
		return ((streamoff)*this - (streamoff)_Right);
		}

	_Myt&  operator+=(streamoff _Off)
		{	// add offset
		_Myoff += _Off;
		return (*this);
		}

	_Myt&  operator-=(streamoff _Off)
		{	// subtract offset
		_Myoff -= _Off;
		return (*this);
		}

	_Myt  operator+(streamoff _Off) const
		{	// return this + offset
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt  operator-(streamoff _Off) const
		{	// return this - offset
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	bool  operator==(const _Myt& _Right) const
		{	// test for file position equality
		return ((streamoff)*this == (streamoff)_Right);
		}

	bool  operator!=(const _Myt& _Right) const
		{	// test for file position inequality
		return (!(*this == _Right));
		}

private:
	 static const _Statetype _Stz;	// initial conversion state
	streamoff _Myoff;	// stream offset
	fpos_t _Fpos;	// C file position
	_Statetype _Mystate;	// current conversion state
	};

	// STATIC fpos::_Stz OBJECT
template<class _Statetype>
	 const _Statetype fpos<_Statetype>::_Stz = _Statetype();

 

 
 

typedef fpos<_Mbstatet> streampos;
typedef streampos wstreampos;

		// SECURE CHAR TRAITS TAGS
struct _Unsecure_char_traits_tag
	{
	};
struct _Secure_char_traits_tag
	{
	};

		// TEMPLATE STRUCT _Char_traits_base
		// Used to define the Secure_char_traits tag. This typedef is used
		// only for user defined char_traits. A user defined char_traits should 
		// inherit from _Char_traits_base, define _Secure_char_traits as 
		// _Secure_char_traits_tag and implement _Copy_s and _Move_s.
struct _Char_traits_base
	{
	typedef _Unsecure_char_traits_tag _Secure_char_traits;
	};

		// TEMPLATE STRUCT char_traits (FROM <string>)
		// char_traits classes implement _Copy_s and _Move_s and are
		// automatically recognized as secure by string_base.
template<class _Elem>
	struct char_traits:
		public _Char_traits_base
	{	// properties of a string or stream element
	typedef _Elem char_type;
	typedef long int_type;
	typedef streampos pos_type;
	typedef streamoff off_type;
	typedef _Mbstatet state_type;

	static void __cdecl assign(_Elem& _Left, const _Elem& _Right)
		{	// assign an element
		_Left = _Right;
		}

	static bool __cdecl eq(const _Elem& _Left, const _Elem& _Right)
		{	// test for element equality
		return (_Left == _Right);
		}

	static bool __cdecl lt(const _Elem& _Left, const _Elem& _Right)
		{	// test if _Left precedes _Right
		return (_Left < _Right);
		}

	static int __cdecl compare([SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First1,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2, size_t _Count)
		{	// compare [_First1, _First1 + _Count) with [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		for (; 0 < _Count; --_Count, ++_First1, ++_First2)
			if (!eq(*_First1, *_First2))
				return (lt(*_First1, *_First2) ? -1 : +1);
		return (0);
		}

	static size_t __cdecl length([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First)
		{	// find length of null-terminated sequence
//		_DEBUG_POINTER(_First);
		size_t _Count;
		for (_Count = 0; !eq(*_First, _Elem()); ++_First)
			++_Count;
		return (_Count);
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	static _Elem *__cdecl copy([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2, size_t _Count)
		{	// copy [_First1, _First1 + _Count) to [_First2, ...)
		// assume there is enough space in the destination buffer
		return _Copy_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Copy_s([SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, size_t _Dest_size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2, size_t _Count)
		{	// copy [_First1, _First1 + _Count) to [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		{ if (!(_Dest_size >= _Count)) { (void) ((!!((("_Dest_size >= _Count", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd", 219, 0, L"(\"_Dest_size >= _Count\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"_Dest_size >= _Count", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd", 219, 0); return (0); } };
		_Elem *_Next = _First1;
		for (; 0 < _Count; --_Count, ++_Next, ++_First2)
			assign(*_Next, *_First2);
		return (_First1);
		}

	static const _Elem *__cdecl find([SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First,
		size_t _Count, const _Elem& _Ch)
		{	// look for _Ch in [_First, _First + _Count)
//		_DEBUG_POINTER(_First);
		for (; 0 < _Count; --_Count, ++_First)
			if (eq(*_First, _Ch))
				return (_First);
		return (0);
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	static _Elem *__cdecl move([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2, size_t _Count)
		{	// move [_First1, _First1 + _Count) to [_First2, ...)
		// assume there is enough space in the destination buffer
		return _Move_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Move_s([SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, size_t _Dest_size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2, size_t _Count)
		{	// move [_First1, _First1 + _Count) to [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		{ if (!(_Dest_size >= _Count)) { (void) ((!!((("_Dest_size >= _Count", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd", 249, 0, L"(\"_Dest_size >= _Count\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"_Dest_size >= _Count", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd", 249, 0); return (0); } };
		_Elem *_Next = _First1;
		if (_First2 < _Next && _Next < _First2 + _Count)
			for (_Next += _Count, _First2 += _Count; 0 < _Count; --_Count)
				assign(*--_Next, *--_First2);
		else
			for (; 0 < _Count; --_Count, ++_Next, ++_First2)
				assign(*_Next, *_First2);
		return (_First1);
		}

	static _Elem *__cdecl assign([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First,
		size_t _Count, _Elem _Ch)
		{	// assign _Count * _Ch to [_First, ...)
//		_DEBUG_POINTER(_First);
		_Elem *_Next = _First;
		for (; 0 < _Count; --_Count, ++_Next)
			assign(*_Next, _Ch);
		return (_First);
		}

	static _Elem __cdecl to_char_type(const int_type& _Meta)
		{	// convert metacharacter to character
		return ((_Elem)_Meta);
		}

	static int_type __cdecl to_int_type(const _Elem& _Ch)
		{	// convert character to metacharacter
		return ((int_type)_Ch);
		}

	static bool __cdecl eq_int_type(const int_type& _Left,
		const int_type& _Right)
		{	// test for metacharacter equality
		return (_Left == _Right);
		}

	static int_type __cdecl eof()
		{	// return end-of-file metacharacter
		return ((int_type)(-1));
		}

	static int_type __cdecl not_eof(const int_type& _Meta)
		{	// return anything but EOF
		return (_Meta != eof() ? (int_type)_Meta : (int_type)!eof());
		}
	};

		// STRUCT char_traits<wchar_t>
template<> struct __declspec(dllimport) char_traits<wchar_t>:
	public _Char_traits_base
	{	// properties of a string or stream wchar_t element
	typedef wchar_t _Elem;
	typedef _Elem char_type;	// for overloads
	typedef wint_t int_type;
	typedef streampos pos_type;
	typedef streamoff off_type;
	typedef _Mbstatet state_type;

	static void __cdecl assign(_Elem& _Left, const _Elem& _Right)
		{	// assign an element
		_Left = _Right;
		}

	static bool __cdecl eq(const _Elem& _Left, const _Elem& _Right)
		{	// test for element equality
		return (_Left == _Right);
		}

	static bool __cdecl lt(const _Elem& _Left, const _Elem& _Right)
		{	// test if _Left precedes _Right
		return (_Left < _Right);
		}

	static int __cdecl compare([SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First1, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// compare [_First1, _First1 + _Count) with [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		return (::wmemcmp(_First1, _First2, _Count));
		}

	static size_t __cdecl length([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First)
		{	// find length of null-terminated sequence
//		_DEBUG_POINTER(_First);
		return (::wcslen(_First));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	static _Elem *__cdecl copy([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// copy [_First1, _First1 + _Count) to [_First2, ...)
		// assume there is enough space in the destination buffer
		return _Copy_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Copy_s([SA_Pre(Null=SA_No,WritableElements="_Size_in_words")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, size_t _Size_in_words, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// copy [_First1, _First1 + _Count) to [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		::wmemcpy_s((_First1), (_Size_in_words), (_First2), (_Count));
		return _First1;
		}

	static const _Elem *__cdecl find([SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First, size_t _Count,
		const _Elem& _Ch)
		{	// look for _Ch in [_First, _First + _Count)
//		_DEBUG_POINTER(_First);
		return ((const _Elem *)::wmemchr(_First, _Ch, _Count));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	static _Elem *__cdecl move([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// move [_First1, _First1 + _Count) to [_First2, ...)
		// assume there is enough space in the destination buffer
		return _Move_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Move_s([SA_Pre(Null=SA_No,WritableElements="_Size_in_words")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, size_t _Size_in_words, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// move [_First1, _First1 + _Count) to [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		::wmemmove_s((_First1), (_Size_in_words), (_First2), (_Count));
		return (_Elem *)_First1;
		}

	static _Elem *__cdecl assign([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First, size_t _Count, _Elem _Ch)
		{	// assign _Count * _Ch to [_First, ...)
//		_DEBUG_POINTER(_First);
		return ((_Elem *)::wmemset(_First, _Ch, _Count));
		}

	static _Elem __cdecl to_char_type(const int_type& _Meta)
		{	// convert metacharacter to character
		return (_Meta);
		}

	static int_type __cdecl to_int_type(const _Elem& _Ch)
		{	// convert character to metacharacter
		return (_Ch);
		}

	static bool __cdecl eq_int_type(const int_type& _Left,
		const int_type& _Right)
		{	// test for metacharacter equality
		return (_Left == _Right);
		}

	static int_type __cdecl eof()
		{	// return end-of-file metacharacter
		return ((wint_t)(0xFFFF));
		}

	static int_type __cdecl not_eof(const int_type& _Meta)
		{	// return anything but EOF
		return (_Meta != eof() ? _Meta : !eof());
		}
	};


		// STRUCT char_traits<char> (FROM <string>)
template<> struct __declspec(dllimport) char_traits<char>:
	public _Char_traits_base
	{	// properties of a string or stream char element
	typedef char _Elem;
	typedef _Elem char_type;
	typedef int int_type;
	typedef streampos pos_type;
	typedef streamoff off_type;
	typedef _Mbstatet state_type;

	static void __cdecl assign(_Elem& _Left, const _Elem& _Right)
		{	// assign an element
		_Left = _Right;
		}

	static bool __cdecl eq(const _Elem& _Left, const _Elem& _Right)
		{	// test for element equality
		return (_Left == _Right);
		}

	static bool __cdecl lt(const _Elem& _Left, const _Elem& _Right)
		{	// test if _Left precedes _Right
		return (_Left < _Right);
		}

	static int __cdecl compare([SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First1, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// compare [_First1, _First1 + _Count) with [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		return (::memcmp(_First1, _First2, _Count));
		}

	static size_t __cdecl length([SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First)
		{	// find length of null-terminated string
//		_DEBUG_POINTER(_First);
		return (::strlen(_First));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	static _Elem *__cdecl copy([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// copy [_First1, _First1 + _Count) to [_First2, ...)
		// assume there is enough space in the destination buffer
		return _Copy_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Copy_s([SA_Pre(Null=SA_No,WritableElements="_Size_in_bytes")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, size_t _Size_in_bytes, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// copy [_First1, _First1 + _Count) to [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		::memcpy_s((_First1), (_Size_in_bytes), (_First2), (_Count));
		return _First1;
		}

	static const _Elem *__cdecl find([SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First, size_t _Count,
		const _Elem& _Ch)
		{	// look for _Ch in [_First, _First + _Count)
//		_DEBUG_POINTER(_First);
		return ((const _Elem *)::memchr(_First, _Ch, _Count));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	static _Elem *__cdecl move([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// move [_First1, _First1 + _Count) to [_First2, ...)
		// assume there is enough space in the destination buffer
		return _Move_s(_First1, _Count, _First2, _Count);
		}

	static _Elem *__cdecl _Move_s([SA_Pre(Null=SA_No,WritableElements="_Size_in_bytes")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First1, size_t _Size_in_bytes, [SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const _Elem *_First2,
		size_t _Count)
		{	// move [_First1, _First1 + _Count) to [_First2, ...)
//		_DEBUG_POINTER(_First1);
//		_DEBUG_POINTER(_First2);
		::memmove_s((_First1), (_Size_in_bytes), (_First2), (_Count));
		return _First1;
		}

	static _Elem *__cdecl assign([SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] _Elem *_First, size_t _Count, _Elem _Ch)
		{	// assign _Count * _Ch to [_First, ...)
//		_DEBUG_POINTER(_First);
		return ((_Elem *)::memset(_First, _Ch, _Count));
		}

	static _Elem __cdecl to_char_type(const int_type& _Meta)
		{	// convert metacharacter to character
		return ((_Elem)_Meta);
		}

	static int_type __cdecl to_int_type(const _Elem& _Ch)
		{	// convert character to metacharacter
		return ((unsigned char)_Ch);
		}

	static bool __cdecl eq_int_type(const int_type& _Left,
		const int_type& _Right)
		{	// test for metacharacter equality
		return (_Left == _Right);
		}

	static int_type __cdecl eof()
		{	// return end-of-file metacharacter
		return ((-1));
		}

	static int_type __cdecl not_eof(const int_type& _Meta)
		{	// return anything but EOF
		return (_Meta != eof() ? _Meta : !eof());
		}
	};

		// TEMPLATE FUNCTION _Char_traits_cat
	template <class _Traits>
	class _Inherits_from_char_traits_base
	{
		typedef char _True;
		class _False { char _Dummy[2]; };
		static _True _Inherits(_Char_traits_base);
		static _False _Inherits(...);
		static _Traits _Make_traits();

	public:
		enum { _Exists = sizeof(_Inherits(_Make_traits())) == sizeof(_True) };
	};

	template <class _Traits, bool _Inherits_from_char_traits_base>
	class _Char_traits_category_helper
	{
	public:
		typedef _Unsecure_char_traits_tag _Secure_char_traits;
	};

	// The char_traits class is secure by definition, because we added the _Copy_s and the _Move_s
	// methods.
	template <class _Elem>
	class _Char_traits_category_helper< char_traits<_Elem> , true>
	{
	public:
		typedef _Secure_char_traits_tag _Secure_char_traits;
	};

	template <class _Traits>
	class _Char_traits_category_helper<_Traits, true>
	{
	public:
		typedef typename _Traits::_Secure_char_traits _Secure_char_traits;
	};

	template <class _Traits>
	class _Char_traits_category
	{
	public:
		typedef typename _Char_traits_category_helper<_Traits, _Inherits_from_char_traits_base<_Traits>::_Exists>::_Secure_char_traits _Secure_char_traits;
	};

	// Retrieve the _Secure_char_traits tag from a user defined char_traits
	// methods.
	template<class _Traits> 
	inline
	typename _Char_traits_category<_Traits>::_Secure_char_traits _Char_traits_cat()
	{
		typename _Char_traits_category<_Traits>::_Secure_char_traits _Secure;
		return (_Secure);
	}

	namespace _Traits_helper
	{

		// TEMPLATE FUNCTION _Traits_helper::copy_s
	template<class _Traits>
	inline
	typename _Traits::char_type *copy_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] typename _Traits::char_type *_First1, size_t _Size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const typename _Traits::char_type *_First2, size_t _Count)
	{
		return copy_s<_Traits>(_First1, _Size, _First2, _Count, _Char_traits_cat<_Traits>());
	}

	template<class _Traits>
	inline
	typename _Traits::char_type *copy_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] typename _Traits::char_type *_First1, size_t _Size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const typename _Traits::char_type *_First2, size_t _Count, _Secure_char_traits_tag)
	{
		return _Traits::_Copy_s(_First1, _Size, _First2, _Count);
	}

	// If _SECURE_SCL is turned on, the user will get a deprecation warning when calling an unsecure _Traits::copy
	template<class _Traits>
	inline
	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	typename _Traits::char_type *copy_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] typename _Traits::char_type *_First1, size_t _Size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const typename _Traits::char_type *_First2, size_t _Count, _Unsecure_char_traits_tag)
	{
		return _Traits::copy(_First1, _First2, _Count);
	}

		// TEMPLATE FUNCTION _Traits_helper::move_s
	template<class _Traits>
	inline
	typename _Traits::char_type *move_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] typename _Traits::char_type *_First1, size_t _Size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const typename _Traits::char_type *_First2, size_t _Count)
	{
		return move_s<_Traits>(_First1, _Size, _First2, _Count, _Char_traits_cat<_Traits>());
	}

	template<class _Traits>
	inline
	typename _Traits::char_type *move_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] typename _Traits::char_type *_First1, size_t _Size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const typename _Traits::char_type *_First2, size_t _Count, _Secure_char_traits_tag)
	{
		return _Traits::_Move_s(_First1, _Size, _First2, _Count);
	}

	// If _SECURE_SCL is turned on, the user will get a deprecation warning when calling an unsecure _Traits::copy
	template<class _Traits>
	inline
	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	typename _Traits::char_type *move_s([SA_Pre(Null=SA_No,WritableElements="_Size")] [SA_Pre(Deref=1,Valid=SA_No)] typename _Traits::char_type *_First1, size_t _Size,
		[SA_Pre(Null=SA_No,ValidElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const typename _Traits::char_type *_First2, size_t _Count, _Unsecure_char_traits_tag)
	{
		return _Traits::move(_First1, _First2, _Count);
	}

	} // namespace _Traits_helper

		// FORWARD REFERENCES
template<class _Ty>
	class allocator;
class ios_base;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ios;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class istreambuf_iterator;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class ostreambuf_iterator;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_streambuf;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_istream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ostream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_iostream;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_stringbuf;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_istringstream;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_ostringstream;
template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Alloc = allocator<_Elem> >
	class basic_stringstream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_filebuf;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ifstream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_ofstream;
template<class _Elem,
	class _Traits = char_traits<_Elem> >
	class basic_fstream;

 
template<class _Elem,
	class _InIt >
	class num_get;
template<class _Elem,
	class _OutIt >
	class num_put;
template<class _Elem>
	class collate;
 #line 703 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

		// char TYPEDEFS
typedef basic_ios<char, char_traits<char> > ios;
typedef basic_streambuf<char, char_traits<char> > streambuf;
typedef basic_istream<char, char_traits<char> > istream;
typedef basic_ostream<char, char_traits<char> > ostream;
typedef basic_iostream<char, char_traits<char> > iostream;
typedef basic_stringbuf<char, char_traits<char>,
	allocator<char> > stringbuf;
typedef basic_istringstream<char, char_traits<char>,
	allocator<char> > istringstream;
typedef basic_ostringstream<char, char_traits<char>,
	allocator<char> > ostringstream;
typedef basic_stringstream<char, char_traits<char>,
	allocator<char> > stringstream;
typedef basic_filebuf<char, char_traits<char> > filebuf;
typedef basic_ifstream<char, char_traits<char> > ifstream;
typedef basic_ofstream<char, char_traits<char> > ofstream;
typedef basic_fstream<char, char_traits<char> > fstream;

		// wchat_t TYPEDEFS
typedef basic_ios<wchar_t, char_traits<wchar_t> > wios;
typedef basic_streambuf<wchar_t, char_traits<wchar_t> >
	wstreambuf;
typedef basic_istream<wchar_t, char_traits<wchar_t> > wistream;
typedef basic_ostream<wchar_t, char_traits<wchar_t> > wostream;
typedef basic_iostream<wchar_t, char_traits<wchar_t> > wiostream;
typedef basic_stringbuf<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wstringbuf;
typedef basic_istringstream<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wistringstream;
typedef basic_ostringstream<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wostringstream;
typedef basic_stringstream<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wstringstream;
typedef basic_filebuf<wchar_t, char_traits<wchar_t> > wfilebuf;
typedef basic_ifstream<wchar_t, char_traits<wchar_t> > wifstream;
typedef basic_ofstream<wchar_t, char_traits<wchar_t> > wofstream;
typedef basic_fstream<wchar_t, char_traits<wchar_t> > wfstream;



 
typedef num_get<char, istreambuf_iterator<char, char_traits<char> > >
	numget;
typedef num_get<wchar_t, istreambuf_iterator<wchar_t, char_traits<wchar_t> > >
	wnumget;
typedef num_put<char, ostreambuf_iterator<char, char_traits<char> > >
	numput;
typedef num_put<wchar_t, ostreambuf_iterator<wchar_t, char_traits<wchar_t> > >
	wnumput;
typedef collate<char> ncollate;
typedef collate<wchar_t> wcollate;
 #line 757 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

}


 #pragma warning(pop)
 #pragma pack(pop)
#line 764 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

#line 766 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"
#line 767 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\iosfwd"

/*
 * Copyright (c) 1992-2008 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.05:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 12 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"

namespace std {
		// TEMPLATE FUNCTION swap (from <algorithm>)
template<class _Ty> inline
	void swap(_Ty& _Left, _Ty& _Right)
	{	// exchange values stored at _Left and _Right
	if (&_Left != &_Right)
		{	// different, worth swapping
		_Ty _Tmp = _Left;

		_Left = _Right;
		_Right = _Tmp;
		}
	}

		// TEMPLATE FUNCTION _Swap_adl
template<class _Ty> inline
	void _Swap_adl(_Ty& _Left, _Ty& _Right)
	{	// exchange values stored at _Left and _Right, using ADL
	swap(_Left, _Right);
	}

		// TEMPLATE STRUCT pair
template<class _Ty1,
	class _Ty2>
	struct pair
	{	// store a pair of values
	typedef pair<_Ty1, _Ty2> _Myt;
	typedef _Ty1 first_type;
	typedef _Ty2 second_type;

	pair()
		: first(_Ty1()), second(_Ty2())
		{	// construct from defaults
		}

	pair(const _Ty1& _Val1, const _Ty2& _Val2)
		: first(_Val1), second(_Val2)
		{	// construct from specified values
		}

	template<class _Other1,
		class _Other2>
		pair(const pair<_Other1, _Other2>& _Right)
		: first(_Right.first), second(_Right.second)
		{	// construct from compatible pair
		}

	void swap(_Myt& _Right)
		{	// exchange contents with _Right
		if (this != &_Right)
			{	// different, worth swapping
			::std:: _Swap_adl(first, _Right.first);
			::std:: _Swap_adl(second, _Right.second);
			}
		}

	_Ty1 first;	// the first stored value
	_Ty2 second;	// the second stored value
	};

		// pair TEMPLATE FUNCTIONS
template<class _Ty1,
	class _Ty2> inline
	void swap(pair<_Ty1, _Ty2>& _Left, pair<_Ty1, _Ty2>& _Right)
	{	// swap _Left and _Right pairs
	_Left.swap(_Right);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator==(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	// test for pair equality
	return (_Left.first == _Right.first && _Left.second == _Right.second);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator!=(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	// test for pair inequality
	return (!(_Left == _Right));
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator<(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	// test if _Left < _Right for pairs
	return (_Left.first < _Right.first ||
		!(_Right.first < _Left.first) && _Left.second < _Right.second);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator>(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	// test if _Left > _Right for pairs
	return (_Right < _Left);
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator<=(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	// test if _Left <= _Right for pairs
	return (!(_Right < _Left));
	}

template<class _Ty1,
	class _Ty2> inline
	bool operator>=(const pair<_Ty1, _Ty2>& _Left,
		const pair<_Ty1, _Ty2>& _Right)
	{	// test if _Left >= _Right for pairs
	return (!(_Left < _Right));
	}

template<class _Ty1,
	class _Ty2> inline
	pair<_Ty1, _Ty2> make_pair(_Ty1 _Val1, _Ty2 _Val2)
	{	// return pair composed from arguments
	return (pair<_Ty1, _Ty2>(_Val1, _Val2));
	}

		// TEMPLATE OPERATORS
	namespace rel_ops
		{	// nested namespace to hide relational operators from std
template<class _Ty> inline
	bool  operator!=(const _Ty& _Left, const _Ty& _Right)
	{	// test for inequality, in terms of equality
	return (!(_Left == _Right));
	}

template<class _Ty> inline
	bool operator>(const _Ty& _Left, const _Ty& _Right)
	{	// test if _Left > _Right, in terms of operator<
	return (_Right < _Left);
	}

template<class _Ty> inline
	bool operator<=(const _Ty& _Left, const _Ty& _Right)
	{	// test if _Left <= _Right, in terms of operator<
	return (!(_Right < _Left));
	}

template<class _Ty> inline
	bool operator>=(const _Ty& _Left, const _Ty& _Right)
	{	// test if _Left >= _Right, in terms of operator<
	return (!(_Left < _Right));
	}
		}
}

 
namespace std {
	namespace tr1 {	// TR1 additions

	// TUPLE INTERFACE TO std::tr1::pair
template<class _Tuple>
	struct tuple_size;
template<int _Idx,
	class _Tuple>
	struct tuple_element;
template<class _Ty1,
	class _Ty2>
	struct tuple_size<std::pair<_Ty1, _Ty2> >
	{	// struct to determine number of elements in pair
	static const int value = 2;
	};

template<int _Idx,
	class _Ty>
	struct _Pair_data;
template<class _Ty1,
	class _Ty2>
	struct _Pair_data<0, std::pair<_Ty1, _Ty2> >
	{	// struct to pick out argument type and value at index 0
	typedef _Ty1& _Type;
	typedef const _Ty1& _CType;

	static _Type _Val(std::pair<_Ty1, _Ty2>& _Pr)
		{	// return value
		return (_Pr.first);
		}

	static _CType _Val(const std::pair<_Ty1, _Ty2>& _Pr)
		{	// return value
		return (_Pr.first);
		}
	};

template<class _Ty1,
	class _Ty2>
	struct _Pair_data<1, std::pair<_Ty1, _Ty2> >
	{	// struct to pick out argument type and value at index 1
	typedef _Ty2& _Type;
	typedef const _Ty2& _CType;

	static _Type _Val(std::pair<_Ty1, _Ty2>& _Pr)
		{	// return value
		return (_Pr.second);
		}

	static _CType _Val(const std::pair<_Ty1, _Ty2>& _Pr)
		{	// return value
		return (_Pr.second);
		}
	};

template<class _Ty1,
	class _Ty2>
	struct tuple_element<0, std::pair<_Ty1, _Ty2> >
	{	// struct to determine type of element 0 in pair
	typedef _Ty1 type;
	};

template<class _Ty1,
	class _Ty2>
	struct tuple_element<1, std::pair<_Ty1, _Ty2> >
	{	// struct to determine type of element 1 in pair
	typedef _Ty2 type;
	};

template<int _Idx,
	class _Ty1,
	class _Ty2>
	typename _Pair_data<_Idx, std::pair<_Ty1, _Ty2> >::_Type
		get(std::pair<_Ty1, _Ty2>& _Pr)
	{	// return element at _Idx in pair _Pr
	return (_Pair_data<_Idx, std::pair<_Ty1, _Ty2> >::_Val(_Pr));
	}

template<int _Idx,
	class _Ty1,
	class _Ty2>
	typename _Pair_data<_Idx, std::pair<_Ty1, _Ty2> >::_CType
		get(const std::pair<_Ty1, _Ty2>& _Pr)
	{	// return element at _Idx in pair _Pr
	return (_Pair_data<_Idx, std::pair<_Ty1, _Ty2> >::_Val(_Pr));
	}

	}	// namespace tr1
}
 #line 257 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"


 #pragma warning(pop)
 #pragma pack(pop)
#line 262 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"

#line 264 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"
#line 265 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\utility"


/*
 * This file is derived from software bearing the following
 * restrictions:
 *
 * Copyright (c) 1994
 * Hewlett-Packard Company
 *
 * Permission to use, copy, modify, distribute and sell this
 * software and its documentation for any purpose is hereby
 * granted without fee, provided that the above copyright notice
 * appear in all copies and that both that copyright notice and
 * this permission notice appear in supporting documentation.
 * Hewlett-Packard Company makes no representations about the
 * suitability of this software for any purpose. It is provided
 * "as is" without express or implied warranty.
 */

/*
 * Copyright (c) 1992-2008 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.05:0009 */
#line 8 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



 #pragma pack(push,8)
 #pragma warning(push,3)
#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

namespace std {

		// RANGE CHECKED ITERATOR TAGS
struct _Unchecked_iterator_tag
	{
	};
struct _Range_checked_iterator_tag
	{
	};

		// CHECKED ITERATOR BASE TAGS
struct _Unchanged_checked_iterator_base_type_tag
	{
	};

struct _Different_checked_iterator_base_type_tag
	{
	};

		// INNER TYPE TAG
struct _Undefined_inner_type_tag
	{
	};

		// MOVE OPERATION TAG
struct _Undefined_move_tag
	{
	};

struct _Swap_move_tag
	{
	};


class _Iterator_base_universal
	{	// base of all iterators
	public:
	typedef _Unchecked_iterator_tag _Checked_iterator_category;
	typedef _Unchanged_checked_iterator_base_type_tag _Checked_iterator_base_type;
	typedef _Undefined_inner_type_tag _Inner_type;
	};


		// Used to initialize _Mycont when _SECURE_SCL is off


		// Used to initialize _Myfirstiter and _Mynextiter when _HAS_ITERATOR_DEBUGGING is off


 
/* 
This internal implementation helper should not have been used externally, but is in our exports
and so cannot be removed right now. However, we deprecate it to avoid new uses 
*/
__declspec(noreturn) __declspec(deprecated) __declspec(dllimport) void __cdecl _Debug_message(const char *, const char *);
/* 
Use this one instead
*/

/* stl.net defined its own _Debug_message */

__declspec(dllimport) void __cdecl _Debug_message(const wchar_t *, const wchar_t *, unsigned int line);


#line 80 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// MACROS





#line 88 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// CLASS _Container_base
class _Iterator_base;

class __declspec(dllimport) _Container_base_secure
	{	// store head of iterator chain
public:
	friend class _Iterator_base;

	 _Container_base_secure()
		: _Myfirstiter(0)
		{	// construct childless container
		}

	 _Container_base_secure(const _Container_base_secure&)
		: _Myfirstiter(0)
		{	// copy a container
		}

	_Container_base_secure&  operator=(const _Container_base_secure&)
		{	// assign a container
		return (*this);
		}

	 ~_Container_base_secure()
		{	// destroy the container
		_Orphan_all();
		}

	void  _Orphan_all() const;	// orphan all iterators
	void  _Swap_all(_Container_base_secure&) const;	// swaps all iterators

	void  _Swap_aux(_Container_base_secure&)
		{
		// Do nothing: we don't have an aux object.
		}

	_Iterator_base *_Myfirstiter;
	};

typedef _Container_base_secure _Container_base;

		// CLASS _Iterator_base
class _Iterator_base : public _Iterator_base_universal
	{	// store links to container, next iterator
public:
	friend class _Container_base_secure;

	 _Iterator_base()
		: _Mycont(0), _Mynextiter(0)
		{	// construct orphaned iterator
		}

	 _Iterator_base(const _Iterator_base& _Right)
		: _Mycont(0), _Mynextiter(0)
		{	// copy an iterator
		*this = _Right;
		}

	_Iterator_base&  operator=(const _Iterator_base& _Right)
		{	// assign an iterator
		if (_Mycont != _Right._Mycont)
			{	// change parentage
			_Lockit _Lock(3);
			_Orphan_me();
			_Adopt(_Right._Mycont);
			}
		return (*this);
		}

	 ~_Iterator_base()
		{	// destroy the iterator
		_Lockit _Lock(3);
		_Orphan_me();
		}

	void  _Adopt(const _Container_base_secure *_Parent)
		{	// adopt this iterator by parent
		if (_Mycont != _Parent)
			{	// change parentage
			_Lockit _Lock(3);
			_Orphan_me();
			if (_Parent != 0 && _Parent->_Myfirstiter != ((_Iterator_base *)-3))
				{	// switch to new parent
				_Mynextiter = _Parent->_Myfirstiter;
				((_Container_base_secure *)_Parent)->_Myfirstiter = this;
				}
			_Mycont = _Parent;
			}
		}

	void  _Orphan_me()
		{	// cut ties with parent
		if (_Mycont != 0 && _Mycont->_Myfirstiter != ((_Iterator_base *)-3))
			{	// adopted, remove self from list
			_Iterator_base **_Pnext =
				(_Iterator_base **)&_Mycont->_Myfirstiter;
			while (*_Pnext != 0 && *_Pnext != this)
				_Pnext = &(*_Pnext)->_Mynextiter;

			if (*_Pnext == 0)
				_Debug_message(L"ITERATOR LIST CORRUPTED!", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 189);
			*_Pnext = _Mynextiter;
			_Mycont = 0;
			}
		}

	const _Container_base_secure *  _Getmycont() const
		{	// This member function always exists when we can get a container pointer
		return _Mycont;
		}

	bool  _Same_container(const _Iterator_base& _Other) const
		{	// This member function always exists when we can get a container pointer
		return _Mycont == _Other._Mycont;
		}

	bool  _Has_container() const
		{	// This member function always exists when we can get a container pointer
		return _Mycont != 0;
		}

	const _Container_base_secure *_Mycont;
	_Iterator_base *_Mynextiter;
	};

typedef _Iterator_base _Iterator_base_secure;

inline void  _Container_base_secure::_Orphan_all() const
	{	// orphan all iterators
	_Lockit _Lock(3);
	if (_Myfirstiter != ((_Iterator_base *)-3))
		{
		for (_Iterator_base **_Pnext = (_Iterator_base **)&_Myfirstiter;
			*_Pnext != 0; *_Pnext = (*_Pnext)->_Mynextiter)
			(*_Pnext)->_Mycont = 0;
		*(_Iterator_base **)&_Myfirstiter = 0;
		}
	}

inline void  _Container_base_secure::_Swap_all(_Container_base_secure& _Right) const
	{	// swap all iterators
	_Lockit _Lock(3);
	_Iterator_base *_Pnext;
	_Iterator_base *_Temp = (_Iterator_base *)_Myfirstiter;
	*(_Iterator_base **)&_Myfirstiter = (_Iterator_base *)_Right._Myfirstiter;
	*(_Iterator_base **)&_Right._Myfirstiter = _Temp;

	if (_Myfirstiter != ((_Iterator_base *)-3))
		{
		for (_Pnext = (_Iterator_base *)_Myfirstiter;
			_Pnext != 0; _Pnext = _Pnext->_Mynextiter)
			_Pnext->_Mycont = this;
		}
	if (_Right._Myfirstiter != ((_Iterator_base *)-3))
		{
		for (_Pnext = (_Iterator_base *)_Right._Myfirstiter;
			_Pnext != 0; _Pnext = _Pnext->_Mynextiter)
			_Pnext->_Mycont = &_Right;
		}
	}

		// COMPARISON MACROS
 
  
 #line 254 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt(const _Ty1& _Left, const _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Left < _Right and operator< is strict weak ordering
	if (!(_Left < _Right))
		return (false);
	else if (_Right < _Left)
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}

template<class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt(const _Ty1& _Left, _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Left < _Right and operator< is strict weak ordering
	if (!(_Left < _Right))
		return (false);
	else if (_Right < _Left)
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}

template<class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt(_Ty1& _Left, const _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Left < _Right and operator< is strict weak ordering
	if (!(_Left < _Right))
		return (false);
	else if (_Right < _Left)
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}

template<class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt(_Ty1& _Left, _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Left < _Right and operator< is strict weak ordering
	if (!(_Left < _Right))
		return (false);
	else if (_Right < _Left)
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}


		// COMPARISON MACRO WITH PRED
 
  
 #line 306 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _Pr, class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt_pred(_Pr _Pred, const _Ty1& _Left, const _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Pred(_Left, _Right) and _Pred is strict weak ordering
	if (!_Pred(_Left, _Right))
		return (false);
	else if (_Pred(_Right, _Left))
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}

template<class _Pr, class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt_pred(_Pr _Pred, const _Ty1& _Left, _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Pred(_Left, _Right) and _Pred is strict weak ordering
	if (!_Pred(_Left, _Right))
		return (false);
	else if (_Pred(_Right, _Left))
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}

template<class _Pr, class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt_pred(_Pr _Pred, _Ty1& _Left, const _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Pred(_Left, _Right) and _Pred is strict weak ordering
	if (!_Pred(_Left, _Right))
		return (false);
	else if (_Pred(_Right, _Left))
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}

template<class _Pr, class _Ty1, class _Ty2> inline
	bool __cdecl _Debug_lt_pred(_Pr _Pred, _Ty1& _Left, _Ty2& _Right,
		const wchar_t *_Where, unsigned int _Line)
	{	// test if _Pred(_Left, _Right) and _Pred is strict weak ordering
	if (!_Pred(_Left, _Right))
		return (false);
	else if (_Pred(_Right, _Left))
		_Debug_message(L"invalid operator<", _Where, _Line);
	return (true);
	}


 































































































































































































































































#line 611 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"


template<class _Alloc>
	class _Container_base_aux_alloc_empty
		: public _Container_base
	{ // base class for containers to avoid holding allocator _Alaux
	protected:
	explicit _Container_base_aux_alloc_empty(_Alloc) { }

	_Container_base_aux_alloc_empty(const _Container_base_aux_alloc_empty&) { }

	_Container_base_aux_alloc_empty& operator=(const _Container_base_aux_alloc_empty&)
		{
		return *this;
		}

	~_Container_base_aux_alloc_empty() { }
	};




#line 634 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
	// We don't have an aux object.
	
#line 637 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"


//	ITERATOR STUFF (from <iterator>)

		// ITERATOR TAGS
struct input_iterator_tag
	{	// identifying tag for input iterators
	};

struct output_iterator_tag
	{	// identifying tag for output iterators
	};

struct forward_iterator_tag
	: public input_iterator_tag
	{	// identifying tag for forward iterators
	};

struct bidirectional_iterator_tag
	: public forward_iterator_tag
	{	// identifying tag for bidirectional iterators
	};

struct random_access_iterator_tag
	: public bidirectional_iterator_tag
	{	// identifying tag for random-access iterators
	};

struct _Int_iterator_tag
	{	// identifying tag for integer types, not an iterator
	};

struct _Float_iterator_tag
	{	// identifying tag for floating point types, not an iterator
	};

		// POINTER ITERATOR TAGS
struct _Nonscalar_ptr_iterator_tag
	{	// pointer to unknown type
	};
struct _Scalar_ptr_iterator_tag
	{	// pointer to scalar type
	};

		// TEMPLATE CLASS iterator
template<class _Category,
	class _Ty,
	class _Diff = ptrdiff_t,
	class _Pointer = _Ty *,
	class _Reference = _Ty&>
		struct iterator
			: public _Iterator_base_universal

	{	// base type for all iterator classes
	typedef _Category iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	// retained
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

template<class _Category,
	class _Ty,
	class _Diff = ptrdiff_t,
	class _Pointer = _Ty *,
	class _Reference = _Ty&,
	class _Base_class = _Iterator_base>
		struct _Iterator_with_base
			: public _Base_class

	{	// base type for all iterator classes
	typedef _Category iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	// retained
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

template<class _Ty,
	class _Diff,
	class _Pointer,
	class _Reference>
	struct _Bidit
		: public _Iterator_with_base<bidirectional_iterator_tag,
			_Ty, _Diff, _Pointer, _Reference>
	{	// base type for container bidirectional iterator classes
	};

template<class _Ty,
	class _Diff,
	class _Pointer,
	class _Reference>
	struct _Ranit
		: public _Iterator_with_base<random_access_iterator_tag,
			_Ty, _Diff, _Pointer, _Reference>
	{	// base type for container random-access iterator classes
	};

template<class _Ty,
	class _Diff,
	class _Pointer,
	class _Reference,
	class _Base_class>
	struct _Ranit_base
		: public _Base_class

	{	// base type for container random-access iterator classes
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef _Diff difference_type;
	typedef _Diff distance_type;	// retained
	typedef _Pointer pointer;
	typedef _Reference reference;
	};

struct _Outit
	: public iterator<output_iterator_tag, void, void,
		void, void>
	{	// base for output iterators
	};

		// TEMPLATE CLASS iterator_traits
template<class _Iter>
	struct iterator_traits
	{	// get traits from iterator _Iter
	typedef typename _Iter::iterator_category iterator_category;
	typedef typename _Iter::value_type value_type;
	typedef typename _Iter::difference_type difference_type;
	typedef difference_type distance_type;	// retained
	typedef typename _Iter::pointer pointer;
	typedef typename _Iter::reference reference;
	};

template<class _Ty>
	struct iterator_traits<_Ty *>
	{	// get traits from pointer
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef ptrdiff_t difference_type;
	typedef ptrdiff_t distance_type;	// retained
	typedef _Ty *pointer;
	typedef _Ty& reference;
	};

template<class _Ty>
	struct iterator_traits<const _Ty *>
	{	// get traits from const pointer
	typedef random_access_iterator_tag iterator_category;
	typedef _Ty value_type;
	typedef ptrdiff_t difference_type;
	typedef ptrdiff_t distance_type;	// retained
	typedef const _Ty *pointer;
	typedef const _Ty& reference;
	};

template<> struct iterator_traits<_Bool>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef _Bool value_type;
	typedef _Bool difference_type;
	typedef _Bool distance_type;
	typedef _Bool * pointer;
	typedef _Bool& reference;
	};

template<> struct iterator_traits<char>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef char value_type;
	typedef char difference_type;
	typedef char distance_type;
	typedef char * pointer;
	typedef char& reference;
	};

template<> struct iterator_traits<signed char>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef signed char value_type;
	typedef signed char difference_type;
	typedef signed char distance_type;
	typedef signed char * pointer;
	typedef signed char& reference;
	};

template<> struct iterator_traits<unsigned char>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned char value_type;
	typedef unsigned char difference_type;
	typedef unsigned char distance_type;
	typedef unsigned char * pointer;
	typedef unsigned char& reference;
	};

 
template<> struct iterator_traits<wchar_t>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef wchar_t value_type;
	typedef wchar_t difference_type;
	typedef wchar_t distance_type;
	typedef wchar_t * pointer;
	typedef wchar_t& reference;
	};
 #line 845 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

template<> struct iterator_traits<short>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef short value_type;
	typedef short difference_type;
	typedef short distance_type;
	typedef short * pointer;
	typedef short& reference;
	};

template<> struct iterator_traits<unsigned short>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned short value_type;
	typedef unsigned short difference_type;
	typedef unsigned short distance_type;
	typedef unsigned short * pointer;
	typedef unsigned short& reference;
	};

template<> struct iterator_traits<int>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef int value_type;
	typedef int difference_type;
	typedef int distance_type;	
	typedef int * pointer;
	typedef int& reference;
	};

template<> struct iterator_traits<unsigned int>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned int value_type;
	typedef unsigned int difference_type;
	typedef unsigned int distance_type;	
	typedef unsigned int * pointer;
	typedef unsigned int& reference;
	};

template<> struct iterator_traits<long>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef long value_type;
	typedef long difference_type;
	typedef long distance_type;	
	typedef long * pointer;
	typedef long& reference;
	};

template<> struct iterator_traits<unsigned long>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned long value_type;
	typedef unsigned long difference_type;
	typedef unsigned long distance_type;	
	typedef unsigned long * pointer;
	typedef unsigned long& reference;
	};

template<> struct iterator_traits<double>
	{
	typedef _Float_iterator_tag iterator_category;
	typedef double value_type;
	typedef double difference_type;
	typedef double distance_type;	
	typedef double * pointer;
	typedef double& reference;
	};

template<> struct iterator_traits<float>
	{
	typedef _Float_iterator_tag iterator_category;
	typedef float value_type;
	typedef float difference_type;
	typedef float distance_type;	
	typedef float * pointer;
	typedef float& reference;
	};

 
template<> struct iterator_traits<__int64>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef __int64 value_type;
	typedef __int64 difference_type;
	typedef __int64 distance_type;	
	typedef __int64 * pointer;
	typedef __int64& reference;
	};

template<> struct iterator_traits<unsigned __int64>
	{	// get traits from integer type
	typedef _Int_iterator_tag iterator_category;
	typedef unsigned __int64 value_type;
	typedef unsigned __int64 difference_type;
	typedef unsigned __int64 distance_type;	
	typedef unsigned __int64 * pointer;
	typedef unsigned __int64& reference;
	};
 #line 947 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION _Iter_cat
template<class _Iter> inline
	typename iterator_traits<_Iter>::iterator_category
		__cdecl _Iter_cat(const _Iter&)
	{	// return category from iterator argument
	typename iterator_traits<_Iter>::iterator_category _Cat;
	return (_Cat);
	}

		// TEMPLATE FUNCTION _Iter_random
		// Checks if both iterators belong to the random_access_iterator category;
		// if not, then it returns the forward_iterator tag.
template<class _Cat1, class _Cat2>
	class _Iter_random_helper
	{
	public:
		typedef forward_iterator_tag _Iter_random_cat;
	};

template<>
	class _Iter_random_helper<random_access_iterator_tag, random_access_iterator_tag>
	{
	public:
		typedef random_access_iterator_tag _Iter_random_cat;
	};

template<class _Cat1, class _Cat2, class _Cat3>
	class _Iter_random_helper3
	{
	public:
		typedef forward_iterator_tag _Iter_random_cat;
	};

template<>
	class _Iter_random_helper3<random_access_iterator_tag, random_access_iterator_tag, random_access_iterator_tag>
	{
	public:
		typedef random_access_iterator_tag _Iter_random_cat;
	};

template<class _Iter1, class _Iter2> inline
	typename _Iter_random_helper<
		typename iterator_traits<_Iter1>::iterator_category,
		typename iterator_traits<_Iter2>::iterator_category>::_Iter_random_cat
		__cdecl _Iter_random(const _Iter1&, const _Iter2&)
	{	// return category from iterator argument
	typename _Iter_random_helper<
		iterator_traits<_Iter1>::iterator_category, 
		iterator_traits<_Iter2>::iterator_category>::_Iter_random_cat _Cat;
	return (_Cat);
	}

template<class _Iter1, class _Iter2, class _Iter3> inline
	typename _Iter_random_helper3<
		typename iterator_traits<_Iter1>::iterator_category,
		typename iterator_traits<_Iter2>::iterator_category,
		typename iterator_traits<_Iter3>::iterator_category>::_Iter_random_cat
		__cdecl _Iter_random(const _Iter1&, const _Iter2&, const _Iter3&)
	{	// return category from iterator argument
	typename _Iter_random_helper3<
		iterator_traits<_Iter1>::iterator_category, 
		iterator_traits<_Iter2>::iterator_category,
		iterator_traits<_Iter3>::iterator_category>::_Iter_random_cat _Cat;
	return (_Cat);
	}

		// HELPER CLASS _If
		// Classic metaprogramming _If statement
	template <bool _Cond, class _Ty1, class _Ty2>
	class _If
	{
	public:
		typedef _Ty2 _Result;
	};

	template <class _Ty1, class _Ty2>
	class _If<true, _Ty1, _Ty2>
	{
	public:
		typedef _Ty1 _Result;
	};

		// HELPER CLASS _Secure_validation_helper
	template <bool _Secure_validation>
	class _Secure_validation_helper
	{
	public:
		typedef _Unchecked_iterator_tag _Checked_iterator_category;
	};

	template <>
	class _Secure_validation_helper<true>
	{
	public:
		typedef _Range_checked_iterator_tag _Checked_iterator_category;
	};


		// TEMPLATE FUNCTION _Checked_cat
	template <class _Iter, bool _Inherits_from_iterator_base>
	class _Checked_iterator_category_helper
	{
	public:
		typedef _Unchecked_iterator_tag _Checked_cat;
	};

	template <class _Iter>
	class _Checked_iterator_category_helper<_Iter, true>
	{
	public:
		typedef typename _Iter::_Checked_iterator_category _Checked_cat;
	};

	template <class _Iter>
	class _Checked_iterator_category
	{
	public:
		typedef typename _Checked_iterator_category_helper<_Iter, __is_base_of(_Iterator_base_universal, _Iter)>::_Checked_cat _Checked_cat;
	};

	template<class _Iter> 
	inline
	typename _Checked_iterator_category<_Iter>::_Checked_cat _Checked_cat(const _Iter&)
	{
		typename _Checked_iterator_category<_Iter>::_Checked_cat _Cat;
		return (_Cat);
	}

		// TEMPLATE FUNCTION _Checked_base
	template <class _Iter, bool _Inherits_from_iterator_base>
	class _Checked_iterator_base_helper2
	{
	public:
		typedef _Unchanged_checked_iterator_base_type_tag _Checked_iterator_base_type;
	};

	template <class _Iter>
	class _Checked_iterator_base_helper2<_Iter, true>
	{
	public:
		typedef typename _Iter::_Checked_iterator_base_type _Checked_iterator_base_type;
	};

	template <class _Iter, class _Base_type>
	class _Checked_iterator_base_helper1
	{
	public:
		typedef _Different_checked_iterator_base_type_tag _Base_type_tag;
		typedef _Base_type _Checked_iterator_base_type;
	};

	template <class _Iter>
	class _Checked_iterator_base_helper1<_Iter, _Unchanged_checked_iterator_base_type_tag>
	{
	public:
		typedef _Unchanged_checked_iterator_base_type_tag _Base_type_tag;
		typedef _Iter _Checked_iterator_base_type;
	};

	template <class _Iter>
	class _Checked_iterator_base_helper
	{
	public:
		typedef _Checked_iterator_base_helper2<_Iter, __is_base_of(_Iterator_base_universal, _Iter)> _Base_helper2;
		typedef _Checked_iterator_base_helper1<_Iter, typename  _Base_helper2::_Checked_iterator_base_type > _Base_helper1;

		typedef typename _Base_helper1::_Base_type_tag _Checked_iterator_base_type_tag;
		typedef typename _Base_helper1::_Checked_iterator_base_type _Checked_iterator_base_type;
	};

	template<class _Iter, class _Base_tag>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(const _Iter &_It, _Base_tag)
	{
		return _It._Checked_iterator_base();
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(const _Iter &_It, _Unchanged_checked_iterator_base_type_tag)
	{
		return _It;
	}

	template<class _Iter, class _Base_tag>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(_Iter &_It, _Base_tag)
	{
		return _It._Checked_iterator_base();
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(_Iter &_It, _Unchanged_checked_iterator_base_type_tag)
	{
		return _It;
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(const _Iter &_It)
	{
		typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type_tag _Base_tag;
		return _Checked_base(_It, _Base_tag);
	}

	template<class _Iter>
	inline
	typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type
		__cdecl _Checked_base(_Iter &_It)
	{
		typename _Checked_iterator_base_helper<_Iter>::_Checked_iterator_base_type_tag _Base_tag;
		return _Checked_base(_It, _Base_tag);
	}

		// TEMPLATE FUNCTION _Checked_assign_from_base

	template<class _DstIter, class _BaseIter>
	inline
	void __cdecl _Checked_assign_from_base(_DstIter &_Dest, const _BaseIter &_Src)
	{
		_Dest._Checked_iterator_assign_from_base(_Src);
	}

	template<class _Iter>
	inline
	void __cdecl _Checked_assign_from_base(_Iter &_Dest, const _Iter &_Src)
	{
		_Dest = _Src;
	}

		// TEMPLATE FUNCTION _Move_cat
 
 
 #line 1188 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	// default _Move_operation_category; std containers like vector, list overloads this trait class
	template <class _Value>
	class _Move_operation_category
	{
	public:
		typedef _Undefined_move_tag _Move_cat;
	};

	template<class _Iter>
	inline
		typename _Move_operation_category<typename iterator_traits<_Iter>::value_type>::_Move_cat _Move_cat(const _Iter&)
	{
		typename _Move_operation_category<typename iterator_traits<_Iter>::value_type>::_Move_cat _Cat;
		return (_Cat);
	}

template<class _Ty>
	struct _Is_swap_move
	{	// assumes _Ty is not _Swap_move_tag
	static const bool _Value = false;
	};

template<>
	struct _Is_swap_move<_Swap_move_tag>
	{	// reports true for _Swap_move_tag
	static const bool _Value = true;
	};

template<class _Ty1,
	class _Ty2>
	class _Move_operation_category<pair<_Ty1, _Ty2> >
	{	// pair implements a performant swap if both elements do
public:
	typedef typename _If<
		_Is_swap_move<typename _Move_operation_category<
			_Ty1>::_Move_cat>::_Value &&
		_Is_swap_move<typename _Move_operation_category<
			_Ty2>::_Move_cat>::_Value,
		_Swap_move_tag,
		_Undefined_move_tag>::_Result _Move_cat;
	};

		// TEMPLATE FUNCTION _Ptr_cat
template<class _T1, class _T2, class _Checked_Cat1, class _Checked_Cat2>
struct _Ptr_cat_with_checked_cat_helper
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _T1,	class _T2>
struct _Ptr_cat_helper
	{
	typedef typename _Ptr_cat_with_checked_cat_helper<_T1, _T2, 
		typename _Checked_iterator_category<_T1>::_Checked_cat,
		typename _Checked_iterator_category<_T2>::_Checked_cat>::_Ptr_cat _Ptr_cat;
	};

template<class _T1,	class _T2, class _Checked_Cat1>
struct _Ptr_cat_with_checked_cat_helper<_T1, _T2, _Checked_Cat1, _Range_checked_iterator_tag>
	{
	typedef typename _Ptr_cat_helper<_T1, typename _T2::_Inner_type>::_Ptr_cat _Ptr_cat;
	};

template<class _T1,	class _T2, class _Checked_Cat2>
struct _Ptr_cat_with_checked_cat_helper<_T1, _T2, _Range_checked_iterator_tag, _Checked_Cat2>
	{
	typedef typename _Ptr_cat_helper<typename _T1::_Inner_type, _T2>::_Ptr_cat _Ptr_cat;
	};

template<class _T1,	class _T2>
struct _Ptr_cat_with_checked_cat_helper<_T1, _T2, _Range_checked_iterator_tag, _Range_checked_iterator_tag>
	{
	typedef typename _Ptr_cat_helper<typename _T1::_Inner_type, typename _T2::_Inner_type>::_Ptr_cat _Ptr_cat;
	};

template<class _T1>
struct _Ptr_cat_helper<_T1, _Undefined_inner_type_tag>
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _T2>
struct _Ptr_cat_helper<_Undefined_inner_type_tag, _T2>
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<_Undefined_inner_type_tag, _Undefined_inner_type_tag>
	{
	typedef _Nonscalar_ptr_iterator_tag _Ptr_cat;
	};

		// INTEGER FUNCTION _Ptr_cat
template<>
struct _Ptr_cat_helper<_Bool *, _Bool *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const _Bool *, _Bool *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<char *, char *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const char *, char *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<signed char *, signed char *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const signed char *, signed char *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned char *, unsigned char *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned char *, unsigned char *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

 

template<>
struct _Ptr_cat_helper<wchar_t *, wchar_t *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const wchar_t *, wchar_t *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

 #line 1346 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
template<>
struct _Ptr_cat_helper<short *, short *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const short *, short *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned short *, unsigned short *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned short *, unsigned short *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<int *, int *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const int *, int *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned int *, unsigned int *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned int *, unsigned int *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<long *, long *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const long *, long *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned long *, unsigned long *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned long *, unsigned long *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<float *, float *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const float *, float *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<double *, double *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const double *, double *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<long double *, long double *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const long double *, long double *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

 

template<>
struct _Ptr_cat_helper<__int64 *, __int64 *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const __int64 *, __int64 *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<unsigned __int64 *, unsigned __int64 *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<>
struct _Ptr_cat_helper<const unsigned __int64 *, unsigned __int64 *>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

 #line 1481 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

template<class _Ty>
struct _Ptr_cat_helper<_Ty **, _Ty **>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _Ty>
struct _Ptr_cat_helper<_Ty **, const _Ty **>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _Ty>
struct _Ptr_cat_helper<_Ty *const *, _Ty **>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

template<class _Ty>
struct _Ptr_cat_helper<_Ty *const *, const _Ty **>
	{	// return pointer category from pointer to pointer arguments
	typedef _Scalar_ptr_iterator_tag _Ptr_cat;
	};

/* use _Ptr_cat_helper to determine the type of the pointer category */
template<class _T1, class _T2> inline 
typename _Ptr_cat_helper<_T1, _T2>::_Ptr_cat __cdecl _Ptr_cat(_T1&, _T2&)
	{
	typename _Ptr_cat_helper<_T1, _T2>::_Ptr_cat _Cat;
	return (_Cat);
	}


 
#line 1517 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"


 
#line 1521 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

 
		// ITERATOR DEBUGGING MACROS
  





 



 

 
 
  
 #line 1540 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

 

 


 
  
 #line 1549 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

 

 


		// TEMPLATE FUNCTION _Debug_pointer
template<class _InIt> inline
	void __cdecl _Debug_pointer(_InIt&, const wchar_t *, unsigned int)
	{	// test pointer for non-singularity, arbitrary type
	}

template<class _Ty> inline
	void __cdecl _Debug_pointer(const _Ty *_First, const wchar_t *_File, unsigned int _Line)
	{	// test iterator for non-singularity, const pointers
	if (_First == 0)
		_Debug_message(L"invalid null pointer", _File, _Line);
	}

template<class _Ty> inline
	void __cdecl _Debug_pointer(_Ty *_First, const wchar_t *_File, unsigned int _Line)
	{	// test iterator for non-singularity, pointers
	if (_First == 0)
		_Debug_message(L"invalid null pointer", _File, _Line);
	}

		// TEMPLATE FUNCTION _Debug_range
template<class _InIt> inline
	void __cdecl _Debug_range2(_InIt, _InIt, const wchar_t *, unsigned int ,
		input_iterator_tag)
	{	// test iterator pair for valid range, arbitrary iterators
	}

template<class _RanIt> inline
	void __cdecl _Debug_range2(_RanIt _First, _RanIt _Last, const wchar_t *_File, unsigned int _Line,
		random_access_iterator_tag)
	{	// test iterator pair for valid range, random-access iterators
	if (_First != _Last)
		{	// check for non-null pointers, valid range
		_Debug_pointer(_First, _File, _Line);
		_Debug_pointer(_Last, _File, _Line);
		if (_Last < _First)
			_Debug_message(L"invalid iterator range", _File, _Line);
		}
	}

template<class _InIt> inline
	void __cdecl _Debug_range(_InIt _First, _InIt _Last, const wchar_t *_File, unsigned int _Line)
	{	// test iterator pair for valid range
	_Debug_range2(_First, _Last, _File, _Line, _Iter_cat(_First));
	}

		// TEMPLATE FUNCTION _Debug_order
template<class _InIt> inline
	void __cdecl _Debug_order2(_InIt _First, _InIt _Last,
		const wchar_t *_File, unsigned int _Line, input_iterator_tag)
	{	// test if range is ordered by operator<, input iterators
	}

template<class _FwdIt> inline
	void __cdecl _Debug_order2(_FwdIt _First, _FwdIt _Last,
		const wchar_t *_File, unsigned int _Line, forward_iterator_tag)
	{	// test if range is ordered by operator<, forward iterators
	if (_First != _Last)
		for (_FwdIt _Next = _First; ++_Next != _Last; ++_First)
			if (_Debug_lt(*_Next, *_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 1614))
				_Debug_message(L"sequence not ordered", _File, _Line);
	}

template<class _InIt> inline
	void __cdecl _Debug_order(_InIt _First, _InIt _Last,
		const wchar_t *_File, unsigned int _Line)
	{	// test is range is ordered by operator<
	_Debug_range(_First, _Last, _File, _Line);
	_Debug_order2(_First, _Last, _File, _Line, _Iter_cat(_First));
	}

		// TEMPLATE FUNCTION _Debug_order WITH PRED
template<class _InIt,
	class _Pr> inline
	void __cdecl _Debug_order2(_InIt _First, _InIt _Last, _Pr _Pred,
		const wchar_t *_File, unsigned int _Line, input_iterator_tag)
	{	// test if range is ordered by predicate, input iterators
	}

template<class _FwdIt,
	class _Pr> inline
	void __cdecl _Debug_order2(_FwdIt _First, _FwdIt _Last, _Pr _Pred,
		const wchar_t *_File, unsigned int _Line, forward_iterator_tag)
	{	// test if range is ordered by predicate, forward iterators
	if (_First != _Last)
		for (_FwdIt _Next = _First; ++_Next != _Last; ++_First)
			if (_Debug_lt_pred(_Pred, *_Next, *_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 1641))
				_Debug_message(L"sequence not ordered", _File, _Line);
	}

template<class _InIt,
	class _Pr> inline
	void __cdecl _Debug_order(_InIt _First, _InIt _Last, _Pr _Pred,
		const wchar_t *_File, unsigned int _Line)
	{	// test if range is ordered by predicate
	_Debug_range(_First, _Last, _File, _Line);
	_Debug_pointer(_Pred, _File, _Line);
	_Debug_order2(_First, _Last, _Pred, _File, _Line, _Iter_cat(_First));
	}

		// TEMPLATE FUNCTION _Debug_order_single
template<class _InIt> inline
	void __cdecl _Debug_order_single2(_InIt _First, _InIt _Last, bool _IsFirstIteration,
		const wchar_t *_File, unsigned int _Line, input_iterator_tag)
	{	// test if _First and ++_First are ordered by operator<, input iterators
	}

template<class _FwdIt> inline
	void __cdecl _Debug_order_single2(_FwdIt _First, _FwdIt _Last, bool /* _IsFirstIteration */,
		const wchar_t *_File, unsigned int _Line, forward_iterator_tag)
	{	// test if _First and ++_First are ordered by operator<, forward iterators
	if (_First != _Last)
		{
		_FwdIt _Next = _First;
		if (++_Next != _Last)
			if (_Debug_lt(*_Next, *_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 1670))
				_Debug_message(L"sequence not ordered", _File, _Line);
		}
	}

template<class _InIt> inline
	void __cdecl _Debug_order_single(_InIt _First, _InIt _Last, bool _IsFirstIteration,
		const wchar_t *_File, unsigned int _Line)
	{	// test if _First and ++_First are ordered by operator<
	_Debug_order_single2(_First, _Last, _IsFirstIteration, _File, _Line, _Iter_cat(_First));
	}

		// TEMPLATE FUNCTION _Debug_order_single WITH PRED
template<class _InIt,
	class _Pr> inline
	void __cdecl _Debug_order_single2(_InIt _First, _InIt _Last, _Pr _Pred, bool _IsFirstIteration,
		const wchar_t *_File, unsigned int _Line, input_iterator_tag)
	{	// test if _First and ++_First ordered by predicate, input iterators
	}

template<class _FwdIt,
	class _Pr> inline
	void __cdecl _Debug_order_single2(_FwdIt _First, _FwdIt _Last, _Pr _Pred, bool _IsFirstIteration,
		const wchar_t *_File, unsigned int _Line, forward_iterator_tag)
	{	// test if _First and ++_First ordered by predicate, forward iterators
	if (_First != _Last)
		{
		_FwdIt _Next = _First;
		if (++_Next != _Last)
			if (_Debug_lt_pred(_Pred, *_Next, *_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 1699))
				_Debug_message(L"sequence not ordered", _File, _Line);
		}
	}

template<class _InIt,
	class _Pr> inline
	void __cdecl _Debug_order_single(_InIt _First, _InIt _Last, _Pr _Pred, bool _IsFirstIteration,
		const wchar_t *_File, unsigned int _Line)
	{	// test if _First and ++_First is ordered by predicate
	_Debug_order_single2(_First, _Last, _Pred, _IsFirstIteration, _File, _Line, _Iter_cat(_First));
	}

 








#line 1722 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

 

  // _CHECKED_CAT retrieves whether an iterator is checked.
  // It returns one of the range checked iterator tags:
  //    _Unchecked_iterator_tag: the iterator is unchecked;
  //    _Range_checked_iterator_tag: the iterator is checked.
  // To change the checked iterator category in your own iterators,
  // you will need to overload the _Checked_iterator_category typedef.
  
  
  // _CHECKED_BASE retrieves the base of a checked iterator.
  // The base type of a checked iterator is supposed to be more
  // performant, but usually do not perform validation. See the standard
  // algorithm implementations for examples on how to use _CHECKED_BASE.
  // To change the checked iterator base type in your own iterators,
  // you will need to overload the _Checked_iterator_base_type typedef.
  
  


  // _ASSIGN_FROM_BASE assign the value of _Src iterator to _Dest.
  // _Src is assumed to be the base of the checked iterator _Dest.
  // See the standard algorithm implementations for examples on how 
  // to use _ASSIGN_FROM_BASE.
  // To change the checked iterator base type in your own iterators,
  // you will need to overload the _Checked_iterator_assign_from_base()
  // method.
  

 






#line 1760 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION _Val_type

template<class _Iter> inline
	typename iterator_traits<_Iter>::value_type *__cdecl _Val_type(_Iter)
	{	// return value type from arbitrary argument
	return (0);
	}

		// TEMPLATE FUNCTION advance
template<class _InIt,
	class _Diff> inline
	void __cdecl advance(_InIt& _Where, _Diff _Off)
	{	// increment iterator by offset, arbitrary iterators
	_Advance(_Where, _Off, _Iter_cat(_Where));
	}

template<class _InIt,
	class _Diff> inline
	void __cdecl _Advance(_InIt& _Where, _Diff _Off, input_iterator_tag)
	{	// increment iterator by offset, input iterators

 
//	if (_Off < 0)
//		_DEBUG_ERROR("negative offset in advance");
 #line 1786 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	for (; 0 < _Off; --_Off)
		++_Where;
	}

template<class _FI,
	class _Diff> inline
	void __cdecl _Advance(_FI& _Where, _Diff _Off, forward_iterator_tag)
	{	// increment iterator by offset, forward iterators

 
//	if (_Off < 0)
//		_DEBUG_ERROR("negative offset in advance");
 #line 1800 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	for (; 0 < _Off; --_Off)
		++_Where;
	}

#pragma warning(push)
#pragma warning(disable: 6295)
template<class _BI,
	class _Diff> inline
	void __cdecl _Advance(_BI& _Where, _Diff _Off, bidirectional_iterator_tag)
	{	// increment iterator by offset, bidirectional iterators
	for (; 0 < _Off; --_Off)
		++_Where;
	for (; _Off < 0; ++_Off)
		--_Where;
	}
#pragma warning(pop)

template<class _RI,
	class _Diff> inline
	void __cdecl _Advance(_RI& _Where, _Diff _Off, random_access_iterator_tag)
	{	// increment iterator by offset, random-access iterators
	_Where += _Off;
	}

		// TEMPLATE FUNCTION _Dist_type

template<class _Iter> inline
	typename iterator_traits<_Iter>::difference_type
		* __cdecl _Dist_type(_Iter)
	{	// return distance type from arbitrary argument
	return (0);
	}

		// TEMPLATE FUNCTIONS distance and _Distance
template<class _InIt,
	class _Diff> inline
		void __cdecl _Distance2(_InIt _First, _InIt _Last, _Diff& _Off,
			input_iterator_tag)
	{	// add to _Off distance between input iterators
	for (; _First != _Last; ++_First)
		++_Off;
	}

template<class _FwdIt,
	class _Diff> inline
		void __cdecl _Distance2(_FwdIt _First, _FwdIt _Last, _Diff& _Off,
			forward_iterator_tag)
	{	// add to _Off distance between forward iterators (redundant)
	for (; _First != _Last; ++_First)
		++_Off;
	}

template<class _BidIt,
	class _Diff> inline
		void __cdecl _Distance2(_BidIt _First, _BidIt _Last, _Diff& _Off,
			bidirectional_iterator_tag)
	{	// add to _Off distance between bidirectional iterators (redundant)
	for (; _First != _Last; ++_First)
		++_Off;
	}

template<class _RanIt,
	class _Diff> inline
		void __cdecl _Distance2(_RanIt _First, _RanIt _Last, _Diff& _Off,
			random_access_iterator_tag)
	{	// add to _Off distance between random-access iterators

 
	if (_First != _Last)
		{	// check for null pointers
		_Debug_pointer(_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",1871);
		_Debug_pointer(_Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",1872);
		}
 #line 1875 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	_Off += _Last - _First;
	}

template<class _InIt> inline
	typename iterator_traits<_InIt>::difference_type
		__cdecl distance(_InIt _First, _InIt _Last)
	{	// return distance between iterators
	typename iterator_traits<_InIt>::difference_type _Off = 0;
	_Distance2(_First, _Last, _Off, _Iter_cat(_First));
	return (_Off);
	}


template<class _InIt,
	class _Diff> inline
		void __cdecl _Distance(_InIt _First, _InIt _Last, _Diff& _Off)
	{	// add to _Off distance between iterators
	_Distance2(_First, _Last, _Off, _Iter_cat(_First));
	}

		// TEMPLATE CLASS _Revranit
template<class _RanIt,
	class _Base>
	class _Revranit
		: public _Base
	{	// wrap iterator to run it backwards
public:
	typedef _Revranit<_RanIt, _Base> _Myt;
	typedef typename iterator_traits<_RanIt>::iterator_category iterator_category;
	typedef typename iterator_traits<_RanIt>::value_type value_type;
	typedef typename iterator_traits<_RanIt>::difference_type difference_type;
	typedef typename iterator_traits<_RanIt>::difference_type distance_type;	// retained
	typedef typename iterator_traits<_RanIt>::pointer pointer;
	typedef typename iterator_traits<_RanIt>::reference reference;
	typedef _RanIt iterator_type;

	 _Revranit()
		{	// construct with default wrapped iterator
		}

	explicit  _Revranit(_RanIt _Right)
		: current(_Right)
		{	// construct wrapped iterator from _Right
		}

	template<class _RanIt2,
		class _Base2>
		_Revranit(const _Revranit<_RanIt2, _Base2>& _Right)
		: current(_Right.base())
		{	// initialize with compatible base
		}

	_RanIt  base() const
		{	// return wrapped iterator
		return (current);
		}

	reference  operator*() const
		{	// return designated value
		_RanIt _Tmp = current;
		return (*--_Tmp);
		}

	pointer  operator->() const
		{	// return pointer to class object
		return (&**this);
		}

	_Myt&  operator++()
		{	// preincrement
		--current;
		return (*this);
		}

	_Myt  operator++(int)
		{	// postincrement
		_Myt _Tmp = *this;
		--current;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	// predecrement
		++current;
		return (*this);
		}

	_Myt  operator--(int)
		{	// postdecrement
		_Myt _Tmp = *this;
		++current;
		return (_Tmp);
		}

	template<class _RanIt2,
		class _Base2>
		bool  _Equal(const _Revranit<_RanIt2, _Base2>& _Right) const
		{	// test for iterator equality
		return (current == _Right.base());
		}

// N.B. functions valid for random-access iterators only beyond this point

	_Myt&  operator+=(difference_type _Off)
		{	// increment by integer
		current -= _Off;
		return (*this);
		}

	_Myt  operator+(difference_type _Off) const
		{	// return this + integer
		return (_Myt(current - _Off));
		}

	_Myt&  operator-=(difference_type _Off)
		{	// decrement by integer
		current += _Off;
		return (*this);
		}

	_Myt  operator-(difference_type _Off) const
		{	// return this - integer
		return (_Myt(current + _Off));
		}

	reference  operator[](difference_type _Off) const
		{	// subscript
		return (*(*this + _Off));
		}

	template<class _RanIt2,
		class _Base2>
		bool  _Less(const _Revranit<_RanIt2, _Base2>& _Right) const
		{	// test if this < _Right
		return (_Right.base() < current);
		}

	template<class _RanIt2,
		class _Base2>
		difference_type  _Minus(const _Revranit<_RanIt2, _Base2>& _Right) const
		{	// return difference of iterators
		return (_Right.base() - current);
		}

protected:
	_RanIt current;	// the wrapped iterator
	};

		// _Revranit TEMPLATE OPERATORS
template<class _RanIt,
	class _Base,
	class _Diff> inline
	_Revranit<_RanIt, _Base>
		operator+(_Diff _Off,
		const _Revranit<_RanIt, _Base>& _Right)
	{	// return reverse_iterator + integer
	return (_Right + _Off);
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	typename _Base1::difference_type operator-(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// return difference of reverse_iterators
	return (_Left._Minus(_Right));
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	bool operator==(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// test for reverse_iterator equality
	return (_Left._Equal(_Right));
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	bool operator!=(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// test for reverse_iterator inequality
	return (!(_Left == _Right));
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	bool operator<(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// test for reverse_iterator < reverse_iterator
	return (_Left._Less(_Right));
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	bool operator>(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// test for reverse_iterator > reverse_iterator
	return (_Right < _Left);
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	bool operator<=(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// test for reverse_iterator <= reverse_iterator
	return (!(_Right < _Left));
	}

template<class _RanIt1,
	class _Base1,
	class _RanIt2,
	class _Base2> inline
	bool operator>=(
		const _Revranit<_RanIt1, _Base1>& _Left,
		const _Revranit<_RanIt2, _Base2>& _Right)
	{	// test for reverse_iterator >= reverse_iterator
	return (!(_Left < _Right));
	}

		// TEMPLATE CLASS reverse_iterator
template<class _RanIt>
	class reverse_iterator
		: public _Revranit<_RanIt, iterator<
			typename iterator_traits<_RanIt>::iterator_category,
			typename iterator_traits<_RanIt>::value_type,
			typename iterator_traits<_RanIt>::difference_type,
			typename iterator_traits<_RanIt>::pointer,
			typename iterator_traits<_RanIt>::reference> >
	{	// wrap iterator to run it backwards
	typedef reverse_iterator<_RanIt> _Myt;
	typedef _Revranit<_RanIt, iterator<
			typename iterator_traits<_RanIt>::iterator_category,
			typename iterator_traits<_RanIt>::value_type,
			typename iterator_traits<_RanIt>::difference_type,
			typename iterator_traits<_RanIt>::pointer,
			typename iterator_traits<_RanIt>::reference> > _Mybase;

public:
	typedef typename iterator_traits<_RanIt>::iterator_category iterator_category;
	typedef typename iterator_traits<_RanIt>::value_type value_type;
	typedef typename iterator_traits<_RanIt>::difference_type difference_type;
	typedef typename iterator_traits<_RanIt>::difference_type distance_type;	// retained
	typedef typename iterator_traits<_RanIt>::pointer pointer;
	typedef typename iterator_traits<_RanIt>::reference reference;
	typedef _RanIt iterator_type;

	 reverse_iterator()
		{	// construct with default wrapped iterator
		}

	explicit  reverse_iterator(_RanIt _Right)
		: _Mybase(_Right)
		{	// construct wrapped iterator from _Right
		}

	template<class _Other>
		 reverse_iterator(const reverse_iterator<_Other>& _Right)
		: _Mybase(_Right.base())
		{	// initialize with compatible base
		}

	 reverse_iterator(_Mybase _Right)
		: _Mybase(_Right)
		{	// construct wrapped iterator from base object
		}


	typedef typename ::std:: _Checked_iterator_category<_RanIt>::_Checked_cat _Checked_iterator_category;
	typedef reverse_iterator<typename _Checked_iterator_base_helper<_RanIt>::_Checked_iterator_base_type> _Checked_iterator_base_type;
 
	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		typename _Checked_iterator_base_type _Base(::std:: _Checked_base(this->current));
		return _Base;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		::std:: _Checked_assign_from_base(this->current, _Base.base());
	}
#line 2174 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	_Myt& operator++()
		{	// preincrement
		++*((_Mybase *)this);
		return (*this);
		}

	_Myt operator++(int)
		{	// postincrement
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt& operator--()
		{	// predecrement
		--*((_Mybase *)this);
		return (*this);
		}

	_Myt operator--(int)
		{	// postdecrement
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt& operator+=(difference_type _Off)
		{	// increment by integer
		*((_Mybase *)this) += _Off;
		return (*this);
		}

	_Myt operator+(difference_type _Off) const
		{	// return this + integer
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt& operator-=(difference_type _Off)
		{	// decrement by integer
		*((_Mybase *)this) -= _Off;
		return (*this);
		}

	_Myt operator-(difference_type _Off) const
		{	// return this - integer
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}
	};

		// reverse_iterator TEMPLATE OPERATORS
template<class _RanIt,
	class _Diff> inline
	reverse_iterator<_RanIt> __cdecl operator+(_Diff _Off,
		const reverse_iterator<_RanIt>& _Right)
	{	// return reverse_iterator + integer
	return (_Right + _Off);
	}

template<class _RanIt1,
	class _RanIt2> inline
	typename reverse_iterator<_RanIt1>::difference_type
		__cdecl operator-(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// return difference of reverse_iterators
	return (_Left._Minus(_Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator==(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// test for reverse_iterator equality
	return (_Left._Equal(_Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator!=(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// test for reverse_iterator inequality
	return (!(_Left == _Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator<(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// test for reverse_iterator < reverse_iterator
	return (_Left._Less(_Right));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator>(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// test for reverse_iterator > reverse_iterator
	return (_Right < _Left);
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator<=(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// test for reverse_iterator <= reverse_iterator
	return (!(_Right < _Left));
	}

template<class _RanIt1,
	class _RanIt2> inline
	bool __cdecl operator>=(const reverse_iterator<_RanIt1>& _Left,
		const reverse_iterator<_RanIt2>& _Right)
	{	// test for reverse_iterator >= reverse_iterator
	return (!(_Left < _Right));
	}

		// TEMPLATE CLASS reverse_bidirectional_iterator (retained)
template<class _BidIt,
	class _Ty,
	class _Reference = _Ty&,
	class _Pointer = _Ty *,
	class _Diff = ptrdiff_t>
	class reverse_bidirectional_iterator
		: public iterator<bidirectional_iterator_tag, _Ty, _Diff,
			_Pointer, _Reference>
	{	// wrap bidirectional iterator to run it backwards
public:
	typedef reverse_bidirectional_iterator<_BidIt, _Ty, _Reference,
		_Pointer, _Diff> _Myt;
	typedef _BidIt iterator_type;

	 reverse_bidirectional_iterator()
		{	// construct with default wrapped iterator
		}

	explicit  reverse_bidirectional_iterator(_BidIt _Right)
		: current(_Right)
		{	// construct wrapped iterator from _Right
		}

	_BidIt  base() const
		{	// return wrapped iterator
		return (current);
		}

	_Reference  operator*() const
		{	// return designated value
		_BidIt _Tmp = current;
		return (*--_Tmp);
		}

	_Pointer  operator->() const
		{	// return pointer to class object
		_Reference _Tmp = **this;
		return (&_Tmp);
		}

	_Myt&  operator++()
		{	// preincrement
		--current;
		return (*this);
		}

	_Myt  operator++(int)
		{	// postincrement
		_Myt _Tmp = *this;
		--current;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	// predecrement
		++current;
		return (*this);
		}

	_Myt  operator--(int)
		{	// postdecrement
		_Myt _Tmp = *this;
		++current;
		return (_Tmp);
		}

	bool  operator==(const _Myt& _Right) const
		{	// test for iterator equality
		return (current == _Right.current);
		}

	bool  operator!=(const _Myt& _Right) const
		{	// test for iterator inequality
		return (!(*this == _Right));
		}

protected:
	_BidIt current;	// the wrapped iterator
	};

		// TEMPLATE CLASS _Revbidit
template<class _BidIt,
	class _BidIt2 = _BidIt>
	class _Revbidit
		: public iterator<
			typename iterator_traits<_BidIt>::iterator_category,
			typename iterator_traits<_BidIt>::value_type,
			typename iterator_traits<_BidIt>::difference_type,
			typename iterator_traits<_BidIt>::pointer,
			typename iterator_traits<_BidIt>::reference>
	{	// wrap bidirectional iterator to run it backwards
public:
	typedef _Revbidit<_BidIt, _BidIt2> _Myt;
	typedef typename iterator_traits<_BidIt>::difference_type _Diff;
	typedef typename iterator_traits<_BidIt>::pointer _Pointer;
	typedef typename iterator_traits<_BidIt>::reference _Reference;
	typedef _BidIt iterator_type;

	 _Revbidit()
		{	// construct with default wrapped iterator
		}

	explicit  _Revbidit(_BidIt _Right)
		: current(_Right)
		{	// construct wrapped iterator from _Right
		}

	 _Revbidit(const _Revbidit<_BidIt2>& _Other)
		: current (_Other.base())
		{	// const converter or copy constructor
		}

	_BidIt  base() const
		{	// return wrapped iterator
		return (current);
		}

	_Reference  operator*() const
		{	// return designated value
		_BidIt _Tmp = current;
		return (*--_Tmp);
		}

	_Pointer  operator->() const
		{	// return pointer to class object
		_Reference _Tmp = **this;
		return (&_Tmp);
		}

	_Myt&  operator++()
		{	// preincrement
		--current;
		return (*this);
		}

	_Myt  operator++(int)
		{	// postincrement
		_Myt _Tmp = *this;
		--current;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	// predecrement
		++current;
		return (*this);
		}

	_Myt  operator--(int)
		{	// postdecrement
		_Myt _Tmp = *this;
		++current;
		return (_Tmp);
		}

	bool  operator==(const _Myt& _Right) const
		{	// test for iterator equality
		return (current == _Right.current);
		}

	bool  operator!=(const _Myt& _Right) const
		{	// test for iterator inequality
		return (!(*this == _Right));
		}

protected:
	_BidIt current;
	};

//	ALGORITHM STUFF (from <algorithm>)

		// TEMPLATE FUNCTION copy
template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	// copy [_First, _Last) to [_Dest, ...), arbitrary iterators
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2470);
	for (; _First != _Last; ++_Dest, ++_First)
		*_Dest = *_First;
	return (_Dest);
	}


template<class _InIt, class _OutIt>
inline
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		random_access_iterator_tag, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	// copy [_First, _Last) to [_Dest, ...), random_access iterators
	// if _OutIt is range checked, this will make sure there is enough space for the copy
	_OutIt _Result = _Dest + (_Last - _First);
	_Copy_opt(_First, _Last, ::std:: _Checked_base(_Dest), 
		forward_iterator_tag(), _Nonscalar_ptr_iterator_tag(), _Range_checked_iterator_tag());
	return _Result;
	}
#line 2489 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Copy_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	// copy [_First, _Last) to [_Dest, ...), pointers to scalars

 
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2497);
	if (_First != _Last)
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",2499);
 #line 2501 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	ptrdiff_t _Off = _Last - _First;	// NB: non-overlapping move
	// if _OutIt is range checked, this will make sure there is enough space for the memmove
	_OutIt _Result = _Dest + _Off;
	if (_Off > 0)
		::memmove_s((&*_Dest), (_Off * sizeof (*_First)), (&*_First), (_Off * sizeof (*_First)));
	return _Result;
	}

template <bool _Cond, class _Result_type>
struct _Enable_if;

template <class _Result_type>
struct _Enable_if<true, _Result_type>
{
	typedef _Result_type _Result;
};

template <class _Checked_iter_cat>
struct _Is_checked_iterator_helper
{
	enum { _Result = false };
};

template <>
struct _Is_checked_iterator_helper<_Range_checked_iterator_tag>
{
	enum { _Result = true };
};

template <class _Iter>
struct _Is_checked_iterator
{
	enum { _Result = 
		_Is_checked_iterator_helper<typename _Checked_iterator_category<_Iter>::_Checked_cat>::_Result };
};





















template<class _InIt, class _OutIt>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// copy [_First, _Last) to [_Dest, ...)
	return (_Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, 
		_Iter_random(_First, _Dest), _Ptr_cat(_First, _Dest), _Range_checked_iterator_tag()));
	}

template<class _InIt, class _OutElem, size_t _Size>
inline
_OutElem* __cdecl copy(_InIt _First, _InIt _Last, _OutElem (&_Dest)[_Size])
	{	// copy [_First, _Last) to [_Dest, ...)
	return copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), ::stdext:: make_checked_array_iterator(_Dest, _Size)).base();
	}

template<class _InIt, class _OutIt>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// copy [_First, _Last) to [_Dest, ...)
	return (_Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, 
		_Iter_random(_First, _Dest), _Ptr_cat(_First, _Dest), _Range_checked_iterator_tag()));
	}











#line 2593 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION _Move
template<class _InIt, class _OutIt, class _InOutItCat, class _MoveCatTy>
inline
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat _First_dest_cat, _MoveCatTy, _Range_checked_iterator_tag)
	{	// move defaults to copy if there is not a more effecient way
	return _Copy_opt(_First, _Last, _Dest,
		_First_dest_cat, _Ptr_cat(_First, _Dest), _Range_checked_iterator_tag());
	}

template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Swap_move_tag, _Range_checked_iterator_tag)
	{	// use swap to instead of the copy constructor
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2609);
	for (; _First != _Last; ++_Dest, ++_First)
		::std:: _Swap_adl(*_Dest, *_First);
	return (_Dest);
	}


template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Move_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		random_access_iterator_tag, _Swap_move_tag _Move_cat, _Range_checked_iterator_tag)
	{	// use swap to instead of the copy constructor
	// if _OutIt is range checked, this will make sure there is enough space for the copy
	_OutIt _Result = _Dest + (_Last - _First);
	_Move_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Move_cat, _Range_checked_iterator_tag());
	return _Result;
	}
#line 2628 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _InIt, class _OutIt>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl _Move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// move [_First, _Last) to [_Dest, ...)
	return _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt, class _OutElem, size_t _Size>
inline
_OutElem* __cdecl _Move(_InIt _First, _InIt _Last, _OutElem (&_Dest)[_Size])
	{	// move [_First, _Last) to [_Dest, ...)
	return _Move(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last),
		::stdext:: make_checked_array_iterator(_Dest, _Size)).base();
	}

template<class _InIt, class _OutIt>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl _Move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// move [_First, _Last) to [_Dest, ...)
	return _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}











#line 2667 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION copy_backward
template<class _BidIt1, class _BidIt2, class _InOutItCat>
inline
	_BidIt2 __cdecl _Copy_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	// copy [_First, _Last) backwards to [..., _Dest), arbitrary iterators
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2674);
	while (_First != _Last)
		*--_Dest = *--_Last;
	return (_Dest);
	}


template<class _InIt, class _OutIt>
inline
	_OutIt __cdecl _Copy_backward_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		random_access_iterator_tag, _Nonscalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	// copy [_First, _Last) backwards to [..., _Dest), arbitrary iterators
	// if _OutIt is range checked, this will make sure there is enough space for the copy
	_OutIt _Result = _Dest - (_Last - _First);
	_Copy_backward_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Nonscalar_ptr_iterator_tag(), _Range_checked_iterator_tag());
	return _Result;
	}
#line 2693 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

template<class _InIt, class _OutIt, class _InOutItCat>
inline
	_OutIt __cdecl _Copy_backward_opt(_InIt _First, _InIt _Last, _OutIt _Dest,
		_InOutItCat, _Scalar_ptr_iterator_tag, _Range_checked_iterator_tag)
	{	// copy [_First, _Last) backwards to [..., _Dest), pointers to scalars

 
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2701);
	if (_First != _Last)
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",2703);
 #line 2705 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	ptrdiff_t _Off = _Last - _First;	// NB: non-overlapping move
	/* if _OutIt is range checked, this will make sure there is enough space for 
	 * the memmove
	 */
	_OutIt _Result = _Dest - _Off;
	if (_Off > 0)
		::memmove_s((&*_Result), (_Off * sizeof (*_First)), (&*_First), (_Off * sizeof (*_First)));
	return _Result;
	}



template<class _BidIt1,
	class _BidIt2> inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// copy [_First, _Last) backwards to [..., _Dest)
	return _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _BidIt1,
	class _BidIt2> inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// copy [_First, _Last) backwards to [..., _Dest)
	return _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag());
	}











#line 2746 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION _Move_backward
template<class _BidIt1, class _BidIt2, class _InOutItCat, class _MoveCatTy>
inline
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat _First_dest_cat, _MoveCatTy, _Range_checked_iterator_tag)
	{	// move defaults to copy if there is not a more effecient way
	return _Copy_backward_opt(_First, _Last, _Dest,
		_First_dest_cat, _Ptr_cat(_First, _Dest), _Range_checked_iterator_tag());
	}

template<class _BidIt1, class _BidIt2, class _InOutItCat>
inline
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		_InOutItCat, _Swap_move_tag, _Range_checked_iterator_tag)
	{	// use swap instead of the copy constructor
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2762);
	while (_First != _Last)
		::std:: _Swap_adl(*--_Dest, *--_Last);
	return (_Dest);
	}


template<class _BidIt1, class _BidIt2>
inline
	_BidIt2 __cdecl _Move_backward_opt(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest,
		random_access_iterator_tag, _Swap_move_tag _Move_cat, _Range_checked_iterator_tag)
	{	// use swap to instead of the copy constructor
	// if _OutIt is range checked, this will make sure there is enough space for the copy
	_BidIt2 _Result = _Dest - (_Last - _First);
	_Move_backward_opt(_First, _Last, ::std:: _Checked_base(_Dest),
		forward_iterator_tag(), _Move_cat, _Range_checked_iterator_tag());
	return _Result;
	}
#line 2781 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _BidIt1, class _BidIt2>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl _Move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// move [_First, _Last) backwards to [..., _Dest)
	return _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _BidIt1, class _BidIt2>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl _Move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// move [_First, _Last) backwards to [..., _Dest)
	return _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		_Iter_random(_First, _Dest), _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}











#line 2812 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION mismatch
template<class _InIt1, class _InIt2, class _InItCats>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
			_InItCats, _Range_checked_iterator_tag)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch

 
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2822);
	if (_First1 != _Last1)
		_Debug_pointer(_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",2824);
 #line 2826 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	for (; _First1 != _Last1 && *_First1 == *_First2; )
		++_First1, ++_First2;
	return (pair<_InIt1, _InIt2>(_First1, _First2));
	}


template<class _InIt1, class _InIt2>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
			random_access_iterator_tag, _Range_checked_iterator_tag)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	// for range checked iterators, this will make sure there is enough space
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	pair<_InIt1, typename ::std:: _Checked_iterator_base_helper<_InIt2>::_Checked_iterator_base_type> _Result =
		_Mismatch(_First1, _Last1, ::std:: _Checked_base(_First2),
			forward_iterator_tag(), _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First2, _Result.second);
	return (pair<_InIt1, _InIt2>(_Result.first, _First2));
	}
#line 2848 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _InIt1, class _InIt2>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		_Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InElem2, size_t _Size>
inline
pair<_InIt1, _InElem2*>
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size])
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	pair<_InIt1, ::stdext:: checked_array_iterator<_InElem2*> > _Result =
		mismatch(_First1, _Last1, ::stdext:: make_checked_array_iterator(_First2, _Size));
	return (pair<_InIt1, _InElem2*>(_Result.first, _Result.second.base()));
	}

template<class _InIt1, class _InIt2>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		_Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (pair<_InIt1, _InIt2>(_First1, _Result.second));
	}












#line 2898 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION mismatch WITH PRED
template<class _InIt1, class _InIt2, class _Pr, class _InItCats>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
			_InItCats, _Range_checked_iterator_tag)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred

 
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 2908);
	if (_First1 != _Last1)
		_Debug_pointer(_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",2910);
	_Debug_pointer(_Pred, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",2911);
 #line 2913 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	for (; _First1 != _Last1 && _Pred(*_First1, *_First2); )
		++_First1, ++_First2;
	return (pair<_InIt1, _InIt2>(_First1, _First2));
	}


template<class _InIt1, class _InIt2, class _Pr>
inline
	pair<_InIt1, _InIt2>
		__cdecl _Mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
			random_access_iterator_tag, _Range_checked_iterator_tag)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	// for range checked iterators, this will make sure there is enough space
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	pair<_InIt1, typename ::std:: _Checked_iterator_base_helper<_InIt2>::_Checked_iterator_base_type> _Result =
		_Mismatch(_First1, _Last1, ::std:: _Checked_base(_First2), _Pred,
			forward_iterator_tag(), _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First2, _Result.second);
	return (pair<_InIt1, _InIt2>(_Result.first, _First2));
	}
#line 2935 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _InIt1, class _InIt2, class _Pr>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		_Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InElem2, class _Pr, size_t _Size>
inline
pair<_InIt1, _InElem2*>
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size], _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	pair<_InIt1, ::stdext:: checked_array_iterator<_InElem2*> > _Result =
		mismatch(_First1, _Last1, ::stdext:: make_checked_array_iterator(_First2, _Size), _Pred);
	return (pair<_InIt1, _InElem2*>(_Result.first, _Result.second.base()));
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		_Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (pair<_InIt1, _InIt2>(_First1, _Result.second));
	}












#line 2985 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION equal
template<class _InIt1, class _InIt2, class _InItCats>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
		_InItCats, _Range_checked_iterator_tag)
	{	// compare [_First1, _Last1) to [First2, ...)
	for (; _First1 != _Last1; ++_First1, ++_First2)
		if (!(*_First1 == *_First2))
			return (false);
	return (true);
	}

inline bool __cdecl _Equal(const char *_First1,
	const char *_Last1, const char *_First2,
	random_access_iterator_tag, _Range_checked_iterator_tag)
	{	// compare [_First1, _Last1) to [First2, ...), for chars
 
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3003);
	if (_First1 != _Last1)
		_Debug_pointer(_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3005);
 #line 3007 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	return (::memcmp(_First1, _First2, _Last1 - _First1) == 0);
	}

inline bool __cdecl _Equal(const signed char *_First1,
	const signed char *_Last1, const signed char *_First2,
	random_access_iterator_tag, _Range_checked_iterator_tag)
	{	// compare [_First1, _Last1) to [First2, ...), for signed chars
 
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3016);
	if (_First1 != _Last1)
		_Debug_pointer(_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3018);
 #line 3020 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	return (::memcmp(_First1, _First2, _Last1 - _First1) == 0);
	}

inline bool __cdecl _Equal(const unsigned char *_First1,
	const unsigned char *_Last1, const unsigned char *_First2,
	random_access_iterator_tag, _Range_checked_iterator_tag)
	{	// compare [_First1, _Last1) to [First2, ...), for unsigned chars
 
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3029);
	if (_First1 != _Last1)
		_Debug_pointer(_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3031);
 #line 3033 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	return (::memcmp(_First1, _First2, _Last1 - _First1) == 0);
	}


template<class _InIt1, class _InIt2>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2,
		random_access_iterator_tag, _Range_checked_iterator_tag)
	{
	// for range checked iterators, this will make sure there is enough space
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	return _Equal(_First1, _Last1, ::std:: _Checked_base(_First2),
		forward_iterator_tag(), _Range_checked_iterator_tag());
	}
#line 3049 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _InIt1, class _InIt2>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// compare [_First1, _Last1) to [First2, ...)
	return _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InElem2, size_t _Size>
inline
bool __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size])
	{	// compare [_First1, _Last1) to [First2, ...)
	return equal(_First1, _Last1,
		::stdext:: make_checked_array_iterator(_First2, _Size));
	}

template<class _InIt1, class _InIt2>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// compare [_First1, _Last1) to [First2, ...)
	return _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}











#line 3088 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION equal WITH PRED
template<class _InIt1, class _InIt2, class _Pr, class _InItCats>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
		_InItCats, _Range_checked_iterator_tag)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	for (; _First1 != _Last1; ++_First1, ++_First2)
		if (!_Pred(*_First1, *_First2))
			return (false);
	return (true);
	}


template<class _InIt1, class _InIt2, class _Pr>
inline
	bool __cdecl _Equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred,
		random_access_iterator_tag, _Range_checked_iterator_tag)
	{
	// for range checked iterators, this will make sure there is enough space
	_InIt2 _Last2 = _First2 + (_Last1 - _First1); (_Last2);
	return _Equal(_First1, _Last1, ::std:: _Checked_base(_First2), _Pred,
		forward_iterator_tag(), _Range_checked_iterator_tag());
	}
#line 3113 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _InIt1, class _InIt2, class _Pr>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	return _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InElem2, class _Pr, size_t _Size>
inline
bool __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size], _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	return equal(_First1, _Last1,
		::stdext:: make_checked_array_iterator(_First2, _Size), _Pred);
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	return _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		_Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}











#line 3152 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION fill
template<class _FwdIt, class _Ty> inline
	void __cdecl _Fill(_FwdIt _First, _FwdIt _Last, const _Ty& _Val)
	{	// copy _Val through [_First, _Last)
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3157);
	for (; _First != _Last; ++_First)
		*_First = _Val;
	}

inline void __cdecl _Fill([SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_First, 
	[SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *_Last, int _Val)
	{	// copy char _Val through [_First, _Last)
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3165);
	::memset(_First, _Val, _Last - _First);
	}

inline void __cdecl _Fill([SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] signed char *_First, 
	[SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] signed char *_Last, int _Val)
	{	// copy signed char _Val through [_First, _Last)
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3172);
	::memset(_First, _Val, _Last - _First);
	}

inline void __cdecl _Fill(
	[SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] unsigned char *_First,
	[SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] unsigned char *_Last, int _Val)
	{	// copy unsigned char _Val through [_First, _Last)
	_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3180);
	::memset(_First, _Val, _Last - _First);
	}

template<class _FwdIt, class _Ty> inline
	void __cdecl fill(_FwdIt _First, _FwdIt _Last, const _Ty& _Val)
	{	// copy _Val through [_First, _Last)
	_Fill(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Val);
	}

		// TEMPLATE FUNCTION fill_n
template<class _OutIt,
	class _Diff,
	class _Ty> inline
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		_Range_checked_iterator_tag)
	{	// copy _Val _Count times through [_First, ...)
	for (; 0 < _Count; --_Count, ++_First)
		*_First = _Val;
	}

inline void __cdecl _Fill_n([SA_Pre(Null=SA_Maybe,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_Count")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_First, 
		size_t _Count, int _Val, _Range_checked_iterator_tag)
	{	// copy char _Val _Count times through [_First, ...)

 
	if (0 < _Count)
		_Debug_pointer(_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3207);
 #line 3209 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	::memset(_First, _Val, _Count);
	}

inline void __cdecl _Fill_n([SA_Pre(Null=SA_Maybe,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_Count")] [SA_Post(Deref=1,Valid=SA_Yes)] signed char *_First, 
		size_t _Count, int _Val, _Range_checked_iterator_tag)
	{	// copy signed char _Val _Count times through [_First, ...)

 
	if (0 < _Count)
		_Debug_pointer(_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3219);
 #line 3221 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	::memset(_First, _Val, _Count);
	}

inline void __cdecl _Fill_n([SA_Pre(Null=SA_Maybe,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="_Count")] [SA_Post(Deref=1,Valid=SA_Yes)] unsigned char *_First, 
		size_t _Count, int _Val, _Range_checked_iterator_tag)
	{	// copy unsigned char _Val _Count times through [_First, ...)

 
	if (0 < _Count)
		_Debug_pointer(_First, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3231);
 #line 3233 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

	::memset(_First, _Val, _Count);
	}

template<class _OutIt, class _Diff, class _Ty, class _OutCat>
inline
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		_OutCat, _Range_checked_iterator_tag)
	{
		_Fill_n(_First, _Count, _Val, _Range_checked_iterator_tag());
	}


template<class _OutIt, class _Diff, class _Ty>
inline
	void __cdecl _Fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val,
		random_access_iterator_tag, _Range_checked_iterator_tag)
	{
		// if _OutIt is checked, this will ensure we have enough space
		_OutIt _Last = _First + _Count; (_Last);
		_Fill_n(::std:: _Checked_base(_First), _Count, _Val,
			_Range_checked_iterator_tag());
	}
#line 3257 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



template<class _OutIt,
	class _Diff,
	class _Ty>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _OutIt >::_Result, void >::_Result __cdecl fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		_Fill_n(_First, _Count, _Val, _Iter_cat(_First), ::std:: _Range_checked_iterator_tag());
	}

template<class _OutElem,
	class _Diff,
	class _Ty, size_t _Size>
inline
void __cdecl fill_n(_OutElem (&_First)[_Size], _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		fill_n(::stdext:: make_checked_array_iterator(_First, _Size), _Count, _Val);
	}

template<class _OutIt,
	class _Diff,
	class _Ty>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _OutIt >::_Result, void >::_Result __cdecl fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		_Fill_n(_First, _Count, _Val, _Iter_cat(_First), ::std:: _Range_checked_iterator_tag());
	}











#line 3299 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION lexicographical_compare
template<class _InIt1, class _InIt2> inline
	bool __cdecl _Lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2)
	{	// order [_First1, _Last1) vs. [First2, Last2)
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3305);
	_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3306);
	for (; _First1 != _Last1 && _First2 != _Last2; ++_First1, ++_First2)
		if (_Debug_lt(*_First1, *_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3308))
			return (true);
		else if (*_First2 < *_First1)
			return (false);
	return (_First1 == _Last1 && _First2 != _Last2);
	}

template<class _InIt1, class _InIt2> inline
	bool __cdecl lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2)
	{	// order [_First1, _Last1) vs. [First2, Last2)
	return _Lexicographical_compare(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1),
		::std:: _Checked_base(_First2), ::std:: _Checked_base(_Last2));
	}

inline bool __cdecl lexicographical_compare(
	const unsigned char *_First1, const unsigned char *_Last1,
	const unsigned char *_First2, const unsigned char *_Last2)
	{	// order [_First1, _Last1) vs. [First2, Last2), for unsigned char
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3327);
	_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3328);
	ptrdiff_t _Num1 = _Last1 - _First1;
	ptrdiff_t _Num2 = _Last2 - _First2;
	int _Ans = ::memcmp(_First1, _First2, _Num1 < _Num2 ? _Num1 : _Num2);
	return (_Ans < 0 || _Ans == 0 && _Num1 < _Num2);
	}

 











#line 3348 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION lexicographical_compare WITH PRED
template<class _InIt1,
	class _InIt2,
	class _Pr> inline
	bool __cdecl _Lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2, _Pr _Pred)
	{	// order [_First1, _Last1) vs. [First2, Last2) using _Pred
	_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3356);
	_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3357);
	_Debug_pointer(_Pred, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility",3358);
	for (; _First1 != _Last1 && _First2 != _Last2; ++_First1, ++_First2)
		if (_Debug_lt_pred(_Pred, *_First1, *_First2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3360))
			return (true);
		else if (_Pred(*_First2, *_First1))
			return (false);
	return (_First1 == _Last1 && _First2 != _Last2);
	}

template<class _InIt1, class _InIt2, class _Pr> inline
	bool __cdecl lexicographical_compare(_InIt1 _First1, _InIt1 _Last1,
		_InIt2 _First2, _InIt2 _Last2, _Pr _Pred)
	{	// order [_First1, _Last1) vs. [First2, Last2) using _Pred
	return _Lexicographical_compare(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1),
		::std:: _Checked_base(_First2), ::std:: _Checked_base(_Last2), _Pred);
	}

 
  
  
 #line 3379 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

		// TEMPLATE FUNCTION max
template<class _Ty> inline
	const _Ty& (__cdecl max)(const _Ty& _Left, const _Ty& _Right)
	{	// return larger of _Left and _Right
	return (_Debug_lt(_Left, _Right, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3384) ? _Right : _Left);
	}

		// TEMPLATE FUNCTION max WITH PRED
template<class _Ty,
	class _Pr> inline
	const _Ty& (__cdecl max)(const _Ty& _Left, const _Ty& _Right, _Pr _Pred)
	{	// return larger of _Left and _Right using _Pred
	return (_Debug_lt_pred(_Pred, _Left, _Right, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3392) ? _Right : _Left);
	}

		// TEMPLATE FUNCTION min
template<class _Ty> inline
	const _Ty& (__cdecl min)(const _Ty& _Left, const _Ty& _Right)
	{	// return smaller of _Left and _Right
	return (_Debug_lt(_Right, _Left, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3399) ? _Right : _Left);
	}

		// TEMPLATE FUNCTION min WITH PRED
template<class _Ty,
	class _Pr> inline
	const _Ty& (__cdecl min)(const _Ty& _Left, const _Ty& _Right, _Pr _Pred)
	{	// return smaller of _Left and _Right using _Pred
	return (_Debug_lt_pred(_Pred, _Right, _Left, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3407) ? _Right : _Left);
	}

}

namespace stdext {

// checked_array_iterator
template <class _Iterator>
	class checked_array_iterator
		: public ::std:: iterator<
			typename ::std:: iterator_traits<_Iterator>::iterator_category, 
			typename ::std:: iterator_traits<_Iterator>::value_type, 
			typename ::std:: iterator_traits<_Iterator>::difference_type, 
			typename ::std:: iterator_traits<_Iterator>::pointer, 
			typename ::std:: iterator_traits<_Iterator>::reference>
	{
public:
	typedef checked_array_iterator<_Iterator> _Myt;
	typedef typename ::std:: iterator_traits<_Iterator>::difference_type difference_type;
	typedef typename ::std:: iterator_traits<_Iterator>::pointer pointer;
	typedef typename ::std:: iterator_traits<_Iterator>::reference reference;

	typedef ::std:: _Range_checked_iterator_tag _Checked_iterator_category;
	typedef _Iterator _Inner_type;

	typedef _Iterator _Checked_iterator_base_type;
 
	_Checked_iterator_base_type _Checked_iterator_base() const
	{
		return _Mycont + _Current;
	}

	void _Checked_iterator_assign_from_base(_Checked_iterator_base_type _Base)
	{
		_Current = _Base - _Mycont;
	}

	// use default copy constructor and copy assignement

	checked_array_iterator():
		_Size(0), _Current(0)
	{
	}

	checked_array_iterator(_Iterator _Cont, size_t _S, size_t _Index = 0)
	{
		{ if (!(_Index <= _S)) { (void) ((!!((("_Index <= _S", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3454, 0, L"(\"_Index <= _S\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3454, 0); } ; };
		_Mycont = _Cont;
		_Size = _S;
		_Current =_Index;
	}

	_Iterator base() const
	{
		return _Mycont + _Current;
	}

	size_t __Size() const
	{
		return _Size;
	}

	bool operator==(const _Myt& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { (void) ((!!((("_Mycont == _Right._Mycont", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3472, 0, L"(\"_Mycont == _Right._Mycont\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3472, 0); } ; };
		return _Current == _Right._Current;
	}

	bool operator!=(const _Myt& _Right) const
	{
		return !(*this == _Right);
	}

	bool operator<(const _Myt& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { (void) ((!!((("_Mycont == _Right._Mycont", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3483, 0, L"(\"_Mycont == _Right._Mycont\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3483, 0); } ; };
		return _Current < _Right._Current;
	}

	bool operator>(const _Myt& _Right) const
	{
		return _Right < *this;
	}

	bool operator<=(const _Myt& _Right) const
	{
		return !(_Right < *this);
	}

	bool operator>=(const _Myt& _Right) const
	{
		return !(*this < _Right);
	}

	reference operator*() const
	{
		{ if (!(_Current < _Size)) { (void) ((!!((("_Current < _Size", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3504, 0, L"(\"_Current < _Size\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3504, 0); } ; };
		return *(_Mycont + _Current);
	}

	pointer operator->() const
	{
		return (&**this);
	}

	checked_array_iterator& operator++()
	{
		{ if (!(_Current < _Size)) { (void) ((!!((("_Current < _Size", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3515, 0, L"(\"_Current < _Size\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3515, 0); } ; };
		++_Current;
		return *this;
	}

	_Myt operator++(int)
	{
		checked_array_iterator _Tmp = *this;
		++*this;
		return _Tmp;
	}

	_Myt& operator--()
	{
		{ if (!(_Current > 0)) { (void) ((!!((("_Current > 0", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3529, 0, L"(\"_Current > 0\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3529, 0); } ; };
		--_Current;
		return *this;
	}

	_Myt operator--(int)
	{
		checked_array_iterator _Tmp = *this;
		--*this;
		return _Tmp;
	}

	// random access iterators methods

	_Myt& operator+=(difference_type _Off)
	{
		{ if (!(_Current + _Off <= _Size && _Current + _Off >= 0)) { (void) ((!!((("_Current + _Off <= _Size && _Current + _Off >= 0", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3545, 0, L"(\"_Current + _Off <= _Size && _Current + _Off >= 0\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3545, 0); } ; };
		_Current += _Off;
		return *this;
	}

	_Myt operator+(difference_type _Off) const
	{
		checked_array_iterator _Tmp = *this;
		return (_Tmp += _Off);
	}

	_Myt& operator-=(difference_type _Off)
	{
		return (*this += -_Off);
	}

	_Myt operator-(difference_type _Off) const
	{
		checked_array_iterator _Tmp = *this;
		return (_Tmp -= _Off);
	}

	difference_type operator-(const checked_array_iterator& _Right) const
	{
		{ if (!(_Mycont == _Right._Mycont)) { (void) ((!!((("_Mycont == _Right._Mycont", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3569, 0, L"(\"_Mycont == _Right._Mycont\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3569, 0); } ; };
		return _Current - _Right._Current;
	}

	reference operator[](difference_type _Off) const
	{
		{ if (!(_Current + _Off < _Size && _Current + _Off >= 0)) { (void) ((!!((("_Current + _Off < _Size && _Current + _Off >= 0", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3575, 0, L"(\"_Current + _Off < _Size && _Current + _Off >= 0\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility", 3575, 0); } ; };
		return *(_Mycont + _Current + _Off);
	}

protected:
	void _Xran() const
	{	// report an out_of_range error
		throw ::std:: out_of_range("invalid checked_array_iterator<T> subscript");
	}

	void _Xinvarg() const
	{	// report an invalid_argument error
		throw ::std:: invalid_argument("invalid checked_array_iterator<T> argument");
	}

	_Iterator _Mycont; // points to the start of the array
	size_t _Current; // the current index
	size_t _Size; // the size of array
	};

template <class _Iter>
checked_array_iterator<_Iter> make_checked_array_iterator(_Iter _Ptr, size_t _Size)
{
	return checked_array_iterator<_Iter>(_Ptr, _Size);
}

template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl unchecked_copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// copy [_First, _Last) to [_Dest, ...)
		return (::std:: _Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt, class _OutIt>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl checked_copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// copy [_First, _Last) to [_Dest, ...)
	return (::std:: _Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, 
		::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt, class _OutElem, size_t _Size>
inline
_OutElem* __cdecl checked_copy(_InIt _First, _InIt _Last, _OutElem (&_Dest)[_Size])
	{	// copy [_First, _Last) to [_Dest, ...)
	return checked_copy(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), ::stdext:: make_checked_array_iterator(_Dest, _Size)).base();
	}

template<class _InIt, class _OutIt>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl checked_copy(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// copy [_First, _Last) to [_Dest, ...)
	return (::std:: _Copy_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest, 
		::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl unchecked_copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// copy [_First, _Last) backwards to [..., _Dest)
		return (::std:: _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _BidIt1,
	class _BidIt2> inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl checked_copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// copy [_First, _Last) backwards to [..., _Dest)
	return ::std:: _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _BidIt1,
	class _BidIt2> inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl checked_copy_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// copy [_First, _Last) backwards to [..., _Dest)
	return ::std:: _Copy_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		::std:: _Iter_random(_First, _Dest), ::std:: _Ptr_cat(_First, _Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt,
	class _OutIt> inline
	_OutIt __cdecl _Unchecked_move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// move [_First, _Last) to [_Dest, ...)
		return (::std:: _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _InIt, class _OutIt>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl _Checked_move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// move [_First, _Last) to [_Dest, ...)
	return ::std:: _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt, class _OutElem, size_t _Size>
inline
_OutElem* __cdecl _Checked_move(_InIt _First, _InIt _Last, _OutElem (&_Dest)[_Size])
	{	// move [_First, _Last) to [_Dest, ...)
	return _Checked_move(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last),
		::stdext:: make_checked_array_iterator(_Dest, _Size)).base();
	}

template<class _InIt, class _OutIt>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _OutIt >::_Result, _OutIt >::_Result __cdecl _Checked_move(_InIt _First, _InIt _Last, _OutIt _Dest)
	{	// move [_First, _Last) to [_Dest, ...)
	return ::std:: _Move_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _BidIt1,
	class _BidIt2> inline
	_BidIt2 __cdecl _Unchecked_move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// move [_First, _Last) backwards to [..., _Dest)
		return (::std:: _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
			::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag()));
	}

template<class _BidIt1, class _BidIt2>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl _Checked_move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// move [_First, _Last) backwards to [..., _Dest)
	return ::std:: _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _BidIt1, class _BidIt2>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _BidIt2 >::_Result, _BidIt2 >::_Result __cdecl _Checked_move_backward(_BidIt1 _First, _BidIt1 _Last, _BidIt2 _Dest)
	{	// move [_First, _Last) backwards to [..., _Dest)
	return ::std:: _Move_backward_opt(::std:: _Checked_base(_First), ::std:: _Checked_base(_Last), _Dest,
		::std:: _Iter_random(_First, _Dest), ::std:: _Move_cat(_Dest), ::std:: _Range_checked_iterator_tag());
	}

template<class _OutIt,
	class _Diff,
	class _Ty> inline
	void __cdecl unchecked_fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		::std:: _Fill_n(_First, _Count, _Val, ::std:: _Iter_cat(_First), ::std:: _Range_checked_iterator_tag());
	}

template<class _OutIt,
	class _Diff,
	class _Ty>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _OutIt >::_Result, void >::_Result __cdecl checked_fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		_Fill_n(_First, _Count, _Val, ::std:: _Iter_cat(_First), ::std:: _Range_checked_iterator_tag());
	}

template<class _OutElem,
	class _Diff,
	class _Ty, size_t _Size>
inline
void __cdecl checked_fill_n(_OutElem (&_First)[_Size], _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		checked_fill_n(::stdext:: make_checked_array_iterator( _First, _Size), _Count, _Val);
	}

template<class _OutIt,
	class _Diff,
	class _Ty>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _OutIt >::_Result, void >::_Result __cdecl checked_fill_n(_OutIt _First, _Diff _Count, const _Ty& _Val)
	{	// copy _Val _Count times through [_First, ...)
		_Fill_n(_First, _Count, _Val, ::std:: _Iter_cat(_First), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InIt2>
inline
	::std:: pair<_InIt1, _InIt2>
		__cdecl unchecked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch

	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));



#line 3767 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
	}

template<class _InIt1, class _InIt2>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InElem2, size_t _Size>
inline
::std:: pair<_InIt1, _InElem2*>
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size])
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	::std:: pair<_InIt1, ::stdext:: checked_array_iterator<_InElem2*> > _Result =
		checked_mismatch(_First1, _Last1, ::stdext:: make_checked_array_iterator(_First2, _Size));
	return (::std:: pair<_InIt1, _InElem2*>(_Result.first, _Result.second.base()));
	}

template<class _InIt1, class _InIt2>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch
	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
	::std:: pair<_InIt1, _InIt2>
		__cdecl unchecked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch

	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));



#line 3819 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InElem2, class _Pr, size_t _Size>
inline
::std:: pair<_InIt1, _InElem2*>
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size], _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	::std:: pair<_InIt1, ::stdext:: checked_array_iterator<_InElem2*> > _Result =
		checked_mismatch(_First1, _Last1, ::stdext:: make_checked_array_iterator(_First2, _Size), _Pred);
	return (::std:: pair<_InIt1, _InElem2*>(_Result.first, _Result.second.base()));
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, ::std:: pair< _InIt1, _InIt2 > >::_Result
		__cdecl checked_mismatch(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// return [_First1, _Last1) and [_First2, _Last2) mismatch using _Pred
	::std:: pair<typename ::std:: _Checked_iterator_base_helper<_InIt1>::_Checked_iterator_base_type, _InIt2> _Result =
		::std:: _Mismatch(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
			::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	::std:: _Checked_assign_from_base(_First1, _Result.first);
	return (::std:: pair<_InIt1, _InIt2>(_First1, _Result.second));
	}

template<class _InIt1, class _InIt2>
inline
	bool __cdecl unchecked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// compare [_First1, _Last1) to [First2, ...)
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InIt2>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// compare [_First1, _Last1) to [First2, ...)
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InElem2, size_t _Size>
inline
bool __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size])
	{	// compare [_First1, _Last1) to [First2, ...)
	return checked_equal(_First1, _Last1,
		::stdext:: make_checked_array_iterator(_First2, _Size));
	}

template<class _InIt1, class _InIt2>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2)
	{	// compare [_First1, _Last1) to [First2, ...)
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
	bool __cdecl unchecked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...)
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
typename ::std:: _Enable_if< ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

template<class _InIt1, class _InElem2, class _Pr, size_t _Size>
inline
bool __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InElem2 (&_First2)[_Size], _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	return checked_equal(_First1, _Last1,
		::stdext:: make_checked_array_iterator(_First2, _Size), _Pred);
	}

template<class _InIt1, class _InIt2, class _Pr>
inline
__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
typename ::std:: _Enable_if< ! ::std:: _Is_checked_iterator< _InIt2 >::_Result, bool >::_Result __cdecl checked_equal(_InIt1 _First1, _InIt1 _Last1, _InIt2 _First2, _Pr _Pred)
	{	// compare [_First1, _Last1) to [First2, ...) using _Pred
	return ::std:: _Equal(::std:: _Checked_base(_First1), ::std:: _Checked_base(_Last1), _First2, _Pred,
		::std:: _Iter_random(_First1, _First2), ::std:: _Range_checked_iterator_tag());
	}

}

/* _SECURE_CRT definitions */

 
 

 
 

 





#line 3939 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

 








 




 














#line 3970 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
extern "C"
#line 3972 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
__declspec(dllimport) void __cdecl _invalid_parameter([SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const wchar_t *, unsigned int, uintptr_t);






#line 3980 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"



 #pragma warning(pop)
 #pragma pack(pop)
#line 3986 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

#line 3988 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"
#line 3989 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xutility"

/*
 * This file is derived from software bearing the following
 * restrictions:
 *
 * Copyright (c) 1994
 * Hewlett-Packard Company
 *
 * Permission to use, copy, modify, distribute and sell this
 * software and its documentation for any purpose is hereby
 * granted without fee, provided that the above copyright notice
 * appear in all copies and that both that copyright notice and
 * this permission notice appear in supporting documentation.
 * Hewlett-Packard Company makes no representations about the
 * suitability of this software for any purpose. It is provided
 * "as is" without express or implied warranty.
 */

/*
 * Copyright (c) 1992-2008 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.05:0009 */

#line 10 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"


 #pragma pack(push,8)
 #pragma warning(push,3)
 #pragma warning(disable: 4100)
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"


 
 
 
#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"

 

 

 

 


namespace std {
		// TEMPLATE FUNCTION _Allocate
template<class _Ty> inline
	_Ty  *_Allocate(size_t _Count, _Ty  *)
	{	// check for integer overflow
	if (_Count <= 0)
		_Count = 0;
	else if (((size_t)(-1) / _Count) < sizeof (_Ty))
		throw std::bad_alloc(0);

		// allocate storage for _Count elements of type _Ty
	return ((_Ty  *)::operator new(_Count * sizeof (_Ty)));
	}

		// TEMPLATE FUNCTION _Construct
template<class _T1,
	class _T2> inline
	void _Construct(_T1  *_Ptr, const _T2& _Val)
	{	// construct object at _Ptr with value _Val
	void  *_Vptr = _Ptr;
	::new (_Vptr) _T1(_Val);
	}

		// TEMPLATE FUNCTION _Destroy
template<class _Ty> inline
	void _Destroy(_Ty  *_Ptr)
	{	// destroy object at _Ptr
	(_Ptr)->~_Ty();
	}

template<> inline
	void _Destroy(char  *)
	{	// destroy a char (do nothing)
	}

template<> inline
	void _Destroy(wchar_t  *)
	{	// destroy a wchar_t (do nothing)
	}


		// TEMPLATE CLASS _Allocator_base
template<class _Ty>
	struct _Allocator_base
	{	// base class for generic allocators
	typedef _Ty value_type;
	};

		// TEMPLATE CLASS _Allocator_base<const _Ty>
template<class _Ty>
	struct _Allocator_base<const _Ty>
	{	// base class for generic allocators for const _Ty
	typedef _Ty value_type;
	};

		// TEMPLATE CLASS allocator
template<class _Ty>
	class allocator
		: public _Allocator_base<_Ty>
	{	// generic allocator for objects of class _Ty
public:
	typedef _Allocator_base<_Ty> _Mybase;
	typedef typename _Mybase::value_type value_type;
	typedef value_type  *pointer;
	typedef value_type & reference;
	typedef const value_type  *const_pointer;
	typedef const value_type & const_reference;

	typedef size_t size_type;
	typedef ptrdiff_t difference_type;

	template<class _Other>
		struct rebind
		{	// convert an allocator<_Ty> to an allocator <_Other>
		typedef allocator<_Other> other;
		};

	pointer address(reference _Val) const
		{	// return address of mutable _Val
		return (&_Val);
		}

	const_pointer address(const_reference _Val) const
		{	// return address of nonmutable _Val
		return (&_Val);
		}

	allocator() throw ()
		{	// construct default allocator (do nothing)
		}

	allocator(const allocator<_Ty>&) throw ()
		{	// construct by copying (do nothing)
		}

	template<class _Other>
		allocator(const allocator<_Other>&) throw ()
		{	// construct from a related allocator (do nothing)
		}

	template<class _Other>
		allocator<_Ty>& operator=(const allocator<_Other>&)
		{	// assign from a related allocator (do nothing)
		return (*this);
		}

	void deallocate(pointer _Ptr, size_type)
		{	// deallocate object at _Ptr, ignore size
		::operator delete(_Ptr);
		}

	pointer allocate(size_type _Count)
		{	// allocate array of _Count elements
		return (_Allocate(_Count, (pointer)0));
		}

	pointer allocate(size_type _Count, const void  *)
		{	// allocate array of _Count elements, ignore hint
		return (allocate(_Count));
		}

	void construct(pointer _Ptr, const _Ty& _Val)
		{	// construct object at _Ptr with value _Val
		_Construct(_Ptr, _Val);
		}

	void destroy(pointer _Ptr)
		{	// destroy object at _Ptr
		_Destroy(_Ptr);
		}

	size_t max_size() const throw ()
		{	// estimate maximum array size
		size_t _Count = (size_t)(-1) / sizeof (_Ty);
		return (0 < _Count ? _Count : 1);
		}
	};

		// allocator TEMPLATE OPERATORS
template<class _Ty,
	class _Other> inline
	bool operator==(const allocator<_Ty>&, const allocator<_Other>&) throw ()
	{	// test for allocator equality (always true)
	return (true);
	}

template<class _Ty,
	class _Other> inline
	bool operator!=(const allocator<_Ty>&, const allocator<_Other>&) throw ()
	{	// test for allocator inequality (always false)
	return (false);
	}

		// CLASS allocator<void>
template<> class __declspec(dllimport) allocator<void>
	{	// generic allocator for type void
public:
	typedef void _Ty;
	typedef _Ty  *pointer;
	typedef const _Ty  *const_pointer;
	typedef _Ty value_type;

	template<class _Other>
		struct rebind
		{	// convert an allocator<void> to an allocator <_Other>
		typedef allocator<_Other> other;
		};

	allocator() throw ()
		{	// construct default allocator (do nothing)
		}

	allocator(const allocator<_Ty>&) throw ()
		{	// construct by copying (do nothing)
		}

	template<class _Other>
		allocator(const allocator<_Other>&) throw ()
		{	// construct from related allocator (do nothing)
		}

	template<class _Other>
		allocator<_Ty>& operator=(const allocator<_Other>&)
		{	// assign from a related allocator (do nothing)
		return (*this);
		}
	};

		// TEMPLATE FUNCTION _Destroy_range
template<class _Alloc> inline
	void _Destroy_range(typename _Alloc::pointer _First,
		typename _Alloc::pointer _Last, _Alloc& _Al)
	{	// destroy [_First, _Last)
	_Destroy_range(_First, _Last, _Al, _Ptr_cat(_First, _Last));
	}

template<class _Alloc> inline
	void _Destroy_range(typename _Alloc::pointer _First,
		typename _Alloc::pointer _Last, _Alloc& _Al,
		_Nonscalar_ptr_iterator_tag)
	{	// destroy [_First, _Last), arbitrary type
	for (; _First != _Last; ++_First)
		_Al.destroy(_First);
	}

template<class _Alloc> inline
	void _Destroy_range(typename _Alloc::pointer _First,
		typename _Alloc::pointer _Last, _Alloc& _Al,
		_Scalar_ptr_iterator_tag)
	{	// destroy [_First, _Last), scalar type (do nothing)
	}
}


 #pragma warning(default: 4100)
 #pragma warning(pop)
 #pragma pack(pop)
#line 250 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"

#line 252 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"
#line 253 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xmemory"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 */

/*
 * This file is derived from software bearing the following
 * restrictions:
 *
 * Copyright (c) 1994
 * Hewlett-Packard Company
 *
 * Permission to use, copy, modify, distribute and sell this
 * software and its documentation for any purpose is hereby
 * granted without fee, provided that the above copyright notice
 * appear in all copies and that both that copyright notice and
 * this permission notice appear in supporting documentation.
 * Hewlett-Packard Company makes no representations about the
 * suitability of this software for any purpose. It is provided
 * "as is" without express or implied warranty.
 V5.03:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"


 #pragma pack(push,8)
 #pragma warning(push,3)
 #pragma warning(disable:4412)
#line 13 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 
 

namespace std {

  #pragma warning(disable:4251)

template<class _Elem,
	class _Traits = char_traits<_Elem>,
	class _Ax = allocator<_Elem> >
	class basic_string;

		// TEMPLATE CLASS _String_const_iterator
template<class _Elem,
	class _Traits,
	class _Alloc>
	class _String_const_iterator
		: public _Ranit_base<_Elem, typename _Alloc::difference_type,
			typename _Alloc::const_pointer, typename _Alloc::const_reference, _Iterator_base_secure>
	{	// iterator for nonmutable string
public:
	typedef _String_const_iterator<_Elem, _Traits, _Alloc> _Myt;
	typedef basic_string<_Elem, _Traits, _Alloc> _Mystring;

	typedef random_access_iterator_tag iterator_category;
	typedef _Elem value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::const_pointer pointer;
	typedef typename _Alloc::const_reference reference;
	typedef _Elem* _Inner_type;


	typedef _Range_checked_iterator_tag _Checked_iterator_category;
#line 48 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"













#line 62 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	 _String_const_iterator()
		{	// construct with null pointer
		_Myptr = 0;
		}

 
 

	 _String_const_iterator(pointer _Ptr, const _Container_base_secure *_Pstring)
		{	// construct with pointer _Ptr
		{ if (!(_Pstring == 0 || _Ptr != 0 && ((_Mystring *)_Pstring)->_Myptr() <= _Ptr && _Ptr <= (((_Mystring *)_Pstring)->_Myptr() + ((_Mystring *)_Pstring)->_Mysize))) { (void) ((!!((("_Pstring == NULL || _Ptr != NULL && ((_Mystring *)_Pstring)->_Myptr() <= _Ptr && _Ptr <= (((_Mystring *)_Pstring)->_Myptr() + ((_Mystring *)_Pstring)->_Mysize)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 76, 0, L"(\"_Pstring == NULL || _Ptr != NULL && ((_Mystring *)_Pstring)->_Myptr() <= _Ptr && _Ptr <= (((_Mystring *)_Pstring)->_Myptr() + ((_Mystring *)_Pstring)->_Mysize)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 76, 0); } ; };
#line 77 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		this->_Adopt(_Pstring);
		_Myptr = _Ptr;
		}

 



















#line 102 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	reference  operator*() const
		{	// return designated object

 
		if (this->_Mycont == 0 || _Myptr == 0
			|| _Myptr < ((_Mystring *)this->_Mycont)->_Myptr()
			|| ((_Mystring *)this->_Mycont)->_Myptr()
				+ ((_Mystring *)this->_Mycont)->_Mysize <= _Myptr)
			{
			_Debug_message(L"string iterator not dereferencable", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 112);
			{ (void) ((!!((("Standard C++ Libraries Out of Range", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 113, 0, L"(\"Standard C++ Libraries Out of Range\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 113, 0); };
			}
		;
 





#line 123 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		return (*_Myptr);
		}

	pointer  operator->() const
		{	// return pointer to class object
		return (&**this);
		}

	_Myt&  operator++()
		{	// preincrement
		if (this->_Mycont != ((const _Container_base_secure *)-4))
		{
			{ if (!(this->_Has_container())) { (void) ((!!((("this->_Has_container()", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 136, 0, L"(\"this->_Has_container()\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 136, 0); } ; };
			{ if (!(_Myptr < (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize))) { (void) ((!!((("_Myptr < (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 137, 0, L"(\"_Myptr < (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 137, 0); } ; };
		}
		++_Myptr;
		return (*this);
		}

	_Myt  operator++(int)
		{	// postincrement
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	// predecrement
		if (this->_Mycont != ((const _Container_base_secure *)-4))
		{
			{ if (!(this->_Has_container())) { (void) ((!!((("this->_Has_container()", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 154, 0, L"(\"this->_Has_container()\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 154, 0); } ; };
			{ if (!(_Myptr > ((_Mystring *)this->_Mycont)->_Myptr())) { (void) ((!!((("_Myptr > ((_Mystring *)this->_Mycont)->_Myptr()", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 155, 0, L"(\"_Myptr > ((_Mystring *)this->_Mycont)->_Myptr()\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 155, 0); } ; };
		}
		--_Myptr;
		return (*this);
		}

	_Myt  operator--(int)
		{	// postdecrement
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt&  operator+=(difference_type _Off)
		{	// increment by integer
		if (this->_Mycont != ((const _Container_base_secure *)-4))
		{
			{ if (!(this->_Has_container())) { (void) ((!!((("this->_Has_container()", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 172, 0, L"(\"this->_Has_container()\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 172, 0); } ; };
			{ if (!(_Myptr + _Off <= (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize) && _Myptr + _Off >= ((_Mystring *)this->_Mycont)->_Myptr())) { (void) ((!!((("_Myptr + _Off <= (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize) && _Myptr + _Off >= ((_Mystring *)this->_Mycont)->_Myptr()", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 175, 0, L"(\"_Myptr + _Off <= (((_Mystring *)this->_Mycont)->_Myptr() + ((_Mystring *)this->_Mycont)->_Mysize) && _Myptr + _Off >= ((_Mystring *)this->_Mycont)->_Myptr()\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 175, 0); } ; };
#line 176 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		}
		_Myptr += _Off;
		return (*this);
		}

	_Myt  operator+(difference_type _Off) const
		{	// return this + integer
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt&  operator-=(difference_type _Off)
		{	// decrement by integer
		return (*this += -_Off);
		}

	_Myt  operator-(difference_type _Off) const
		{	// return this - integer
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type  operator-(const _Myt& _Right) const
		{	// return difference of iterators

 
		_Compat(_Right);
 




#line 209 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		return (_Myptr - _Right._Myptr);
		}

	reference  operator[](difference_type _Off) const
		{	// subscript
		return (*(*this + _Off));
		}

	bool  operator==(const _Myt& _Right) const
		{	// test for iterator equality

 
		_Compat(_Right);
 




#line 229 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		return (_Myptr == _Right._Myptr);
		}

	bool  operator!=(const _Myt& _Right) const
		{	// test for iterator inequality
		return (!(*this == _Right));
		}

	bool  operator<(const _Myt& _Right) const
		{	// test if this < _Right

 
		_Compat(_Right);
 




#line 249 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		return (_Myptr < _Right._Myptr);
		}

	bool  operator>(const _Myt& _Right) const
		{	// test if this > _Right
		return (_Right < *this);
		}

	bool  operator<=(const _Myt& _Right) const
		{	// test if this <= _Right
		return (!(_Right < *this));
		}

	bool  operator>=(const _Myt& _Right) const
		{	// test if this >= _Right
		return (!(*this < _Right));
		}

 
	void  _Compat(const _Myt& _Right) const
		{	// test for compatible iterator pair
		if (this->_Mycont == 0 || this->_Mycont != _Right._Mycont)
			{
			_Debug_message(L"string iterators incompatible", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 273);
			{ (void) ((!!((("Standard C++ Libraries Invalid Argument", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 274, 0, L"(\"Standard C++ Libraries Invalid Argument\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"invalid argument\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 274, 0); };
			}
		}
 #line 278 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	static void __cdecl _Xlen()
		{
		_Mystring::_Xlen();
		}

	static void __cdecl _Xran()
		{
		_Mystring::_Xran();
		}

	static void __cdecl _Xinvarg()
		{
		_Mystring::_Xinvarg();
		}

	pointer _Myptr;	// offset of element in string
	};

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	_String_const_iterator<_Elem, _Traits, _Alloc> __cdecl operator+(
		typename _String_const_iterator<_Elem, _Traits, _Alloc>
			::difference_type _Off,
		_String_const_iterator<_Elem, _Traits, _Alloc> _Next)
	{	// add offset to iterator
	return (_Next += _Off);
	}

		// TEMPLATE CLASS _String_iterator
template<class _Elem,
	class _Traits,
	class _Alloc>
	class _String_iterator
		: public _String_const_iterator<_Elem, _Traits, _Alloc>
	{	// iterator for mutable string
public:
	typedef _String_iterator<_Elem, _Traits, _Alloc> _Myt;
	typedef _String_const_iterator<_Elem, _Traits, _Alloc> _Mybase;

	typedef random_access_iterator_tag iterator_category;
	typedef _Elem value_type;
	typedef typename _Alloc::difference_type difference_type;
	typedef typename _Alloc::pointer pointer;
	typedef typename _Alloc::reference reference;

	 _String_iterator()
		{	// construct with null string pointer
		}

 
 

	 _String_iterator(pointer _Ptr, const _Container_base_secure *_Pstring)
		: _Mybase(_Ptr, _Pstring)
		{	// construct with pointer _Ptr
		}

  













#line 352 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"













#line 366 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	reference  operator*() const
		{	// return designated object
		return ((reference)**(_Mybase *)this);
		}

	pointer  operator->() const
		{	// return pointer to class object
		return (&**this);
		}

	_Myt&  operator++()
		{	// preincrement
		++(*(_Mybase *)this);
		return (*this);
		}

	_Myt  operator++(int)
		{	// postincrement
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	_Myt&  operator--()
		{	// predecrement
		--(*(_Mybase *)this);
		return (*this);
		}

	_Myt  operator--(int)
		{	// postdecrement
		_Myt _Tmp = *this;
		--*this;
		return (_Tmp);
		}

	_Myt&  operator+=(difference_type _Off)
		{	// increment by integer
		(*(_Mybase *)this) += _Off;
		return (*this);
		}

	_Myt  operator+(difference_type _Off) const
		{	// return this + integer
		_Myt _Tmp = *this;
		return (_Tmp += _Off);
		}

	_Myt&  operator-=(difference_type _Off)
		{	// decrement by integer
		return (*this += -_Off);
		}

	_Myt  operator-(difference_type _Off) const
		{	// return this - integer
		_Myt _Tmp = *this;
		return (_Tmp -= _Off);
		}

	difference_type  operator-(const _Mybase& _Right) const
		{	// return difference of iterators
		return ((_Mybase)*this - _Right);
		}

	reference  operator[](difference_type _Off) const
		{	// subscript
		return (*(*this + _Off));
		}
	};

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	_String_iterator<_Elem, _Traits, _Alloc>  operator+(
		typename _String_iterator<_Elem, _Traits, _Alloc>
			::difference_type _Off,
		_String_iterator<_Elem, _Traits, _Alloc> _Next)
	{	// add offset to iterator
	return (_Next += _Off);
	}

		// CLASS _String_base
class __declspec(dllimport) _String_base
		: public _Container_base_secure
	{	// ultimate base class for basic_string to hold error reporters
public:
	 static void __cdecl _Xlen();	// report a length_error

	 static void __cdecl _Xran();	// report an out_of_range error

	 static void __cdecl _Xinvarg();
	};

		// TEMPLATE CLASS _String_val
template<class _Ty,
	class _Alloc>
	class _String_val
		: public _String_base
	{	// base class for basic_string to hold allocator _Alval
protected:
	typedef typename _Alloc::template
		rebind<_Ty>::other _Alty;

	 _String_val(_Alty _Al = _Alty())
		: _Alval(_Al)
		{	// construct allocator from _Al
		}

public:
	 _String_val(const _String_val &_Right)
		: _Alval(_Right._Alval)
		{	// copy constructor

		if (_Right._Myfirstiter == ((_Iterator_base *)-3))
			{
			this->_Myfirstiter = ((_Iterator_base *)-3);
			}
#line 485 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		}

protected:
	_Alty _Alval;	// allocator object for strings
	};

		// TEMPLATE CLASS basic_string
template<class _Elem,
	class _Traits,
	class _Ax>
	class basic_string
		: public _String_val<_Elem, _Ax>
	{	// null-terminated transparent array of elements
public:
	typedef basic_string<_Elem, _Traits, _Ax> _Myt;
	typedef _String_val<_Elem, _Ax> _Mybase;
	typedef typename _Mybase::_Alty _Alloc;
	typedef typename _Alloc::size_type size_type;
	typedef typename _Alloc::difference_type _Dift;
	typedef _Dift difference_type;
	typedef typename _Alloc::pointer _Tptr;
	typedef typename _Alloc::const_pointer _Ctptr;
	typedef _Tptr pointer;
	typedef _Ctptr const_pointer;
	typedef typename _Alloc::reference _Reft;
	typedef _Reft reference;
	typedef typename _Alloc::const_reference const_reference;
	typedef typename _Alloc::value_type value_type;



	typedef _String_iterator<_Elem, _Traits, _Alloc> iterator;
	typedef _String_const_iterator<_Elem, _Traits, _Alloc> const_iterator;

//	friend class _String_iterator<_Elem, _Traits, _Alloc>;
	friend class _String_const_iterator<_Elem, _Traits, _Alloc>;

	typedef std::reverse_iterator<iterator> reverse_iterator;
	typedef std::reverse_iterator<const_iterator> const_reverse_iterator;

    

    /*
    * This special _Size_type struct is used to overload operator[].
    * The correct operator[] is chosen based on the value of _SECURE_SCL.
    * See below when we define operator[].
    */
    





#line 539 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

    /*
    * _No_debug_placeholder is used to overload the basic_string constructors.
    * The correct constructors are chosen based on the value of _HAS_ITERATOR_DEBUGGING.
    * See below when we define the constructors.
    */
    



#line 550 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

  
	struct _Has_debug_it
	{
		bool _Value;
		explicit _Has_debug_it(bool _Val): _Value(_Val) { }
	};
  #line 558 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 #line 560 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 







#line 570 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

  

	 basic_string(_Has_debug_it _Hdi = _Has_debug_it(true))
		: _Mybase()
		{	// construct empty string
		if (!_Hdi._Value)
			{
			this->_Myfirstiter = ((_Iterator_base *)-3);
			}
		_Tidy();
		}

  











#line 596 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 #line 598 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 

	explicit  basic_string(const _Alloc& _Al)
		: _Mybase(_Al)
		{	// construct empty string with allocator
		_Tidy();
		}

	 basic_string(const _Myt& _Right, size_type _Roff,
		size_type _Count = npos)
		: _Mybase()
		{	// construct from _Right [_Roff, _Roff + _Count)

		if (_Right._Myfirstiter == ((_Iterator_base *)-3))
			{
			this->_Myfirstiter = ((_Iterator_base *)-3);
			}
#line 617 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		_Tidy();
		assign(_Right, _Roff, _Count);
		}

	 basic_string(const _Myt& _Right, size_type _Roff, size_type _Count,
		const _Alloc& _Al)
		: _Mybase(_Al)
		{	// construct from _Right [_Roff, _Roff + _Count) with allocator

		if (_Right._Myfirstiter == ((_Iterator_base *)-3))
			{
			this->_Myfirstiter = ((_Iterator_base *)-3);
			}
#line 631 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		_Tidy();
		assign(_Right, _Roff, _Count);
		}

	 basic_string(const _Elem *_Ptr, size_type _Count)
		: _Mybase()
		{	// construct from [_Ptr, _Ptr + _Count)
		_Tidy();
		assign(_Ptr, _Count);
		}

	 basic_string(const _Elem *_Ptr, size_type _Count, const _Alloc& _Al)
		: _Mybase(_Al)
		{	// construct from [_Ptr, _Ptr + _Count) with allocator
		_Tidy();
		assign(_Ptr, _Count);
		}

	 basic_string(const _Elem *_Ptr)
		: _Mybase()
		{	// construct from [_Ptr, <null>)
		_Tidy();
		assign(_Ptr);
		}

	 basic_string(const _Elem *_Ptr, const _Alloc& _Al)
		: _Mybase(_Al)
		{	// construct from [_Ptr, <null>) with allocator
		_Tidy();
		assign(_Ptr);
		}

	 basic_string(size_type _Count, _Elem _Ch)
		: _Mybase()
		{	// construct from _Count * _Ch
		_Tidy();
		assign(_Count, _Ch);
		}

	 basic_string(size_type _Count, _Elem _Ch, const _Alloc& _Al)
		: _Mybase(_Al)
		{	// construct from _Count * _Ch with allocator
		_Tidy();
		assign(_Count, _Ch);
		}

	template<class _It>
		 basic_string(_It _First, _It _Last)
		: _Mybase()
		{	// construct from [_First, _Last)
		_Tidy();
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		 basic_string(_It _First, _It _Last, const _Alloc& _Al)
		: _Mybase(_Al)
		{	// construct from [_First, _Last) with allocator
		_Tidy();
		_Construct(_First, _Last, _Iter_cat(_First));
		}

	 basic_string(const_pointer _First, const_pointer _Last)
		: _Mybase()
		{	// construct from [_First, _Last), const pointers

		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 697);
#line 699 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		_Tidy();
		if (_First != _Last)
			assign(&*_First, _Last - _First);
		}

	 basic_string(const_iterator _First, const_iterator _Last)
		: _Mybase()
		{	// construct from [_First, _Last), const_iterators

		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 708);
#line 710 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		_Tidy();
		if (_First != _Last)
			assign(&*_First, _Last - _First);
		}

 #line 716 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	// The copy constructor does not need to be overloaded.
	// If _Right._Myfirstiter == _IGNORE_MYITERLIST it will be copied over.
	 basic_string(const _Myt& _Right)
		: _Mybase(_Right)
		{	// construct by copying _Right
		_Tidy();
		assign(_Right, 0, npos);
		}

 

  































































































































#line 857 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 #line 859 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	template<class _It>
		void  _Construct(_It _Count,
			_It _Ch, _Int_iterator_tag)
		{	// initialize from _Count * _Ch
		assign((size_type)_Count, (_Elem)_Ch);
		}

	template<class _It>
		void  _Construct(_It _First,
			_It _Last, input_iterator_tag)
		{	// initialize from [_First, _Last), input iterators
		try {
		for (; _First != _Last; ++_First)
			append((size_type)1, (_Elem)*_First);
		} catch (...) {
		_Tidy(true);
		throw;
		}
		}

	template<class _It>
		void  _Construct(_It _First,
			_It _Last, forward_iterator_tag)
		{	// initialize from [_First, _Last), forward iterators

		// skip debug checks if the container is initizialed with _IGNORE_MYITERLIST
		if (this->_Myfirstiter != ((_Iterator_base *)-3))
			{
			_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 888);
			}
#line 891 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
		size_type _Count = 0;
		_Distance(_First, _Last, _Count);
		reserve(_Count);

		try {
		for (; _First != _Last; ++_First)
			append((size_type)1, (_Elem)*_First);
		} catch (...) {
		_Tidy(true);
		throw;
		}
		}

	 ~basic_string()
		{	// destroy the string
		_Tidy(true);
		}

	typedef _Traits traits_type;
	typedef _Alloc allocator_type;

	 static const size_type npos;	// generic bad/missing length/position

	_Myt&  operator=(const _Myt& _Right)
		{	// assign _Right
		return (assign(_Right));
		}

	_Myt&  operator=(const _Elem *_Ptr)
		{	// assign [_Ptr, <null>)
		return (assign(_Ptr));
		}

	_Myt&  operator=(_Elem _Ch)
		{	// assign 1 * _Ch
		return (assign(1, _Ch));
		}

	_Myt&  operator+=(const _Myt& _Right)
		{	// append _Right
		return (append(_Right));
		}

	_Myt&  operator+=(const _Elem *_Ptr)
		{	// append [_Ptr, <null>)
		return (append(_Ptr));
		}

	_Myt&  operator+=(_Elem _Ch)
		{	// append 1 * _Ch
		return (append((size_type)1, _Ch));
		}

	_Myt&  append(const _Myt& _Right)
		{	// append _Right
		return (append(_Right, 0, npos));
		}

	_Myt&  append(const _Myt& _Right,
		size_type _Roff, size_type _Count)
		{	// append _Right [_Roff, _Roff + _Count)
		if (_Right.size() < _Roff)
			_String_base::_Xran();	// _Roff off end
		size_type _Num = _Right.size() - _Roff;
		if (_Num < _Count)
			_Count = _Num;	// trim _Count to size
		if (npos - _Mysize <= _Count || _Mysize + _Count < _Mysize)
			_String_base::_Xlen();	// result too long

		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	// make room and append new stuff
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Mysize, _Myres - _Mysize,
				_Right._Myptr() + _Roff, _Count);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  append(const _Elem *_Ptr, size_type _Count)
		{	// append [_Ptr, _Ptr + _Count)

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",974);
 #line 976 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Inside(_Ptr))
			return (append(*this, _Ptr - _Myptr(), _Count));	// substring
		if (npos - _Mysize <= _Count || _Mysize + _Count < _Mysize)
			_String_base::_Xlen();	// result too long

		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	// make room and append new stuff
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Mysize, _Myres - _Mysize, _Ptr, _Count);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  append(const _Elem *_Ptr)
		{	// append [_Ptr, <null>)
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",993);
		return (append(_Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  append(size_type _Count, _Elem _Ch)
		{	// append _Count * _Ch
			if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	// result too long

		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	// make room and append new stuff using assign
			_Chassign(_Mysize, _Count, _Ch);
			_Eos(_Num);
			}
		return (*this);
		}

	template<class _It>
		_Myt&  append(_It _First, _It _Last)
		{	// append [_First, _Last)
		return (_Append(_First, _Last, _Iter_cat(_First)));
		}

	template<class _It>
		_Myt&  _Append(_It _Count, _It _Ch, _Int_iterator_tag)
		{	// append _Count * _Ch
		return (append((size_type)_Count, (_Elem)_Ch));
		}

	template<class _It>
		_Myt&  _Append(_It _First, _It _Last, input_iterator_tag)
		{	// append [_First, _Last), input iterators
		return (replace(end(), end(), _First, _Last));
		}

	_Myt&  append(const_pointer _First, const_pointer _Last)
		{	// append [_First, _Last), const pointers
		return (replace(end(), end(), _First, _Last));
		}

	_Myt&  append(const_iterator _First, const_iterator _Last)
		{	// append [_First, _Last), const_iterators
		return (replace(end(), end(), _First, _Last));
		}

	_Myt&  assign(const _Myt& _Right)
		{	// assign _Right
		return (assign(_Right, 0, npos));
		}

	_Myt&  assign(const _Myt& _Right,
		size_type _Roff, size_type _Count)
		{	// assign _Right [_Roff, _Roff + _Count)
		if (_Right.size() < _Roff)
			_String_base::_Xran();	// _Roff off end
		size_type _Num = _Right.size() - _Roff;
		if (_Count < _Num)
			_Num = _Count;	// trim _Num to size

		if (this == &_Right)
			erase((size_type)(_Roff + _Num)), erase(0, _Roff);	// substring
		else if (_Grow(_Num))
			{	// make room and assign new stuff
			_Traits_helper::copy_s<_Traits>(_Myptr(), _Myres, _Right._Myptr() + _Roff, _Num);
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  assign(const _Elem *_Ptr, size_type _Count)
		{	// assign [_Ptr, _Ptr + _Count)

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1068);
 #line 1070 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Inside(_Ptr))
			return (assign(*this, _Ptr - _Myptr(), _Count));	// substring

		if (_Grow(_Count))
			{	// make room and assign new stuff
			_Traits_helper::copy_s<_Traits>(_Myptr(), _Myres, _Ptr, _Count);
			_Eos(_Count);
			}
		return (*this);
		}

	_Myt&  assign(const _Elem *_Ptr)
		{	// assign [_Ptr, <null>)
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1084);
		return (assign(_Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  assign(size_type _Count, _Elem _Ch)
		{	// assign _Count * _Ch
		if (_Count == npos)
			_String_base::_Xlen();	// result too long

		if (_Grow(_Count))
			{	// make room and assign new stuff
			_Chassign(0, _Count, _Ch);
			_Eos(_Count);
			}
		return (*this);
		}

	template<class _It>
		_Myt&  assign(_It _First, _It _Last)
		{	// assign [First, _Last)
		return (_Assign(_First, _Last, _Iter_cat(_First)));
		}

	template<class _It>
		_Myt&  _Assign(_It _Count, _It _Ch, _Int_iterator_tag)
		{	// assign _Count * _Ch
		return (assign((size_type)_Count, (_Elem)_Ch));
		}

	template<class _It>
		_Myt&  _Assign(_It _First, _It _Last, input_iterator_tag)
		{	// assign [First, _Last), input iterators
		return (replace(begin(), end(), _First, _Last));
		}

	_Myt&  assign(const_pointer _First, const_pointer _Last)
		{	// assign [First, _Last), const pointers
		return (replace(begin(), end(), _First, _Last));
		}

	_Myt&  assign(const_iterator _First, const_iterator _Last)
		{	// assign [First, _Last), const_iterators
		return (replace(begin(), end(), _First, _Last));
		}

	_Myt&  insert(size_type _Off, const _Myt& _Right)
		{	// insert _Right at _Off
		return (insert(_Off, _Right, 0, npos));
		}

	_Myt&  insert(size_type _Off,
		const _Myt& _Right, size_type _Roff, size_type _Count)
		{	// insert _Right [_Roff, _Roff + _Count) at _Off
		if (_Mysize < _Off || _Right.size() < _Roff)
			_String_base::_Xran();	// _Off or _Roff off end
		size_type _Num = _Right.size() - _Roff;
		if (_Num < _Count)
			_Count = _Num;	// trim _Count to size
		if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	// result too long

		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	// make room and insert new stuff
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off, _Mysize - _Off);	// empty out hole
			if (this == &_Right)
				_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
					_Myptr() + (_Off < _Roff ? _Roff + _Count : _Roff),
						_Count);	// substring
			else
				_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
					_Right._Myptr() + _Roff, _Count);	// fill hole
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  insert(size_type _Off,
		const _Elem *_Ptr, size_type _Count)
		{	// insert [_Ptr, _Ptr + _Count) at _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1167);
 #line 1169 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Inside(_Ptr))
			return (insert(_Off, *this,
				_Ptr - _Myptr(), _Count));	// substring
		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	// result too long
		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	// make room and insert new stuff
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off, _Mysize - _Off);	// empty out hole
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off, _Ptr, _Count);	// fill hole
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  insert(size_type _Off, const _Elem *_Ptr)
		{	// insert [_Ptr, <null>) at _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1190);
		return (insert(_Off, _Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  insert(size_type _Off,
		size_type _Count, _Elem _Ch)
		{	// insert _Count * _Ch at _Off
		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (npos - _Mysize <= _Count)
			_String_base::_Xlen();	// result too long
		size_type _Num;
		if (0 < _Count && _Grow(_Num = _Mysize + _Count))
			{	// make room and insert new stuff
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off, _Mysize - _Off);	// empty out hole
			_Chassign(_Off, _Count, _Ch);	// fill hole
			_Eos(_Num);
			}
		return (*this);
		}

	iterator  insert(const_iterator _Where)
		{	// insert <null> at _Where
		return (insert(_Where, _Elem()));
		}

	iterator  insert(const_iterator _Where, _Elem _Ch)
		{	// insert _Ch at _Where
		size_type _Off = _Pdif(_Where, begin());
		insert(_Off, 1, _Ch);
		return (begin() + _Off);
		}

	void  insert(const_iterator _Where, size_type _Count, _Elem _Ch)
		{	// insert _Count * _Elem at _Where
		size_type _Off = _Pdif(_Where, begin());
		insert(_Off, _Count, _Ch);
		}

	template<class _It>
		void  insert(const_iterator _Where, _It _First, _It _Last)
		{	// insert [_First, _Last) at _Where
		_Insert(_Where, _First, _Last, _Iter_cat(_First));
		}

	template<class _It>
		void  _Insert(const_iterator _Where, _It _Count, _It _Ch,
			_Int_iterator_tag)
		{	// insert _Count * _Ch at _Where
		insert(_Where, (size_type)_Count, (_Elem)_Ch);
		}

	template<class _It>
		void  _Insert(const_iterator _Where, _It _First, _It _Last,
			input_iterator_tag)
		{	// insert [_First, _Last) at _Where, input iterators
		replace(_Where, _Where, _First, _Last);
		}

	void  insert(const_iterator _Where, const_pointer _First, const_pointer _Last)
		{	// insert [_First, _Last) at _Where, const pointers
		replace(_Where, _Where, _First, _Last);
		}

	void  insert(const_iterator _Where, const_iterator _First, const_iterator _Last)
		{	// insert [_First, _Last) at _Where, const_iterators
		replace(_Where, _Where, _First, _Last);
		}

	_Myt&  erase(size_type _Off = 0,
		size_type _Count = npos)
		{	// erase elements [_Off, _Off + _Count)
		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (_Mysize - _Off < _Count)
			_Count = _Mysize - _Off;	// trim _Count
		if (0 < _Count)
			{	// move elements down
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off, _Myptr() + _Off + _Count,
				_Mysize - _Off - _Count);
			size_type _Newsize = _Mysize - _Count;
			_Eos(_Newsize);
			}
		return (*this);
		}

	iterator  erase(const_iterator _Where)
		{	// erase element at _Where
		size_type _Count = _Pdif(_Where, begin());
		erase(_Count, 1);
		return (iterator(_Myptr() + _Count, this));
		}

	iterator  erase(const_iterator _First, const_iterator _Last)
		{	// erase substring [_First, _Last)
		size_type _Count = _Pdif(_First, begin());
		erase(_Count, _Pdif(_Last, _First));
		return (iterator(_Myptr() + _Count, this));
		}

	void  clear()
		{	// erase all
		erase(begin(), end());
		}

	_Myt&  replace(size_type _Off, size_type _N0, const _Myt& _Right)
		{	// replace [_Off, _Off + _N0) with _Right
		return (replace(_Off, _N0, _Right, 0, npos));
		}

	_Myt&  replace(size_type _Off,
		size_type _N0, const _Myt& _Right, size_type _Roff, size_type _Count)
		{	// replace [_Off, _Off + _N0) with _Right [_Roff, _Roff + _Count)
		if (_Mysize < _Off || _Right.size() < _Roff)
			_String_base::_Xran();	// _Off or _Roff off end
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	// trim _N0 to size
		size_type _Num = _Right.size() - _Roff;
		if (_Num < _Count)
			_Count = _Num;	// trim _Count to size
		if (npos - _Count <= _Mysize - _N0)
			_String_base::_Xlen();	// result too long

		size_type _Nm = _Mysize - _N0 - _Off;	// length of preserved tail
		size_type _Newsize = _Mysize + _Count - _N0;
		if (_Mysize < _Newsize)
			_Grow(_Newsize);

		if (this != &_Right)
			{	// no overlap, just move down and copy in new stuff
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// empty hole
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Right._Myptr() + _Roff, _Count);	// fill hole
			}
		else if (_Count <= _N0)
			{	// hole doesn't get larger, just copy in substring
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + _Roff, _Count);	// fill hole
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// move tail down
			}
		else if (_Roff <= _Off)
			{	// hole gets larger, substring begins before hole
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// move tail down
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + _Roff, _Count);	// fill hole
			}
		else if (_Off + _N0 <= _Roff)
			{	// hole gets larger, substring begins after hole
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// move tail down
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + (_Roff + _Count - _N0), _Count);	// fill hole
			}
		else
			{	// hole gets larger, substring begins in hole
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off, _Myres - _Off,
				_Myptr() + _Roff, _N0);	// fill old hole
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// move tail down
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _N0, _Myres - _Off - _N0, _Myptr() + _Roff + _Count,
				_Count - _N0);	// fill rest of new hole
			}

		_Eos(_Newsize);
		return (*this);
		}

	_Myt&  replace(size_type _Off,
		size_type _N0, const _Elem *_Ptr, size_type _Count)
		{	// replace [_Off, _Off + _N0) with [_Ptr, _Ptr + _Count)

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1367);
 #line 1369 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Inside(_Ptr))
			return (replace(_Off, _N0, *this,
				_Ptr - _Myptr(), _Count));	// substring, replace carefully
		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	// trim _N0 to size
		if (npos - _Count <= _Mysize - _N0)
			_String_base::_Xlen();	// result too long
		size_type _Nm = _Mysize - _N0 - _Off;

		if (_Count < _N0)
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// smaller hole, move tail up
		size_type _Num;
		if ((0 < _Count || 0 < _N0) && _Grow(_Num = _Mysize + _Count - _N0))
			{	// make room and rearrange
			if (_N0 < _Count)
				_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
					_Myptr() + _Off + _N0, _Nm);	// move tail down
			_Traits_helper::copy_s<_Traits>(_Myptr() + _Off, _Myres - _Off, _Ptr, _Count);	// fill hole
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  replace(size_type _Off, size_type _N0, const _Elem *_Ptr)
		{	// replace [_Off, _Off + _N0) with [_Ptr, <null>)
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1398);
		return (replace(_Off, _N0, _Ptr, _Traits::length(_Ptr)));
		}

	_Myt&  replace(size_type _Off,
		size_type _N0, size_type _Count, _Elem _Ch)
		{	// replace [_Off, _Off + _N0) with _Count * _Ch
		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	// trim _N0 to size
		if (npos - _Count <= _Mysize - _N0)
			_String_base::_Xlen();	// result too long
		size_type _Nm = _Mysize - _N0 - _Off;

		if (_Count < _N0)
			_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
				_Myptr() + _Off + _N0, _Nm);	// smaller hole, move tail up
		size_type _Num;
		if ((0 < _Count || 0 < _N0) && _Grow(_Num = _Mysize + _Count - _N0))
			{	// make room and rearrange
			if (_N0 < _Count)
				_Traits_helper::move_s<_Traits>(_Myptr() + _Off + _Count, _Myres - _Off - _Count,
					_Myptr() + _Off + _N0, _Nm);	// move tail down
			_Chassign(_Off, _Count, _Ch);	// fill hole
			_Eos(_Num);
			}
		return (*this);
		}

	_Myt&  replace(const_iterator _First, const_iterator _Last, const _Myt& _Right)
		{	// replace [_First, _Last) with _Right
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Right));
		}

	_Myt&  replace(const_iterator _First, const_iterator _Last, const _Elem *_Ptr,
		size_type _Count)
		{	// replace [_First, _Last) with [_Ptr, _Ptr + _Count)
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Ptr, _Count));
		}

	_Myt&  replace(const_iterator _First, const_iterator _Last, const _Elem *_Ptr)
		{	// replace [_First, _Last) with [_Ptr, <null>)
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Ptr));
		}

	_Myt&  replace(const_iterator _First, const_iterator _Last,
		size_type _Count, _Elem _Ch)
		{	// replace [_First, _Last) with _Count * _Ch
		return (replace(
			_Pdif(_First, begin()), _Pdif(_Last, _First), _Count, _Ch));
		}

	template<class _It>
		_Myt&  replace(const_iterator _First, const_iterator _Last,
			_It _First2, _It _Last2)
		{	// replace [_First, _Last) with [_First2, _Last2)
		return (_Replace(_First, _Last,
			_First2, _Last2, _Iter_cat(_First2)));
		}

	template<class _It>
		_Myt&  _Replace(const_iterator _First, const_iterator _Last,
			_It _Count, _It _Ch, _Int_iterator_tag)
		{	// replace [_First, _Last) with _Count * _Ch
		return (replace(_First, _Last, (size_type)_Count, (_Elem)_Ch));
		}

	template<class _It>
		_Myt&  _Replace(const_iterator _First, const_iterator _Last,
			_It _First2, _It _Last2, input_iterator_tag)
		{	// replace [_First, _Last) with [_First2, _Last2), input iterators
		_Myt _Right(_First2, _Last2);
		replace(_First, _Last, _Right);
		return (*this);
		}

	_Myt&  replace(const_iterator _First, const_iterator _Last,
		const_pointer _First2, const_pointer _Last2)
		{	// replace [_First, _Last) with [_First2, _Last2), const pointers
		if (_First2 == _Last2)
			erase(_Pdif(_First, begin()), _Pdif(_Last, _First));
		else
			replace(_Pdif(_First, begin()), _Pdif(_Last, _First),
				&*_First2, _Last2 - _First2);
		return (*this);
		}

	_Myt&  replace(const_iterator _First, const_iterator _Last,
		const_iterator _First2, const_iterator _Last2)
		{	// replace [_First, _Last) with [_First2, _Last2), const_iterators
		if (_First2 == _Last2)
			erase(_Pdif(_First, begin()), _Pdif(_Last, _First));
		else
			replace(_Pdif(_First, begin()), _Pdif(_Last, _First),
				&*_First2, _Last2 - _First2);
		return (*this);
		}

	iterator  begin()
		{	// return iterator for beginning of mutable sequence
		return (iterator(_Myptr(), this));
		}

	const_iterator  begin() const
		{	// return iterator for beginning of nonmutable sequence
		return (const_iterator(_Myptr(), this));
		}

	iterator  end()
		{	// return iterator for end of mutable sequence
		return (iterator(_Myptr() + _Mysize, this));
		}

	const_iterator  end() const
		{	// return iterator for end of nonmutable sequence
		return (const_iterator(_Myptr() + _Mysize, this));
		}

	reverse_iterator  rbegin()
		{	// return iterator for beginning of reversed mutable sequence
		return (reverse_iterator(end()));
		}

	const_reverse_iterator  rbegin() const
		{	// return iterator for beginning of reversed nonmutable sequence
		return (const_reverse_iterator(end()));
		}

	reverse_iterator  rend()
		{	// return iterator for end of reversed mutable sequence
		return (reverse_iterator(begin()));
		}

	const_reverse_iterator  rend() const
		{	// return iterator for end of reversed nonmutable sequence
		return (const_reverse_iterator(begin()));
		}

	reference  at(size_type _Off)
		{	// subscript mutable sequence with checking
		if (_Mysize <= _Off)
			_String_base::_Xran();	// _Off off end
		return (_Myptr()[_Off]);
		}

	const_reference  at(size_type _Off) const
		{	// subscript nonmutable sequence with checking
		if (_Mysize <= _Off)
			_String_base::_Xran();	// _Off off end
		return (_Myptr()[_Off]);
		}

 

	reference  operator[](size_type _Off)
		{	// subscript mutable sequence

 
		// skip debug checks if the container is initizialed with _IGNORE_MYITERLIST
		if (this->_Myfirstiter != ((_Iterator_base *)-3))
			{
			if (_Mysize < _Off)
				{
				_Debug_message(L"string subscript out of range", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 1565);
				{ (void) ((!!((("Standard C++ Libraries Out of Range", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 1566, 0, L"(\"Standard C++ Libraries Out of Range\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 1566, 0); };
				}
			}
 

#line 1572 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		return (_Myptr()[_Off]);
		}

	const_reference  operator[](size_type _Off) const
		{	// subscript nonmutable sequence

 
		// skip debug checks if the container is initizialed with _IGNORE_MYITERLIST
		if (this->_Myfirstiter != ((_Iterator_base *)-3))
			{
			if (_Mysize < _Off)	// sic
				{
				_Debug_message(L"string subscript out of range", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 1585);
				{ (void) ((!!((("Standard C++ Libraries Out of Range", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 1586, 0, L"(\"Standard C++ Libraries Out of Range\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring", 1586, 0); };
				}
			}
 

#line 1592 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		return (_Myptr()[_Off]);
		}

 #line 1597 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 

  







































#line 1641 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

 #line 1643 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

	void  push_back(_Elem _Ch)
		{	// insert element at end
		insert(end(), _Ch);
		}

	const _Elem * c_str() const
		{	// return pointer to null-terminated nonmutable array
		return (_Myptr());
		}

	const _Elem * data() const
		{	// return pointer to nonmutable array
		return (c_str());
		}

	size_type  length() const
		{	// return length of sequence
		return (_Mysize);
		}

	size_type  size() const
		{	// return length of sequence
		return (_Mysize);
		}

	size_type  max_size() const
		{	// return maximum possible length of sequence
		size_type _Num = _Mybase::_Alval.max_size();
		return (_Num <= 1 ? 1 : _Num - 1);
		}

	void  resize(size_type _Newsize)
		{	// determine new length, padding with null elements as needed
		resize(_Newsize, _Elem());
		}

	void  resize(size_type _Newsize, _Elem _Ch)
		{	// determine new length, padding with _Ch elements as needed
		if (_Newsize <= _Mysize)
			erase(_Newsize);
		else
			append(_Newsize - _Mysize, _Ch);
		}

	size_type  capacity() const
		{	// return current length of allocated storage
		return (_Myres);
		}

	void  reserve(size_type _Newcap = 0)
		{	// determine new minimum length of allocated storage
		if (_Mysize <= _Newcap && _Myres != _Newcap)
			{	// change reservation
			size_type _Size = _Mysize;
			if (_Grow(_Newcap, true))
				_Eos(_Size);
			}
		}

	bool  empty() const
		{	// test if sequence is empty
		return (_Mysize == 0);
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	size_type  copy(_Elem *_Dest,
		size_type _Count, size_type _Off = 0) const
		{	// copy [_Off, _Off + _Count) to [_Dest, _Dest + _Count)

 
		if (_Count != 0)
			_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1715);
 #line 1717 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		// assume there is enough space in _Ptr
		return _Copy_s(_Dest, _Count, _Count, _Off);
		}

	size_type  _Copy_s(_Elem *_Dest, size_type _Dest_size,
		size_type _Count, size_type _Off = 0) const
		{	// copy [_Off, _Off + _Count) to [_Dest, _Dest + _Count)
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1725);
		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (_Mysize - _Off < _Count)
			_Count = _Mysize - _Off;
		_Traits_helper::copy_s<_Traits>(_Dest, _Dest_size, _Myptr() + _Off, _Count);
		return (_Count);
		}

	void  swap(_Myt& _Right)
		{	// exchange contents with _Right
		if (this == &_Right)
			;	// same object, do nothing
		else if (_Mybase::_Alval == _Right._Alval)
			{	// same allocator, swap control information

 
			this->_Swap_all(_Right);
 #line 1744 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

			_Bxty _Tbx = _Bx;
			_Bx = _Right._Bx, _Right._Bx = _Tbx;

			size_type _Tlen = _Mysize;
			_Mysize = _Right._Mysize, _Right._Mysize = _Tlen;

			size_type _Tres = _Myres;
			_Myres = _Right._Myres, _Right._Myres = _Tres;
			}
		else
			{	// different allocator, do multiple assigns
			_Myt _Tmp = *this;

			*this = _Right;
			_Right = _Tmp;
			}
		}

	size_type  find(const _Myt& _Right, size_type _Off = 0) const
		{	// look for _Right beginnng at or after _Off
		return (find(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	// look for [_Ptr, _Ptr + _Count) beginnng at or after _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1774);
 #line 1776 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Count == 0 && _Off <= _Mysize)
			return (_Off);	// null string always matches (if inside string)

		size_type _Nm;
		if (_Off < _Mysize && _Count <= (_Nm = _Mysize - _Off))
			{	// room for match, look for it
			const _Elem *_Uptr, *_Vptr;
			for (_Nm -= _Count - 1, _Vptr = _Myptr() + _Off;
				(_Uptr = _Traits::find(_Vptr, _Nm, *_Ptr)) != 0;
				_Nm -= _Uptr - _Vptr + 1, _Vptr = _Uptr + 1)
				if (_Traits::compare(_Uptr, _Ptr, _Count) == 0)
					return (_Uptr - _Myptr());	// found a match
			}

		return (npos);	// no match
		}

	size_type  find(const _Elem *_Ptr, size_type _Off = 0) const
		{	// look for [_Ptr, <null>) beginnng at or after _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1796);
		return (find(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find(_Elem _Ch, size_type _Off = 0) const
		{	// look for _Ch at or after _Off
		return (find((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  rfind(const _Myt& _Right, size_type _Off = npos) const
		{	// look for _Right beginning before _Off
		return (rfind(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  rfind(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	// look for [_Ptr, _Ptr + _Count) beginning before _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1816);
 #line 1818 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Count == 0)
			return (_Off < _Mysize ? _Off : _Mysize);	// null always matches
		if (_Count <= _Mysize)
			{	// room for match, look for it
			const _Elem *_Uptr = _Myptr() +
				(_Off < _Mysize - _Count ? _Off : _Mysize - _Count);
			for (; ; --_Uptr)
				if (_Traits::eq(*_Uptr, *_Ptr)
					&& _Traits::compare(_Uptr, _Ptr, _Count) == 0)
					return (_Uptr - _Myptr());	// found a match
				else if (_Uptr == _Myptr())
					break;	// at beginning, no more chance for match
			}

		return (npos);	// no match
		}

	size_type  rfind(const _Elem *_Ptr, size_type _Off = npos) const
		{	// look for [_Ptr, <null>) beginning before _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1838);
		return (rfind(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  rfind(_Elem _Ch, size_type _Off = npos) const
		{	// look for _Ch before _Off
		return (rfind((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_first_of(const _Myt& _Right,
		size_type _Off = 0) const
		{	// look for one of _Right at or after _Off
		return (find_first_of(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find_first_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	// look for one of [_Ptr, _Ptr + _Count) at or after _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1859);
 #line 1861 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (0 < _Count && _Off < _Mysize)
			{	// room for match, look for it
			const _Elem *const _Vptr = _Myptr() + _Mysize;
			for (const _Elem *_Uptr = _Myptr() + _Off; _Uptr < _Vptr; ++_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) != 0)
					return (_Uptr - _Myptr());	// found a match
			}

		return (npos);	// no match
		}

	size_type  find_first_of(const _Elem *_Ptr, size_type _Off = 0) const
		{	// look for one of [_Ptr, <null>) at or after _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1875);
		return (find_first_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_first_of(_Elem _Ch, size_type _Off = 0) const
		{	// look for _Ch at or after _Off
		return (find((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_last_of(const _Myt& _Right,
		size_type _Off = npos) const
		{	// look for one of _Right before _Off
		return (find_last_of(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find_last_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	// look for one of [_Ptr, _Ptr + _Count) before _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1896);
 #line 1898 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (0 < _Count && 0 < _Mysize)
			for (const _Elem *_Uptr = _Myptr()
				+ (_Off < _Mysize ? _Off : _Mysize - 1); ; --_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) != 0)
					return (_Uptr - _Myptr());	// found a match
				else if (_Uptr == _Myptr())
					break;	// at beginning, no more chance for match

		return (npos);	// no match
		}

	size_type  find_last_of(const _Elem *_Ptr,
		size_type _Off = npos) const
		{	// look for one of [_Ptr, <null>) before _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1913);
		return (find_last_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_last_of(_Elem _Ch, size_type _Off = npos) const
		{	// look for _Ch before _Off
		return (rfind((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_first_not_of(const _Myt& _Right,
		size_type _Off = 0) const
		{	// look for none of _Right at or after _Off
		return (find_first_not_of(_Right._Myptr(), _Off,
			_Right.size()));
		}

	size_type  find_first_not_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	// look for none of [_Ptr, _Ptr + _Count) at or after _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1935);
 #line 1937 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Off < _Mysize)
			{	// room for match, look for it
			const _Elem *const _Vptr = _Myptr() + _Mysize;
			for (const _Elem *_Uptr = _Myptr() + _Off; _Uptr < _Vptr; ++_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) == 0)
					return (_Uptr - _Myptr());
			}
		return (npos);
		}

	size_type  find_first_not_of(const _Elem *_Ptr,
		size_type _Off = 0) const
		{	// look for one of [_Ptr, <null>) at or after _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1951);
		return (find_first_not_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_first_not_of(_Elem _Ch, size_type _Off = 0) const
		{	// look for non _Ch at or after _Off
		return (find_first_not_of((const _Elem *)&_Ch, _Off, 1));
		}

	size_type  find_last_not_of(const _Myt& _Right,
		size_type _Off = npos) const
		{	// look for none of _Right before _Off
		return (find_last_not_of(_Right._Myptr(), _Off, _Right.size()));
		}

	size_type  find_last_not_of(const _Elem *_Ptr,
		size_type _Off, size_type _Count) const
		{	// look for none of [_Ptr, _Ptr + _Count) before _Off

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1972);
 #line 1974 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (0 < _Mysize)
			for (const _Elem *_Uptr = _Myptr()
				+ (_Off < _Mysize ? _Off : _Mysize - 1); ; --_Uptr)
				if (_Traits::find(_Ptr, _Count, *_Uptr) == 0)
					return (_Uptr - _Myptr());
				else if (_Uptr == _Myptr())
					break;
		return (npos);
		}

	size_type  find_last_not_of(const _Elem *_Ptr,
		size_type _Off = npos) const
		{	// look for none of [_Ptr, <null>) before _Off
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",1988);
		return (find_last_not_of(_Ptr, _Off, _Traits::length(_Ptr)));
		}

	size_type  find_last_not_of(_Elem _Ch, size_type _Off = npos) const
		{	// look for non _Ch before _Off
		return (find_last_not_of((const _Elem *)&_Ch, _Off, 1));
		}

	_Myt  substr(size_type _Off = 0, size_type _Count = npos) const
		{	// return [_Off, _Off + _Count) as new string
		return (_Myt(*this, _Off, _Count, get_allocator()));
		}

	int  compare(const _Myt& _Right) const
		{	// compare [0, _Mysize) with _Right
		return (compare(0, _Mysize, _Right._Myptr(), _Right.size()));
		}

	int  compare(size_type _Off, size_type _N0,
		const _Myt& _Right) const
		{	// compare [_Off, _Off + _N0) with _Right
		return (compare(_Off, _N0, _Right, 0, npos));
		}

	int  compare(size_type _Off,
		size_type _N0, const _Myt& _Right,
		size_type _Roff, size_type _Count) const
		{	// compare [_Off, _Off + _N0) with _Right [_Roff, _Roff + _Count)
		if (_Right.size() < _Roff)
			_String_base::_Xran();	// _Off off end
		if (_Right._Mysize - _Roff < _Count)
			_Count = _Right._Mysize - _Roff;	// trim _Count to size
		return (compare(_Off, _N0, _Right._Myptr() + _Roff, _Count));
		}

	int  compare(const _Elem *_Ptr) const
		{	// compare [0, _Mysize) with [_Ptr, <null>)
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",2026);
		return (compare(0, _Mysize, _Ptr, _Traits::length(_Ptr)));
		}

	int  compare(size_type _Off, size_type _N0, const _Elem *_Ptr) const
		{	// compare [_Off, _Off + _N0) with [_Ptr, <null>)
		_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",2032);
		return (compare(_Off, _N0, _Ptr, _Traits::length(_Ptr)));
		}

	int  compare(size_type _Off,
		size_type _N0, const _Elem *_Ptr, size_type _Count) const
		{	// compare [_Off, _Off + _N0) with [_Ptr, _Ptr + _Count)

 
		if (_Count != 0)
			_Debug_pointer(_Ptr, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring",2042);
 #line 2044 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

		if (_Mysize < _Off)
			_String_base::_Xran();	// _Off off end
		if (_Mysize - _Off < _N0)
			_N0 = _Mysize - _Off;	// trim _N0 to size

		size_type _Ans = _Traits::compare(_Myptr() + _Off, _Ptr,
			_N0 < _Count ? _N0 : _Count);
		return (_Ans != 0 ? (int)_Ans : _N0 < _Count ? -1
			: _N0 == _Count ? 0 : +1);
		}

	allocator_type  get_allocator() const
		{	// return allocator object for values
		return (_Mybase::_Alval);
		}

	enum
		{	// length of internal buffer, [1, 16]
		_BUF_SIZE = 16 / sizeof (_Elem) < 1 ? 1
			: 16 / sizeof(_Elem)};

protected:
	enum
		{	// roundup mask for allocated buffers, [0, 15]
		_ALLOC_MASK = sizeof (_Elem) <= 1 ? 15
			: sizeof (_Elem) <= 2 ? 7
			: sizeof (_Elem) <= 4 ? 3
			: sizeof (_Elem) <= 8 ? 1 : 0};

	void  _Chassign(size_type _Off, size_type _Count, _Elem _Ch)
		{	// assign _Count copies of _Ch beginning at _Off
		if (_Count == 1)
			_Traits::assign(*(_Myptr() + _Off), _Ch);
		else
			_Traits::assign(_Myptr() + _Off, _Count, _Ch);
		}

	void  _Copy(size_type _Newsize, size_type _Oldlen)
		{	// copy _Oldlen elements to newly allocated buffer
		size_type _Newres = _Newsize | _ALLOC_MASK;
		if (max_size() < _Newres)
			_Newres = _Newsize;	// undo roundup if too big
		else if (_Newres / 3 < _Myres / 2
			&& _Myres <= max_size() - _Myres / 2)
			_Newres = _Myres + _Myres / 2;	// grow exponentially if possible
		_Elem *_Ptr = 0;

		try {
			_Ptr = _Mybase::_Alval.allocate(_Newres + 1);
		} catch (...) {
			_Newres = _Newsize;	// allocation failed, undo roundup and retry
			try {
				_Ptr = _Mybase::_Alval.allocate(_Newres + 1);
			} catch (...) {
			_Tidy(true);	// failed again, discard storage and reraise
			throw;
			}
		}

		if (0 < _Oldlen)
			_Traits_helper::copy_s<_Traits>(_Ptr, _Newres + 1, _Myptr(), _Oldlen);	// copy existing elements
		_Tidy(true);
		_Bx._Ptr = _Ptr;
		_Myres = _Newres;
		_Eos(_Oldlen);
		}

	void  _Eos(size_type _Newsize)
		{	// set new length and null terminator
		_Traits::assign(_Myptr()[_Mysize = _Newsize], _Elem());
		}

	bool  _Grow(size_type _Newsize,
		bool _Trim = false)
		{	// ensure buffer is big enough, trim to size if _Trim is true
			if (max_size() < _Newsize)
			_String_base::_Xlen();	// result too long
		if (_Myres < _Newsize)
			_Copy(_Newsize, _Mysize);	// reallocate to grow
		else if (_Trim && _Newsize < _BUF_SIZE)
			_Tidy(true,	// copy and deallocate if trimming to small string
				_Newsize < _Mysize ? _Newsize : _Mysize);
		else if (_Newsize == 0)
			_Eos(0);	// new size is zero, just null terminate
		return (0 < _Newsize);	// return true only if more work to do
		}

	bool  _Inside(const _Elem *_Ptr)
		{	// test if _Ptr points inside string
		if (_Ptr == 0 || _Ptr < _Myptr() || _Myptr() + _Mysize <= _Ptr)
			return (false);	// don't ask
		else
			return (true);
		}

	static size_type __cdecl _Pdif(const_iterator _P2,
		const_iterator _P1)
		{	// compute safe iterator difference
		return ((_P2)._Myptr == 0 ? 0 : _P2 - _P1);
		}

	void  _Tidy(bool _Built = false,
		size_type _Newsize = 0)
		{	// initialize buffer, deallocating any storage
		if (!_Built)
			;
		else if (_BUF_SIZE <= _Myres)
			{	// copy any leftovers to small buffer and deallocate
			_Elem *_Ptr = _Bx._Ptr;
			if (0 < _Newsize)
				_Traits_helper::copy_s<_Traits>(_Bx._Buf, _BUF_SIZE, _Ptr, _Newsize);
			_Mybase::_Alval.deallocate(_Ptr, _Myres + 1);
			}
		_Myres = _BUF_SIZE - 1;
		_Eos(_Newsize);
		}

	union _Bxty
		{	// storage for small buffer or pointer to larger one
		_Elem _Buf[_BUF_SIZE];
		_Elem *_Ptr;
		} _Bx;

	_Elem * _Myptr()
		{	// determine current pointer to buffer for mutable string
		return (_BUF_SIZE <= _Myres ? _Bx._Ptr : _Bx._Buf);
		}

	const _Elem * _Myptr() const
		{	// determine current pointer to buffer for nonmutable string
		return (_BUF_SIZE <= _Myres ? _Bx._Ptr : _Bx._Buf);
		}

	size_type _Mysize;	// current length of string
	size_type _Myres;	// current storage reserved for string
	};

	// basic_string implements a performant swap
template<class _Elem, class _Traits, class _Ax>
	class _Move_operation_category<basic_string<_Elem, _Traits, _Ax> >
	{
	public:
		typedef _Swap_move_tag _Move_cat;
	};

		// STATIC npos OBJECT
template<class _Elem,
	class _Traits,
	class _Alloc>
	 const typename basic_string<_Elem, _Traits, _Alloc>::size_type
		basic_string<_Elem, _Traits, _Alloc>::npos =
			(typename basic_string<_Elem, _Traits, _Alloc>::size_type)(-1);

		// basic_string TEMPLATE OPERATORS

template<class _Elem,
	class _Traits,
	class _Alloc> inline
	void __cdecl swap(basic_string<_Elem, _Traits, _Alloc>& _Left,
		basic_string<_Elem, _Traits, _Alloc>& _Right)
	{	// swap _Left and _Right strings
	_Left.swap(_Right);
	}

typedef basic_string<char, char_traits<char>, allocator<char> >
	string;
typedef basic_string<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> > wstring;

 

template class __declspec(dllimport) allocator<char>;
template class __declspec(dllimport) allocator<wchar_t>;
template class __declspec(dllimport) _String_val<char, allocator<char> >;
template class __declspec(dllimport) _String_val<wchar_t, allocator<wchar_t> >;
template class __declspec(dllimport) basic_string<char, char_traits<char>,
	allocator<char> >;
template class __declspec(dllimport) basic_string<wchar_t, char_traits<wchar_t>,
	allocator<wchar_t> >;




 #line 2229 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
}

 #pragma warning(default: 4251)
 #pragma warning(pop)
 #pragma pack(pop)
#line 2235 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

#line 2237 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"
#line 2238 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xstring"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */

#line 8 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 13 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"
namespace std {





		// CLASS logic_error
class logic_error
	: public std:: exception
	{	// base of all logic-error exceptions
public:
	explicit  logic_error(const string& _Message)
		: _Str(_Message)
		{	// construct from message string
		}

	virtual  ~logic_error() throw ()
		{	// destroy the object
		}

	virtual const char * what() const throw ()
		{	// return pointer to message string
		return (_Str.c_str());
		}

 





#line 45 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

private:
	string _Str;	// the stored message string
	};

		// CLASS domain_error
class domain_error
	: public logic_error
	{	// base of all domain-error exceptions
public:
	explicit  domain_error(const string& _Message)
		: logic_error(_Message)
		{	// construct from message string
		}

	virtual  ~domain_error() throw ()
		{	// destroy the object
		}

 





#line 71 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};

		// CLASS invalid_argument
class invalid_argument
	: public logic_error
	{	// base of all invalid-argument exceptions
public:
	explicit  invalid_argument(const string& _Message)
		: logic_error(_Message)
		{	// construct from message string
		}

	virtual  ~invalid_argument() throw ()
		{	// destroy the object
		}

 





#line 95 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};

		// CLASS length_error
class length_error
	: public logic_error
	{	// base of all length-error exceptions
public:
	explicit  length_error(const string& _Message)
		: logic_error(_Message)
		{	// construct from message string
		}

	virtual  ~length_error() throw ()
		{	// destroy the object
		}

 





#line 119 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};

		// CLASS out_of_range
class out_of_range
	: public logic_error
	{	// base of all out-of-range exceptions
public:
	explicit  out_of_range(const string& _Message)
		: logic_error(_Message)
		{	// construct from message string
		}

	virtual  ~out_of_range() throw ()
		{	// destroy the object
		}

 





#line 143 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};

		// CLASS runtime_error
class runtime_error
	: public std:: exception
	{	// base of all runtime-error exceptions
public:
	explicit  runtime_error(const string& _Message)
		: _Str(_Message)
		{	// construct from message string
		}

	virtual  ~runtime_error() throw ()
		{	// destroy the object
		}

	virtual const char * what() const throw ()
		{	// return pointer to message string
		return (_Str.c_str());
		}

 





#line 172 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

private:
	string _Str;	// the stored message string
	};

		// CLASS overflow_error
class overflow_error
	: public runtime_error
	{	// base of all overflow-error exceptions
public:
	explicit  overflow_error(const string& _Message)
		: runtime_error(_Message)
		{	// construct from message string
		}

	virtual  ~overflow_error() throw ()
		{	// destroy the object
		}

 





#line 198 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};

		// CLASS underflow_error
class underflow_error
	: public runtime_error
	{	// base of all underflow-error exceptions
public:
	explicit  underflow_error(const string& _Message)
		: runtime_error(_Message)
		{	// construct from message string
		}

	virtual  ~underflow_error() throw ()
		{	// destroy the object
		}

 





#line 222 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};

		// CLASS range_error
class range_error
	: public runtime_error
	{	// base of all range-error exceptions
public:
	explicit  range_error(const string& _Message)
		: runtime_error(_Message)
		{	// construct from message string
		}

	virtual  ~range_error() throw ()
		{	// destroy the object
		}

 





#line 246 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

	};























}

 #pragma warning(pop)
 #pragma pack(pop)
#line 276 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

#line 278 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"
#line 279 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\stdexcept"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 9 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"
/***
*typeinfo.h - Defines the type_info structure and exceptions used for RTTI
*
*	Copyright (c) Microsoft Corporation. All rights reserved.
*	Modified January 1996 by P.J. Plauger
*
*Purpose:
*       Defines the type_info structure and exceptions used for
*       Runtime Type Identification.
*
*       [Public]
*
****/


#pragma once
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"







#pragma pack(push,8)
#line 27 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"

 



 

#line 35 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"

struct __type_info_node {
    void *memPtr;
    __type_info_node* next;
};

extern __type_info_node __type_info_root_node;

class type_info {
public:
    virtual ~type_info();
    __declspec(dllimport) bool  operator==(const type_info& rhs) const;
    __declspec(dllimport) bool  operator!=(const type_info& rhs) const;
    __declspec(dllimport) int  before(const type_info& rhs) const;
    __declspec(dllimport) const char*  name(__type_info_node* __ptype_info_node = &__type_info_root_node) const;
    __declspec(dllimport) const char*  raw_name() const;
private:
    void *_m_data;
    char _m_d_name[1];
     type_info(const type_info& rhs);
    type_info&  operator=(const type_info& rhs);
    __declspec(dllimport) static const char *__cdecl _Name_base(const type_info *,__type_info_node* __ptype_info_node);
    __declspec(dllimport) static void __cdecl _Type_info_dtor(type_info *);
};

 

 namespace std {

using ::type_info;

 }


// This include must occur below the definition of class type_info


 namespace std {

class __declspec(dllimport) bad_cast : public exception {
public:










     bad_cast(const char * _Message = "bad cast");
     bad_cast(const bad_cast &);
    virtual  ~bad_cast();
#line 90 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"
};

class __declspec(dllimport) bad_typeid : public exception {
public:










     bad_typeid(const char * _Message = "bad typeid");
     bad_typeid(const bad_typeid &);
    virtual  ~bad_typeid();
#line 108 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"

};

class __declspec(dllimport) __non_rtti_object : public bad_typeid {
public:










     __non_rtti_object(const char * _Message);
     __non_rtti_object(const __non_rtti_object &);
    virtual  ~__non_rtti_object();
#line 127 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"
};

 }
 

 
























































#line 190 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"

#line 192 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"


#pragma pack(pop)
#line 196 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"

#line 198 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\typeinfo"

/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Modified January 1996 by P.J. Plauger
 * Modified November 1998 by P.J. Plauger
 * Consult your license regarding permissions and restrictions.
 */
#line 10 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug"
// debug heap support header for Microsoft
#pragma once






 #pragma pack(push,8)
 #pragma warning(push,3)
#line 12 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug"

namespace std {
struct _DebugHeapTag_t
	{	// placement new tag type to select debug CRT heap
	int _Type;
	};
}

		// SUPPORT FOR DEBUG HEAP

 
   
   
   
   

  
  
  

[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] __declspec(dllimport) void * __cdecl operator new(size_t _Size,
	const std::_DebugHeapTag_t&, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *, int)
		throw (...);	// allocate from the debug CRT heap

[returnvalue:SA_Post(Null=SA_No,WritableBytes="_Size")] __declspec(dllimport) void * __cdecl operator new[](size_t _Size,
	const std::_DebugHeapTag_t&, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *, int)
		throw (...);	// allocate array from the debug CRT heap

__declspec(dllimport) void __cdecl operator delete(void *,
	const std::_DebugHeapTag_t&, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *, int)
		throw ();	// delete if new for debug CRT heap fails

__declspec(dllimport) void __cdecl operator delete[](void *,
	const std::_DebugHeapTag_t&, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *, int)
		throw ();	// delete if array new for debug CRT heap fails

namespace std {

__declspec(dllimport) const _DebugHeapTag_t& __cdecl _DebugHeapTag_func();

		// TEMPLATE FUNCTION _DebugHeapDelete
template<class _Ty>
	void __cdecl _DebugHeapDelete(_Ty *_Ptr)
	{	// delete from the debug CRT heap even if operator delete exists
	if (_Ptr != 0)
		{	// worth deleting
		_Ptr->~_Ty();
		// delete as _NORMAL_BLOCK, not _CRT_BLOCK, since we might have
		// facets allocated by normal new.
		free(_Ptr);
		}
	}

		// TEMPLATE CLASS _DebugHeapAllocator
template<class _Ty>
	class _DebugHeapAllocator
	: public allocator<_Ty>
	{	// an allocator which uses the debug CRT heap
public:

	template<class _Other>
		struct rebind
		{	// convert _DebugHeapAllocator<_Ty> to _DebugHeapAllocator<_Other>
		typedef typename _DebugHeapAllocator<_Other> other;
		};

	typename allocator<_Ty>::pointer __cdecl allocate(typename allocator<_Ty>::size_type _Count, const void *)
		{	// check for integer overflow
		if (_Count <= 0)
			_Count = 0;
		else if (((size_t)(-1) / _Count) < sizeof(_Ty))
			throw std::bad_alloc(0);

			// allocate array of _Count elements, ignore hint
		return ((_Ty *)new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug", 86) char[_Count * sizeof(_Ty)]);
		}

	typename allocator<_Ty>::pointer  allocate(typename allocator<_Ty>::size_type _Count)
		{	// check for integer overflow
		if (_Count <= 0)
			_Count = 0;
		else if (((size_t)(-1) / _Count) < sizeof(_Ty))
			throw std::bad_alloc(0);

			// allocate array of _Count elements
		return ((_Ty *)new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug", 97) char[_Count * sizeof(_Ty)]);
		}

	void  deallocate(typename allocator<_Ty>::pointer _Ptr, typename allocator<_Ty>::size_type)
		{	// deallocate object at _Ptr, ignore size
		std::_DebugHeapDelete((void *)_Ptr);
		}
	};

template class __declspec(dllimport) _DebugHeapAllocator<char>;

		// CLASS _DebugHeapString
class __declspec(dllimport) _DebugHeapString
	: public basic_string<char, char_traits<char>, _DebugHeapAllocator<char> >
	{	// a version of std::string allocated on the debug CRT heap
public:
	typedef _DebugHeapString _Myt;
	typedef basic_string<char, char_traits<char>, _DebugHeapAllocator<char> >
		_Mybase;
	typedef char _Elem;

	 _DebugHeapString()
		: _Mybase()
		{	// construct empty string
		}

	 _DebugHeapString(const _Myt& _Right)
		: _Mybase(_Right)
		{	// construct by copying _Right
		}

	 _DebugHeapString(const _Elem *_Ptr)
		: _Mybase(_Ptr)
		{	// construct from [_Ptr, <null>)
		}

	 _DebugHeapString(const string &_Str)
		: _Mybase(_Str.c_str())
		{	// construct from std::string
		}

	 operator string() const
		{	// convert to a string
		return (string(c_str()));
		}
	};
}

  




#line 151 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug"



 #pragma warning(pop)
 #pragma pack(pop)
#line 157 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug"


#line 160 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug"
#line 161 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xdebug"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 11 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"
// xlocinfo internal header for Microsoft
#pragma once



#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"
/* xlocinfo.h internal header for Microsoft C */
#pragma once


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


















































/* the character classification macro definitions */



/*
 * Maximum number of bytes in multi-byte character in the current locale
 * (also defined in stdlib.h).
 */

















/* Introduced to detect error when character testing functions are called
 * with illegal input of integer.
 */

__declspec(dllimport) int __cdecl _chvalidator([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mask);



#line 214 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"












































#line 259 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


__declspec(dllimport) int __cdecl _chvalidator_l([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Ch, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Mask);



#line 266 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

















































































/* MS C version 2.0 extended ctype macros */











#line 360 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"




/* Non-ANSI names for compatibility */











#line 377 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 379 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"


}
#line 383 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"

#line 385 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ctype.h"
#line 6 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"
/***
*locale.h - definitions/declarations for localization routines
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file defines the structures, values, macros, and functions
*       used by the localization routines.
*
*       [Public]
*
****/


#pragma once
#line 17 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"




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






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 22 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"


/*
 * Currently, all MS C compilers for Win32 platforms default to 8 byte
 * alignment.
 */
#pragma pack(push,8)
#line 30 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"


extern "C" {
#line 34 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"

/* define NULL pointer value */








/* Locale categories */











/* Locale convention structure */


struct lconv {
        char *decimal_point;
        char *thousands_sep;
        char *grouping;
        char *int_curr_symbol;
        char *currency_symbol;
        char *mon_decimal_point;
        char *mon_thousands_sep;
        char *mon_grouping;
        char *positive_sign;
        char *negative_sign;
        char int_frac_digits;
        char frac_digits;
        char p_cs_precedes;
        char p_sep_by_space;
        char n_cs_precedes;
        char n_sep_by_space;
        char p_sign_posn;
        char n_sign_posn;
        };

#line 81 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"

/* ANSI: char lconv members default is CHAR_MAX which is compile time
   dependent. Defining and using _charmax here causes CRT startup code
   to initialize lconv members properly */






/* function prototypes */









#line 102 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"

 __declspec(dllimport) int __cdecl _configthreadlocale([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Flag);
 __declspec(dllimport) char * __cdecl setlocale([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Category, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Locale);
 __declspec(dllimport) struct lconv * __cdecl localeconv(void);
 __declspec(dllimport) _locale_t __cdecl _get_current_locale(void);
 __declspec(dllimport) _locale_t __cdecl _create_locale([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Category, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Locale);
__declspec(dllimport) void __cdecl _free_locale([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);

/* use _get_current_locale, _create_locale and _free_locale, instead of these functions with double leading underscore */
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "_get_current_locale" " instead. See online help for details.")) __declspec(dllimport) _locale_t __cdecl __get_current_locale(void);
[returnvalue:SA_Post(MustCheck=SA_Yes)] __declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "_create_locale" " instead. See online help for details.")) __declspec(dllimport) _locale_t __cdecl __create_locale([SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] int _Category, [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] const char * _Locale);
__declspec(deprecated("This function or variable has been superceded by newer library or operating system functionality. Consider using " "_free_locale" " instead. See online help for details.")) __declspec(dllimport) void __cdecl __free_locale([SA_Pre(Null=SA_Maybe)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] _locale_t _Locale);











}
#line 127 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"


#pragma pack(pop)
#line 131 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"

#line 133 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\locale.h"
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"






#pragma pack(push,8)
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"



extern "C" {
#line 20 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"

		/* SUPPLEMENTAL CTYPE MACROS & DECLARATIONS */











		/* SUPPLEMENTAL LOCALE MACROS AND DECLARATIONS */



















typedef struct _Collvec
	{	/* stuff needed by _Strcoll, etc. */
	unsigned long _Hand;	// LCID
	unsigned int _Page;		// UINT
	} _Collvec;

typedef struct _Ctypevec
	{	/* stuff needed by _Tolower, etc. */
	unsigned long _Hand;	// LCID
	unsigned int _Page;		// UINT
	const short *_Table;
	int _Delfl;
	} _Ctypevec;

typedef struct _Cvtvec
	{	/* stuff needed by _Mbrtowc, etc. */
	unsigned long _Hand;	// LCID
	unsigned int _Page;		// UINT
	} _Cvtvec;

		/* FUNCTION DECLARATIONS */
__declspec(dllimport) _Collvec __cdecl _Getcoll();
__declspec(dllimport) _Ctypevec __cdecl _Getctype();
__declspec(dllimport) _Cvtvec __cdecl _Getcvt();

__declspec(dllimport) int __cdecl _Getdateorder();

__declspec(dllimport) int __cdecl _Mbrtowc([SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] wchar_t *, const char *, size_t,
	mbstate_t *, const _Cvtvec *);
__declspec(dllimport) float __cdecl _Stof(const char *, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **, long);
__declspec(dllimport) double __cdecl _Stod(const char *, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **, long);
__declspec(dllimport) long double __cdecl _Stold(const char *, [SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **, 
  long);
__declspec(dllimport) int __cdecl _Strcoll(const char *, const char *,
	const char *, const char *, const _Collvec *);
__declspec(dllimport) size_t __cdecl _Strxfrm(
  [SA_Pre(Null=SA_No,WritableElements="\n@""_End1-_String1")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="return")] [SA_Post(Deref=1,Valid=SA_Yes)] char * _String1, 
  [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char * _End1, const char *, const char *, const _Collvec *);
__declspec(dllimport) int __cdecl _Tolower(int, const _Ctypevec *);
__declspec(dllimport) int __cdecl _Toupper(int, const _Ctypevec *);
__declspec(dllimport) int __cdecl _Wcrtomb([SA_Pre(Null=SA_No,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] char *, wchar_t, mbstate_t *,
	const _Cvtvec *);
__declspec(dllimport) int __cdecl _Wcscoll(const wchar_t *, const wchar_t *,
	const wchar_t *, const wchar_t *, const _Collvec *);
__declspec(dllimport) size_t __cdecl _Wcsxfrm(
  [SA_Pre(Null=SA_No,WritableElements="\n@""_End1-_String1")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="return")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_String1, 
  [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_End1, const wchar_t *, const wchar_t *, const _Collvec *);

__declspec(dllimport) short __cdecl _Getwctype(wchar_t, const _Ctypevec *);
__declspec(dllimport) const wchar_t * __cdecl _Getwctypes(const wchar_t *, const wchar_t *,
	short*, const _Ctypevec*);
__declspec(dllimport) wchar_t __cdecl _Towlower(wchar_t, const _Ctypevec *);
__declspec(dllimport) wchar_t __cdecl _Towupper(wchar_t, const _Ctypevec *);

}
#line 109 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"


extern "C" {
__declspec(dllimport) void *__cdecl _Gettnames();
__declspec(dllimport) char *__cdecl _Getdays();
__declspec(dllimport) char *__cdecl _Getmonths();
__declspec(dllimport) size_t __cdecl _Strftime(
  [SA_Pre(Null=SA_No,WritableElements="_Maxsize")] [SA_Pre(Deref=1,Valid=SA_No)] char *, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] size_t _Maxsize, 
  [SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)]  const char *, [SA_Pre(Null=SA_No)] [SA_Pre(Deref=1,Valid=SA_Yes,Access=SA_Read)] const struct tm *, void *);
}

extern "C" {
_locale_t __cdecl _GetLocaleForCP(unsigned int);
}


#pragma pack(pop)
#line 127 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"

#line 129 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo.h"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"




 #pragma pack(push,8)
 #pragma warning(push,3)
 #pragma warning(disable:4412)
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"

namespace std {

		// CLASS _Timevec
class __declspec(dllimport) _Timevec
	{	// smart pointer to information used by _Strftime
public:
	 _Timevec(void *_Ptr = 0)
		: _Timeptr(_Ptr)
		{	// construct from ptr
		}

	 _Timevec(const _Timevec& _Right)
		{	// construct from _Right
		*this = _Right;
		}

	 ~_Timevec()
		{	// destroy the object
		free(_Timeptr);
		}

	_Timevec&  operator=(const _Timevec& _Right)
		{	// transfer ownership of _Timeptr from _Right
		_Timeptr = _Right._Timeptr;
		((_Timevec *)&_Right)->_Timeptr = 0;
		return (*this);
		}

	void * _Getptr() const
		{	// return pointer to time information
		return (_Timeptr);
		}

private:
	void *_Timeptr;	// pointer to time information
	};

		// CLASS _Locinfo

// warning 4412 is benign here
#pragma warning(push)
#pragma warning(disable:4412)
class __declspec(dllimport) _Locinfo
	{	// summary of all stuff peculiar to a locale used by standard facets
public:
	typedef ::_Collvec _Collvec;
	typedef ::_Ctypevec _Ctypevec;
	typedef ::_Cvtvec _Cvtvec;
	typedef std::_Timevec _Timevec;

    static  void __cdecl _Locinfo_ctor(_Locinfo *, const char *);
	static  void __cdecl _Locinfo_ctor(_Locinfo *, const string&);
	static  void __cdecl _Locinfo_ctor(_Locinfo *, int, const char *);
    static  void __cdecl _Locinfo_dtor(_Locinfo *);
    static  _Locinfo& __cdecl _Locinfo_Addcats(_Locinfo *, int, const char *);

	 _Locinfo(const char *_Pch = "C")

        : _Lock(0)
#line 76 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"
        {
        if (_Pch == 0)
            throw runtime_error("bad locale name");
        _Locinfo_ctor(this, _Pch);
        }

	 _Locinfo(int _I, const char *_Pch)

        : _Lock(0)
#line 86 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"
        {
        if (_Pch == 0)
            throw runtime_error("bad locale name");
        _Locinfo_ctor(this, _I, _Pch);
        }

	 _Locinfo(const string& locstr)

        : _Lock(0)
#line 96 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"
		{
        _Locinfo_ctor(this, locstr);
		}

	 ~_Locinfo()
        {
        _Locinfo_dtor(this);
        }

	_Locinfo&  _Addcats(int _I, const char *_Pch)
		{
		if (_Pch == 0)
			throw runtime_error("bad locale name");
		return _Locinfo_Addcats(this, _I, _Pch);
		}

	string  _Getname() const
		{	// return the new locale name
		return (_Newlocname);
		}

	_Collvec  _Getcoll() const
		{	// return collation stuff
		return (::_Getcoll());
		}

	_Ctypevec  _Getctype() const
		{	// return ctype stuff
		return (::_Getctype());
		}

	_Cvtvec  _Getcvt() const
		{	// return codecvt stuff
		return (::_Getcvt());
		}

	const lconv * _Getlconv() const
		{	// return localeconv stuff
		return (localeconv());
		}

	_Timevec  _Gettnames() const
		{	// return names used by _Strftime
		return (_Timevec(::_Gettnames()));
		}

	const char * _Getdays() const
		{	// return names for weekdays
		const char *_Ptr = ::_Getdays();
		if (_Ptr != 0)
			{	// capture names and free allocated C string
			((_Locinfo *)this)->_Days = _Ptr;
			free((void *)_Ptr);
			}
		return (_Days.size() != 0 ? _Days.c_str()
			: ":Sun:Sunday:Mon:Monday:Tue:Tuesday:Wed:Wednesday"
				":Thu:Thursday:Fri:Friday:Sat:Saturday");
		}

	const char * _Getmonths() const
		{	// return names for months
		const char *_Ptr = ::_Getmonths();
		if (_Ptr != 0)
			{	// capture names and free allocated C string
			((_Locinfo *)this)->_Months = _Ptr;
			free((void *)_Ptr);
			}
		return (_Months.size() != 0 ? _Months.c_str()
			: ":Jan:January:Feb:February:Mar:March"
				":Apr:April:May:May:Jun:June"
				":Jul:July:Aug:August:Sep:September"
				":Oct:October:Nov:November:Dec:December");
		}

	const char * _Getfalse() const
		{	// return false name (no C source)
		return ("false");
		}

	const char * _Gettrue() const
		{	// return true name (no C source)
		return ("true");
		}

	int  _Getdateorder() const
		{	// return date order
		return ::_Getdateorder();
		}

private:





	_Lockit _Lock;	// thread lock, because global locale is altered
#line 193 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"
	string _Days;	// weekday names
	string _Months;	// month names
	string _Oldlocname;	// old locale name to revert to on destruction
	string _Newlocname;	// new locale name for this object
	};
#pragma warning(pop)

		// TEMPLATE FUNCTION _LStrcoll
template<class _Elem> inline
	int __cdecl _LStrcoll(const _Elem *_First1, const _Elem *_Last1,
		const _Elem *_First2, const _Elem *_Last2,
			const _Locinfo::_Collvec *)
	{	// perform locale-specific comparison of _Elem sequences
	for (; _First1 != _Last1 && _First2 != _Last2; ++_First1, ++_First2)
		if (*_First1 < *_First2)
			return (-1);	// [_First1, _Last1) < [_First2, _Last2)
		else if (*_First2 < *_First1)
			return (+1);	// [_First1, _Last1) > [_First2, _Last2)
	return (_First2 != _Last2 ? -1 : _First1 != _Last1 ? +1 : 0);
	}

template<> inline
	int __cdecl _LStrcoll(const char *_First1, const char *_Last1,
		const char *_First2, const char *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	// perform locale-specific comparison of char sequences
	return (_Strcoll(_First1, _Last1, _First2, _Last2, _Vector));
	}

template<> inline
	int __cdecl _LStrcoll(const wchar_t *_First1, const wchar_t *_Last1,
		const wchar_t *_First2, const wchar_t *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	// perform locale-specific comparison of wchar_t sequences
	return (_Wcscoll(_First1, _Last1, _First2, _Last2, _Vector));
	}

		// TEMPLATE FUNCTION _LStrxfrm
template<class _Elem> inline
	size_t __cdecl _LStrxfrm(_Elem *_First1, _Elem *_Last1,
		const _Elem *_First2, const _Elem *_Last2,
			const _Locinfo::_Collvec *)
	{	// perform locale-specific transform of _Elems [_First1, _Last1)
	size_t _Count = _Last2 - _First2;
	if (_Count <= (size_t)(_Last1 - _First1))
		::memcpy_s((_First1), ((_Last1 - _First1)* sizeof(_Elem)), (_First2), (_Count * sizeof (_Elem)));
	return (_Count);
	}

template<> inline
	size_t __cdecl _LStrxfrm(
		[SA_Pre(Null=SA_No,WritableElements="\n@""_Last1-_First1")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="return")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_First1, 
		[SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *_Last1,
		const char *_First2, const char *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	// perform locale-specific transform of chars [_First1, _Last1)
	return (_Strxfrm(_First1, _Last1, _First2, _Last2, _Vector));
	}

template<> inline
	size_t __cdecl _LStrxfrm(
		[SA_Pre(Null=SA_No,WritableElements="\n@""_Last1-_First1")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="return")] [SA_Post(Deref=1,Valid=SA_Yes)] wchar_t *_First1, 
		[SA_Pre(Null=SA_No,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *_Last1,
		const wchar_t *_First2, const wchar_t *_Last2,
			const _Locinfo::_Collvec *_Vector)
	{	// perform locale-specific transform of wchar_ts [_First1, _Last1)
	return (_Wcsxfrm(_First1, _Last1, _First2, _Last2, _Vector));
	}
}

 #pragma warning(pop)
 #pragma pack(pop)
#line 266 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"

#line 268 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"
#line 269 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocinfo"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 12 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"


 #pragma pack(push,8)
 #pragma warning(push,3)
 #pragma warning(disable:4412)
#line 18 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

namespace std {

		// TEMPLATE CLASS _Locbase
template<class _Dummy>
	class _Locbase
	{	// define templatized category constants, instantiate on demand
public:
	 static const int collate = ((1 << (1)) >> 1);
	 static const int ctype = ((1 << (2)) >> 1);
	 static const int monetary = ((1 << (3)) >> 1);
	 static const int numeric = ((1 << (4)) >> 1);
	 static const int time = ((1 << (5)) >> 1);
	 static const int messages = ((1 << (6)) >> 1);
	 static const int all = (((1 << (7)) >> 1) - 1);
	 static const int none = 0;
	};

template<class _Dummy>
	const int _Locbase<_Dummy>::collate;
template<class _Dummy>
	const int _Locbase<_Dummy>::ctype;
template<class _Dummy>
	const int _Locbase<_Dummy>::monetary;
template<class _Dummy>
	const int _Locbase<_Dummy>::numeric;
template<class _Dummy>
	const int _Locbase<_Dummy>::time;
template<class _Dummy>
	const int _Locbase<_Dummy>::messages;
template<class _Dummy>
	const int _Locbase<_Dummy>::all;
template<class _Dummy>
	const int _Locbase<_Dummy>::none;

		// CLASS locale
class locale;
template<class _Facet>
	const _Facet& __cdecl use_facet(const locale&);

// warning 4412 is benign here
#pragma warning(push)
#pragma warning(disable:4412)
class __declspec(dllimport) locale
	: public _Locbase<int>
	{	// nonmutable collection of facets that describe a locale
public:
	typedef int category;

			// CLASS id
	class __declspec(dllimport) id
		{	// identifier stamp, unique for each distinct kind of facet
	public:
		 id(size_t _Val = 0)
			: _Id(_Val)
			{	// construct with specified stamp value
			}

		 operator size_t()
			{	// get stamp, with lazy allocation
			if (_Id == 0)
				{	// still zero, allocate stamp
				{ ::std:: _Lockit _Lock(0);
					if (_Id == 0)
						_Id = ++_Id_cnt;
				}
				}
			return (_Id);
			}

	private:
		 id(const id&);	// not defined
		id&  operator=(const id&);	// not defined

		size_t _Id;	// the identifier stamp
		static  int& __cdecl _Id_cnt_func();



		 static int _Id_cnt;	// static source of unique stamps
#line 99 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
		};

	class _Locimp;

			// class facet
	class facet
		{	// base class for all locale facets, performs reference counting
		friend class locale;
		friend class _Locimp;

	public:
		__declspec(dllimport) static size_t __cdecl _Getcat(const facet ** = 0,
			const locale * = 0)
			{	// get category value, or -1 if no corresponding C category
			return ((size_t)(-1));
			}

		__declspec(dllimport) void  _Incref()
			{	// safely increment the reference count
			{ ::std:: _Lockit _Lock(0);
				if (_Refs < (size_t)(-1))
					++_Refs;
			}
			}

		__declspec(dllimport) facet * _Decref()
			{	// safely decrement the reference count, return this when dead
			{ ::std:: _Lockit _Lock(0);
				if (0 < _Refs && _Refs < (size_t)(-1))
					--_Refs;
				return (_Refs == 0 ? this : 0);
			}
			}

		void  _Register()
			{


#line 138 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
			facet_Register(this);
#line 140 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
			}

  
		__declspec(dllimport) void * __cdecl operator new(size_t _Size)
			{	// replace operator new
			return (operator new(_Size, std::_DebugHeapTag_func(),
				"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 146));
			}

		__declspec(dllimport) void * __cdecl operator new(size_t _Size,
			const std::_DebugHeapTag_t& _Tag, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *_File, int _Line)
			{	// replace debugging operator new
			return (::operator new(_Size, _Tag, _File, _Line));
			}

		__declspec(dllimport) void __cdecl operator delete(void *_Ptr,
			const std::_DebugHeapTag_t&, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] char *, int)
			{	// replace debugging operator delete
			operator delete(_Ptr);
			}

		__declspec(dllimport) void __cdecl operator delete(void *_Ptr)
			{	// replace operator delete
			std::_DebugHeapDelete((facet*)_Ptr);
			}
 #line 166 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"


//	_PROTECTED:
		__declspec(dllimport) virtual  ~facet()
			{	// destroy the object
			}

	protected:
		__declspec(dllimport) explicit  facet(size_t _Initrefs = 0)
			: _Refs(_Initrefs)
			{	// construct with initial reference count
			}

	private:


#line 183 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
		static void __cdecl facet_Register(facet *);	// queue up lazy facet for destruction
#line 185 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

		 facet(const facet&);	// not defined
		facet&  operator=(const facet&);	// not defined

		size_t _Refs;	// the reference count
		};

#pragma warning(push)
#pragma warning(disable:4275)
			// CLASS _Locimp
	class __declspec(dllimport) _Locimp
		: public facet
		{	// reference-counted actual implementation of a locale
	protected:
		 ~_Locimp()
			{
			_Locimp_dtor(this);
			}

	private:
		static  void __cdecl _Locimp_dtor(_Locimp *); // destoy the object
		static void _Locimp_ctor(_Locimp *,const _Locimp&);	// copy a _Locimp
		static  void __cdecl _Locimp_Addfac(_Locimp *,facet *, size_t);	// add a facet
		friend class locale;

		 _Locimp(bool _Transparent = false)
			: locale::facet(1), _Facetvec(0), _Facetcount(0),
				_Catmask(none), _Xparent(_Transparent), _Name("*")
			{ }
		
		 _Locimp(const _Locimp& _Right)
			: locale::facet(1), _Facetvec(0), _Facetcount(_Right._Facetcount),
				_Catmask(_Right._Catmask), _Xparent(_Right._Xparent), _Name(_Right._Name)
			{
			_Locimp_ctor(this, _Right);
			}
		
		void  _Addfac(facet *_Pfacet, size_t _Id)
			{
			_Locimp_Addfac(this, _Pfacet, _Id);
			}

		static _Locimp * _Makeloc(const _Locinfo&,
			category, _Locimp *, const locale *);	// make essential facets

		static void _Makewloc(const _Locinfo&,
			category, _Locimp *, const locale *);	// make wchar_t facets

 
		static void _Makeushloc(const _Locinfo&,
			category, _Locimp *, const locale *);	// make ushort facets
 #line 237 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

		static void _Makexloc(const _Locinfo&,
			category, _Locimp *, const locale *);	// make remaining facets

		facet **_Facetvec;	// pointer to vector of facets
		size_t _Facetcount;	// size of vector of facets
		category _Catmask;	// mask describing implemented categories
		bool _Xparent;	// true if locale is transparent
		_DebugHeapString _Name;	// locale name, or "*" if not known

		static  _Locimp *& __cdecl _Clocptr_func();	// pointer to "C" locale object



		 static _Locimp *_Clocptr;	// pointer to "C" locale object
#line 253 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
private:
		_Locimp&  operator=(const _Locimp&);	// not defined
	
		};
#pragma warning(pop)

	__declspec(deprecated("This is an obsolete part of the Standard C++ Library Implementation. Do not use it.")) locale&  _Addfac(facet *_Fac, size_t _Id,
		size_t _Catmask)
		{
		if (1 < this->_Ptr->_Refs)
			{	// shared, make private copy before altering
			this->_Ptr->_Decref();
			this->_Ptr = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 265) _Locimp(*this->_Ptr);
			}
		this->_Ptr->_Addfac(_Fac, _Id);

		if (_Catmask != 0)
			this->_Ptr->_Name = "*";
		return (*this);
		}


	template<class _Elem,
		class _Traits,
		class _Alloc>
		bool  operator()(const basic_string<_Elem, _Traits, _Alloc>& _Left,
			const basic_string<_Elem, _Traits, _Alloc>& _Right) const
		{	// compare _Left and _Right strings using collate facet in locale
		const std::collate<_Elem>& _Coll_fac =
			std::use_facet<std::collate<_Elem> >(*this);

		return (_Coll_fac.compare(_Left.c_str(), _Left.c_str() + _Left.size(),
			_Right.c_str(), _Right.c_str() + _Right.size()) < 0);
		}

	template<class _Facet>
		locale  combine(const locale& _Loc) const
		{	// combine two locales
		_Facet *_Facptr;

		try {
			_Facptr = (_Facet *)&std::use_facet<_Facet>(_Loc);
		} catch (...) {
			throw runtime_error("locale::combine facet missing");
		}

		_Locimp *_Newimp = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 299) _Locimp(*_Ptr);
		_Newimp->_Addfac(_Facptr, _Facet::id);
		_Newimp->_Catmask = 0;
		_Newimp->_Name = "*";
		return (locale(_Newimp));
		}

	template<class _Facet>
		 locale(const locale& _Loc, const _Facet *_Facptr)
			: _Ptr(new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 308) _Locimp(*_Loc._Ptr))
		{	// construct from _Loc, replacing facet with *_Facptr
		if (_Facptr != 0)
			{	// replace facet
			_Ptr->_Addfac((_Facet *)_Facptr, _Facet::id);
			if (_Facet::_Getcat() != (size_t)(-1))
				{	// no C category
				_Ptr->_Catmask = 0;
				_Ptr->_Name = "*";
				}
			}
		}


	 locale() throw ()
		: _Ptr(_Init())
		{	// construct from current locale
		_Getgloballocale()->_Incref();
		}

	 locale(_Uninitialized)
		{	// defer construction
		}

	 locale(const locale& _Right) throw ()
		: _Ptr(_Right._Ptr)
		{	// construct by copying
		_Ptr->_Incref();
		}

	 locale(const locale& _Loc, const locale& _Other,
		category _Cat) 	// construct from locale and category in another locale
		: _Ptr(new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 340) _Locimp(*_Loc._Ptr))
		{	// construct a locale by copying named facets
		try {
			{ _Locinfo _Lobj(_Loc._Ptr->_Catmask, _Loc._Ptr->_Name.c_str());
				_Locimp::_Makeloc(_Lobj._Addcats(_Cat & _Other._Ptr->_Catmask,
					_Other._Ptr->_Name.c_str()), _Cat, _Ptr, &_Other);
			}
		} catch (...) {
			std::_DebugHeapDelete(_Ptr->_Decref());
			throw;
		}
		}

	explicit  locale(const char *_Locname,
		category _Cat = all) 	// construct from named locale for category
		: _Ptr(new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 355) _Locimp)
		{	// construct a locale with named facets
		try {
		_Init();
		{ _Locinfo _Lobj(_Cat, _Locname);
			if (_Lobj._Getname().compare("*") == 0)
				throw runtime_error("bad locale name");
			_Locimp::_Makeloc(_Lobj, _Cat, _Ptr, 0);
		}
		} catch (...) {
		std::_DebugHeapDelete(_Ptr->_Decref());
		throw;
		}
		}

	 locale(const locale& _Loc, const char * _Locname,
		category _Cat) 	// construct from locale and category in named locale
		: _Ptr(new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 372) _Locimp(*_Loc._Ptr))
		{	// construct a locale by copying, replacing named facets
		try {
		{ _Locinfo _Lobj(_Loc._Ptr->_Catmask, _Loc._Ptr->_Name.c_str());
			bool _Hadname = _Lobj._Getname().compare("*") != 0;
			_Lobj._Addcats(_Cat, _Locname);

			if (_Hadname && _Lobj._Getname().compare("*") == 0)
				throw runtime_error("bad locale name");
			_Locimp::_Makeloc(_Lobj, _Cat, _Ptr, 0);
		}
		} catch (...) {
		std::_DebugHeapDelete(_Ptr->_Decref());
		throw;
		}
		}

	 ~locale() throw ()
		{	// destroy the object
		if (_Ptr != 0)
			std::_DebugHeapDelete(_Ptr->_Decref());
		}

	locale&  operator=(const locale& _Right) throw ()
		{	// assign a locale
		if (_Ptr != _Right._Ptr)
			{	// different implementation, point at new one
			std::_DebugHeapDelete(_Ptr->_Decref());
			_Ptr = _Right._Ptr;
			_Ptr->_Incref();
			}
		return (*this);
		}

	string  name() const
		{	// return locale name
		return (_Ptr->_Name);
		}

	const facet * _Getfacet(size_t _Id) const 	// get facet by id
		{	// look up a facet in locale object
		const facet *_Facptr = _Id < _Ptr->_Facetcount
			? _Ptr->_Facetvec[_Id] : 0;	// null if id off end
		if (_Facptr != 0 || !_Ptr->_Xparent)
			return (_Facptr);	// found facet or not transparent, return pointer
		else
			{	// look in current locale
			locale::_Locimp *_Ptr = _Getgloballocale();
			return (_Id < _Ptr->_Facetcount
				? _Ptr->_Facetvec[_Id]	// get from current locale
				: 0);	// no entry in current locale
			}
		}


	bool  operator==(const locale& _Loc) const
		{	// compare locales for equality
		return (_Ptr == _Loc._Ptr
			|| name().compare("*") != 0 && name().compare(_Loc.name()) == 0);
		}

	bool  operator!=(const locale& _Right) const
		{	// test for locale inequality
		return (!(*this == _Right));
		}

	static  const locale& __cdecl classic();	// return classic "C" locale

	static  locale __cdecl global(const locale&);	// return current locale

	static  locale __cdecl empty();	// return empty (transparent) locale

private:
	locale(_Locimp *_Ptrimp)
		: _Ptr(_Ptrimp)
		{	// construct from _Locimp pointer
		}

	static  _Locimp *__cdecl _Getgloballocale();
	static  _Locimp *__cdecl _Init();	// initialize locale
	static  void __cdecl _Setgloballocale(void *);

	_Locimp *_Ptr;	// pointer to locale implementation object
	};
#pragma warning(pop)

		// SUPPORT TEMPLATES
template<class _Facet>
	struct _Facetptr
	{	// store pointer to lazy facet for use_facet
	 static const locale::facet *_Psave;
	};

template<class _Facet>
	 const locale::facet *_Facetptr<_Facet>::_Psave = 0;

template<class _Facet> inline __declspec(deprecated("This is an obsolete part of the Standard C++ Library Implementation. Do not use it."))
	locale _Addfac(locale _Loc, const _Facet *_Facptr)
		{	// add facet to locale -- retained
		size_t _Cat = _Facet::_Getcat(0, 0);
		locale _Newloc = _Loc._Addfac((_Facet *)_Facptr, _Facet::id, _Cat);

		return (_Newloc);
		}

  

  


template<class _Facet> inline
	const _Facet& __cdecl use_facet(const locale& _Loc)


{	// get facet reference from locale
	{ ::std:: _Lockit _Lock(0);	// the thread lock, make get atomic
		const locale::facet *_Psave =
			_Facetptr<_Facet>::_Psave;	// static pointer to lazy facet

		size_t _Id = _Facet::id;
		const locale::facet *_Pf = _Loc._Getfacet(_Id);

		if (_Pf != 0)
			;	// got facet from locale
		else if (_Psave != 0)
			_Pf = _Psave;	// lazy facet already allocated
		else if (_Facet::_Getcat(&_Psave, &_Loc) == (size_t)(-1))

 
		throw bad_cast();	// lazy disallowed

	

#line 506 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

		else
			{	// queue up lazy facet for destruction
			_Pf = _Psave;
			_Facetptr<_Facet>::_Psave = _Psave;

			locale::facet *_Pfmod = (_Facet *)_Psave;
			_Pfmod->_Incref();
			_Pfmod->_Register();
			}

		return ((const _Facet&)(*_Pf));	// should be dynamic_cast
	}
	}

template<class _Facet> inline __declspec(deprecated("This is an obsolete part of the Standard C++ Library Implementation. Do not use it."))
	const _Facet& __cdecl use_facet(const locale& _Loc, const _Facet *,
		bool = false)
	{	// get facet reference from locale -- retained, 2/3 arg versions
	return use_facet<_Facet>(_Loc);
	}

		// TEMPLATE FUNCTION _Getloctxt
template<class _Elem,
	class _InIt> inline
	int __cdecl _Getloctxt(_InIt& _First, _InIt& _Last, size_t _Numfields,
		const _Elem *_Ptr)
	{	// find field at _Ptr that matches longest in [_First, _Last)
	for (size_t _Off = 0; _Ptr[_Off] != (_Elem)0; ++_Off)
		if (_Ptr[_Off] == _Ptr[0])
			++_Numfields;	// add fields with leading mark to initial count
	string _Str(_Numfields, '\0');	// one column counter for each field

	int _Ans = -2;	// no candidates so far
	for (size_t _Column = 1; ; ++_Column, ++_First, _Ans = -1)
		{	// test each element against all viable fields
		bool  _Prefix = false;	// seen at least one valid prefix
		size_t _Off = 0;	// offset into fields
		size_t _Field = 0;	// current field number

		for (; _Field < _Numfields; ++_Field)
			{	// test element at _Column in field _Field
			for (; _Ptr[_Off] != (_Elem)0 && _Ptr[_Off] != _Ptr[0]; ++_Off)
				;	// find beginning of field

			if (_Str[_Field] != '\0')
				_Off += _Str[_Field];	// skip tested columns in field
			else if (_Ptr[_Off += _Column] == _Ptr[0]
				|| _Ptr[_Off] == (_Elem)0)
				{	// matched all of field, save as possible answer
				_Str[_Field] = (char)(_Column < 127
					? _Column : 127);	// save skip count if small enough
				_Ans = (int)_Field;	// save answer
				}
			else if (_First == _Last || _Ptr[_Off] != *_First)
				_Str[_Field] = (char)(_Column < 127
					? _Column : 127);	// no match, just save skip count
			else
				_Prefix = true;	// still a valid prefix
			}

		if (!_Prefix || _First == _Last)
			break;	// no pending prefixes or no input, give up
		}
	return (_Ans);	// return field number or negative value on failure
	}

		// TEMPLATE FUNCTION _Maklocbyte



template<class _Elem> inline
	char __cdecl _Maklocbyte(_Elem _Char,
		const _Locinfo::_Cvtvec&)
	{	// convert _Elem to char using _Cvtvec
	return ((char)(unsigned char)_Char);
	}

template<> inline
	char __cdecl _Maklocbyte(wchar_t _Char,
		const _Locinfo::_Cvtvec& _Cvt)
	{	// convert wchar_t to char using _Cvtvec
	char _Byte = '\0';
	mbstate_t _Mbst1 = {0};
	_Wcrtomb(&_Byte, _Char, &_Mbst1, &_Cvt);
	return (_Byte);
	}


		// TEMPLATE FUNCTION _Maklocchr



template<class _Elem> inline
	_Elem __cdecl _Maklocchr(char _Byte, _Elem *,
		const _Locinfo::_Cvtvec&)
	{	// convert char to _Elem using _Cvtvec
	return ((_Elem)(unsigned char)_Byte);
	}

template<> inline
	wchar_t __cdecl _Maklocchr(char _Byte, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *,
		const _Locinfo::_Cvtvec& _Cvt)
	{	// convert char to wchar_t using _Cvtvec
	wchar_t _Wc = L'\0';
	mbstate_t _Mbst1 = {0};
	_Mbrtowc(&_Wc, &_Byte, 1, &_Mbst1, &_Cvt);
	return (_Wc);
	}


		// TEMPLATE FUNCTION _Maklocstr



template<class _Elem> inline
	_Elem *__cdecl _Maklocstr(const char *_Ptr, _Elem *,
		const _Locinfo::_Cvtvec&)
	{	// convert C string to _Elem sequence using _Cvtvec
	size_t _Count = ::strlen(_Ptr) + 1;
	_Elem *_Ptrdest = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 626) _Elem[_Count];

#pragma warning(push)
#pragma warning(disable: 6011)
	/* prefast noise */
	for (_Elem *_Ptrnext = _Ptrdest; 0 < _Count; --_Count, ++_Ptrnext, ++_Ptr)
		*_Ptrnext = (_Elem)(unsigned char)*_Ptr;
	return (_Ptrdest);
#pragma warning(pop)
	}

template<> inline
	wchar_t *__cdecl _Maklocstr(const char *_Ptr, [SA_Pre(Null=SA_Maybe,NullTerminated=SA_Yes)] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Pre(Deref=1,Access=SA_Read)] wchar_t *,
		const _Locinfo::_Cvtvec& _Cvt)
	{	// convert C string to wchar_t sequence using _Cvtvec
	size_t _Count, _Count1;
	size_t _Wchars;
	const char *_Ptr1;
	int _Bytes;
	wchar_t _Wc;
	mbstate_t _Mbst1 = {0};

	_Count1 = ::strlen(_Ptr) + 1;
	for (_Count = _Count1, _Wchars = 0, _Ptr1 = _Ptr; 0 < _Count;
		_Count -= _Bytes, _Ptr1 += _Bytes, ++_Wchars)
		if ((_Bytes = _Mbrtowc(&_Wc, _Ptr1, _Count, &_Mbst1, &_Cvt)) <= 0)
			break;
	++_Wchars;	// count terminating nul

	wchar_t *_Ptrdest = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 655) wchar_t[_Wchars];
	wchar_t *_Ptrnext = _Ptrdest;
	mbstate_t _Mbst2 = {0};
#pragma warning(push)
#pragma warning(disable: 6011)
	/* prefast noise */
	for (; 0 < _Wchars;
		_Count -= _Bytes, _Ptr += _Bytes, --_Wchars, ++_Ptrnext)
		if ((_Bytes = _Mbrtowc(_Ptrnext, _Ptr, _Count1, &_Mbst2, &_Cvt)) <= 0)
			break;
	*_Ptrnext = L'\0';
#pragma warning(pop)
	return (_Ptrdest);
	}


#pragma warning(push)
#pragma warning(disable:4275)
		// STRUCT codecvt_base
class __declspec(dllimport) codecvt_base
	: public locale::facet
	{	// base class for codecvt
public:
	enum
		{	// constants for different parse states
		ok, partial, error, noconv};
	typedef int result;

	 codecvt_base(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// default constructor
		}

	bool  always_noconv() const throw ()
		{	// return true if conversions never change input (from codecvt)
		return (do_always_noconv());
		}

	int  max_length() const throw ()
		{	// return maximum length required for a conversion (from codecvt)
		return (do_max_length());
		}

	int  encoding() const throw ()
		{	// return length of code sequence (from codecvt)
		return (do_encoding());
		}

	 ~codecvt_base()
		{	// destroy the object
		}

protected:
	virtual bool  do_always_noconv() const throw ()
		{	// return true if conversions never change input (from codecvt)
		return (true);
		}

	virtual int  do_max_length() const throw ()
		{	// return maximum length required for a conversion (from codecvt)
		return (1);
		}

	virtual int  do_encoding() const throw ()
		{	// return length of code sequence (from codecvt)
		return (1);	// -1 ==> state dependent, 0 ==> varying length
		}
	};
#pragma warning(pop)

		// TEMPLATE CLASS codecvt
template<class _Elem,
	class _Byte,
	class _Statype>
	class codecvt
		: public codecvt_base
	{	// facet for converting between _Elem and char (_Byte) sequences
public:
	typedef _Elem intern_type;
	typedef _Byte extern_type;
	typedef _Statype state_type;

	result  in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	// convert bytes [_First1, _Last1) to [_First2, _Last)
		return (do_in(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// convert [_First1, _Last1) to bytes [_First2, _Last2)
		return (do_out(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// generate bytes to return to default shift state
		return (do_unshift(_State, _First2, _Last2, _Mid2));
		}

	int  length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	// return min(_Count, converted length of bytes [_First1, _Last1))
		return (do_length(_State, _First1, _Last1, _Count));
		}

	 static locale::id id;	// unique facet id

	explicit  codecvt(size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 codecvt(const _Locinfo& _Lobj, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 785) codecvt<_Elem, _Byte, _Statype>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

protected:
	virtual  ~codecvt()
		{	// destroy the object
		}

protected:
	void  _Init(const _Locinfo&)
		{	// initialize from _Locinfo object
		}

	virtual result  do_in(_Statype&,
		const _Byte *_First1, const _Byte *, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *, _Elem *& _Mid2) const
		{	// convert bytes [_First1, _Last1) to [_First2, _Last)
		_Mid1 = _First1, _Mid2 = _First2;
		return (noconv);	// convert nothing
		}

	virtual result  do_out(_Statype&,
		const _Elem *_First1, const _Elem *, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *, _Byte *& _Mid2) const
		{	// convert [_First1, _Last1) to bytes [_First2, _Last)
		_Mid1 = _First1, _Mid2 = _First2;
		return (noconv);	// convert nothing
		}

	virtual result  do_unshift(_Statype&,
		_Byte *_First2, _Byte *, _Byte *&_Mid2) const
		{	// generate bytes to return to default shift state
		_Mid2 = _First2;
		return (noconv);	// convert nothing
		}

	virtual int  do_length(const _Statype&, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	// return min(_Count, converted length of bytes [_First1, _Last1))
		return ((int)(_Count < (size_t)(_Last1 - _First1)
			? _Count : _Last1 - _First1));	// assume 1-to-1 conversion
		}
	};

		// STATIC codecvt::id OBJECT
template<class _Elem,
	class _Byte,
	class _Statype>
	 locale::id codecvt<_Elem, _Byte, _Statype>::id;

		// CLASS codecvt<wchar_t, char, _Mbstatet>
template<> class __declspec(dllimport) codecvt<wchar_t, char, _Mbstatet>
	: public codecvt_base
	{	// facet for converting between wchar_t and char (_Byte) sequences
public:
	typedef wchar_t _Elem;
	typedef char _Byte;
	typedef _Mbstatet _Statype;
	typedef _Elem intern_type;
	typedef _Byte extern_type;
	typedef _Statype state_type;

	result  in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	// convert bytes [_First1, _Last1) to [_First2, _Last)
		return (do_in(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// convert [_First1, _Last1) to bytes [_First2, _Last)
		return (do_out(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// generate bytes to return to default shift state
		return (do_unshift(_State,
			_First2, _Last2, _Mid2));
		}

	int  length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	// return min(_Count, converted length of bytes [_First1, _Last1))
		return (do_length(_State, _First1, _Last1, _Count));
		}

	static  locale::id& __cdecl _Id_func();



	 static locale::id id;	// unique facet id
#line 884 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

	explicit  codecvt(size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 codecvt(const _Locinfo& _Lobj, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 903) codecvt<_Elem, _Byte, _Statype>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

protected:
	virtual  ~codecvt()
		{	// destroy the object
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Lobj
		_Cvt = _Lobj._Getcvt();
		}

	virtual result  do_in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
			_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	// convert bytes [_First1, _Last1) to [_First2, _Last)
		_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 923);
		_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 924);
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			switch (_Bytes = _Mbrtowc(_Mid2, _Mid1, _Last1 - _Mid1,
				&_State, &_Cvt))
			{	// test result of locale-specific mbrtowc call
			case -2:	// partial conversion
				_Mid1 = _Last1;
				return (_Ans);

			case -1:	// failed conversion
				return (error);

			case 0:	// may have converted null character
				if (*_Mid2 == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				// fall through

			default:	// converted _Bytes bytes to a wchar_t
				if (_Bytes == -3)
					_Bytes = 0;	// wchar_t generated from state info
				_Mid1 += _Bytes;
				++_Mid2;
				_Ans = ok;
			}
		return (_Ans);
		}

	virtual result  do_out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
			_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// convert [_First1, _Last1) to bytes [_First2, _Last)
		_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 959);
		_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 960);
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			if ((int)___mb_cur_max_func() <= _Last2 - _Mid2)
				if ((_Bytes = _Wcrtomb(_Mid2, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	// locale-specific wcrtomb failed
				else
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
			else
				{	// destination possibly too small, convert into buffer
				_Byte _Buf[5];
				_Statype _Stsave = _State;

				if ((_Bytes = _Wcrtomb(_Buf, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	// locale-specific wcrtomb failed
				else if (_Last2 - _Mid2 < _Bytes)
					{	// converted too many, roll back and return previous
					_State = _Stsave;
					return (_Ans);
					}
				else
					{	// copy converted bytes from buffer
					::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
					}
				}
		return (_Ans);
		}

	virtual result  do_unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// generate bytes to return to default shift state
		_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 997);
		_Mid2 = _First2;
		result _Ans = ok;
		int _Bytes;
		_Byte _Buf[5];
		_Statype _Stsave = _State;

		if ((_Bytes = _Wcrtomb(_Buf, L'\0', &_State, &_Cvt)) <= 0)
			_Ans = error;	// locale-specific wcrtomb failed
		else if (_Last2 - _Mid2 < --_Bytes)
			{	// converted too many, roll back and return
			_State = _Stsave;
			_Ans = partial;
			}
		else if (0 < _Bytes)
			{	// copy converted bytes from buffer
			::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
			_Mid2 += _Bytes;
			}
		return (_Ans);
		}

	virtual int  do_length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	// return min(_Count, converted length of bytes [_First1, _Last1))

 



#line 1028 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
		_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1028);
		int _Wchars;
		const _Byte *_Mid1;
		_Statype _Mystate = _State;

		for (_Wchars = 0, _Mid1 = _First1;
			(size_t)_Wchars < _Count && _Mid1 != _Last1; )
			{	// convert another wchar_t
			int _Bytes;
			_Elem _Ch;

			switch (_Bytes = _Mbrtowc(&_Ch, _Mid1, _Last1 - _Mid1,
				&_Mystate, &_Cvt))
				{	// test result of locale-specific mbrtowc call
			case -2:	// partial conversion
				return (_Wchars);

			case -1:	// failed conversion
				return (_Wchars);

			case 0:	// may have converted null character
				if (_Ch == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				// fall through

			default:	// converted _Bytes bytes to a wchar_t
				if (_Bytes == -3)
					_Bytes = 0;	// wchar_t generated from state info
				_Mid1 += _Bytes;
				++_Wchars;
				}
			}
		return (_Wchars);
 #line 1062 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
		}

	virtual bool  do_always_noconv() const throw ()
		{	// return true if conversions never change input
		return (false);
		}

	virtual int  do_max_length() const throw ()
		{	// return maximum length required for a conversion (from codecvt)
		return (5);
		}

private:
	_Locinfo::_Cvtvec _Cvt;	// locale info passed to _Mbrtowc, _Wcrtomb
	};


		// CLASS codecvt<unsigned short, char, _Mbstatet>
template<> class __declspec(dllimport) codecvt<unsigned short, char, _Mbstatet>
	: public codecvt_base
	{	// facet for converting between unsigned short and char sequences
public:
	typedef unsigned short _Elem;
	typedef char _Byte;
	typedef _Mbstatet _Statype;
	typedef _Elem intern_type;
	typedef _Byte extern_type;
	typedef _Statype state_type;

	result  in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
		_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	// convert bytes [_First1, _Last1) to [_First2, _Last)
		return (do_in(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// convert [_First1, _Last1) to bytes [_First2, _Last)
		return (do_out(_State,
			_First1, _Last1, _Mid1, _First2, _Last2, _Mid2));
		}

	result  unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// generate bytes to return to default shift state
		return (do_unshift(_State,
			_First2, _Last2, _Mid2));
		}

	int  length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	// return min(_Count, converted length of bytes [_First1, _Last1))
		return (do_length(_State, _First1, _Last1, _Count));
		}

	static  locale::id& __cdecl _Id_func();



	 static locale::id id;	// unique facet id
#line 1126 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

	explicit  codecvt(size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 codecvt(const _Locinfo& _Lobj, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1145) codecvt<_Elem, _Byte, _Statype>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

protected:
	virtual  ~codecvt()
		{	// destroy the object
		}

protected:
	 codecvt(const char *_Locname, size_t _Refs = 0)
		: codecvt_base(_Refs)
		{	// construct from specified locale
		{ _Locinfo _Lobj(_Locname);
			_Init(_Lobj);
		}
		}

	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Lobj
		_Cvt = _Lobj._Getcvt();
		}

	virtual result  do_in(_Statype& _State,
		const _Byte *_First1, const _Byte *_Last1, const _Byte *& _Mid1,
			_Elem *_First2, _Elem *_Last2, _Elem *& _Mid2) const
		{	// convert bytes [_First1, _Last1) to [_First2, _Last)
		_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1173);
		_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1174);
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			switch (_Bytes = _Mbrtowc((wchar_t *)_Mid2, _Mid1, _Last1 - _Mid1,
				&_State, &_Cvt))
			{	// test result of locale-specific mbrtowc call
			case -2:	// partial conversion
				_Mid1 = _Last1;
				return (_Ans);

			case -1:	// failed conversion
				return (error);

			case 0:	// may have converted null character
				if (*_Mid2 == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				// fall through

			default:	// converted _Bytes bytes to an unsigned short
				if (_Bytes == -3)
					_Bytes = 0;	// wchar_t generated from state info
				_Mid1 += _Bytes;
				++_Mid2;
				_Ans = ok;
			}
		return (_Ans);
		}

	virtual result  do_out(_Statype& _State,
		const _Elem *_First1, const _Elem *_Last1, const _Elem *& _Mid1,
			_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// convert [_First1, _Last1) to bytes [_First2, _Last)
		_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1209);
		_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1210);
		_Mid1 = _First1, _Mid2 = _First2;
		result _Ans = _Mid1 == _Last1 ? ok : partial;
		int _Bytes;

		while (_Mid1 != _Last1 && _Mid2 != _Last2)
			if (5 <= _Last2 - _Mid2)
				if ((_Bytes = _Wcrtomb(_Mid2, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	// locale-specific wcrtomb failed
				else
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
			else
				{	// destination possibly too small, convert into buffer
				_Byte _Buf[5];
				_Statype _Stsave = _State;

				if ((_Bytes = _Wcrtomb(_Buf, *_Mid1,
					&_State, &_Cvt)) < 0)
					return (error);	// locale-specific wcrtomb failed
				else if (_Last2 - _Mid2 < _Bytes)
					{	// converted too many, roll back and return previous
					_State = _Stsave;
					return (_Ans);
					}
				else
					{	// copy converted bytes from buffer
					::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
					++_Mid1, _Mid2 += _Bytes, _Ans = ok;
					}
				}
		return (_Ans);
		}

	virtual result  do_unshift(_Statype& _State,
		_Byte *_First2, _Byte *_Last2, _Byte *& _Mid2) const
		{	// generate bytes to return to default shift state
		_Debug_range(_First2, _Last2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1247);
		_Mid2 = _First2;
		result _Ans = ok;
		int _Bytes;
		_Byte _Buf[5];
		_Statype _Stsave = _State;

		if ((_Bytes = _Wcrtomb(_Buf, L'\0', &_State, &_Cvt)) <= 0)
			_Ans = error;	// locale-specific wcrtomb failed
		else if (_Last2 - _Mid2 < --_Bytes)
			{	// converted too many, roll back and return
			_State = _Stsave;
			_Ans = partial;
			}
		else if (0 < _Bytes)
			{	// copy converted bytes from buffer
			::memcpy_s((_Mid2), (_Last2 - _Mid2), (_Buf), (_Bytes));
			_Mid2 += _Bytes;
			}
		return (_Ans);
		}

	virtual int  do_length(const _Statype& _State, const _Byte *_First1,
		const _Byte *_Last1, size_t _Count) const
		{	// return min(_Count, converted length of bytes [_First1, _Last1))
		_Debug_range(_First1, _Last1, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1272);
		int _Wchars;
		const _Byte *_Mid1;
		_Statype _Mystate = _State;

		for (_Wchars = 0, _Mid1 = _First1;
			(size_t)_Wchars < _Count && _Mid1 != _Last1; )
			{	// convert another unsigned char
			int _Bytes;
			_Elem _Ch;

			switch (_Bytes = _Mbrtowc((wchar_t *)&_Ch, _Mid1, _Last1 - _Mid1,
				&_Mystate, &_Cvt))
				{	// test result of locale-specific mbrtowc call
			case -2:	// partial conversion
				return (_Wchars);

			case -1:	// failed conversion
				return (_Wchars);

			case 0:	// may have converted null character
				if (_Ch == (_Elem)0)
					_Bytes = (int)::strlen(_Mid1) + 1;
				// fall through

			default:	// converted _Bytes bytes to an unsigned char
				if (_Bytes == -3)
					_Bytes = 0;	// wchar_t generated from state info
				_Mid1 += _Bytes;
				++_Wchars;
				}
			}
		return (_Wchars);
		}

	virtual bool  do_always_noconv() const throw ()
		{	// return true if conversions never change input
		return (false);
		}

	virtual int  do_max_length() const throw ()
		{	// return maximum length required for a conversion (from codecvt)
		return (5);
		}

private:
	_Locinfo::_Cvtvec _Cvt;	// locale info passed to _Mbrtowc, _Wcrtomb
	};
#line 1321 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

		// TEMPLATE CLASS codecvt_byname
template<class _Elem,
	class _Byte,
	class _Statype>
	class codecvt_byname
		: public codecvt<_Elem, _Byte, _Statype>
	{	// codecvt for named locale
public:
	explicit  codecvt_byname(const char *_Locname, size_t _Refs = 0)
		: codecvt<_Elem, _Byte, _Statype>(_Locname, _Refs)
		{	// construct for named locale
		}

protected:
	virtual  ~codecvt_byname()
		{	// destroy the object
		}
	};

#pragma warning(push)
#pragma warning(disable:4275)
		// STRUCT ctype_base
struct __declspec(dllimport) ctype_base
	: public locale::facet
	{	// base for ctype
	enum
		{	// constants for character classifications
		alnum = 0x4|0x2|0x1|0x100, alpha = 0x2|0x1|0x100,
		cntrl = 0x20, digit = 0x4, graph = 0x4|0x2|0x10|0x1|0x100,
		lower = 0x2, print = 0x4|0x2|0x10|0x40|0x1|0x100|0x80,
		punct = 0x10, space = 0x8|0x40|0x000, upper = 0x1,
		xdigit = 0x80};
	typedef short mask;	// to match <ctype.h>

	 ctype_base(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// default constructor
		}

	 ~ctype_base()
		{	// destroy the object
		}

protected:
	static void __cdecl _Xran()
		{	// report an out_of_range error
		throw out_of_range("out_of_range in ctype<T>");
		}
	};
#pragma warning(pop)

		// TEMPLATE CLASS ctype
template<class _Elem>
	class ctype
		: public ctype_base
	{	// facet for classifying elements, converting cases
public:
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return (do_is(_Maskval, _Ch));
		}

	const _Elem * is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		return (do_is(_First, _Last, _Dest));
		}

	const _Elem * scan_is(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		return (do_scan_is(_Maskval, _First, _Last));
		}

	const _Elem * scan_not(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		return (do_scan_not(_Maskval, _First, _Last));
		}

	_Elem  tolower(_Elem _Ch) const
		{	// convert element to lower case
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	// convert element to upper case
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	// widen char
		return (do_widen(_Byte));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const char * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	// widen chars in [_First, _Last)
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const char * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	// narrow element to char
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in the destination buffer
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	 static locale::id id;	// unique facet id

	explicit  ctype(size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1487) ctype<_Elem>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

protected:
	virtual  ~ctype()
		{	// destroy the object
		if (_Ctype._Delfl)
			free((void *)_Ctype._Table);
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Lobj
		_Ctype = _Lobj._Getctype();
		}

	virtual bool  do_is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return ((_Ctype._Table[(unsigned char)narrow(_Ch)]
			& _Maskval) != 0);
		}

	virtual const _Elem * do_is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1514);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",1515);
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Ctype._Table[(unsigned char)narrow(*_First)];
		return (_First);
		}

	virtual const _Elem * do_scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1524);
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual const _Elem * do_scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1533);
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	// convert element to lower case
		unsigned char _Byte = (unsigned char)narrow(_Ch, '\0');
		if (_Byte == '\0')
			return (_Ch);
		else
			return (widen((char)_Tolower(_Byte, &_Ctype)));
		}

	virtual const _Elem * do_tolower(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1550);
		for (; _First != _Last; ++_First)
			{	// convert *_First to lower case
			unsigned char _Byte = (unsigned char)narrow(*_First, '\0');
			if (_Byte != '\0')
				*_First = (widen((char)_Tolower(_Byte, &_Ctype)));
			}
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	// convert element to upper case
		unsigned char _Byte = (unsigned char)narrow(_Ch, '\0');
		if (_Byte == '\0')
			return (_Ch);
		else
			return (widen((char)_Toupper(_Byte, &_Ctype)));
		}

	virtual const _Elem * do_toupper(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1571);
		for (; _First != _Last; ++_First)
			{	// convert *_First to upper case
			unsigned char _Byte = (unsigned char)narrow(*_First, '\0');
			if (_Byte != '\0')
				*_First = (widen((char)_Toupper(_Byte, &_Ctype)));
			}
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	// widen char
		return (_Maklocchr(_Byte, (_Elem *)0, _Cvt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const char * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const char * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1597);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",1598);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1599, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1599, 0); } ; };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Maklocchr(*_First, (_Elem *)0, _Cvt);
		return (_First);
		}

	char  _Donarrow(_Elem _Ch, char _Dflt) const
		{	// narrow element to char
		char _Byte;
		if (_Ch == (_Elem)0)
			return ('\0');
		else if ((_Byte = _Maklocbyte((_Elem)_Ch, _Cvt)) == '\0')
			return (_Dflt);
		else
			return (_Byte);
		}

	virtual char  do_narrow(_Elem _Ch, char _Dflt) const
		{	// narrow element to char
		return (_Donarrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt, [SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char _Dflt, 
		[SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1634);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",1635);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1636, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1636, 0); } ; };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Donarrow(*_First, _Dflt);
		return (_First);
		}

private:
	_Locinfo::_Ctypevec _Ctype;	// locale info passed to _Tolower, etc.
	_Locinfo::_Cvtvec _Cvt;		// conversion information
	};

		// STATIC ctype::id OBJECT
template<class _Elem>
	 locale::id ctype<_Elem>::id;

		// CLASS ctype<char>
template<> class __declspec(dllimport) ctype<char>
	: public ctype_base
	{	// facet for classifying char elements, converting cases
	typedef ctype<char> _Myt;

public:
	typedef char _Elem;
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return ((_Ctype._Table[(unsigned char)_Ch] & _Maskval) != 0);
		}

	const _Elem * is(const _Elem *_First,
		const _Elem *_Last, mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1669);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",1670);
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Ctype._Table[(unsigned char)*_First];
		return (_First);
		}

	const _Elem * scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1679);
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	const _Elem * scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1688);
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	_Elem  tolower(_Elem _Ch) const
		{	// convert element to lower case
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	// convert element to upper case
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	// widen char
		return (do_widen(_Byte));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const _Elem * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	_Elem  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	// narrow element to char
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	static  locale::id& __cdecl _Id_func();



	 static locale::id id;	// unique facet id
#line 1765 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

	explicit  ctype(const mask *_Table = 0,
		bool _Deletetable = false,
		size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct with specified table and delete flag for table
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		if (_Table != 0)
			{	// replace existing char to mask table
			_Tidy();
			_Ctype._Table = _Table;
			_Ctype._Delfl = _Deletetable ? -1 : 0;
			}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from current locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1792) ctype<_Elem>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

	 static const size_t table_size = 1 << 8/*CHAR_BIT*/;	// size of _Ctype._Table (char to mask)

protected:
	virtual  ~ctype()
		{	// destroy the object
		_Tidy();
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Lobj
		_Ctype = _Lobj._Getctype();
		}

	void  _Tidy()
		{	// free any allocated storage
		if (0 < _Ctype._Delfl)
			free((void *)_Ctype._Table);
		else if (_Ctype._Delfl < 0)
			delete[] (void *)_Ctype._Table;
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	// convert element to lower case
		return ((_Elem)_Tolower((unsigned char)_Ch, &_Ctype));
		}

	virtual const _Elem * do_tolower(_Elem *_First,
		const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1827);
		for (; _First != _Last; ++_First)
			*_First = (_Elem)_Tolower((unsigned char)*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	// convert element to upper case
		return ((_Elem)_Toupper((unsigned char)_Ch, &_Ctype));
		}

	virtual const _Elem * do_toupper(_Elem *_First,
		const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1841);
		for (; _First != _Last; ++_First)
			*_First = (_Elem)_Toupper((unsigned char)*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	// widen char
		return (_Byte);
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const _Elem * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1863);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",1864);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1865, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1865, 0); } ; };
		::memcpy_s((_Dest), (_Dest_size), (_First), (_Last - _First));
		return (_Last);
		}

	virtual _Elem  do_narrow(_Elem _Ch, char) const
		{	// narrow char
		return (_Ch);
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt, 
		[SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char, [SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1888);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",1889);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1890, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 1890, 0); } ; };
		::memcpy_s((_Dest), (_Dest_size), (_First), (_Last - _First));
		return (_Last);
		}

	const mask * table() const throw ()
		{	// return address of char to mask table
		return (_Ctype._Table);
		}

	static const mask *__cdecl classic_table() throw ()
		{	// return address of char to mask table for "C" locale
		const _Myt& _Ctype_fac = use_facet<_Myt >(locale::classic());
		return (_Ctype_fac.table());
		}

private:
	_Locinfo::_Ctypevec _Ctype;	// information
	};

		// CLASS ctype<wchar_t>
template<> class __declspec(dllimport) ctype<wchar_t>
	: public ctype_base
	{	// facet for classifying wchar_t elements, converting cases
	typedef ctype<wchar_t> _Myt;

public:
	typedef wchar_t _Elem;
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return (do_is(_Maskval, _Ch));
		}

	const _Elem * is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		return (do_is(_First, _Last, _Dest));
		}

	const _Elem * scan_is(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		return (do_scan_is(_Maskval, _First, _Last));
		}

	const _Elem * scan_not(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		return (do_scan_not(_Maskval, _First, _Last));
		}

	_Elem  tolower(_Elem _Ch) const
		{	// convert element to lower case
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	// convert element to upper case
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	// widen char
		return (do_widen(_Byte));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const char * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const char * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	// narrow element to char
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	static  locale::id& __cdecl _Id_func();



	 static locale::id id;	// unique facet id
#line 2014 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

	explicit  ctype(size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2033) ctype<_Elem>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

protected:
	virtual  ~ctype()
		{	// destroy the object
		if (_Ctype._Delfl)
			free((void *)_Ctype._Table);
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Lobj
		_Ctype = _Lobj._Getctype();
		_Cvt = _Lobj._Getcvt();
		}

	virtual bool  do_is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return ((::_Getwctype(_Ch, &_Ctype) & _Maskval) != 0);
		}

	virtual const wchar_t * do_is(const _Elem *_First,
		const _Elem *_Last, mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2060);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",2061);
		return (::_Getwctypes(_First, _Last, _Dest, &_Ctype));
		}

	virtual const _Elem * do_scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2068);
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual const _Elem * do_scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2077);
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	// convert element to lower case
		return (_Towlower(_Ch, &_Ctype));
		}

	virtual const _Elem * do_tolower(_Elem *_First,
		const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2091);
		for (; _First != _Last; ++_First)
			*_First = _Towlower(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	// convert element to upper case
		return (_Towupper(_Ch, &_Ctype));
		}

	virtual const _Elem * do_toupper(_Elem *_First,
		const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2105);
		for (; _First != _Last; ++_First)
			*_First = _Towupper(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	_Elem  _Dowiden(char _Byte) const
		{	// widen char
		mbstate_t _Mbst = {0};
		wchar_t _Wc;
		return (_Mbrtowc(&_Wc, &_Byte, 1, &_Mbst, &_Cvt) < 0
			? (wchar_t)(wint_t)(0xFFFF) : _Wc);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	// widen char
		return (_Dowiden(_Byte));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const char * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const char * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2135);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",2136);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2137, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2137, 0); } ; };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Dowiden(*_First);
		return (_First);
		}

	char  _Donarrow(_Elem _Ch, char _Dflt) const
		{	// narrow element to char
		char _Buf[5];
		mbstate_t _Mbst = {0};
		return (_Wcrtomb(_Buf, _Ch, &_Mbst, &_Cvt) != 1
			? _Dflt : _Buf[0]);
		}

	virtual char  do_narrow(_Elem _Ch, char _Dflt) const
		{	// narrow element to char
		return (_Donarrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt,  
		[SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char _Dflt, 
		[SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2170);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",2171);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2172, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2172, 0); } ; };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Donarrow(*_First, _Dflt);
		return (_First);
		}

private:
	_Locinfo::_Ctypevec _Ctype;	// locale info passed to _Tolower, etc.
	_Locinfo::_Cvtvec _Cvt;		// conversion information
	};


		// CLASS ctype<unsigned short>
template<> class __declspec(dllimport) ctype<unsigned short>
	: public ctype_base
	{	// facet for classifying unsigned short elements, converting cases
	typedef ctype<unsigned short> _Myt;

public:
	typedef unsigned short _Elem;
	typedef _Elem char_type;

	bool  is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return (do_is(_Maskval, _Ch));
		}

	const _Elem * is(const _Elem *_First, const _Elem *_Last,
		mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		return (do_is(_First, _Last, _Dest));
		}

	const _Elem * scan_is(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		return (do_scan_is(_Maskval, _First, _Last));
		}

	const _Elem * scan_not(mask _Maskval, const _Elem *_First,
		const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		return (do_scan_not(_Maskval, _First, _Last));
		}

	_Elem  tolower(_Elem _Ch) const
		{	// convert element to lower case
		return (do_tolower(_Ch));
		}

	const _Elem * tolower(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		return (do_tolower(_First, _Last));
		}

	_Elem  toupper(_Elem _Ch) const
		{	// convert element to upper case
		return (do_toupper(_Ch));
		}

	const _Elem * toupper(_Elem *_First, const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		return (do_toupper(_First, _Last));
		}

	_Elem  widen(char _Byte) const
		{	// widen char
		return (do_widen(_Byte));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const char * widen(const char *_First, const char *_Last,
		_Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_widen(_First, _Last, _Dest));
#pragma warning(pop)
		}

	const char * _Widen_s(const char *_First, const char *_Last,
		_Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		return (_Do_widen_s(_First, _Last, _Dest, _Dest_size));
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	// narrow element to char
		return (do_narrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	const _Elem * narrow(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
#pragma warning(push)
#pragma warning(disable:4996)
		return (do_narrow(_First, _Last, _Dflt, _Dest));
#pragma warning(pop)
		}

	const _Elem * _Narrow_s(const _Elem *_First, const _Elem *_Last,
		char _Dflt, [SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		return (_Do_narrow_s(_First, _Last, _Dflt, _Dest, _Dest_size));
		}

	static  locale::id& __cdecl _Id_func();



	 static locale::id id;	// unique facet id
#line 2288 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

	explicit  ctype(size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 ctype(const _Locinfo& _Lobj, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2307) ctype<_Elem>(
				_Locinfo(_Ploc->name()));
		return (2);
		}

protected:
	virtual  ~ctype()
		{	// destroy the object
		if (_Ctype._Delfl)
			free((void *)_Ctype._Table);
		}

protected:
	 ctype(const char *_Locname, size_t _Refs = 0)
		: ctype_base(_Refs)
		{	// construct from specified locale
		{ _Locinfo _Lobj(_Locname);
			_Init(_Lobj);
		}
		}

	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Lobj
		_Ctype = _Lobj._Getctype();
		_Cvt = _Lobj._Getcvt();
		}

	virtual bool  do_is(mask _Maskval, _Elem _Ch) const
		{	// test if element fits any mask classifications
		return ((::_Getwctype(_Ch, &_Ctype) & _Maskval) != 0);
		}

	virtual const _Elem * do_is(const _Elem *_First,
		const _Elem *_Last, mask *_Dest) const
		{	// get mask sequence for elements in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2342);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",2343);
		return ((const _Elem *)::_Getwctypes((const wchar_t *)_First,
			(const wchar_t *)_Last, _Dest, &_Ctype));
		}

	virtual const _Elem * do_scan_is(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) that fits mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2351);
		for (; _First != _Last && !is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual const _Elem * do_scan_not(mask _Maskval,
		const _Elem *_First, const _Elem *_Last) const
		{	// find first in [_First, _Last) not fitting mask classification
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2360);
		for (; _First != _Last && is(_Maskval, *_First); ++_First)
			;
		return (_First);
		}

	virtual _Elem  do_tolower(_Elem _Ch) const
		{	// convert element to lower case
		return (_Towlower(_Ch, &_Ctype));
		}

	virtual const _Elem * do_tolower(_Elem *_First,
		const _Elem *_Last) const
		{	// convert [_First, _Last) in place to lower case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2374);
		for (; _First != _Last; ++_First)
			*_First = _Towlower(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	virtual _Elem  do_toupper(_Elem _Ch) const
		{	// convert element to upper case
		return (_Towupper(_Ch, &_Ctype));
		}

	virtual const _Elem * do_toupper(_Elem *_First,
		const _Elem *_Last) const
		{	// convert [_First, _Last) in place to upper case
		_Debug_range((const _Elem *)_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2388);
		for (; _First != _Last; ++_First)
			*_First = _Towupper(*_First, &_Ctype);
		return ((const _Elem *)_First);
		}

	_Elem  _Dowiden(char _Byte) const
		{	// widen char
		mbstate_t _Mbst = {0};
		unsigned short _Wc;
		return (_Mbrtowc((wchar_t *)&_Wc, &_Byte, 1, &_Mbst, &_Cvt) < 0
			? (unsigned short)(wint_t)(0xFFFF) : _Wc);
		}

	virtual _Elem  do_widen(char _Byte) const
		{	// widen char
		return (_Dowiden(_Byte));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const char * do_widen(const char *_First,
		const char *_Last, _Elem *_Dest) const
		{	// widen chars in [_First, _Last)
		// assume there is enough space in _Dest
		return _Do_widen_s(_First, _Last, _Dest, _Last - _First);
		}

	virtual const char * _Do_widen_s(const char *_First,
		const char *_Last, _Elem *_Dest, size_t _Dest_size) const
		{	// widen chars in [_First, _Last)
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2418);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",2419);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2420, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2420, 0); } ; };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Dowiden(*_First);
		return (_First);
		}

	char  _Donarrow(_Elem _Ch, char _Dflt) const
		{	// narrow element to char
		char _Buf[5];
		mbstate_t _Mbst = {0};
		return (_Wcrtomb(_Buf, _Ch, &_Mbst, &_Cvt) != 1
			? _Dflt : _Buf[0]);
		}

	virtual char  do_narrow(_Elem _Ch, char _Dflt) const
		{	// narrow element to char
		return (_Donarrow(_Ch, _Dflt));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual const _Elem * do_narrow(const _Elem *_First,
		const _Elem *_Last, char _Dflt, [SA_Pre(Null=SA_No,WritableElements="\n@""_Last-_First")] [SA_Pre(Deref=1,Valid=SA_No)] char *_Dest) const
		{	// narrow elements in [_First, _Last) to chars
		// assume there is enough space in _Dest
		return _Do_narrow_s(_First, _Last, _Dflt, _Dest, _Last - _First);
		}

	virtual const _Elem * _Do_narrow_s(const _Elem *_First,
		const _Elem *_Last, char _Dflt, 
		[SA_Pre(Null=SA_No,WritableElements="_Dest_size")] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(ValidElements="\n@""_Last-_First")] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Dest, 
		size_t _Dest_size) const
		{	// narrow elements in [_First, _Last) to chars
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2452);
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale",2453);
		{ if (!(_Dest_size >= (size_t)(_Last - _First))) { (void) ((!!((("_Dest_size >= (size_t)(_Last - _First)", 0)))) || (1 != _CrtDbgReportW(2, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2454, 0, L"(\"_Dest_size >= (size_t)(_Last - _First)\", 0)")) || (__debugbreak(), 0)); ::_invalid_parameter(L"\"out of range\"", __LPREFIX( __FUNCTION__), L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale", 2454, 0); } ; };
		for (; _First != _Last; ++_First, ++_Dest)
			*_Dest = _Donarrow(*_First, _Dflt);
		return (_First);
		}

private:
	_Locinfo::_Ctypevec _Ctype;	// locale info passed to _Tolower, etc.
	_Locinfo::_Cvtvec _Cvt;		// conversion information
	};
#line 2465 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

		// TEMPLATE CLASS ctype_byname
template<class _Elem>
	class ctype_byname
	: public ctype<_Elem>
	{	// ctype for named locale
public:
	explicit  ctype_byname(const char *_Locname, size_t _Refs = 0)
		: ctype<_Elem>(_Locname, _Refs)
		{	// construct from named locale
		}

protected:
	virtual  ~ctype_byname()
		{	// destroy the object
		}
	};

		// TEMPLATE CLASS ctype_byname<char>
template<> class ctype_byname<char>
	: public ctype<char>
	{	// ctype_byname<char> for named locale
public:
	explicit  ctype_byname(const char *_Locname, size_t _Refs = 0)
		: ctype<char>(_Locname, _Refs)
		{	// construct from named locale
		}

protected:
	virtual  ~ctype_byname()
		{	// destroy the object
		}
	};

 

template class __declspec(dllimport) codecvt<char, char, _Mbstatet>;

 #line 2504 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
}


 #pragma warning(pop)
 #pragma pack(pop)
#line 2510 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

#line 2512 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"
#line 2513 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocale"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */

#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"
#line 1 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\share.h"
/***
*share.h - defines file sharing modes for sopen
*
*       Copyright (c) Microsoft Corporation. All rights reserved.
*
*Purpose:
*       This file defines the file sharing modes for sopen().
*
*       [Public]
*
****/


#pragma once
#line 16 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\share.h"






#line 23 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\share.h"









/* Non-ANSI names for compatibility */




#line 38 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\share.h"

#line 40 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\share.h"
#line 8 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"


 #pragma pack(push,8)
 #pragma warning(push,3)
 #pragma warning(disable:4412)
#line 14 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"

namespace std {

 
 
 
 
 
 
 
 
 
 
 
 
 
 

 

 
 

 
 
 

		// TEMPLATE CLASS _Iosb
template<class _Dummy>
	class _Iosb
	{	// define templatized bitmask/enumerated types, instantiate on demand
public:
	enum _Dummy_enum {_Dummy_enum_val = 1};	// don't ask

	enum _Fmtflags
		{	// constants for formatting options
		_Fmtmask = 0xffff, _Fmtzero = 0};

	static const _Fmtflags skipws = (_Fmtflags)0x0001;
	static const _Fmtflags unitbuf = (_Fmtflags)0x0002;
	static const _Fmtflags uppercase = (_Fmtflags)0x0004;
	static const _Fmtflags showbase = (_Fmtflags)0x0008;
	static const _Fmtflags showpoint = (_Fmtflags)0x0010;
	static const _Fmtflags showpos = (_Fmtflags)0x0020;
	static const _Fmtflags left = (_Fmtflags)0x0040;
	static const _Fmtflags right = (_Fmtflags)0x0080;
	static const _Fmtflags internal = (_Fmtflags)0x0100;
	static const _Fmtflags dec = (_Fmtflags)0x0200;
	static const _Fmtflags oct = (_Fmtflags)0x0400;
	static const _Fmtflags hex = (_Fmtflags)0x0800;
	static const _Fmtflags scientific = (_Fmtflags)0x1000;
	static const _Fmtflags fixed = (_Fmtflags)0x2000;

	static const _Fmtflags hexfloat =
		(_Fmtflags)0x3000;	// added with TR1/

	static const _Fmtflags boolalpha = (_Fmtflags)0x4000;
	static const _Fmtflags _Stdio = (_Fmtflags)0x8000;
	static const _Fmtflags adjustfield = (_Fmtflags)(0x0040
		| 0x0080 | 0x0100);
	static const _Fmtflags basefield = (_Fmtflags)(0x0200
		| 0x0400 | 0x0800);
	static const _Fmtflags floatfield = (_Fmtflags)(0x1000
		| 0x2000);

	enum _Iostate
		{	// constants for stream states
		_Statmask = 0x17};

	static const _Iostate goodbit = (_Iostate)0x0;
	static const _Iostate eofbit = (_Iostate)0x1;
	static const _Iostate failbit = (_Iostate)0x2;
	static const _Iostate badbit = (_Iostate)0x4;
	static const _Iostate _Hardfail = (_Iostate)0x10;

	enum _Openmode
		{	// constants for file opening options
		_Openmask = 0xff};

	static const _Openmode in = (_Openmode)0x01;
	static const _Openmode out = (_Openmode)0x02;
	static const _Openmode ate = (_Openmode)0x04;
	static const _Openmode app = (_Openmode)0x08;
	static const _Openmode trunc = (_Openmode)0x10;
	static const _Openmode _Nocreate = (_Openmode)0x40;
	static const _Openmode _Noreplace = (_Openmode)0x80;
	static const _Openmode binary = (_Openmode)0x20;

	enum _Seekdir
		{	// constants for file positioning options
		_Seekmask = 0x3};
	static const _Seekdir beg = (_Seekdir)0;
	static const _Seekdir cur = (_Seekdir)1;
	static const _Seekdir end = (_Seekdir)2;

	enum
		{	// constant for default file opening protection
		_Openprot = 0x40};
	};

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::skipws;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::unitbuf;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::uppercase;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::showbase;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::showpoint;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::showpos;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::left;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::right;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::internal;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::dec;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::oct;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::hex;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::scientific;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::fixed;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags
		_Iosb<_Dummy>::hexfloat;	// added with TR1

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::boolalpha;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::_Stdio;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::adjustfield;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::basefield;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Fmtflags _Iosb<_Dummy>::floatfield;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::goodbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::eofbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::failbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::badbit;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Iostate _Iosb<_Dummy>::_Hardfail;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::in;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::out;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::ate;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::app;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::trunc;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::_Nocreate;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::_Noreplace;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Openmode _Iosb<_Dummy>::binary;

template<class _Dummy>
	const typename _Iosb<_Dummy>::_Seekdir _Iosb<_Dummy>::beg;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Seekdir _Iosb<_Dummy>::cur;
template<class _Dummy>
	const typename _Iosb<_Dummy>::_Seekdir _Iosb<_Dummy>::end;

		// CLASS ios_base
class __declspec(dllimport) ios_base
	: public _Iosb<int>
	{	// base class for ios
public:
	typedef int fmtflags;
	typedef int iostate;
	typedef int openmode;
	typedef int seekdir;

	typedef std::streamoff streamoff;
	typedef std::streampos streampos;

	enum event
		{	// constants for ios events
		erase_event, imbue_event, copyfmt_event};

	typedef void (__cdecl *event_callback)(event, ios_base&, int);
	typedef unsigned int io_state, open_mode, seek_dir;

			// CLASS failure
	class failure
		: public runtime_error
		{	// base of all iostreams exceptions
	public:
		explicit  failure(const string &_Message)
			: runtime_error(_Message)
			{	// construct with message
			}

		virtual  ~failure() throw ()
			{	// destroy the object
			}








#line 235 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"

		};

			// CLASS Init
	class __declspec(dllimport) Init
		{	// controller for standard-stream initialization
	public:
		 Init()
            {
            _Init_ctor(this);
            }

		 ~Init()
            {
            _Init_dtor(this);
            }

	private:
        static  void __cdecl _Init_ctor(Init *);
        static  void __cdecl _Init_dtor(Init *);

		 static int& __cdecl _Init_cnt_func();	// net constructions - destructions



		 static int _Init_cnt;	// net constructions - destructions
#line 262 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"
		};

	ios_base&  operator=(const ios_base& _Right)
		{	// assign state and format stuff from _Right
		if (this != &_Right)
			{	// worth doing
			_Mystate = _Right._Mystate;
			copyfmt(_Right);
			}
		return (*this);
		}

	 operator void *() const
		{	// test if any stream operation has failed
		return (fail() ? 0 : (void *)this);
		}

	bool  operator!() const
		{	// test if no stream operation has failed
		return (fail());
		}

    void  clear(iostate _State, bool _Reraise)
        {	// set state, possibly reraise exception
        _Mystate = (iostate)(_State & _Statmask);
        if ((_Mystate & _Except) == 0)
            ;
        else if (_Reraise)
            throw;
        else if (_Mystate & _Except & badbit)
            throw failure("ios_base::badbit set");
        else if (_Mystate & _Except & failbit)
            throw failure("ios_base::failbit set");
        else
            throw failure("ios_base::eofbit set");
        }

	void  clear(iostate _State = goodbit)
		{	// set state to argument
		clear(_State, false);
		}

	void  clear(io_state _State)
		{	// set state to argument, old-style
		clear((iostate)_State);
		}

	iostate  rdstate() const
		{	// return stream state
		return (_Mystate);
		}


	void  setstate(iostate _State, bool _Exreraise)
		{	// merge in state argument, possibly reraise exception
		if (_State != goodbit)
			clear((iostate)((int)rdstate() | (int)_State), _Exreraise);
		}

	void  setstate(iostate _State)
		{	// merge in state argument
		if (_State != goodbit)
			clear((iostate)((int)rdstate() | (int)_State), false);
		}

	void  setstate(io_state _State)
		{	// merge in state argument, old style
		setstate((iostate)_State);
		}

	bool  good() const
		{	// test if no state bits are set
		return (rdstate() == goodbit);
		}

	bool  eof() const
		{	// test if eofbit is set in stream state
		return ((int)rdstate() & (int)eofbit);
		}

	bool  fail() const
		{	// test if badbit or failbit is set in stream state
		return (((int)rdstate()
			& ((int)badbit | (int)failbit)) != 0);
		}

	bool  bad() const
		{	// test if badbit is set in stream state
		return (((int)rdstate() & (int)badbit) != 0);
		}

	// This method is not used in msvcm80.dll, so we do not need to compile it.
	// Also, if we never change the exception mask, we ensure the clear() method
	// will never throw any exception. See VSW#476338 for details.
	iostate  exceptions() const
		{	// return exception mask
		return (_Except);
		}

	void  exceptions(iostate _Newexcept)
		{	// set exception mask to argument
		_Except = (iostate)((int)_Newexcept & (int)_Statmask);
		clear(_Mystate);
		}

	void  exceptions(io_state _State)
		{	// set exception mask to argument, old style
		exceptions((iostate)_State);
		}

	fmtflags  flags() const
		{	// return format flags
		return (_Fmtfl);
		}

	fmtflags  flags(fmtflags _Newfmtflags)
		{	// set format flags to argument
		fmtflags _Oldfmtflags = _Fmtfl;
		_Fmtfl = (fmtflags)((int)_Newfmtflags & (int)_Fmtmask);
		return (_Oldfmtflags);
		}

	fmtflags  setf(fmtflags _Newfmtflags)
		{	// merge in format flags argument
		ios_base::fmtflags _Oldfmtflags = _Fmtfl;
		_Fmtfl = (fmtflags)((int)_Fmtfl
			| (int)_Newfmtflags & (int)_Fmtmask);
		return (_Oldfmtflags);
		}

	fmtflags  setf(fmtflags _Newfmtflags, fmtflags _Mask)
		{	// merge in format flags argument under mask argument
		ios_base::fmtflags _Oldfmtflags = _Fmtfl;
		_Fmtfl = (fmtflags)(((int)_Fmtfl & (int)~_Mask)
			| ((int)_Newfmtflags & (int)_Mask & (int)_Fmtmask));
		return (_Oldfmtflags);
		}

	void  unsetf(fmtflags _Mask)
		{	// clear format flags under mask argument
		_Fmtfl = (fmtflags)((int)_Fmtfl & (int)~_Mask);
		}

	streamsize  precision() const
		{	// return precision
		return (_Prec);
		}

	streamsize  precision(streamsize _Newprecision)
		{	// set precision to argument
		streamsize _Oldprecision = _Prec;
		_Prec = _Newprecision;
		return (_Oldprecision);
		}

	streamsize  width() const
		{	// return width
		return (_Wide);
		}

	streamsize  width(streamsize _Newwidth)
		{	// set width to argument
		streamsize _Oldwidth = _Wide;
		_Wide = _Newwidth;
		return (_Oldwidth);
		}

	locale  getloc() const
		{	// get locale
		return (*_Ploc);
		}

	locale  imbue(const locale& _Loc)
        {	// set locale to argument
        locale _Oldlocale = *_Ploc;
        *_Ploc = _Loc;
        _Callfns(imbue_event);
        return (_Oldlocale);
        }

	static int __cdecl xalloc()
		{	// allocate new iword/pword index
		{ ::std:: _Lockit _Lock(2);	// lock thread to ensure atomicity
			return (_Index++);
		}
		}

	long&  iword(int _Idx)
		{	// return reference to long element
		return (_Findarr(_Idx)._Lo);
		}

	void *&  pword(int _Idx)
		{	// return reference to pointer element
		return (_Findarr(_Idx)._Vp);
		}

	void  register_callback(event_callback _Pfn, int _Idx)
        {	// register event handler
        _Calls = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase", 461) _Fnarray(_Idx, _Pfn, _Calls);
        }

	ios_base&  copyfmt(const ios_base& _Other)
        {	// copy format stuff
        if (this != &_Other)
            {	// copy all but _Mystate
            _Tidy();
            *_Ploc = *_Other._Ploc;
            _Fmtfl = _Other._Fmtfl;
            _Prec = _Other._Prec;
            _Wide = _Other._Wide;
            _Iosarray *_Ptr = _Other._Arr;

            for (_Arr = 0; _Ptr != 0; _Ptr = _Ptr->_Next)
                if (_Ptr->_Lo != 0 || _Ptr->_Vp != 0)
                    {	// copy over nonzero array values
                    iword(_Ptr->_Index) = _Ptr->_Lo;
                    pword(_Ptr->_Index) = _Ptr->_Vp;
                    }

            for (_Fnarray *_Q = _Other._Calls; _Q != 0; _Q = _Q->_Next)
                register_callback(_Q->_Pfn, _Q->_Index);	// copy callbacks

            _Callfns(copyfmt_event);	// call callbacks
            exceptions(_Other._Except);	// cause any throw at end
            }
        return (*this);
        }


	virtual  ~ios_base()
        {
        _Ios_base_dtor(this);
        }

	static bool __cdecl sync_with_stdio(bool _Newsync = true)
		{	// set C/C++ synchronization flag from argument
		{ ::std:: _Lockit _Lock(2);	// lock thread to ensure atomicity
			const bool _Oldsync = _Sync;
			_Sync = _Newsync;
			return (_Oldsync);
		}
		}

	static  void __cdecl _Addstd(ios_base *);
	size_t _Stdstr;	// if > 0 index of standard stream to suppress destruction

protected:
	 ios_base()
		{	// default constructor
		}

	void  _Init()
        {	// initialize a new ios_base
        _Ploc = 0;
        _Stdstr = 0;
        _Except = goodbit;
        _Fmtfl = skipws | dec;
        _Prec = 6;
        _Wide = 0;
        _Arr = 0;
        _Calls = 0;
        clear(goodbit);
        _Ploc = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase", 525) locale;
        }

private:
			// STRUCT _Iosarray
	struct _Iosarray
		{	// list element for open-ended sparse array of longs/pointers
	public:
		 _Iosarray(int _Idx, _Iosarray *_Link)
			: _Next(_Link), _Index(_Idx), _Lo(0), _Vp(0)
			{	// construct node for index _Idx and link it in
			}

		_Iosarray *_Next;	// pointer to next node
		int _Index;	// index of this node
		long _Lo;	// stored long value
		void *_Vp;	// stored pointer value
		};

			// STRUCT _Fnarray
	struct _Fnarray
		{	// list element for open-ended sparse array of event handlers
		 _Fnarray(int _Idx, event_callback _Pnew, _Fnarray *_Link)
			: _Next(_Link), _Index(_Idx), _Pfn(_Pnew)
			{	// construct node for index _Idx and link it in
			}

		_Fnarray *_Next;	// pointer to next node
		int _Index;	// index of this node
		event_callback _Pfn;	// pointer to event handler
		};

	void  _Callfns(event _Ev)
        {	// call all event handlers, reporting event
        for (_Fnarray *_Ptr = _Calls; _Ptr != 0; _Ptr = _Ptr->_Next)
            (*_Ptr->_Pfn)(_Ev, *this, _Ptr->_Index);
        }

	_Iosarray&  _Findarr(int _Idx)
        {	// locate or make a variable array element
        _Iosarray *_Ptr, *_Q;

        for (_Ptr = _Arr, _Q = 0; _Ptr != 0; _Ptr = _Ptr->_Next)
            if (_Ptr->_Index == _Idx)
                return (*_Ptr);	// found element, return it
            else if (_Q == 0 && _Ptr->_Lo == 0 && _Ptr->_Vp == 0)
                _Q = _Ptr;	// found recycling candidate

        if (_Q != 0)
            {	// recycle existing element
            _Q->_Index = _Idx;
            return (*_Q);
            }

        _Arr = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase", 579) _Iosarray(_Idx, _Arr);	// make a new element
        return (*_Arr);
        }

	void __cdecl _Tidy()
        {	// discard storage for an ios_base
        _Callfns(erase_event);
        _Iosarray *_Q1, *_Q2;

        for (_Q1 = _Arr; _Q1 != 0; _Q1 = _Q2)
            _Q2 = _Q1->_Next, std::_DebugHeapDelete(_Q1);	// delete array elements
        _Arr = 0;

        _Fnarray *_Q3, *_Q4;
        for (_Q3 = _Calls; _Q3 != 0; _Q3 = _Q4)
            _Q4 = _Q3->_Next, std::_DebugHeapDelete(_Q3);	// delete callback elements
        _Calls = 0;
        }

    static  void __cdecl _Ios_base_dtor(ios_base *);

	iostate _Mystate;	// stream state
	iostate _Except;	// exception mask
	fmtflags _Fmtfl;	// format flags
	streamsize _Prec;	// field precision
	streamsize _Wide;	// field width
	_Iosarray *_Arr;	// pointer to first node of long/pointer array
	_Fnarray *_Calls;	// pointer to first node of call list
	locale *_Ploc;	// pointer to locale




#line 613 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"
	 static int _Index;	// source of unique indexes for long/pointer array
	 static bool _Sync;	// C/C++ synchronization flag (ignored)
#line 616 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"
    static  int& __cdecl _Index_func();
    static  bool& __cdecl _Sync_func();
	};





}

 #pragma warning(pop)
 #pragma pack(pop)
#line 629 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"

#line 631 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"
#line 632 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xiosbase"

/*
 * Copyright (c) 1992-2006 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.02:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 12 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"
namespace std {

		// TEMPLATE CLASS basic_streambuf
template<class _Elem,
	class _Traits>
	class basic_streambuf
	{	// control read/write buffers

	basic_streambuf(const basic_streambuf<_Elem, _Traits>&);	// not defined
	basic_streambuf<_Elem, _Traits>&
		operator=(const basic_streambuf<_Elem, _Traits>&);	// not defined


protected:
	basic_streambuf()
		: _Plocale(new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf", 27)(locale))
		{	// construct with no buffers
		_Init();
		}

	basic_streambuf(_Uninitialized)
		{	// construct uninitialized
		}

public:
	typedef basic_streambuf<_Elem, _Traits> _Myt;
	typedef _Elem char_type;
	typedef _Traits traits_type;

	virtual  ~basic_streambuf()
		{	// destroy the object
		std::_DebugHeapDelete(_Plocale);
		}

	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	pos_type pubseekoff(off_type _Off, ios_base::seekdir _Way,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		{	// change position by _Off, according to _Way, _Mode
		return (seekoff(_Off, _Way, _Mode));
		}

	pos_type pubseekoff(off_type _Off, ios_base::seek_dir _Way,
		ios_base::open_mode _Mode)
		{	// change position by _Off, according to _Way, _Mode (old style)
		return (pubseekoff(_Off, (ios_base::seekdir)_Way,
			(ios_base::openmode)_Mode));
		}

	pos_type pubseekpos(pos_type _Pos,
		ios_base::openmode _Mode = ios_base::in | ios_base::out)
		{	// change position to _Pos, according to _Mode
		return (seekpos(_Pos, _Mode));
		}

	pos_type pubseekpos(pos_type _Pos, ios_base::open_mode _Mode)
		{	// change position to _Pos, according to _Mode (old style)
		return (seekpos(_Pos, (ios_base::openmode)_Mode));
		}

	_Myt *pubsetbuf(_Elem *_Buffer, streamsize _Count)
		{	// offer _Buffer to external agent
		return (setbuf(_Buffer, _Count));
		}

	locale pubimbue(const locale &_Newlocale)
		{	// set locale to argument
		locale _Oldlocale = *_Plocale;
		imbue(_Newlocale);
		*_Plocale = _Newlocale;
		return (_Oldlocale);
		}

	locale getloc() const
		{	// get locale
		return (*_Plocale);
		}

	streamsize in_avail()
		{	// return count of buffered input characters
		streamsize _Res = _Gnavail();
		return (0 < _Res ? _Res : showmanyc());
		}

	int pubsync()
		{	// synchronize with external agent
		return (sync());
		}

	int_type sbumpc()
		{	// get a character and point past it
		return (0 < _Gnavail()
			? _Traits::to_int_type(*_Gninc()) : uflow());
		}

	int_type sgetc()
		{	// get a character and don't point past it
		return (0 < _Gnavail()
			? _Traits::to_int_type(*gptr()) : underflow());
		}

	streamsize _Sgetn_s(_Elem *_Ptr, size_t _Ptr_size, streamsize _Count)
		{	// get up to _Count characters into array beginning at _Ptr
		return _Xsgetn_s(_Ptr, _Ptr_size, _Count);
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	streamsize sgetn(_Elem *_Ptr, streamsize _Count)
		{	// get up to _Count characters into array beginning at _Ptr
#pragma warning(push)
#pragma warning(disable:4996)
		return xsgetn(_Ptr, _Count);
#pragma warning(pop)
		}

	int_type snextc()
		{	// point to next character and return it
		return (1 < _Gnavail()
			? _Traits::to_int_type(*_Gnpreinc())
			: _Traits::eq_int_type(_Traits::eof(), sbumpc())
				? _Traits::eof() : sgetc());
		}

	int_type sputbackc(_Elem _Ch)
		{	// put back _Ch
		return (gptr() != 0 && eback() < gptr()
			&& _Traits::eq(_Ch, gptr()[-1])
			? _Traits::to_int_type(*_Gndec())
			: pbackfail(_Traits::to_int_type(_Ch)));
		}

	void stossc()
		{	// point past a character
		if (0 < _Gnavail())
			_Gninc();
		else
			uflow();
		}

	int_type sungetc()
		{	// back up one position
		return (gptr() != 0 && eback() < gptr()
			? _Traits::to_int_type(*_Gndec()) : pbackfail());
		}

	int_type sputc(_Elem _Ch)
		{	// put a character
		return (0 < _Pnavail()
			? _Traits::to_int_type(*_Pninc() = _Ch)
			: overflow(_Traits::to_int_type(_Ch)));
		}

	streamsize sputn(const _Elem *_Ptr, streamsize _Count)
		{	// put _Count characters from array beginning at _Ptr
		return (xsputn(_Ptr, _Count));
		}

	void _Lock()
		{	// set the thread lock
		_Mylock._Lock();
		}

	void _Unlock()
		{	// clear the thread lock
		_Mylock._Unlock();
		}


protected:
	_Elem *eback() const
		{	// return beginning of read buffer
		return (*_IGfirst);
		}

	_Elem *gptr() const
		{	// return current position in read buffer
		return (*_IGnext);
		}

	_Elem *pbase() const
		{	// return beginning of write buffer
		return (*_IPfirst);
		}

	_Elem *pptr() const
		{	// return current position in write buffer
		return (*_IPnext);
		}

	_Elem *egptr() const
		{	// return end of read buffer
		return (*_IGnext + *_IGcount);
		}

	void gbump(int _Off)
		{	// alter current position in read buffer by _Off
		*_IGcount -= _Off;
		*_IGnext += _Off;
		}

	void setg(_Elem *_First, _Elem *_Next, _Elem *_Last)
		{	// set pointers for read buffer
		*_IGfirst = _First;
		*_IGnext = _Next;
		*_IGcount = (int)(_Last - _Next);
		}

	_Elem *epptr() const
		{	// return end of write buffer
		return (*_IPnext + *_IPcount);
		}

	_Elem *_Gndec()
		{	// decrement current position in read buffer
		++*_IGcount;
		return (--*_IGnext);
		}

	_Elem *_Gninc()
		{	// increment current position in read buffer
		--*_IGcount;
		return ((*_IGnext)++);
		}

	_Elem *_Gnpreinc()
		{	// preincrement current position in read buffer
		--*_IGcount;
		return (++(*_IGnext));
		}

	streamsize _Gnavail() const
		{	// count number of available elements in read buffer
		return (*_IGnext != 0 ? *_IGcount : 0);
		}

	void pbump(int _Off)
		{	// alter current position in write buffer by _Off
		*_IPcount -= _Off;
		*_IPnext += _Off;
		}

	void setp(_Elem *_First, _Elem *_Last)
		{	// set pointers for write buffer
		*_IPfirst = _First;
		*_IPnext = _First;
		*_IPcount = (int)(_Last - _First);
		}

	void setp(_Elem *_First, _Elem *_Next, _Elem *_Last)
		{	// set pointers for write buffer, extended version
		*_IPfirst = _First;
		*_IPnext = _Next;
		*_IPcount = (int)(_Last - _Next);
		}

	_Elem *_Pninc()
		{	// increment current position in write buffer
		--*_IPcount;
		return ((*_IPnext)++);
		}

	streamsize _Pnavail() const
		{	// count number of available positions in write buffer
		return (*_IPnext != 0 ? *_IPcount : 0);
		}

	void _Init()
		{	// initialize buffer parameters for no buffers
		_IGfirst = &_Gfirst, _IPfirst = &_Pfirst;
		_IGnext = &_Gnext, _IPnext = &_Pnext;
		_IGcount = &_Gcount, _IPcount = &_Pcount;
		setp(0, 0), setg(0, 0, 0);
		}

	void _Init(_Elem **_Gf, _Elem **_Gn, int *_Gc,
		_Elem **_Pf, _Elem **_Pn, int *_Pc)
		{	// initialize buffer parameters as specified
		_IGfirst = _Gf, _IPfirst = _Pf;
		_IGnext = _Gn, _IPnext = _Pn;
		_IGcount = _Gc, _IPcount = _Pc;
		}

	virtual int_type  overflow(int_type = _Traits::eof())
		{	// put a character to stream (always fail)
		return (_Traits::eof());
		}

	virtual int_type  pbackfail(int_type = _Traits::eof())
		{	// put a character back to stream (always fail)
		return (_Traits::eof());
		}

	virtual streamsize  showmanyc()
		{	// return count of input characters
		return (0);
		}

	virtual int_type  underflow()
		{	// get a character from stream, but don't point past it
		return (_Traits::eof());
		}

	virtual int_type  uflow()
		{	// get a character from stream, point past it
		return (_Traits::eq_int_type(_Traits::eof(), underflow())
			? _Traits::eof() : _Traits::to_int_type(*_Gninc()));
		}

	__declspec(deprecated("Function call with parameters that may be unsafe - this call relies on the caller to check that the passed values are correct. " "To disable this warning, use -D_SCL_SECURE_NO_WARNINGS. See documentation on how to use Visual C++ 'Checked Iterators'"))
	virtual streamsize  xsgetn(_Elem * _Ptr,
		streamsize _Count)
		{	// get _Count characters from stream
		// assume the destination buffer is large enough
		return _Xsgetn_s(_Ptr, (size_t)-1, _Count);
		}

	virtual streamsize  _Xsgetn_s(_Elem * _Ptr,
		size_t _Ptr_size, streamsize _Count)
		{	// get _Count characters from stream
		int_type _Meta;
		streamsize _Stream_size, _Size, _Copied;

		for (_Copied = 0; 0 < _Count; )
			if (0 < (_Stream_size = _Gnavail()))
				{	// copy from read buffer
				_Size = _Stream_size;
				if (_Count < _Size)
					_Size = _Count;
				_Traits_helper::copy_s<_Traits>(_Ptr, _Ptr_size, gptr(), _Size);
				_Ptr += _Size;
				_Copied += _Size;
				_Count -= _Size;
				gbump((int)_Size);
				}
			else if (_Traits::eq_int_type(_Traits::eof(), _Meta = uflow()))
				break;	// end of file, quit
			else
				{	// get a single character
				*_Ptr++ = _Traits::to_char_type(_Meta);
				++_Copied;
				--_Count;
				}

		return (_Copied);
		}

	virtual streamsize  xsputn(const _Elem *_Ptr,
		streamsize _Count)
		{	// put _Count characters to stream
		streamsize _Stream_size, _Size, _Copied;

		for (_Copied = 0; 0 < _Count; )
			if (0 < (_Stream_size = _Pnavail()))
				{	// copy to write buffer
				_Size = _Stream_size;
				if (_Count < _Size)
					_Size = _Count;
				_Traits_helper::copy_s<_Traits>(pptr(), _Stream_size, _Ptr, _Size);
				_Ptr += _Size;
				_Copied += _Size;
				_Count -= _Size;
				pbump((int)_Size);
				}
			else if (_Traits::eq_int_type(_Traits::eof(),
				overflow(_Traits::to_int_type(*_Ptr))))
				break;	// single character put failed, quit
			else
				{	// count character successfully put
				++_Ptr;
				++_Copied;
				--_Count;
				}

		return (_Copied);
		}

	virtual pos_type  seekoff(off_type, ios_base::seekdir,
		ios_base::openmode = ios_base::in | ios_base::out)
		{	// change position by offset, according to way and mode
		return (streampos(_BADOFF));
		}

	virtual pos_type  seekpos(pos_type,
		ios_base::openmode = ios_base::in | ios_base::out)
		{	// change to specified position, according to mode
		return (streampos(_BADOFF));
		}

	virtual _Myt * setbuf(_Elem *, streamsize)
		{	// offer buffer to external agent (do nothing)
		return (this);
		}

	virtual int  sync()
		{	// synchronize with external agent (do nothing)
		return (0);
		}

	virtual void  imbue(const locale&)
		{	// set locale to argument (do nothing)
		}

private:
	_Mutex _Mylock;	// thread lock
	_Elem *_Gfirst;	// beginning of read buffer
	_Elem *_Pfirst;	// beginning of write buffer
	_Elem **_IGfirst;	// pointer to beginning of read buffer
	_Elem **_IPfirst;	// pointer to beginning of write buffer
	_Elem *_Gnext;	// current position in read buffer
	_Elem *_Pnext;	// current position in write buffer
	_Elem **_IGnext;	// pointer to current position in read buffer
	_Elem **_IPnext;	// pointer to current position in write buffer
	int _Gcount;	// length of read buffer
	int _Pcount;	// length of write buffer
	int *_IGcount;	// pointer to length of read buffer
	int *_IPcount;	// pointer to length of write buffer
	locale *_Plocale;	// pointer to imbued locale object
	};

 

template class __declspec(dllimport) basic_streambuf<char, char_traits<char> >;
template class __declspec(dllimport) basic_streambuf<wchar_t, char_traits<wchar_t> >;



 #line 441 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

		// TEMPLATE CLASS istreambuf_iterator
template<class _Elem,
	class _Traits>
	class istreambuf_iterator
		: public iterator<input_iterator_tag,
			_Elem, typename _Traits::off_type, _Elem *, _Elem&>
	{	// wrap stream buffer as input iterator
	typedef istreambuf_iterator<_Elem, _Traits> _Myt;
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef basic_streambuf<_Elem, _Traits> streambuf_type;
	typedef basic_istream<_Elem, _Traits> istream_type;

	typedef typename traits_type::int_type int_type;


	typedef _Range_checked_iterator_tag _Checked_iterator_category;
#line 461 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

	istreambuf_iterator(streambuf_type *_Sb = 0) throw ()
		: _Strbuf(_Sb), _Got(_Sb == 0)
		{	// construct from stream buffer _Sb
		}

	istreambuf_iterator(istream_type& _Istr) throw ()
		: _Strbuf(_Istr.rdbuf()), _Got(_Istr.rdbuf() == 0)
		{	// construct from stream buffer in istream _Istr
		}

	_Elem operator*() const
		{	// return designated value
		if (!_Got)
			((_Myt *)this)->_Peek();

 
		if (_Strbuf == 0)
			_Debug_message(L"istreambuf_iterator is not dereferencable", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf", 479);
 #line 481 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

		return (_Val);
		}

	_Myt& operator++()
		{	// preincrement

 
		if (_Strbuf == 0)
			_Debug_message(L"istreambuf_iterator is not incrementable", L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf", 490);
 #line 492 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

		_Inc();
		return (*this);
		}

	_Myt operator++(int)
		{	// postincrement
		if (!_Got)
			_Peek();
		_Myt _Tmp = *this;
		++*this;
		return (_Tmp);
		}

	bool equal(const _Myt& _Right) const
		{	// test for equality
		if (!_Got)
			((_Myt *)this)->_Peek();
		if (!_Right._Got)
			((_Myt *)&_Right)->_Peek();
		return (_Strbuf == 0 && _Right._Strbuf == 0
			|| _Strbuf != 0 && _Right._Strbuf != 0);
		}

private:
	void _Inc()
		{	// skip to next input element
		if (_Strbuf == 0
			|| traits_type::eq_int_type(traits_type::eof(),
				_Strbuf->sbumpc()))
			_Strbuf = 0, _Got = true;
		else
			_Got = false;
		}

	_Elem _Peek()
		{	// peek at next input element
		int_type _Meta;
		if (_Strbuf == 0
			|| traits_type::eq_int_type(traits_type::eof(),
				_Meta = _Strbuf->sgetc()))
			_Strbuf = 0;
		else
			_Val = traits_type::to_char_type(_Meta);
		_Got = true;
		return (_Val);
		}

	streambuf_type *_Strbuf;	// the wrapped stream buffer
	bool _Got;	// true if _Val is valid
	_Elem _Val;	// next element to deliver
	};

		// istreambuf_iterator TEMPLATE OPERATORS
template<class _Elem,
	class _Traits> inline
	bool  operator==(
		const istreambuf_iterator<_Elem, _Traits>& _Left,
		const istreambuf_iterator<_Elem, _Traits>& _Right)
	{	// test for istreambuf_iterator equality
	return (_Left.equal(_Right));
	}

template<class _Elem,
	class _Traits> inline
	bool  operator!=(
		const istreambuf_iterator<_Elem, _Traits>& _Left,
		const istreambuf_iterator<_Elem, _Traits>& _Right)
	{	// test for istreambuf_iterator inequality
	return (!(_Left == _Right));
	}

		// TEMPLATE CLASS ostreambuf_iterator
template<class _Elem,
	class _Traits>
	class ostreambuf_iterator
		: public _Outit
	{	// wrap stream buffer as output iterator
	typedef ostreambuf_iterator<_Elem, _Traits> _Myt;
public:
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef basic_streambuf<_Elem, _Traits> streambuf_type;
	typedef basic_ostream<_Elem, _Traits> ostream_type;


	typedef _Range_checked_iterator_tag _Checked_iterator_category;
#line 580 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

	ostreambuf_iterator(streambuf_type *_Sb) throw ()
		: _Failed(false), _Strbuf(_Sb)
		{	// construct from stream buffer _Sb
		}

	ostreambuf_iterator(ostream_type& _Ostr) throw ()
		: _Failed(false), _Strbuf(_Ostr.rdbuf())
		{	// construct from stream buffer in _Ostr
		}

	_Myt& operator=(_Elem _Right)
		{	// store element and increment
		if (_Strbuf == 0
			|| traits_type::eq_int_type(_Traits::eof(),
				_Strbuf->sputc(_Right)))
			_Failed = true;
		return (*this);
		}

	_Myt& operator*()
		{	// pretend to get designated element
		return (*this);
		}

	_Myt& operator++()
		{	// pretend to preincrement
		return (*this);
		}

	_Myt& operator++(int)
		{	// pretend to postincrement
		return (*this);
		}

	bool failed() const throw ()
		{	// return true if any stores failed
		return (_Failed);
		}

private:
	bool _Failed;	// true if any stores have failed
	streambuf_type *_Strbuf;	// the wrapped stream buffer
	};
}

 #pragma warning(pop)
 #pragma pack(pop)
#line 629 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

#line 631 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"
#line 632 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\streambuf"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 10 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 15 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

		// TEXT-TO-NUMERIC CONVERSION FUNCTIONS


extern "C" {
#line 21 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
extern __declspec(dllimport) float __cdecl _Stofx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **,
		long, int *);
extern __declspec(dllimport) double __cdecl _Stodx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **,
		long, int *);
extern __declspec(dllimport) long double __cdecl _Stoldx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **,
		long, int *);
extern __declspec(dllimport) long __cdecl _Stolx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **, int,
		int *);
extern __declspec(dllimport) unsigned long __cdecl _Stoulx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)] char **,
		int, int *);

  

extern __declspec(dllimport) __int64 __cdecl _Stollx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)]  char **,
		int, int *);
extern __declspec(dllimport) unsigned __int64 __cdecl _Stoullx(const char *,[SA_Pre(Null=SA_Maybe,WritableElementsConst=1)] [SA_Pre(Deref=1,Valid=SA_No)] [SA_Post(Deref=1,Null=SA_Maybe)] [SA_Post(Deref=2,Valid=SA_Yes)]  char **,
		int, int *);
  #line 39 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"


}
#line 43 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"


  
   
   
  #line 49 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

namespace std {

 

#pragma warning(push)
#pragma warning(disable:4275)
		// TEMPLATE CLASS numpunct
template<class _Elem>
	class numpunct
		: public locale::facet
	{	// facet for defining numeric punctuation text
public:
	typedef basic_string<_Elem, char_traits<_Elem>, allocator<_Elem> >
		string_type;
	typedef _Elem char_type;

	 static locale::id id;	// unique facet id

	_Elem  decimal_point() const
		{	// return decimal point
		return (do_decimal_point());
		}

	_Elem  thousands_sep() const
		{	// return thousands separator
		return (do_thousands_sep());
		}

	string  grouping() const
		{	// return grouping string
		return (do_grouping());
		}

	string_type  falsename() const
		{	// return name for false
		return (do_falsename());
		}

	string_type  truename() const
		{	// return name for true
		return (do_truename());
		}

	explicit  numpunct(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
			if (_Kseparator == 0)
				_Kseparator =	// NB: differs from "C" locale
					_Maklocchr(',', (_Elem *)0, _Lobj._Getcvt());
		}
		}

	 numpunct(const _Locinfo& _Lobj, size_t _Refs = 0, bool _Isdef = false)
		: locale::facet(_Refs)
		{	// construct from specified locale
		_Init(_Lobj, _Isdef);
		}

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 114) numpunct<_Elem>(
				_Locinfo(_Ploc->name()), 0, true);
		return (4);
		}

protected:
	virtual  ~numpunct()
		{	// destroy the object
		_Tidy();
		}

protected:
	 numpunct(const char *_Locname, size_t _Refs = 0, bool _Isdef = false)
		: locale::facet(_Refs)
		{	// construct from specified locale
		{ _Locinfo _Lobj(_Locname);
			_Init(_Lobj, _Isdef);
		}
		}

	void  _Init(const _Locinfo& _Lobj, bool _Isdef = false)
		{	// initialize from _Lobj
		const lconv *_Ptr = _Lobj._Getlconv();

		_Grouping = 0;
		_Falsename = 0;
		_Truename = 0;

		try {
		_Grouping = _Maklocstr(_Ptr->grouping, (char *)0, _Lobj._Getcvt());
		_Falsename = _Maklocstr(_Lobj._Getfalse(), (_Elem *)0, _Lobj._Getcvt());
		_Truename = _Maklocstr(_Lobj._Gettrue(), (_Elem *)0, _Lobj._Getcvt());
		} catch (...) {
		_Tidy();
		throw;
		}

		_Dp = _Maklocchr(_Ptr->decimal_point[0], (_Elem *)0, _Lobj._Getcvt());
		_Kseparator =
			_Maklocchr(_Ptr->thousands_sep[0], (_Elem *)0, _Lobj._Getcvt());

		if (_Isdef)
			{	// apply defaults for required facets
			_Grouping = _Maklocstr("", (char *)0, _Lobj._Getcvt());
			_Dp = _Maklocchr('.', (_Elem *)0, _Lobj._Getcvt());
			_Kseparator = _Maklocchr(',', (_Elem *)0, _Lobj._Getcvt());
			}
		}

	virtual _Elem  do_decimal_point() const
		{	// return decimal point
		return (_Dp);
		}

	virtual _Elem  do_thousands_sep() const
		{	// return thousands separator
		return (_Kseparator);
		}

	virtual string  do_grouping() const
		{	// return grouping string
		return (string(_Grouping));
		}

	virtual string_type  do_falsename() const
		{	// return name for false
		return (string_type(_Falsename));
		}

	virtual string_type  do_truename() const
		{	// return name for true
		return (string_type(_Truename));
		}

private:
	void  _Tidy()
		{	// free all storage
		std::_DebugHeapDelete((void *)(void *)_Grouping);
		std::_DebugHeapDelete((void *)(void *)_Falsename);
		std::_DebugHeapDelete((void *)(void *)_Truename);
		}

	const char *_Grouping;	// grouping string, "" for "C" locale
	_Elem _Dp;	// decimal point, '.' for "C" locale
	_Elem _Kseparator;	// thousands separator, '\0' for "C" locale
	const _Elem *_Falsename;	// name for false, "false" for "C" locale
	const _Elem *_Truename;	// name for true, "true" for "C" locale
	};

		// TEMPLATE CLASS numpunct_byname
template<class _Elem>
	class numpunct_byname
		: public numpunct<_Elem>
	{	// numpunct for named locale
public:
	explicit  numpunct_byname(const char *_Locname, size_t _Refs = 0)
		: numpunct<_Elem>(_Locname, _Refs)
		{	// construct for named locale
		}

protected:
	virtual  ~numpunct_byname()
		{	// destroy the object
		}
	};

		// STATIC numpunct::id OBJECT
template<class _Elem>
	 locale::id numpunct<_Elem>::id;

		// TEMPLATE CLASS num_get
template<class _Elem,
	class _InIt = istreambuf_iterator<_Elem, char_traits<_Elem> > >
	class num_get
		: public locale::facet
	{	// facet for converting text to encoded numbers
public:
	typedef numpunct<_Elem> _Mypunct;
	typedef basic_string<_Elem, char_traits<_Elem>, allocator<_Elem> >
		_Mystr;

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 239) num_get<_Elem, _InIt>(
				_Locinfo(_Ploc->name()));
		return (4);
		}

	 static locale::id id;	// unique facet id

protected:
	virtual  ~num_get()
		{	// destroy the object
		}

protected:
	void _Init(const _Locinfo& _Lobj)
		{	// initialize from _Locinfo object
		_Cvt = _Lobj._Getcvt();
		}

	_Locinfo::_Cvtvec _Cvt;		// conversion information

public:
	explicit  num_get(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 num_get(const _Locinfo& _Lobj, size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	typedef _Elem char_type;
	typedef _InIt iter_type;

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase,	ios_base::iostate& _State,
			_Bool& _Val) const
		{	// get bool from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase,	ios_base::iostate& _State,
			unsigned short& _Val) const
		{	// get unsigned short from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase,	ios_base::iostate& _State,
			unsigned int& _Val) const
		{	// get unsigned int from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long& _Val) const
		{	// get long from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned long& _Val) const
		{	// get unsigned long from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

 
	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			__int64& _Val) const
		{	// get long long from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned __int64& _Val) const
		{	// get unsigned long long from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}
 #line 327 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			float& _Val) const
		{	// get float from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			double& _Val) const
		{	// get double from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long double& _Val) const
		{	// get long double from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

	_InIt  get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			void *& _Val) const
		{	// get void pointer from [_First, _Last) into _Val
		return (do_get(_First, _Last, _Iosbase, _State, _Val));
		}

protected:
	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			_Bool& _Val) const
		{	// get bool from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 361);
		int _Ans = -1;	// negative answer indicates failure

		if (_Iosbase.flags() & ios_base::boolalpha)
			{	// get false name or true name
			typedef typename _Mystr::size_type _Mystrsize;
			const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
			_Mystr _Str((_Mystrsize)1, (char_type)0);
			_Str += _Punct_fac.falsename();
			_Str += (char_type)0;
			_Str += _Punct_fac.truename();	// construct "\0false\0true"
			_Ans = _Getloctxt(_First, _Last, (size_t)2, _Str.c_str());
			}
		else
			{	// get zero or nonzero integer
			char _Ac[32], *_Ep;
			int _Errno = 0;
			const unsigned long _Ulo = ::_Stoulx(_Ac, &_Ep,
				_Getifld(_Ac, _First, _Last, _Iosbase.flags(),
					_Iosbase.getloc()), &_Errno);
			if (_Ep != _Ac && _Errno == 0 && _Ulo <= 1)
				_Ans = _Ulo;
			}

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ans < 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans != 0;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned short& _Val) const
		{	// get unsigned short from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 398);
		char _Ac[32], *_Ep;
		int _Errno = 0;
		int _Base = _Getifld(_Ac, _First, _Last, _Iosbase.flags(),
			_Iosbase.getloc());	// gather field into _Ac
		char *_Ptr = _Ac[0] == '-' ? _Ac + 1 : _Ac;	// point past any sign
		const unsigned long _Ans =
			::_Stoulx(_Ptr, &_Ep, _Base, &_Errno);	// convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ptr || _Errno != 0 || 0xffff < _Ans)
			_State |= ios_base::failbit;
		else
			_Val = (unsigned short)(_Ac[0] == '-'
				? 0 -_Ans : _Ans);	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned int& _Val) const
		{	// get unsigned int from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 421);
		char _Ac[32], *_Ep;
		int _Errno = 0;
		int _Base = _Getifld(_Ac, _First, _Last, _Iosbase.flags(),
			_Iosbase.getloc());	// gather field into _Ac
		char *_Ptr = _Ac[0] == '-' ? _Ac + 1 : _Ac;	// point past any sign
		const unsigned long _Ans =
			::_Stoulx(_Ptr, &_Ep, _Base, &_Errno);	// convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ptr || _Errno != 0 || 0xffffffff < _Ans)
			_State |= ios_base::failbit;
		else
			_Val = _Ac[0] == '-' ? 0 -_Ans : _Ans;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long& _Val) const
		{	// get long from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 443);
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const long _Ans = ::_Stolx(_Ac, &_Ep,
			_Getifld(_Ac, _First, _Last, _Iosbase.flags(),
				_Iosbase.getloc()), &_Errno);	// gather field, convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned long& _Val) const
		{	// get unsigned long from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 463);
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const unsigned long _Ans = ::_Stoulx(_Ac, &_Ep,
			_Getifld(_Ac, _First, _Last, _Iosbase.flags(),
				_Iosbase.getloc()), &_Errno);	// gather field, convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}

 
	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			__int64& _Val) const
		{	// get long long from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 484);
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const __int64 _Ans = ::_Stollx(_Ac, &_Ep, _Getifld(_Ac, _First, _Last, _Iosbase.flags(), _Iosbase.getloc()), &_Errno);	// gather field, convert
#line 490 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			unsigned __int64& _Val) const
		{	// get unsigned long long from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 504);
		char _Ac[32], *_Ep;
		int _Errno = 0;
		const unsigned __int64 _Ans = ::_Stoullx(_Ac, &_Ep, _Getifld(_Ac, _First, _Last, _Iosbase.flags(), _Iosbase.getloc()), &_Errno);	// gather field, convert
#line 510 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}
 #line 520 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			float& _Val) const
		{	// get float from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 525);
		char _Ac[8 + 36 + 16], *_Ep;
		int _Errno = 0;
		const float _Ans = ::_Stofx(_Ac, &_Ep,
			_Getffld(_Ac, _First, _Last,
				_Iosbase.getloc()), &_Errno);	// gather field, convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			double& _Val) const
		{	// get double from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 545);
		char _Ac[8 + 36 + 16], *_Ep;
		int _Errno = 0;
		const double _Ans = ::_Stodx(_Ac, &_Ep,
			_Getffld(_Ac, _First, _Last,
				_Iosbase.getloc()), &_Errno);	// gather field, convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			long double& _Val) const
		{	// get long double from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 565);
		char _Ac[8 + 36 + 16], *_Ep;
		int _Errno = 0;
		const long double _Ans = ::_Stoldx(_Ac, &_Ep,
			_Getffld(_Ac, _First, _Last,
				_Iosbase.getloc()), &_Errno);	// gather field, convert

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = _Ans;	// deliver value
		return (_First);
		}

	virtual _InIt  do_get(_InIt _First, _InIt _Last,
		ios_base& _Iosbase, ios_base::iostate& _State,
			void *& _Val) const
		{	// get void pointer from [_First, _Last) into _Val
		_Debug_range(_First, _Last, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 585);
		char _Ac[32], *_Ep;
		int _Errno = 0;

 
		int _Base = _Getifld(_Ac, _First, _Last, ios_base::hex,
			_Iosbase.getloc());	// gather field
		const unsigned __int64 _Ans =
			(sizeof (void *) == sizeof (unsigned long))
				? (unsigned __int64)::_Stoulx(_Ac, &_Ep, _Base, &_Errno)
				: ::_Stoullx(_Ac, &_Ep, _Base, &_Errno);

 



#line 602 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

		if (_First == _Last)
			_State |= ios_base::eofbit;
		if (_Ep == _Ac || _Errno != 0)
			_State |= ios_base::failbit;
		else
			_Val = (void *)((char *)0 + _Ans);	// deliver value
		return (_First);
		}

private:
	int __cdecl _Getifld([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Ac,
		_InIt& _First, _InIt& _Last, ios_base::fmtflags _Basefield,
			const locale& _Loc) const
		{	// get integer field from [_First, _Last) into _Ac
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Loc);
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _Kseparator = _Grouping.size() == 0
			? (_Elem)0 : _Punct_fac.thousands_sep();
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		char *_Ptr = _Ac;

		if (_First == _Last)
			;	// empty field
		else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
			*_Ptr++ = '+', ++_First;	// gather plus sign
		else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
			*_Ptr++ = '-', ++_First;	// gather minus sign

		_Basefield &= ios_base::basefield;
		int _Base = _Basefield == ios_base::oct ? 8
			: _Basefield == ios_base::hex ? 16
			: _Basefield == ios_base::_Fmtzero ? 0 : 10;

		bool _Seendigit = false;	// seen a digit in input
		bool _Nonzero = false;	// seen a nonzero digit in input

		if (_First != _Last && *_First == _E0)
			{	// leading zero, look for 0x, 0X
			_Seendigit = true, ++_First;
			if (_First != _Last && (*_First == _Maklocchr('x', (_Elem *)0, _Cvt)
					|| *_First == _Maklocchr('X', (_Elem *)0, _Cvt))
				&& (_Base == 0 || _Base == 16))
				_Base = 16, _Seendigit = false, ++_First;
			else if (_Base == 0)
				_Base = 8;
			}

		int _Dlen = _Base == 0 || _Base == 10 ? 10
			: _Base == 8 ? 8 : 16 + 6;
		string _Groups((size_t)1, (char)_Seendigit);
		size_t _Group = 0;

		for (char *const _Pe = &_Ac[32 - 1];
			_First != _Last; ++_First)
			if (::memchr((const char *)"0123456789abcdefABCDEF",
				*_Ptr = _Maklocbyte((_Elem)*_First, _Cvt), _Dlen) != 0)
				{	// got a digit, characterize it and add to group size
				if ((_Nonzero || *_Ptr != '0') && _Ptr < _Pe)
					++_Ptr, _Nonzero = true;
				_Seendigit = true;
				if (_Groups[_Group] != 127)
					++_Groups[_Group];
				}
			else if (_Groups[_Group] == '\0'
				|| _Kseparator == (_Elem)0
				|| *_First != _Kseparator)
				break;	// not a group separator, done
			else
				{	// add a new group to _Groups string
				_Groups.append((string::size_type)1, '\0');
				++_Group;
				}

		if (_Group == 0)
			;	// no thousands separators seen
		else if ('\0' < _Groups[_Group])
			++_Group;	// add trailing group to group count
		else
			_Seendigit = false;	// trailing separator, fail

		for (const char *_Pg = _Grouping.c_str(); _Seendigit && 0 < _Group; )
			if (*_Pg == 127)
				break;	// end of grouping constraints to check
			else if (0 < --_Group && *_Pg != _Groups[_Group]
				|| 0 == _Group && *_Pg < _Groups[_Group])
				_Seendigit = false;	// bad group size, fail
			else if ('\0' < _Pg[1])
				++_Pg;	// group size okay, advance to next test

		if (_Seendigit && !_Nonzero)
			*_Ptr++ = '0';	// zero field, replace stripped zero(s)
		else if (!_Seendigit)
			_Ptr = _Ac;	// roll back pointer to indicate failure
		*_Ptr = '\0';
		return (_Base);
		}

	int __cdecl _Getffld([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Ac,
		_InIt& _First, _InIt &_Last, const locale& _Loc) const
		{	// get floating-point field from [_First, _Last) into _Ac
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Loc);
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		char *_Ptr = _Ac;
		bool _Bad = false;

		if (_First == _Last)
			;	// empty field
		else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
			*_Ptr++ = '+', ++_First;	// gather plus sign
		else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
			*_Ptr++ = '-', ++_First;	// gather minus sign

		bool _Seendigit = false;	// seen a digit in input
		int _Significant = 0;	// number of significant digits
		int _Pten = 0;	// power of 10 multiplier

		if (*_Grouping.c_str() == 127 || *_Grouping.c_str() <= '\0')
			for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
					_Seendigit = true, ++_First)
				if (36 <= _Significant)
					++_Pten;	// just scale by 10
				else if (*_First == _E0 && _Significant == 0)
					;	// drop leading zeros
				else
					{	// save a significant digit
					*_Ptr++ = (char)((*_First - _E0) + '0');
					++_Significant;
					}
		else
			{	// grouping specified, gather digits and group sizes
			const _Elem _Kseparator = _Punct_fac.thousands_sep();

			string _Groups((size_t)1, '\0');
			size_t _Group = 0;

			for (; _First != _Last; ++_First)
				if (_E0 <= *_First && *_First <= _E0 + 9)
					{	// got a digit, add to group size
					_Seendigit = true;
					if (36 <= _Significant)
						++_Pten;	// just scale by 10
					else if (*_First == _E0 && _Significant == 0)
						;	// drop leading zeros
					else
						{	// save a significant digit
						*_Ptr++ = (char)((*_First - _E0) + '0');
						++_Significant;
						}
					if (_Groups[_Group] != 127)
						++_Groups[_Group];
					}
				else if (_Groups[_Group] == '\0'
					|| _Kseparator == (_Elem)0
					|| *_First != _Kseparator)
					break;	// not a group separator, done
				else
					{	// add a new group to _Groups string
					_Groups.append((size_t)1, '\0');
					++_Group;
					}
			if (_Group == 0)
				;	// no thousands separators seen
			else if ('\0' < _Groups[_Group])
				++_Group;	// add trailing group to group count
			else
				_Bad = true;	// trailing separator, fail

			for (const char *_Pg = _Grouping.c_str();
				!_Bad && 0 < _Group; )
				if (*_Pg == 127)
					break;	// end of grouping constraints to check
				else if (0 < --_Group && *_Pg != _Groups[_Group]
					|| 0 == _Group && *_Pg < _Groups[_Group])
					_Bad = true;	// bad group size, fail
				else if ('\0' < _Pg[1])
					++_Pg;	// group size okay, advance to next test
			}

		if (_Seendigit && _Significant == 0)
			*_Ptr++ = '0';	// save at least one leading digit

		if (_First != _Last && *_First == _Punct_fac.decimal_point())
			*_Ptr++ = localeconv()->decimal_point[0], ++_First;	// add .

		if (_Significant == 0)
			{	// 0000. so far
			for (; _First != _Last && *_First == _E0;
				_Seendigit = true, ++_First)
				--_Pten;	// just count leading fraction zeros
			if (_Pten < 0)
				*_Ptr++ = '0', ++_Pten;	// put one back
			}

		for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
				_Seendigit = true, ++_First)
			if (_Significant < 36)
				{	// save a significant fraction digit
				*_Ptr++ = (char)((*_First - _E0) + '0');
				++_Significant;
				}

		if (_Seendigit && _First != _Last
			&& (*_First == _Maklocchr('e', (_Elem *)0, _Cvt)
				|| *_First == _Maklocchr('E', (_Elem *)0, _Cvt)))
			{	// 'e' or 'E', collect exponent
			*_Ptr++ = 'e', ++_First;
			_Seendigit = false, _Significant = 0;

			if (_First == _Last)
				;	// 'e' or 'E' is last element
			else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
				*_Ptr++ = '+', ++_First;	// gather plus sign
			else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
				*_Ptr++ = '-', ++_First;	// gather minus sign
			for (; _First != _Last && *_First == _E0; )
				_Seendigit = true, ++_First;	// strip leading zeros
			if (_Seendigit)
				*_Ptr++ = '0';	// put one back
			for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
				_Seendigit = true, ++_First)
				if (_Significant < 8)
					{	// save a significant exponent digit
					*_Ptr++ = (char)((*_First - _E0) + '0');
					++_Significant;
					}
			}

		if (_Bad || !_Seendigit)
			_Ptr = _Ac;	// roll back pointer to indicate failure
		*_Ptr = '\0';
		return (_Pten);
		}


	int _Hexdig(const _Elem _Dig, const _Elem _E0,
		const _Elem _Al, const _Elem _Au) const
		{	// convert hex digit
		if (_E0 <= _Dig && _Dig <= _E0 + 9)
			return (_Dig - _E0);	// assume 0-9 contiguous (C Standard)
		else if (_Al <= _Dig && _Dig <= _Al + 5)
			return (_Dig - _Al + 10);	// assume a-f contiguous
		else if (_Au <= _Dig && _Dig <= _Au + 5)
			return (_Dig - _Au + 10);	// assume A-F contiguous
		else
			return (-1);
		}

	int __cdecl _Getffldx(char *_Ac,
		_InIt& _First, _InIt &_Last,
		ios_base& _Iosbase, int *_Phexexp) const
		{	// get hex floating-point field from [_First, _Last) into _Ac
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		const _Elem _Al = _Maklocchr('a', (_Elem *)0, _Cvt);
		const _Elem _Au = _Maklocchr('A', (_Elem *)0, _Cvt);
		char *_Ptr = _Ac;
		bool _Bad = false;
		int _Dig;

		if (_First == _Last)
			;	// empty field
		else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
			*_Ptr++ = '+', ++_First;	// gather plus sign
		else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
			*_Ptr++ = '-', ++_First;	// gather minus sign

		*_Ptr++ = '0';
		*_Ptr++ = 'x';

		bool _Seendigit = false;	// seen a digit in input
		int _Significant = 0;	// number of significant digits
		int _Phex = 0;	// power of 10 multiplier

		if (_First == _Last || *_First != _E0)
			;
		else if (++_First != _Last
			&& (*_First == _Maklocchr('x', (_Elem *)0, _Cvt)
				 || *_First == _Maklocchr('X', (_Elem *)0, _Cvt)))
			++_First;	// discard any 0x or 0X
		else
			_Seendigit = true;	// '0' not followed by 'x' or 'X'

		if (*_Grouping.c_str() == 127 || *_Grouping.c_str() <= '\0')
			for (; _First != _Last
				&& 0 <= (_Dig = _Hexdig(*_First, _E0, _Al, _Au));
					_Seendigit = true, ++_First)
				if (36 <= _Significant)
					++_Phex;	// just scale by 10
				else if (*_First == _E0 && _Significant == 0)
					;	// drop leading zeros
				else
					{	// save a significant digit
					*_Ptr++ = "0123456789abcdef"[_Dig];
					++_Significant;
					}
		else
			{	// grouping specified, gather digits and group sizes
			const _Elem _Kseparator = _Grouping.size() == 0
				? (_Elem)0 : _Punct_fac.thousands_sep();
			string _Groups((size_t)1, '\0');
			size_t _Group = 0;

			for (; _First != _Last; ++_First)
				if (0 <= (_Dig = _Hexdig(*_First, _E0, _Al, _Au)))
					{	// got a digit, add to group size
					_Seendigit = true;
					if (36 <= _Significant)
						++_Phex;	// just scale by 10
					else if (*_First == _E0 && _Significant == 0)
						;	// drop leading zeros
					else
						{	// save a significant digit
						*_Ptr++ = "0123456789abcdef"[_Dig];
						++_Significant;
						}
					if (_Groups[_Group] != 127)
						++_Groups[_Group];
					}
				else if (_Groups[_Group] == '\0'
					|| _Kseparator == (_Elem)0
					|| *_First != _Kseparator)
					break;	// not a group separator, done
				else
					{	// add a new group to _Groups string
					_Groups.append((size_t)1, '\0');
					++_Group;
					}
			if (_Group == 0)
				;	// no thousands separators seen
			else if ('\0' < _Groups[_Group])
				++_Group;	// add trailing group to group count
			else
				_Bad = true;	// trailing separator, fail

			for (const char *_Pg = _Grouping.c_str();
				!_Bad && 0 < _Group; )
				if (*_Pg == 127)
					break;	// end of grouping constraints to check
				else if (0 < --_Group && *_Pg != _Groups[_Group]
					|| 0 == _Group && *_Pg < _Groups[_Group])
					_Bad = true;	// bad group size, fail
				else if ('\0' < _Pg[1])
					++_Pg;	// group size okay, advance to next test
			}

		if (_Seendigit && _Significant == 0)
			*_Ptr++ = '0';	// save at least one leading digit

		if (_First != _Last && *_First == _Punct_fac.decimal_point())
			*_Ptr++ = localeconv()->decimal_point[0], ++_First;	// add .

		if (_Significant == 0)
			{	// 0000. so far
			for (; _First != _Last && *_First == _E0;
				_Seendigit = true, ++_First)
				--_Phex;	// just count leading fraction zeros
			if (_Phex < 0)
				*_Ptr++ = '0', ++_Phex;	// put one back
			}

		for (; _First != _Last
				&& 0 <= (_Dig = _Hexdig(*_First, _E0, _Al, _Au));
				_Seendigit = true, ++_First)
			if (_Significant < 36)
				{	// save a significant fraction digit
				*_Ptr++ = "0123456789abcdef"[_Dig];
				++_Significant;
				}

		if (_Seendigit && _First != _Last
			&& (*_First == _Maklocchr('p', (_Elem *)0, _Cvt)
				|| *_First == _Maklocchr('P', (_Elem *)0, _Cvt)))
			{	// 'p' or 'P', collect exponent
			*_Ptr++ = 'p', ++_First;
			_Seendigit = false, _Significant = 0;

			if (_First == _Last)
				;	// 'p' or 'P' is last element
			else if (*_First == _Maklocchr('+', (_Elem *)0, _Cvt))
				*_Ptr++ = '+', ++_First;	// gather plus sign
			else if (*_First == _Maklocchr('-', (_Elem *)0, _Cvt))
				*_Ptr++ = '-', ++_First;	// gather minus sign
			for (; _First != _Last && *_First == _E0; )
				_Seendigit = true, ++_First;	// strip leading zeros
			if (_Seendigit)
				*_Ptr++ = '0';	// put one back
			for (; _First != _Last
				&& _E0 <= *_First && *_First <= _E0 + 9;
				_Seendigit = true, ++_First)
				if (_Significant < 8)
					{	// save a significant exponent digit
					*_Ptr++ = (char)((*_First - _E0) + '0');
					++_Significant;
					}
			}

		if (_Bad || !_Seendigit)
			_Ptr = _Ac;	// roll back pointer to indicate failure
		*_Ptr = '\0';
		*_Phexexp = _Phex;	// power of 16 multiplier
		return (0);	// power of 10 multiplier
		}
	};

		// STATIC num_get::id OBJECT
template<class _Elem,
	class _InIt>
	 locale::id num_get<_Elem, _InIt>::id;

		// TEMPLATE CLASS num_put
template<class _Elem,
	class _OutIt = ostreambuf_iterator<_Elem, char_traits<_Elem> > >
	class num_put
		: public locale::facet
	{	// facet for converting encoded numbers to text
public:
	typedef numpunct<_Elem> _Mypunct;
	typedef basic_string<_Elem, char_traits<_Elem>, allocator<_Elem> >
		_Mystr;

	static size_t __cdecl _Getcat(const locale::facet **_Ppf = 0,
		const locale *_Ploc = 0)
		{	// return locale category mask and construct standard facet
		if (_Ppf != 0 && *_Ppf == 0)
			*_Ppf = new(std::_DebugHeapTag_func(), "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum", 1032) num_put<_Elem, _OutIt>(
				_Locinfo(_Ploc->name()));
		return (4);
		}

	 static locale::id id;	// unique facet id

protected:
	virtual  ~num_put()
		{	// destroy the object
		}

protected:
	void  _Init(const _Locinfo& _Lobj)
		{	// initialize from _Locinfo object
		_Cvt = _Lobj._Getcvt();
		}

	_Locinfo::_Cvtvec _Cvt;		// conversion information

public:
	explicit  num_put(size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// construct from current locale
		{ _Locinfo _Lobj;
			_Init(_Lobj);
		}
		}

	 num_put(const _Locinfo& _Lobj, size_t _Refs = 0)
		: locale::facet(_Refs)
		{	// construct from specified locale
		_Init(_Lobj);
		}

	typedef _Elem char_type;
	typedef _OutIt iter_type;

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, _Bool _Val) const
		{	// put formatted bool to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long _Val) const
		{	// put formatted long to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned long _Val) const
		{	// put formatted unsigned long to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

 
	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, __int64 _Val) const
		{	// put formatted long long to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned __int64 _Val) const
		{	// put formatted unsigned long long to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}
 #line 1101 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, double _Val) const
		{	// put formatted double to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long double _Val) const
		{	// put formatted long double to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

	_OutIt  put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, const void *_Val) const
		{	// put formatted void pointer to _Dest
		return (do_put(_Dest, _Iosbase, _Fill, _Val));
		}

protected:
	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, _Bool _Val) const
		{	// put formatted bool to _Dest
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum",1124);
		if (!(_Iosbase.flags() & ios_base::boolalpha))
			return (do_put(_Dest, _Iosbase, _Fill, (long)_Val));
		else
			{	// put "false" or "true"
			const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
			_Mystr _Str;
			if (_Val)
				_Str.assign(_Punct_fac.truename());
			else
				_Str.assign(_Punct_fac.falsename());

			size_t _Fillcount = _Iosbase.width() <= 0
				|| (size_t)_Iosbase.width() <= _Str.size()
					? 0 : (size_t)_Iosbase.width() - _Str.size();

			if ((_Iosbase.flags() & ios_base::adjustfield) != ios_base::left)
				{	// put leading fill
				_Dest = _Rep(_Dest, _Fill, _Fillcount);
				_Fillcount = 0;
				}
			_Dest = _Put(_Dest, _Str.c_str(), _Str.size());	// put field
			_Iosbase.width(0);
			return (_Rep(_Dest, _Fill, _Fillcount));	// put trailing fill
			}
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long _Val) const
		{	// put formatted long to _Dest
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[6];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "ld",
				_Iosbase.flags()), _Val)));
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned long _Val) const
		{	// put formatted unsigned long to _Dest
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[6];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "lu",
				_Iosbase.flags()), _Val)));
		}

 
	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, __int64 _Val) const
		{	// put formatted long long to _Dest
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[8];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "Ld",
				_Iosbase.flags()), _Val)));
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, unsigned __int64 _Val) const
		{	// put formatted unsigned long long to _Dest
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size], _Fmt[8];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, _Ifmt(_Fmt, "Lu",
				_Iosbase.flags()), _Val)));
		}
 #line 1192 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, double _Val) const
		{	// put formatted double to _Dest
		const size_t _Buf_size = 8 + 36 + 64;
		char _Buf[_Buf_size], _Fmt[8];
		streamsize _Precision = _Iosbase.precision() <= 0
			&& !(_Iosbase.flags() & ios_base::fixed)
				? 6 : _Iosbase.precision();	// desired precision
		int _Significance = 36 < _Precision
			? 36 : (int)_Precision;	// actual sprintf precision
		_Precision -= _Significance;
		size_t _Beforepoint = 0;	// zeros to add before decimal point
		size_t _Afterpoint = 0;	// zeros to add after decimal point

		if ((_Iosbase.flags() & ios_base::floatfield) == ios_base::fixed
			&& _Val * 0.5 != _Val)	// skip -Inf, 0, Inf
			{	// scale silly fixed-point value
			bool _Signed = _Val < 0;
			if (_Signed)
				_Val = -_Val;

			for (; 1e35 <= _Val && _Beforepoint < 5000; _Beforepoint += 10)
				_Val /= 1e10;	// drop 10 zeros before decimal point

			if (0 < _Val)
				for (; 10 <= _Precision && _Val <= 1e-35
					&& _Afterpoint < 5000; _Afterpoint += 10)
					{	// drop 10 zeros after decimal point
					_Val *= 1e10;
					_Precision -= 10;
					}

			if (_Signed)
				_Val = -_Val;
			}

		return (_Fput(_Dest, _Iosbase, _Fill, _Buf,
			_Beforepoint, _Afterpoint, _Precision,
				::sprintf_s(_Buf, _Buf_size, _Ffmt(_Fmt, 0, _Iosbase.flags()),
					_Significance, _Val)));	// convert and put
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, long double _Val) const
		{	// put formatted long double to _Dest
		const size_t _Buf_size = 8 + 36 + 64;
		char _Buf[_Buf_size], _Fmt[8];
		streamsize _Precision = _Iosbase.precision() <= 0
			&& !(_Iosbase.flags() & ios_base::fixed)
				? 6 : _Iosbase.precision();	// desired precision
		int _Significance = 36 < _Precision
			? 36 : (int)_Precision;	// actual sprintf precision
		_Precision -= _Significance;
		size_t _Beforepoint = 0;	// zeros to add before decimal point
		size_t _Afterpoint = 0;	// zeros to add after decimal point

		if ((_Iosbase.flags() & ios_base::floatfield) == ios_base::fixed)
			{	// scale silly fixed-point value
			bool _Signed = _Val < 0;
			if (_Signed)
				_Val = -_Val;

			for (; 1e35 <= _Val && _Beforepoint < 5000; _Beforepoint += 10)
				_Val /= 1e10;	// drop 10 zeros before decimal point

			if (0 < _Val)
				for (; 10 <= _Precision && _Val <= 1e-35
					&& _Afterpoint < 5000; _Afterpoint += 10)
					{	// drop 10 zeros after decimal point
					_Val *= 1e10;
					_Precision -= 10;
					}

			if (_Signed)
				_Val = -_Val;
			}

		return (_Fput(_Dest, _Iosbase, _Fill, _Buf,
			_Beforepoint, _Afterpoint, _Precision,
				::sprintf_s(_Buf, _Buf_size, _Ffmt(_Fmt, 'L', _Iosbase.flags()),
					_Significance, _Val)));	// convert and put
		}

	virtual _OutIt  do_put(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, const void *_Val) const
		{	// put formatted void pointer to _Dest
		const size_t _Buf_size = 2 * 32;
		char _Buf[_Buf_size];
		return (_Iput(_Dest, _Iosbase, _Fill, _Buf,
			::sprintf_s(_Buf, _Buf_size, "%p", _Val)));
		}

private:
	char *__cdecl _Ffmt([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Fmt,
		char _Spec, ios_base::fmtflags _Flags) const
		{	// generate sprintf format for floating-point
		char *_Ptr = _Fmt;
		*_Ptr++ = '%';

		if (_Flags & ios_base::showpos)
			*_Ptr++ = '+';
		if (_Flags & ios_base::showpoint)
			*_Ptr++ = '#';
		*_Ptr++ = '.';
		*_Ptr++ = '*';	// for precision argument
		if (_Spec != '\0')
			*_Ptr++ = _Spec;	// 'L' qualifier for long double only

		ios_base::fmtflags _Ffl = _Flags & ios_base::floatfield;
		*_Ptr++ = _Ffl == ios_base::fixed ? 'f'
			: _Ffl == ios_base::hexfloat ? 'a'	// added with TR1
			: _Ffl == ios_base::scientific ? 'e' : 'g';	// specifier
		*_Ptr = '\0';
		return (_Fmt);
		}

	_OutIt __cdecl _Fput(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, const char *_Buf,
			size_t _Beforepoint, size_t _Afterpoint,
				size_t _Trailing, size_t _Count) const
		{	// put formatted floating-point to _Dest
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum",1314);
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
		const string _Grouping = _Punct_fac.grouping();
		const _Elem _Kseparator = _Punct_fac.thousands_sep();
		string _Groupstring;
		const _Elem _E0 = _Maklocchr('0', (_Elem *)0, _Cvt);
		size_t _Prefix = _Buf[0] == '+' || _Buf[0] == '-' ? 1 : 0;

		char _Enders[3];
		_Enders[0] = ::localeconv()->decimal_point[0];
		_Enders[1] = 'e';
		_Enders[2] = '\0';

		const char *_Eptr = (const char *)::memchr(_Buf,
			'e', _Count);	// find exponent
		const char *_Pointptr = (const char *)::memchr(_Buf,
			_Enders[0], _Count);	// find decimal point
		if (_Pointptr == 0)
			_Trailing = 0;

		if (*_Grouping.c_str() != 127 && '\0' < *_Grouping.c_str())
			{	// grouping specified, add thousands separators
			_Groupstring.append(_Buf, _Count);	// assemble field into string
			if (_Eptr == 0)
				_Groupstring.append(_Trailing, '0');
			else
				{	/* dispose of any zeros before exponent */
				if (_Pointptr == 0)
					{	/* no point but exponent, put scaling zeros */
					_Groupstring.append(_Beforepoint, '0');
					_Beforepoint = 0;
					}
				_Groupstring.insert(_Eptr - _Buf, _Trailing, '0');
				}
			_Trailing = 0;

			if (_Pointptr == 0)
				_Groupstring.append(_Beforepoint, '0');
			else
				{	// fill in zeros around decimal point
				_Groupstring.insert(_Pointptr - _Buf + 1, _Afterpoint, '0');
				_Groupstring.insert(_Pointptr - _Buf, _Beforepoint, '0');
				_Afterpoint = 0;
				}
			_Beforepoint = 0;

			const char *_Pg = _Grouping.c_str();
			size_t _Off = ::strcspn(&_Groupstring[0], &_Enders[0]);
			while (*_Pg != 127 && '\0' < *_Pg
				&& (size_t)*_Pg < _Off - _Prefix)
				{	// add a NUL to mark thousands separator
				_Groupstring.insert(_Off -= *_Pg, (size_t)1, '\0');
				if ('\0' < _Pg[1])
					++_Pg;	// not last group, advance
				}

			_Buf = &_Groupstring[0];
			_Trailing = 0;
			_Count = _Groupstring.size();
			}

		size_t _Fillcount = _Beforepoint + _Afterpoint + _Trailing + _Count;
		_Fillcount = _Iosbase.width() <= 0
			|| (size_t)_Iosbase.width() <= _Fillcount
				? 0 : (size_t)_Iosbase.width() - _Fillcount;
		ios_base::fmtflags _Adjustfield =
			_Iosbase.flags() & ios_base::adjustfield;
		if (_Adjustfield != ios_base::left
			&& _Adjustfield != ios_base::internal)
			{	// put leading fill
			_Dest = _Rep(_Dest, _Fill, _Fillcount);
			_Fillcount = 0;
			}
		else if (_Adjustfield == ios_base::internal)
			{	// put internal fill
			if (0 < _Prefix)
				{	// but first put sign
				_Dest = _Putc(_Dest, _Buf, 1);
				++_Buf, --_Count;
				}
			_Dest = _Rep(_Dest, _Fill, _Fillcount);
			_Fillcount = 0;
			}

		_Pointptr = (const char *)::memchr(_Buf,
			_Enders[0], _Count);	// find decimal point again
		if (_Pointptr != 0)
			{	// has decimal point, put pieces and zero fills
			size_t _Fracoffset = _Pointptr - _Buf + 1;
			_Dest = _Putgrouped(_Dest, _Buf, _Fracoffset - 1, _Kseparator);
			_Dest = _Rep(_Dest, _E0, _Beforepoint);
			_Dest = _Rep(_Dest, _Punct_fac.decimal_point(), 1);
			_Dest = _Rep(_Dest, _E0, _Afterpoint);
			_Buf += _Fracoffset, _Count -= _Fracoffset;
			}

		_Eptr = (const char *)::memchr(_Buf,
			'e', _Count);	// find exponent again
		if (_Eptr != 0)
			{	// has exponent field, put it out
			size_t _Expoffset = _Eptr - _Buf + 1;
			_Dest = _Putgrouped(_Dest, _Buf, _Expoffset - 1, _Kseparator);
			_Dest = _Rep(_Dest, _E0, _Trailing), _Trailing = 0;
			_Dest = _Putc(_Dest, _Iosbase.flags() & ios_base::uppercase
				? "E" : "e", 1);
			_Buf += _Expoffset, _Count -= _Expoffset;
			}

		_Dest = _Putgrouped(_Dest, _Buf, _Count,
			_Kseparator);	// put leftover field
		_Dest = _Rep(_Dest, _E0, _Trailing);	// put trailing zeros
		_Iosbase.width(0);
		return (_Rep(_Dest, _Fill, _Fillcount));	// put trailing fill
		}

	char *__cdecl _Ifmt([SA_Pre(Null=SA_No)] [SA_Post(NullTerminated=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Fmt,
		const char *_Spec, ios_base::fmtflags _Flags) const
		{	// generate sprintf format for integer
		char *_Ptr = _Fmt;
		*_Ptr++ = '%';

		if (_Flags & ios_base::showpos)
			*_Ptr++ = '+';
		if (_Flags & ios_base::showbase)
			*_Ptr++ = '#';
		if (_Spec[0] != 'L')
			*_Ptr++ = _Spec[0];	// qualifier
		else
			{	/* change L to I64 */
			*_Ptr++ = 'I';
			*_Ptr++ = '6';
			*_Ptr++ = '4';
			}

		ios_base::fmtflags _Basefield = _Flags & ios_base::basefield;
		*_Ptr++ = _Basefield == ios_base::oct ? 'o'
			: _Basefield != ios_base::hex ? _Spec[1]	// 'd' or 'u'
			: _Flags & ios_base::uppercase ? 'X' : 'x';
		*_Ptr = '\0';
		return (_Fmt);
		}

	_OutIt __cdecl _Iput(_OutIt _Dest,
		ios_base& _Iosbase, _Elem _Fill, [SA_Pre(Null=SA_No,WritableElements="_Count")] [SA_Pre(Deref=1,Valid=SA_Yes)] [SA_Post(Deref=1,Valid=SA_Yes)] char *_Buf, size_t _Count) const
		{	// put formatted integer to _Dest
		_Debug_pointer(_Dest, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum",1459);
		const _Mypunct& _Punct_fac = use_facet<_Mypunct >(_Iosbase.getloc());
		const string _Grouping = _Punct_fac.grouping();
		const size_t _Prefix = *_Buf == '+' || *_Buf == '-' ? 1
			: *_Buf == '0' && (_Buf[1] == 'x' || _Buf[1] == 'X') ? 2
			: 0;

		if (*_Grouping.c_str() != 127 && '\0' < *_Grouping.c_str())
			{	// grouping specified, add thousands separators
			const char *_Pg = _Grouping.c_str();
			size_t _Off = _Count;
			while (*_Pg != 127 && '\0' < *_Pg
				&& (size_t)*_Pg < _Off - _Prefix)
				{	// add a NUL to mark thousands separator
				_Off -= *_Pg;
				::memmove_s((&_Buf[_Off + 1]), (_Count + 1 - _Off), (&_Buf[_Off]), (_Count + 1 - _Off));
#line 1476 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
				_Buf[_Off] = '\0', ++_Count;
				if ('\0' < _Pg[1])
					++_Pg;	// not last group, advance
				}
			}

		size_t _Fillcount = _Iosbase.width() <= 0
			|| (size_t)_Iosbase.width() <= _Count
				? 0 : (size_t)_Iosbase.width() - _Count;

		ios_base::fmtflags _Adjustfield =
			_Iosbase.flags() & ios_base::adjustfield;
		if (_Adjustfield != ios_base::left
			&& _Adjustfield != ios_base::internal)
			{	// put leading fill
			_Dest = _Rep(_Dest, _Fill, _Fillcount);
			_Fillcount = 0;
			}
		else if (_Adjustfield == ios_base::internal)
			{	// put internal fill
			_Dest = _Putc(_Dest, _Buf, _Prefix);	// put prefix
			_Buf += _Prefix, _Count -= _Prefix;
			_Dest = _Rep(_Dest, _Fill, _Fillcount), _Fillcount = 0;
			}

		_Dest = _Putgrouped(_Dest, _Buf, _Count,
			_Punct_fac.thousands_sep());	// put field
		_Iosbase.width(0);
		return (_Rep(_Dest, _Fill, _Fillcount));	// put trailing fill
		}

	_OutIt __cdecl _Put(_OutIt _Dest,
		const _Elem *_Ptr, size_t _Count) const
		{	// put [_Ptr, _Ptr + _Count) to _Dest
		for (; 0 < _Count; --_Count, ++_Dest, ++_Ptr)
			*_Dest = *_Ptr;
		return (_Dest);
		}

	_OutIt __cdecl _Putc(_OutIt _Dest,
		const char *_Ptr, size_t _Count) const
		{	// put char sequence [_Ptr, _Ptr + _Count) to _Dest
		for (; 0 < _Count; --_Count, ++_Dest, ++_Ptr)
			*_Dest = _Maklocchr(*_Ptr, (_Elem *)0, _Cvt);
		return (_Dest);
		}

	_OutIt __cdecl _Putgrouped(_OutIt _Dest,
		const char *_Ptr, size_t _Count, _Elem _Kseparator) const
		{	// put char sequence [_Ptr, _Ptr + _Count) to _Dest with commas
		for (; ; ++_Ptr, --_Count)
			{	// put field with thousands separators for NULs
			const char *_Pend =
				(const char *)::memchr(_Ptr, '\0', _Count);
			size_t _Groupsize = _Pend != 0 ? _Pend - _Ptr : _Count;

			_Dest = _Putc(_Dest, _Ptr, _Groupsize);
			_Ptr += _Groupsize, _Count -= _Groupsize;
			if (_Count == 0)
				break;
			if (_Kseparator != (_Elem)0)
				_Dest = _Rep(_Dest, _Kseparator, 1);
			}
		return (_Dest);
		}

	_OutIt __cdecl _Rep(_OutIt _Dest,
		_Elem _Ch, size_t _Count) const
		{	// put _Count * _Ch to _Dest
		for (; 0 < _Count; --_Count, ++_Dest)
			*_Dest = _Ch;
		return (_Dest);
		}
	};

		// STATIC num_put::id OBJECT
template<class _Elem,
	class _OutIt>
	 locale::id num_put<_Elem, _OutIt>::id;

 

template class __declspec(dllimport) numpunct<char>;
template class __declspec(dllimport) num_get<char,
	istreambuf_iterator<char, char_traits<char> > >;
template class __declspec(dllimport) num_put<char,
	ostreambuf_iterator<char, char_traits<char> > >;

template class __declspec(dllimport) numpunct<wchar_t>;
template class __declspec(dllimport) num_get<wchar_t,
	istreambuf_iterator<wchar_t, char_traits<wchar_t> > >;
template class __declspec(dllimport) num_put<wchar_t,
	ostreambuf_iterator<wchar_t, char_traits<wchar_t> > >;



 #line 1573 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

#pragma warning(pop)
}


 #pragma warning(pop)
 #pragma pack(pop)
#line 1581 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

#line 1583 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"
#line 1584 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\xlocnum"

/*
 * Copyright (c) 1992-2008 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.05:0009 */

#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"


 #pragma pack(push,8)
 #pragma warning(push,3)
#line 12 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"

namespace std {

		// TEMPLATE CLASS basic_ios
template<class _Elem,
	class _Traits>
	class basic_ios
		: public ios_base
	{	// base class for basic_istream/basic_ostream
public:
	typedef basic_ios<_Elem, _Traits> _Myt;
	typedef basic_ostream<_Elem, _Traits> _Myos;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef ctype<_Elem> _Ctype;
	typedef _Elem char_type;
	typedef _Traits traits_type;
	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	explicit  basic_ios(_Mysb *_Strbuf)
		{	// construct from stream buffer pointer
		init(_Strbuf);
		}

	virtual  ~basic_ios()
		{	// destroy the object
		}

	void  clear(iostate _State = goodbit, bool _Reraise = false)
		{	// set state, possibly reraise exception
		ios_base::clear((iostate)(_Mystrbuf == 0
			? (int)_State | (int)badbit : (int)_State), _Reraise);
		}

	void  clear(io_state _State)
		{	// set state to _State
		clear((iostate)_State);
		}

	void  setstate(iostate _State, bool _Reraise = false)
		{	// merge _State into state, possible reraise exception
		if (_State != goodbit)
			clear((iostate)((int)rdstate() | (int)_State), _Reraise);
		}

	void  setstate(io_state _State)
		{	// merge _State into state
		setstate((iostate)_State);
		}

	_Myt&  copyfmt(const _Myt& _Right)
		{	// copy format parameters
		_Tiestr = _Right.tie();
		_Fillch = _Right.fill();
		ios_base::copyfmt(_Right);
		return (*this);
		}

	_Myos * tie() const
		{	// return tie pointer
		return (_Tiestr);
		}

	_Myos * tie(_Myos *_Newtie)
		{	// set tie pointer
		_Myos *_Oldtie = _Tiestr;
		_Tiestr = _Newtie;
		return (_Oldtie);
		}

	_Mysb * rdbuf() const
		{	// return stream buffer pointer
		return (_Mystrbuf);
		}

	_Mysb * rdbuf(_Mysb *_Strbuf)
		{	// set stream buffer pointer
		_Mysb *_Oldstrbuf = _Mystrbuf;
		_Mystrbuf = _Strbuf;
		clear();
		return (_Oldstrbuf);
		}

	locale  imbue(const locale& _Loc)
		{	// set locale to argument
		locale _Oldlocale = ios_base::imbue(_Loc);
		if (rdbuf() != 0)
			rdbuf()->pubimbue(_Loc);
		return (_Oldlocale);
		}

	_Elem  fill() const
		{	// return fill character
		return (_Fillch);
		}

	_Elem  fill(_Elem _Newfill)
		{	// set fill character
		_Elem _Oldfill = _Fillch;
		_Fillch = _Newfill;
		return (_Oldfill);
		}

	char  narrow(_Elem _Ch, char _Dflt = '\0') const
		{	// convert _Ch to byte using imbued locale
		const _Ctype& _Ctype_fac = use_facet<_Ctype >(getloc());
		return (_Ctype_fac.narrow(_Ch, _Dflt));
		}

	_Elem  widen(char _Byte) const
		{	// convert _Byte to character using imbued locale
		const _Ctype& _Ctype_fac = use_facet<_Ctype >(getloc());
		return (_Ctype_fac.widen(_Byte));
		}

protected:
	void  init(_Mysb *_Strbuf = 0,
		bool _Isstd = false)
		{	// initialize with stream buffer pointer
		_Init();	// initialize ios_base
		_Mystrbuf = _Strbuf;
		_Tiestr = 0;
		_Fillch = widen(' ');

		if (_Mystrbuf == 0)
			setstate(badbit);

		if (_Isstd)
			_Addstd(this);	// special handling for standard streams
		else
		_Stdstr = 0;
		}

	 basic_ios()
		{	// default constructor, do nothing
		}

private:
	 basic_ios(const _Myt&);	// not defined
	_Myt&  operator=(const _Myt&);	// not defined

	_Mysb *_Mystrbuf;	// pointer to stream buffer
	_Myos *_Tiestr;	// pointer to tied output stream
	_Elem _Fillch;	// the fill character
	};

 

template class __declspec(dllimport) basic_ios<char,
	char_traits<char> >;
template class __declspec(dllimport) basic_ios<wchar_t,
	char_traits<wchar_t> >;



 #line 169 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"

		// MANIPULATORS
inline ios_base& __cdecl boolalpha(ios_base& _Iosbase)
	{	// set boolalpha
	_Iosbase.setf(ios_base::boolalpha);
	return (_Iosbase);
	}

inline ios_base& __cdecl dec(ios_base& _Iosbase)
	{	// set basefield to dec
	_Iosbase.setf(ios_base::dec, ios_base::basefield);
	return (_Iosbase);
	}

inline ios_base& __cdecl fixed(ios_base& _Iosbase)
	{	// set floatfield to fixed
	_Iosbase.setf(ios_base::fixed, ios_base::floatfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl hex(ios_base& _Iosbase)
	{	// set basefield to hex
	_Iosbase.setf(ios_base::hex, ios_base::basefield);
	return (_Iosbase);
	}

	namespace tr1 {	// added with TR1
inline std::ios_base& __cdecl hexfloat(std::ios_base& _Iosbase)
	{	// set floatfield to hexfloat
	_Iosbase.setf(std::ios_base::hexfloat, std::ios_base::floatfield);
	return (_Iosbase);
	}
	}	// namespace tr1
using tr1::hexfloat;

inline ios_base& __cdecl internal(ios_base& _Iosbase)
	{	// set adjustfield to internal
	_Iosbase.setf(ios_base::internal, ios_base::adjustfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl left(ios_base& _Iosbase)
	{	// set adjustfield to left
	_Iosbase.setf(ios_base::left, ios_base::adjustfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl noboolalpha(ios_base& _Iosbase)
	{	// clear boolalpha
	_Iosbase.unsetf(ios_base::boolalpha);
	return (_Iosbase);
	}

inline ios_base& __cdecl noshowbase(ios_base& _Iosbase)
	{	// clear showbase
	_Iosbase.unsetf(ios_base::showbase);
	return (_Iosbase);
	}

inline ios_base& __cdecl noshowpoint(ios_base& _Iosbase)
	{	// clear showpoint
	_Iosbase.unsetf(ios_base::showpoint);
	return (_Iosbase);
	}

inline ios_base& __cdecl noshowpos(ios_base& _Iosbase)
	{	// clear showpos
	_Iosbase.unsetf(ios_base::showpos);
	return (_Iosbase);
	}

inline ios_base& __cdecl noskipws(ios_base& _Iosbase)
	{	// clear skipws
	_Iosbase.unsetf(ios_base::skipws);
	return (_Iosbase);
	}

inline ios_base& __cdecl nounitbuf(ios_base& _Iosbase)
	{	// clear unitbuf
	_Iosbase.unsetf(ios_base::unitbuf);
	return (_Iosbase);
	}

inline ios_base& __cdecl nouppercase(ios_base& _Iosbase)
	{	// clear uppercase
	_Iosbase.unsetf(ios_base::uppercase);
	return (_Iosbase);
	}

inline ios_base& __cdecl oct(ios_base& _Iosbase)
	{	// set oct in basefield
	_Iosbase.setf(ios_base::oct, ios_base::basefield);
	return (_Iosbase);
	}

inline ios_base& __cdecl right(ios_base& _Iosbase)
	{	// set right in adjustfield
	_Iosbase.setf(ios_base::right, ios_base::adjustfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl scientific(ios_base& _Iosbase)
	{	// set scientific in floatfield
	_Iosbase.setf(ios_base::scientific, ios_base::floatfield);
	return (_Iosbase);
	}

inline ios_base& __cdecl showbase(ios_base& _Iosbase)
	{	// set showbase
	_Iosbase.setf(ios_base::showbase);
	return (_Iosbase);
	}

inline ios_base& __cdecl showpoint(ios_base& _Iosbase)
	{	// set showpoint
	_Iosbase.setf(ios_base::showpoint);
	return (_Iosbase);
	}

inline ios_base& __cdecl showpos(ios_base& _Iosbase)
	{	// set showpos
	_Iosbase.setf(ios_base::showpos);
	return (_Iosbase);
	}

inline ios_base& __cdecl skipws(ios_base& _Iosbase)
	{	// set skipws
	_Iosbase.setf(ios_base::skipws);
	return (_Iosbase);
	}

inline ios_base& __cdecl unitbuf(ios_base& _Iosbase)
	{	// set unitbuf
	_Iosbase.setf(ios_base::unitbuf);
	return (_Iosbase);
	}

inline ios_base& __cdecl uppercase(ios_base& _Iosbase)
	{	// set uppercase
	_Iosbase.setf(ios_base::uppercase);
	return (_Iosbase);
	}
}


 #pragma warning(pop)
 #pragma pack(pop)
#line 317 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"

#line 319 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"
#line 320 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ios"

/*
 * Copyright (c) 1992-2007 by P.J. Plauger.  ALL RIGHTS RESERVED.
 * Consult your license regarding permissions and restrictions.
 V5.03:0009 */
#line 7 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"


 #pragma pack(push,8)
 #pragma warning(push,3)
 #pragma warning(disable: 4390)
#line 13 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"

namespace std {

		// I/O EXCEPTION MACROS

 
 

 



 



 





#line 36 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"

		// TEMPLATE CLASS basic_ostream
template<class _Elem,
	class _Traits>
	class basic_ostream
		: virtual public basic_ios<_Elem, _Traits>
	{	// control insertions into a stream buffer
public:
	typedef basic_ostream<_Elem, _Traits> _Myt;
	typedef basic_ios<_Elem, _Traits> _Myios;
	typedef basic_streambuf<_Elem, _Traits> _Mysb;
	typedef ostreambuf_iterator<_Elem, _Traits> _Iter;
	typedef num_put<_Elem, _Iter> _Nput;

	explicit  basic_ostream(basic_streambuf<_Elem, _Traits> *_Strbuf,
		bool _Isstd = false)
		{	// construct from a stream buffer pointer
		_Myios::init(_Strbuf, _Isstd);
		}

	 basic_ostream(_Uninitialized, bool _Addit = true)
		{	// construct uninitialized
		if (_Addit)
			ios_base::_Addstd(this);	// suppress for basic_iostream
		}

	virtual  ~basic_ostream()
		{	// destroy the object
		}

	typedef typename _Traits::int_type int_type;
	typedef typename _Traits::pos_type pos_type;
	typedef typename _Traits::off_type off_type;

	class _Sentry_base
		{	// stores thread lock and reference to output stream
	public:
		 _Sentry_base(_Myt& _Ostr)
			: _Myostr(_Ostr)
			{	// lock the stream buffer, if there
			if (_Myostr.rdbuf() != 0)
				_Myostr.rdbuf()->_Lock();
			}

		 ~_Sentry_base()
			{	// destroy after unlocking
			if (_Myostr.rdbuf() != 0)
				_Myostr.rdbuf()->_Unlock();
			}

		_Myt& _Myostr;	// the output stream, for _Unlock call at destruction
		};

	class sentry
		: public _Sentry_base
		{	// stores thread lock and state of stream
	public:
		explicit  sentry(_Myt& _Ostr)
			: _Sentry_base(_Ostr)
			{	// construct locking and testing stream
			if (_Ostr.good() && _Ostr.tie() != 0)
				_Ostr.tie()->flush();
			_Ok = _Ostr.good();	// store test only after flushing tie
			}

		 ~sentry()
			{	// destroy the object

 
			if (!std:: uncaught_exception())
				this->_Myostr._Osfx();
			}

 


#line 113 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"

		 operator bool() const
			{	// test if stream state okay
			return (_Ok);
			}

	private:
		 sentry(const sentry&);	// not defined
		sentry&  operator=(const sentry&);	// not defined

		bool _Ok;	// true if stream state okay at construction
		};

	bool  opfx()
		{	// test stream state and flush tie stream as needed (retained)
		if (ios_base::good() && _Myios::tie() != 0)
			_Myios::tie()->flush();
		return (ios_base::good());
		}

	void  osfx()
		{	// perform any wrapup (retained)
		_Osfx();
		}

	void  _Osfx()
		{	// perform any wrapup
		try {
		if (ios_base::flags() & ios_base::unitbuf)
			flush();	// flush stream as needed
		} catch (...) {
		}
		}
























	_Myt&  operator<<(_Myt& (__cdecl *_Pfn)(_Myt&))
		{	// call basic_ostream manipulator
		_Debug_pointer(_Pfn, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream",172);
		return ((*_Pfn)(*this));
		}

	_Myt&  operator<<(_Myios& (__cdecl *_Pfn)(_Myios&))
		{	// call basic_ios manipulator
		_Debug_pointer(_Pfn, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream",178);
		(*_Pfn)(*(_Myios *)this);
		return (*this);
		}

	_Myt&  operator<<(ios_base& (__cdecl *_Pfn)(ios_base&))
		{	// call ios_base manipulator
		_Debug_pointer(_Pfn, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream",185);
		(*_Pfn)(*(ios_base *)this);
		return (*this);
		}

	_Myt&  operator<<(_Bool _Val)
		{	// insert a boolean
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(short _Val)
		{	// insert a short
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());
			ios_base::fmtflags _Bfl =
				ios_base::flags() & ios_base::basefield;
			long _Tmp = (_Bfl == ios_base::oct
				|| _Bfl == ios_base::hex)
				? (long)(unsigned short)_Val : (long)_Val;

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Tmp).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

        /*  Note that if your stream is wchar_t, and you are not using native wchar_t
            Then this operation will be unavailable as there is an explicit 
            specialisation further down this file that is designed to treat an 
            unsigned short as a character.

            If you wish to read or write unsigned shorts to wchar_t streams, you should 
            consider making wchar_t a native type by turning on /Zc:wchar_t
        */
	_Myt&  operator<<(unsigned short _Val)
		{	// insert an unsigned short
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (unsigned long)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(int __w64 _Val)
		{	// insert an int
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());
			ios_base::fmtflags _Bfl =
				ios_base::flags() & ios_base::basefield;
			long _Tmp = (_Bfl == ios_base::oct
				|| _Bfl == ios_base::hex)
				? (long)(unsigned int)_Val : (long)_Val;

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Tmp).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(unsigned int __w64 _Val)
		{	// insert an unsigned int
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (unsigned long)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(long _Val)
		{	// insert a long
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(unsigned long __w64 _Val)
		{	// insert an unsigned long
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (unsigned long)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

 
	_Myt&  operator<<(__int64 _Val)
		{	// insert a long long
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(unsigned __int64 _Val)
		{	// insert an unsigned long long
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}
 #line 389 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"

	_Myt&  operator<<(float _Val)
		{	// insert a float
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), (double)_Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(double _Val)
		{	// insert a double
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(long double _Val)
		{	// insert a long double
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(const void *_Val)
		{	// insert a void pointer
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (_Ok)
			{	// state okay, use facet to insert
			const _Nput& _Nput_fac = use_facet<_Nput >(ios_base::getloc());

			try {
			if (_Nput_fac.put(_Iter(_Myios::rdbuf()), *this,
				_Myios::fill(), _Val).failed())
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  operator<<(_Mysb *_Strbuf)
		{	// insert until end-of-file from a stream buffer
		ios_base::iostate _State = ios_base::goodbit;
		bool _Copied = false;
		const sentry _Ok(*this);

		if (_Ok && _Strbuf != 0)
			for (int_type _Meta = _Traits::eof(); ; _Copied = true)
				{	// extract another character from stream buffer
				try {
				_Meta = _Traits::eq_int_type(_Traits::eof(), _Meta)
					? _Strbuf->sgetc() : _Strbuf->snextc();
				} catch (...) {
					_Myios::setstate(ios_base::failbit);
					throw;
				}

				if (_Traits::eq_int_type(_Traits::eof(), _Meta))
					break;	// end of file, quit

				try {
					if (_Traits::eq_int_type(_Traits::eof(),
						_Myios::rdbuf()->sputc(
							_Traits::to_char_type(_Meta))))
						{	// insertion failed, quit
						_State |= ios_base::badbit;
						break;
						}
				} catch (...) { _Myios::setstate(ios_base::badbit, true); }
				}

		ios_base::width(0);
		_Myios::setstate(_Strbuf == 0 ? ios_base::badbit
			: !_Copied ? _State | ios_base::failbit : _State);
		return (*this);
		}

	_Myt&  put(_Elem _Ch)
		{	// insert a character
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (!_Ok)
			_State |= ios_base::badbit;
		else
			{	// state okay, insert character
			try {
			if (_Traits::eq_int_type(_Traits::eof(),
				_Myios::rdbuf()->sputc(_Ch)))
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  write(const _Elem *_Str,
		streamsize _Count)
		{	// insert _Count characters from array _Str
		if (0 < _Count)
			_Debug_pointer(_Str, L"e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream",531);
		ios_base::iostate _State = ios_base::goodbit;
		const sentry _Ok(*this);

		if (!_Ok)
			_State |= ios_base::badbit;
		else
			{	// state okay, insert characters
			try {
			if (_Myios::rdbuf()->sputn(_Str, _Count) != _Count)
				_State |= ios_base::badbit;
			} catch (...) { _Myios::setstate(ios_base::badbit, true); }
			}

		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  flush()
		{	// flush output stream
		ios_base::iostate _State = ios_base::goodbit;
		if (!ios_base::fail() && _Myios::rdbuf()->pubsync() == -1)
			_State |= ios_base::badbit;	// sync failed
		_Myios::setstate(_State);
		return (*this);
		}

	_Myt&  seekp(pos_type _Pos)
		{	// set output stream position to _Pos
		if (!ios_base::fail()
			&& (off_type)_Myios::rdbuf()->pubseekpos(_Pos,
				ios_base::out) == _BADOFF)
			_Myios::setstate(ios_base::failbit);
		return (*this);
		}

	_Myt&  seekp(off_type _Off, ios_base::seekdir _Way)
		{	// change output stream position by _Off, according to _Way
		if (!ios_base::fail()
			&& (off_type)_Myios::rdbuf()->pubseekoff(_Off, _Way,
				ios_base::out) == _BADOFF)
			_Myios::setstate(ios_base::failbit);
		return (*this);
		}

	pos_type  tellp()
		{	// return output stream position
		if (!ios_base::fail())
			return (_Myios::rdbuf()->pubseekoff(0,
				ios_base::cur, ios_base::out));
		else
			return (pos_type(_BADOFF));
		}
	};























































 

template class __declspec(dllimport) basic_ostream<char, char_traits<char> >;
template class __declspec(dllimport) basic_ostream<wchar_t, char_traits<wchar_t> >;



 #line 648 "e:\\programfiles\\microsoft visual studio 9.0\\vc\\include\\ostream"

		// INSERTERS

 template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr, const char *_Val)
	{	// insert NTBS
	ios_base::iostate _State = ios_base::goodbit;
	streamsize _Count = (streamsize)::strlen(_Val);	// may overflow
	streamsize _Pad = _Ostr.width() <= 0 || _Ostr.width() <= _Count
		? 0 : _Ostr.width() - _Count;
	const typename basic_ostream<_Elem, _Traits>::sentry _Ok(_Ostr);

	if (!_Ok)
		_State |= ios_base::badbit;
	else
		{	// state okay, insert characters
		try {
		const ctype<_Elem>& _Ctype_fac = use_facet<ctype<_Elem> >(_Ostr.getloc());
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; 0 < _Pad; --_Pad)	// pad on left
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	// insertion failed, quit
					_State |= ios_base::badbit;
					break;
					}

		for (; _State == ios_base::goodbit && 0 < _Count; --_Count, ++_Val)
			if (_Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ctype_fac.widen(*_Val))))
					_State |= ios_base::badbit;

		if (_State == ios_base::goodbit)
			for (; 0 < _Pad; --_Pad)	// pad on right
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					{	// insertion failed, quit
					_State |= ios_base::badbit;
					break;
					}
		_Ostr.width(0);
		} catch (...) { (_Ostr).setstate(ios_base::badbit, true); }
		}

	_Ostr.setstate(_State);
	return (_Ostr);
	}

template<class _Elem,
	class _Traits> inline
	basic_ostream<_Elem, _Traits>& __cdecl operator<<(
		basic_ostream<_Elem, _Traits>& _Ostr, char _Ch)
	{	// insert a character
	ios_base::iostate _State = ios_base::goodbit;
	const typename basic_ostream<_Elem, _Traits>::sentry _Ok(_Ostr);

	if (_Ok)
		{	// state okay, insert
		const ctype<_Elem>& _Ctype_fac = use_facet<ctype<_Elem> >(_Ostr.getloc());
		streamsize _Pad = _Ostr.width() <= 1 ? 0 : _Ostr.width() - 1;

		try {
		if ((_Ostr.flags() & ios_base::adjustfield) != ios_base::left)
			for (; _State == ios_base::goodbit && 0 < _Pad;
				--_Pad)	// pad on left
				if (_Traits::eq_int_type(_Traits::eof(),
					_Ostr.rdbuf()->sputc(_Ostr.fill())))
					_State |= ios_base::badbit;

		if (_State == ios_base::goodbit
			&& _Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ctype_fac.widen(_Ch))))
			_State |= ios_base::badbit;

		for (; _State == ios_base::goodbit && 0 < _Pad;
			--_Pad)	// pad on right
			if (_Traits::eq_int_type(_Traits::eof(),
				_Ostr.rdbuf()->sputc(_Ostr.fill())))
				_State |= ios_base::badbit;
		}

	_Ostr.width(0);
	_Ostr.setstate(_State);
	}
