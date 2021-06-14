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
	std::string testJavaStringInput(String javaString);

	std::string testJavaStringReferenceInput(const String& javaString);
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

