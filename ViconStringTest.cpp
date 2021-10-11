#include "ViconStringTest.h"

#include <string>
#include <iostream>
#include <exception>
#include <typeinfo>
#include <stdexcept>
#include <sstream>

#include "IDataStreamClientBase.h"
#include "DataStreamClient.h"


///////////////////////////////////////////
ViconDataStreamSDK::CPP::String ViconDataStreamSDK::CPP::ViconStringToJavaStringTest::getViconStringHallo() {
	return ViconDataStreamSDK::CPP::String("ViconStringHallo");
}

const char* ViconDataStreamSDK::CPP::ViconStringToJavaStringTest::getCharStringHallo() {
	return "CharStringHallo";
}

std::string ViconDataStreamSDK::CPP::ViconStringToJavaStringTest::getStdStringHallo() {
	return std::string("StdStringHallo");
}
///////////////////////////////////////////


///////////////////////////////////////////
std::string ViconDataStreamSDK::CPP::JavaStringToViconStringTest::testJavaStringInput(String javaToViconString)
{
	std::string stdString = javaToViconString;
	return stdString;
}

std::string ViconDataStreamSDK::CPP::JavaStringToViconStringTest::testJavaStringInputConst(const String javaToViconString)
{
	std::string stdString = javaToViconString;
	return stdString;
}

std::string ViconDataStreamSDK::CPP::JavaStringToViconStringTest::testJavaStringInputReference(String& javaToViconString)
{
	std::string stdString = javaToViconString;
	return stdString;
}

std::string ViconDataStreamSDK::CPP::JavaStringToViconStringTest::testJavaStringInputReferenceConst(const String& javaToViconString)
{
	std::string stdString = javaToViconString;
	return stdString;
}

std::string ViconDataStreamSDK::CPP::JavaStringToViconStringTest::testJavaStringInputPointer(String* javaToViconString)
{
	std::string stdString = *javaToViconString;
	return stdString;
}

std::string ViconDataStreamSDK::CPP::JavaStringToViconStringTest::testJavaStringInputPointerConst(const String* javaToViconString)
{
	std::string stdString = *javaToViconString;
	return stdString;
}


///////////////////////////////////////////


///////////////////////////////////////////
ViconDataStreamSDK::CPP::Output_Connect ViconDataStreamSDK::CPP::ViconConnectTest::testConnect()
{
	ViconDataStreamSDK::CPP::Client client;
	ViconDataStreamSDK::CPP::Output_Connect result = client.Connect("192.168.10.1:51001");
	client.Disconnect();
	return result;
}

std::string ViconDataStreamSDK::CPP::ViconConnectTest::testConnectGiven(const ViconDataStreamSDK::CPP::String& javaString)
{
	ViconDataStreamSDK::CPP::Client client;
	ViconDataStreamSDK::CPP::Output_Connect result;
	std::string output;

	try {
		result = client.Connect(javaString);
		if (result.Result == ViconDataStreamSDK::CPP::Result::Success)
		{
			output = "success";
		}
		else
		{
			output = "failure";
		}
		//exception schmeißen testen
	}
	catch(...)
	{
		std::ostringstream os;
			std::exception_ptr p = std::current_exception();
		os <<(p ? p.__cxa_exception_type()->name() : "null") << std::endl;
			return os.str();
	}
		client.Disconnect();
	return output;
}
///////////////////////////////////////////

