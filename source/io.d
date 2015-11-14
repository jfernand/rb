import serial.device;
import std.stdio;
import std.conv;

private string[] list () {
	return SerialPort.ports;
}

unittest {
	writeln(SerialPort.ports);
}