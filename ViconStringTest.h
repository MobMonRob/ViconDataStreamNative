#pragma once

#include <string>

#include "IDataStreamClientBase.h"


namespace ViconDataStreamSDK
{
namespace CPP
{


///////////////////////////////////////////
class ViconStringToJavaStringTest
{
public:
	String getViconStringHallo();

	const char* getCharStringHallo();

	std::string getStdStringHallo();
};
///////////////////////////////////////////

///////////////////////////////////////////
class JavaStringToViconStringTest
{
public:
	std::string testJavaStringInput(String javaToViconString);
	
	std::string testJavaStringInputConst(const String javaToViconString);

	std::string testJavaStringInputReference(String& javaToViconString);
	
	std::string testJavaStringInputReferenceConst(const String& javaToViconString);
    
    std::string testJavaStringInputPointer(String* javaToViconString);
    
    std::string testJavaStringInputPointerConst(const String* javaToViconString);
};
///////////////////////////////////////////

///////////////////////////////////////////
class ViconConnectTest
{
public:
	Output_Connect testConnect();

	std::string testConnectGiven(const String& javaString);
};
///////////////////////////////////////////


}
}

